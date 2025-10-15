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
echo "Deployment Options:"
echo "----------------------------"
echo ""
echo "EASY (Uncomment in main config):"
echo "  ✓ GCP Cloud Run (recommended for hackathons - free tier)"
echo "    Required: GCP_PROJECT_ID, GCP_REGION, GCLOUD_SERVICE_KEY"
echo ""
echo "  ✓ AWS ECS (container service - free tier available)"
echo "    Required: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_ACCOUNT_ID,"
echo "              AWS_REGION, AWS_ECS_CLUSTER, AWS_ECS_SERVICE"
echo ""
echo "ADVANCED (Copy from examples/ folder):"
echo "  • Docker Hub - See examples/deploy-to-docker.yml"
echo "  • AWS EKS (Kubernetes) - See examples/deploy-to-aws-eks.yml"
echo "  • Azure Container Instances - See examples/deploy-to-azure-container.yml"
echo ""

# Create .env.example file
echo "Creating .env.example file..."
cat > .env.example << 'EOF'
# GCP Cloud Run Configuration (Recommended)
GCP_PROJECT_ID=your_gcp_project_id
GCP_REGION=us-central1
GCLOUD_SERVICE_KEY=your_base64_encoded_service_account_key

# AWS ECS Configuration
AWS_ACCESS_KEY_ID=your_aws_access_key_id
AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key
AWS_ACCOUNT_ID=123456789012
AWS_REGION=us-east-1
AWS_ECS_CLUSTER=your_ecs_cluster
AWS_ECS_SERVICE=your_ecs_service

# Docker Hub Configuration (Advanced)
DOCKER_USERNAME=your_docker_username
DOCKER_PASSWORD=your_docker_password_or_token

# AWS EKS Configuration (Advanced)
AWS_EKS_CLUSTER_NAME=your_eks_cluster_name

# Azure Container Instances Configuration (Advanced)
AZURE_SP_APP_ID=your_service_principal_app_id
AZURE_SP_PASSWORD=your_service_principal_password
AZURE_SP_TENANT=your_azure_tenant_id
AZURE_RESOURCE_GROUP=your_resource_group
AZURE_REGISTRY_NAME=your_acr_name
EOF
echo "✓ Created .env.example"

echo ""
echo "========================================="
echo "Setup complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Choose a deployment option (Cloud Run recommended)"
echo "2. Set environment variables in CircleCI project settings"
echo "3. Uncomment deployment in .circleci/config.yml (or copy from examples/)"
echo "4. Push to GitHub and watch your pipeline run!"
echo ""

