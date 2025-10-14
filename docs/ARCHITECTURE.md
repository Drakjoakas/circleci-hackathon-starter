# Architecture Overview

## Repository Structure

This hackathon starter is designed for simplicity and speed. Here's how it's organized:

### Application Layer
- `app.py` - Simple Flask web application
- `test_app.py` - Basic test suite using pytest
- `requirements.txt` - Python dependencies
- `Dockerfile` - Container configuration

### CI/CD Layer
- `.circleci/config.yml` - Main CircleCI pipeline configuration
- `examples/` - Pre-built deployment configurations for AWS, GCP, and Azure

### Tooling
- `scripts/setup.sh` - Configuration validator and setup helper
- `scripts/validate.sh` - Quick config validation

### Documentation
- `README.md` / `README.es.md` - Main documentation (English/Spanish)
- `QUICK_START.md` - Printable quick reference
- `SUBMISSION_TEMPLATE.md` - Hackathon submission template

## Pipeline Flow

```
1. Push to GitHub
   ↓
2. CircleCI detects change
   ↓
3. Install dependencies
   ↓
4. Run tests (pytest)
   ↓
5. (Optional) Deploy to cloud
   ↓
6. Report status
```

## Deployment Options

### AWS Lambda
- **Technology**: Serverless functions
- **Packaging**: ZIP file with dependencies
- **Deployment**: AWS CLI

### Google Cloud Run
- **Technology**: Containerized deployment
- **Packaging**: Docker image
- **Deployment**: gcloud CLI

### Azure Functions
- **Technology**: Serverless functions
- **Packaging**: ZIP file with dependencies
- **Deployment**: Azure CLI

## Environment Variables

All sensitive credentials are stored as CircleCI environment variables, never in code:
- AWS credentials
- GCP service account keys
- Azure service principal credentials

## Customization Points

1. **Replace the app** - Swap `app.py` with your application
2. **Update tests** - Modify `test_app.py` for your test suite
3. **Extend pipeline** - Add more jobs to `.circleci/config.yml`
4. **Add deployment steps** - Customize deployment for your needs

## Design Principles

- **Simple by default** - Works immediately after fork
- **Clear comments** - Every section is explained
- **Self-contained examples** - Each deployment config is complete
- **Fail-safe** - Helpful error messages guide users
- **Cloud-agnostic** - Support for major cloud providers

