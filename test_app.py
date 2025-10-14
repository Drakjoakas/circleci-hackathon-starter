"""
Basic tests for the Flask application
Run with: pytest test_app.py
"""

from app import app


def test_hello_endpoint():
    """Test the main endpoint returns the expected message"""
    client = app.test_client()
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello from CircleCI Hackathon!" in response.data


def test_health_endpoint():
    """Test the health check endpoint"""
    client = app.test_client()
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json == {"status": "healthy"}


def test_app_runs():
    """Test that the app can be imported and initialized"""
    assert app is not None
    assert app.name == "app"

