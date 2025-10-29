# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added [Unreleased]

- Nothing yet

### Changed [Unreleased]

- Nothing yet

### Deprecated [Unreleased]

- Nothing yet

### Removed [Unreleased]

- Nothing yet

### Fixed [Unreleased]

- Nothing yet

### Security [Unreleased]

- Nothing yet

## [0.1.0] - 2025-10-29

### Added [0.1.0]

- Initial release of Terraform AWS Modules library
- **Backend Module**: Terraform state storage and locking infrastructure
  - S3 bucket for state file storage with versioning
  - DynamoDB table for state locking (pay-per-request)
  - Server-side encryption (AES256) enabled by default
  - Lifecycle protection to prevent accidental deletion
- **GitHub Actions Module**: OIDC authentication setup for CI/CD
  - IAM role with least-privilege permissions
  - Branch-specific access control
  - Route53 and Terraform state management permissions
  - Resource tagging for organization
- Comprehensive documentation and README files
- Complete examples for all modules
- GitHub Actions CI/CD pipeline
  - Automated module testing with Terraform validation
  - Security scanning with Trivy
  - Documentation validation with markdownlint
  - Multi-version Terraform compatibility testing
- Bootstrap script for OIDC provider setup
- Contributing guidelines and architecture documentation

### Security [0.1.0]

- OIDC integration for secure AWS authentication
- Secret detection in CI/CD pipeline
- Security vulnerability scanning
- Least-privilege IAM policies

### Documentation [0.1.0]

- Module README files with usage examples
- Architecture documentation
- Contributing guidelines
- Release process documentation
- Bootstrap script documentation

---

## Release Notes Format

### Version Numbering

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backwards compatible manner
- **PATCH** version when you make backwards compatible bug fixes

### Change Categories

- **Added** for new features
- **Changed** for changes in existing functionality
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Fixed** for any bug fixes
- **Security** for security improvements
