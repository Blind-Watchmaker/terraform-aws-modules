# Terraform AWS Modules

A collection of production-ready Terraform modules for AWS infrastructure.
Each module follows best practices for security, maintainability, and cost
optimization.

## Available Modules

| Module | Description | Version | Status |
|--------|-------------|---------|--------|
| [backend](./modules/backend/) | Terraform state storage and locking infrastructure with S3 and DynamoDB | 0.1.0 | ✅ Stable |
| [github-actions](./modules/github-actions/) | IAM role and policy for GitHub Actions OIDC authentication | 0.1.0 | ✅ Stable |

### Backend Module

Creates AWS infrastructure for Terraform remote state storage and locking:

- S3 bucket with versioning for state file storage
- DynamoDB table for state locking (pay-per-request)
- Server-side encryption (AES256)
- Lifecycle protection to prevent accidental deletion

[View Documentation](./modules/backend/README.md)

### GitHub Actions Module

Sets up IAM infrastructure for GitHub Actions to authenticate with AWS using
OIDC:

- IAM role with least-privilege permissions
- OIDC integration for secure authentication
- Branch-specific access control
- Route53 and Terraform permissions

[View Documentation](./modules/github-actions/README.md)

## Quick Start

### Backend Module Setup

```hcl
module "backend" {
  source              = "github.com/Blind-Watchmaker/terraform-aws-modules//modules/backend"
  version             = "~> 0.1"
  
  aws_region          = "us-west-2"
  s3_bucket_name      = "my-terraform-state-bucket"
  dynamodb_table_name = "my-terraform-locks"
}
```

### GitHub Actions Module Setup

```hcl
module "github_actions" {
  source              = "github.com/Blind-Watchmaker/terraform-aws-modules//modules/github-actions"
  version             = "~> 0.1"
  
  github_repo         = "username/repository"
  branch              = "main"
  s3_bucket_name      = "tfstate-bucket"
  dynamodb_table_name = "terraform-locks"
  aws_region          = "us-west-2"
}
```

## Requirements

- Terraform >= 1.0
- AWS Provider >= 4.0

## Documentation

- [Architecture](./docs/ARCHITECTURE.md) - Design principles and module
  structure
- [Contributing](./docs/CONTRIBUTING.md) - Guidelines for contributors
- [Releasing](./docs/RELEASING.md) - Release process and versioning

## Contributing

See [CONTRIBUTING.md](./docs/CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](./LICENSE) file for details.
