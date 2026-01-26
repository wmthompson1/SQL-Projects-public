import os
import pytest
from arango import ArangoClient


def get_client():
    host = os.getenv('ARANGO_HOST', '127.0.0.1')
    port = os.getenv('ARANGO_PORT', '8529')
    return ArangoClient(hosts=f"http://{host}:{port}")


def test_arango_connection_and_db_exists():
    """Basic integration test: connect and verify the test database exists."""
    client = get_client()
    user = os.getenv('ARANGO_USER', 'test_user')
    password = os.getenv('ARANGO_PASSWORD', 'test_pass')
    db_name = os.getenv('ARANGO_DB', 'ncm_test_db')

    try:
        # Attempt to connect to the target database with provided credentials
        db = client.db(db_name, username=user, password=password)
        # If the connection is successful, basic operation should work
        cols = db.collections()
        assert isinstance(cols, list) or isinstance(cols, dict)
    except Exception as exc:
        pytest.fail(f"ArangoDB integration test failed: {exc}")
