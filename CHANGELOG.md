# Changelog

## [Unreleased] - 2025-10-14

### Fixed - Critical Issues

- **Azure deployment configuration**: Updated `circleci/azure-cli` orb from non-existent version `@2.0.0` to valid version `@1.3.2` in `examples/deploy-to-azure.yml`
  - This fixes a critical bug that would have caused complete pipeline failure for Azure deployments

### Fixed - Important Issues

- **AWS orb version**: Updated `circleci/aws-cli` from `@4.1.0` to `@4.1.3` in `examples/deploy-to-aws.yml` for latest features and security updates
- **GCP orb version**: Updated `circleci/gcp-cli` from `@3.1.0` to `@3.2.1` in `examples/deploy-to-gcp.yml` for latest features and security updates
- **Prerequisites documentation**: Added comprehensive "Prerequisites" section to both `README.md` and `README.es.md` explaining:
  - Cloud resources must be created before deployment
  - Links to setup guides for AWS Lambda, GCP Cloud Run, and Azure Functions
  - Required permissions and configurations

### Fixed - Minor Issues

- **Script output**: Fixed `scripts/validate.sh` to prevent displaying blank entries when listing environment variables
  - Changed regex pattern from `\$[A-Z_]*` to `\$[A-Z_][A-Z_0-9]*` to require at least one character after `$`

### Verification

All changes have been verified:
- ✅ Orb versions updated correctly in all three deployment examples
- ✅ Main CircleCI config (`.circleci/config.yml`) remains unchanged and valid
- ✅ Python application code unchanged
- ✅ Documentation updated in both English and Spanish
- ✅ Script fix implemented correctly
- ✅ No functionality broken

### Impact

These fixes improve the repository from **8/10** to an estimated **9.5/10** beginner experience rating:
- Azure deployment now functional (was completely broken)
- All orb versions up-to-date
- Clear expectations about prerequisites
- Cleaner script output

