def load_semantic_graph_with_elevations(conn):
    """Load semantic graph with explicit elevation weights for NCM pattern."""
    from arangodb_helpers.graph_builder import DirectGraphBuilder
    
    G = DirectGraphBuilder()
    COLLECTION = "manufacturing_semantic_layer_node"
    
    print("Loading intents...")
    cursor = conn.execute("SELECT intent_id, intent_name, description FROM schema_intents")
    for row in cursor:
        node_key = f"intent_{row['intent_name']}"
        G.add_node(node_key, COLLECTION,
                   type="Intent",
                   intent_id=row['intent_id'],
                   name=row['intent_name'],
                   description=row['description'] or "")
    
    print("Loading perspectives...")
    cursor = conn.execute("SELECT perspective_id, perspective_name, description FROM schema_perspectives")
    for row in cursor:
        node_key = f"perspective_{row['perspective_name']}"
        G.add_node(node_key, COLLECTION,
                   type="Perspective",
                   perspective_id=row['perspective_id'],
                   name=row['perspective_name'],
                   description=row['description'] or "")
    
    print("Loading concepts (including NCM concepts)...")
    cursor = conn.execute("SELECT concept_id, concept_name, description FROM schema_concepts")
    for row in cursor:
        node_key = f"concept_{row['concept_name']}"
        G.add_node(node_key, COLLECTION,
                   type="Concept",
                   concept_id=row['concept_id'],
                   name=row['concept_name'],
                   description=row['description'] or "")
    
    print("Loading fields (including NCM fields)...")
    cursor = conn.execute("SELECT DISTINCT table_name, field_name FROM schema_concept_fields")
    for row in cursor:
        node_key = f"field_{row['table_name']}_{row['field_name']}"
        G.add_node(node_key, COLLECTION,
                   type="Field",
                   table_name=row['table_name'],
                   field_name=row['field_name'],
                   name=f"{row['table_name']}.{row['field_name']}")
    
    print("Loading Intent -> Perspective edges (OPERATES_WITHIN)...")
    cursor = conn.execute("""
        SELECT i.intent_name, p.perspective_name, ip.intent_factor_weight
        FROM schema_intent_perspectives ip
        JOIN schema_intents i ON ip.intent_id = i.intent_id
        JOIN schema_perspectives p ON ip.perspective_id = p.perspective_id
    """)
    for row in cursor:
        G.add_edge(f"{COLLECTION}/intent_{row['intent_name']}", 
                   f"{COLLECTION}/perspective_{row['perspective_name']}",
                   "OPERATES_WITHIN",
                   weight=row['intent_factor_weight'])
    
    print("Loading Perspective -> Concept edges (USES_DEFINITION)...")
    cursor = conn.execute("""
        SELECT p.perspective_name, c.concept_name
        FROM schema_perspective_concepts pc
        JOIN schema_perspectives p ON pc.perspective_id = p.perspective_id
        JOIN schema_concepts c ON pc.concept_id = c.concept_id
    """)
    for row in cursor:
        G.add_edge(f"{COLLECTION}/perspective_{row['perspective_name']}", 
                   f"{COLLECTION}/concept_{row['concept_name']}",
                   "USES_DEFINITION")
    
    print("Loading Field -> Concept edges (CAN_MEAN)...")
    cursor = conn.execute("""
        SELECT c.concept_name, cf.table_name, cf.field_name
        FROM schema_concept_fields cf
        JOIN schema_concepts c ON cf.concept_id = c.concept_id
    """)
    for row in cursor:
        field_key = f"field_{row['table_name']}_{row['field_name']}"
        G.add_edge(f"{COLLECTION}/{field_key}", 
                   f"{COLLECTION}/concept_{row['concept_name']}",
                   "CAN_MEAN")
    
    print("Loading Intent -> Concept edges (ELEVATES/SUPPRESSES)...")
    cursor = conn.execute("""
        SELECT i.intent_name, c.concept_name, ic.intent_factor_weight
        FROM schema_intent_concepts ic
        JOIN schema_intents i ON ic.intent_id = i.intent_id
        JOIN schema_concepts c ON ic.concept_id = c.concept_id
    """)
    for row in cursor:
        weight = row['intent_factor_weight']
        if weight == 1:
            rel = "ELEVATES"
        elif weight == -1:
            rel = "SUPPRESSES"
        else:
            rel = "NEUTRAL"
        G.add_edge(f"{COLLECTION}/intent_{row['intent_name']}", 
                   f"{COLLECTION}/concept_{row['concept_name']}",
                   rel,
                   weight=weight)
    
    print("\nAdding explicit NCM elevation edges...")
    
    ncm_concept = f"{COLLECTION}/concept_MATERIAL_NON_CONFORMANCE"
    fin_ncm_concept = f"{COLLECTION}/concept_FINANCIAL_LIABILITY_NCM"
    defect_concept = f"{COLLECTION}/concept_PRODUCTION_DEFECT"
    quality_perspective = f"{COLLECTION}/perspective_Quality"
    finance_perspective = f"{COLLECTION}/perspective_Finance"
    
    G.add_edge(quality_perspective, ncm_concept,
               "ELEVATES",
               elevation_weight=1.0,
               solder_priority="primary",
               collision_resolution="Quality perspective selects NCM.severity over defect.severity")
    print(f"  Added: Quality -> MATERIAL_NON_CONFORMANCE (weight=1.0)")
    
    G.add_edge(quality_perspective, defect_concept,
               "SUPPRESSES",
               elevation_weight=0.0,
               solder_priority="secondary",
               collision_resolution="Suppressed when NCM is elevated")
    print(f"  Added: Quality -> PRODUCTION_DEFECT (weight=0.0, suppressed)")
    
    G.add_edge(finance_perspective, fin_ncm_concept,
               "ELEVATES",
               elevation_weight=1.0,
               solder_priority="primary",
               collision_resolution="Finance perspective selects NCM.cost_impact (actual) over defect.cost_impact (estimated)")
    print(f"  Added: Finance -> FINANCIAL_LIABILITY_NCM (weight=1.0)")
    
    G.add_edge(finance_perspective, defect_concept,
               "SUPPRESSES",
               elevation_weight=0.0,
               solder_priority="secondary",
               collision_resolution="Suppressed in Finance - defect.cost_impact is estimated, NCM.cost_impact is actual")
    print(f"  Added: Finance -> PRODUCTION_DEFECT (weight=0.0, suppressed)")
    
    ncm_severity_field = f"{COLLECTION}/field_stg_non_conformant_materials_severity"
    ncm_cost_field = f"{COLLECTION}/field_stg_non_conformant_materials_cost_impact"
    defect_severity_field = f"{COLLECTION}/field_stg_product_defects_severity"
    defect_cost_field = f"{COLLECTION}/field_stg_product_defects_cost_impact"
    
    G.add_edge(defect_cost_field, defect_concept,
               "CAN_MEAN",
               is_primary=False,
               table_alias="defect",
               note="Estimated cost - suppressed in Finance perspective")
    print(f"  Added: stg_product_defects.cost_impact -> PRODUCTION_DEFECT (estimated)")
    
    G.add_edge(ncm_severity_field, ncm_concept,
               "CAN_MEAN",
               is_primary=True,
               table_alias="ncm")
    
    G.add_edge(ncm_cost_field, fin_ncm_concept,
               "CAN_MEAN",
               is_primary=True,
               table_alias="ncm")
    
    return G
