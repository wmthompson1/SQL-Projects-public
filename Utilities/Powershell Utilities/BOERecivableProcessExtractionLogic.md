Data Map Format (CSV):

Doc,block,upper_left,lower_right,Segment type
1,1,A3,B5,Free-form
1,2,A8,Doc 1 end,Tabular-form

Extraction Flow (lines 168-198):

for idx, row in scheme_df.iterrows():
    range_str = f"{row['upper_left']}:{row['lower_right']}"
    segment_type = row['Segment type']
    
    # Convert Excel range to indices
    start_row, end_row, start_col, end_col = excel_range_to_indices(range_str, sheet)
    
    # Extract based on segment type
    if segment_type.lower() == 'free-form':
        block_data['content'] = extract_freeform_block(...)  # → dict
    elif segment_type.lower() == 'tabular-form':
        block_data['content'] = extract_tabular_block(...)   # 

The output is a structured dict with blocks containing extracted metadata (free-form) or table data (tabular-form) - ready for hybrid RAG processing.