#!/bin/bash

# CircleCI Hackathon Starter - Setup Script
# This script helps you validate your CircleCI configuration and prepare for deployment

set -e

echo "========================================="
echo "CircleCI Hackathon Starter - Setup"
echo "========================================="
echo ""

# Check if CircleCI CLI is installed
echo "Checking for CircleCI CLI..."
if command -v circleci &> /dev/null; then
    echo "✓ CircleCI CLI is installed"
    circleci version
else
    echo "✗ CircleCI CLI not found"
    echo ""
    echo "Please install the CircleCI CLI to validate your configuration:"
    echo "https://circleci.com/docs/local-cli/"
    echo ""
    echo "macOS: brew install circleci"
    echo "Linux: snap install circleci"
    exit 1
fi

echo ""
echo "Validating CircleCI configuration..."
if circleci config validate .circleci/config.yml; then
    echo "✓ Configuration is valid"
else
    echo "✗ Configuration has errors"
    exit 1
fi

echo ""
echo "Environment variables needed:"
echo "----------------------------"
echo "For AWS Lambda deployment:"
echo "  - AWS_ACCESS_KEY_ID"
echo "  - AWS_SECRET_ACCESS_KEY"
echo "  - AWS_LAMBDA_FUNCTION_NAME"
echo "  - AWS_REGION"
echo ""
echo "For GCP Cloud Run deployment:"
echo "  - GCP_PROJECT_ID"
echo "  - GCP_REGION"
echo "  - GCP_SERVICE_ACCOUNT_KEY"
echo ""
echo "For Azure Functions deployment:"
echo "  - AZURE_FUNCTION_APP_NAME"
echo "  - AZURE_RESOURCE_GROUP"
echo "  - AZURE_SP_APP_ID"
echo "  - AZURE_SP_PASSWORD"
echo "  - AZURE_SP_TENANT"
echo ""

# Create .env.example file
echo "Creating .env.example file..."
cat > .env.example << 'EOF'
# AWS Configuration
AWS_ACCESS_KEY_ID=your_aws_access_key_id
AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key
AWS_LAMBDA_FUNCTION_NAME=your_lambda_function_name
AWS_REGION=us-east-1

# GCP Configuration
GCP_PROJECT_ID=your_gcp_project_id
GCP_REGION=us-central1
GCP_SERVICE_ACCOUNT_KEY=your_base64_encoded_service_account_key

# Azure Configuration
AZURE_FUNCTION_APP_NAME=your_function_app_name
AZURE_RESOURCE_GROUP=your_resource_group
AZURE_SP_APP_ID=your_service_principal_app_id
AZURE_SP_PASSWORD=your_service_principal_password
AZURE_SP_TENANT=your_azure_tenant_id
EOF
echo "✓ Created .env.example"

echo ""
echo "========================================="
echo "Setup complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Choose a deployment target (AWS/GCP/Azure)"
echo "2. Set environment variables in CircleCI project settings"
echo "3. Update .circleci/config.yml or copy an example from examples/"
echo "4. Push to GitHub and watch your pipeline run!"
echo ""

