import sys, yaml
p = sys.argv[1] if len(sys.argv) > 1 else '.github/workflows/validate-solder.yml'
try:
    with open(p, 'r', encoding='utf-8') as f:
        yaml.safe_load(f)
    print('YAML valid (safe_load)')
except Exception as e:
    print('YAML parse error:', repr(e))
    raise SystemExit(2)
