#!/bin/bash

# CircleCI Configuration Validator
# Quick validation script for your CircleCI config

echo "Validating CircleCI configuration..."
echo ""

# Check if CircleCI CLI is available
if ! command -v circleci &> /dev/null; then
    echo "✗ CircleCI CLI not installed"
    echo "Install from: https://circleci.com/docs/local-cli/"
    exit 1
fi

# Validate the config
if circleci config validate .circleci/config.yml; then
    echo ""
    echo "✓ Configuration is valid!"
    echo ""
    
    # List environment variables found in config
    echo "Environment variables referenced in config:"
    grep -o '\$[A-Z_][A-Z_0-9]*' .circleci/config.yml | sort -u | sed 's/\$/  - /' || echo "  None found"
    
    exit 0
else
    echo ""
    echo "✗ Configuration has errors - please fix them before deploying"
    exit 1
fi

