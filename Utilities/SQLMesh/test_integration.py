import sys
sys.path.append('.')

from ground_truth_integration import GroundTruthQueryManager

# Initialize manager
manager = GroundTruthQueryManager("ground_truth_queries.sql")
print(f"✓ Found {len(manager.get_all_queries())} queries")

# Test Gradio export
choices = manager.export_for_gradio()
print(f"✓ Gradio dropdown has {len(choices)} options")
print("\n✅ Integration successful!")
