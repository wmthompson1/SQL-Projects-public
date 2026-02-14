# Central anonymization manifest used by the seeder
ANONYMIZATION_POLICY = {
    "OPERATION": {
        "VENDOR_ID": {"action": "hash", "salt": "east_wall_2026", "length": 32},
    }
}

# Example: extend as needed
# ANONYMIZATION_POLICY["VENDOR"] = {
#     "ID": {"action": "hash", "salt": "east_wall_2026", "length": 32},
#     "NAME": {"action": "fake", "provider": "company"},
# }
