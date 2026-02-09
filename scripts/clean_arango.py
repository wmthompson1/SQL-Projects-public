from arango import ArangoClient
import sys
import os
import argparse
import json


def load_config():
    endpoint = os.environ.get('ARANGO_ENDPOINT') or os.environ.get('ARANGO_HOST')
    port = os.environ.get('ARANGO_PORT')
    if endpoint and port and not endpoint.startswith('http'):
        endpoint = f'http://{endpoint}:{port}'
    if not endpoint:
        endpoint = os.environ.get('ARANGO_ENDPOINT', 'http://127.0.0.1:8529')

    db_name = os.environ.get('ARANGO_DB', 'manufacturing_graph')
    user = os.environ.get('ARANGO_USER')
    pw = os.environ.get('ARANGO_PASSWORD')
    no_auth = os.environ.get('ARANGO_NO_AUTH')
    return endpoint, db_name, user, pw, bool(no_auth)


def confirm_safe_host(endpoint: str) -> bool:
    # Only allow destructive actions on localhost by default
    allowed_local = ['127.0.0.1', 'localhost']
    try:
        host = endpoint.split('://')[-1].split(':')[0]
    except Exception:
        return False
    return host in allowed_local


def main():
    parser = argparse.ArgumentParser(description='Safely drop ArangoDB test collections')
    parser.add_argument('--confirm', action='store_true', help='Confirm destructive action')
    parser.add_argument('--backup', action='store_true', help='Backup collections before dropping')
    args = parser.parse_args()

    endpoint, db_name, user, pw, no_auth = load_config()

    if not args.confirm and os.environ.get('CONFIRM_CLEAN', '').lower() != 'yes':
        print('Refusing to run without explicit confirmation. Use --confirm or set CONFIRM_CLEAN=yes')
        sys.exit(3)

    if not confirm_safe_host(endpoint) and os.environ.get('FORCE_CLEAN', '').lower() != 'true':
        print('Refusing to drop collections on non-local ArangoDB host:', endpoint)
        print('Set FORCE_CLEAN=true to override (dangerous).')
        sys.exit(4)

    c = ArangoClient(hosts=endpoint)
    try:
        if user and pw and not no_auth:
            db = c.db(db_name, username=user, password=pw)
        else:
            db = c.db(db_name)
    except Exception as e:
        print('ERROR connecting to ArangoDB:', e)
        sys.exit(2)

    colls = ['manufacturing_semantic_layer_node', 'manufacturing_semantic_layer_edges']

    if args.backup:
        os.makedirs('arango_backups', exist_ok=True)
        for coll in colls:
            try:
                if db.has_collection(coll):
                    docs = list(db.collection(coll).all())
                    with open(f'arango_backups/{coll}.json', 'w', encoding='utf8') as fh:
                        json.dump(docs, fh, indent=2)
                    print(f'Backed up {coll} ({len(docs)} docs)')
                else:
                    print(f'No collection to backup: {coll}')
            except Exception as ex:
                print(f'Error backing up {coll}:', ex)

    for coll in colls:
        try:
            if db.has_collection(coll):
                db.delete_collection(coll)
                print(f'Dropped collection: {coll}')
            else:
                print(f'Collection not present: {coll}')
        except Exception as ex:
            print(f'Error dropping {coll}:', ex)

    print('Done')


if __name__ == '__main__':
    main()
