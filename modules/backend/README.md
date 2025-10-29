# Backend Module

This module creates the AWS infrastructure required for Terraform remote
state storage and locking. It provisions an S3 bucket for storing Terraform
state files and a DynamoDB table for state locking to prevent concurrent
modifications.

## Features

- **S3 Bucket**: Stores Terraform state files with versioning enabled
- **Server-Side Encryption**: AES256 encryption for state files at rest
- **DynamoDB Table**: Provides state locking to prevent concurrent Terraform
  operations
- **Lifecycle Protection**: Prevents accidental destruction of the S3 bucket
- **Pay-per-Request**: DynamoDB table uses on-demand billing for cost
  efficiency

## Usage

```hcl
module "backend" {
  source              = "./modules/backend"
  aws_region          = "ca-central-1"
  s3_bucket_name      = "my-terraform-state-bucket"
  dynamodb_table_name = "my-terraform-locks"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | AWS region for the backend resources | `string` | n/a | yes |
| s3_bucket_name | S3 bucket name for Terraform state storage | `string` | n/a | yes |
| dynamodb_table_name | DynamoDB table name for Terraform state locking | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| s3_bucket | The name of the S3 bucket used for Terraform state |
| dynamodb_table | The name of the DynamoDB table used for state locking |

## Resources

| Name | Type |
|------|------|
| aws_s3_bucket.terraform_state | resource |
| aws_s3_bucket_versioning.state | resource |
| aws_s3_bucket_server_side_encryption_configuration.state | resource |
| aws_dynamodb_table.terraform_locks | resource |

## Security Considerations

- The S3 bucket is protected from accidental deletion with
  `prevent_destroy = true`
- State files are encrypted at rest using AES256 server-side encryption
- DynamoDB table uses pay-per-request billing to minimize costs
- Bucket versioning is enabled to maintain state file history

## Cost Optimization

- DynamoDB table uses on-demand billing (pay-per-request) instead of
  provisioned capacity
- S3 storage costs are minimal for typical Terraform state files
- No additional AWS services are provisioned beyond the essential backend
  components

## Examples

See the `examples/` directory for complete usage examples.

## License

This module is licensed under the same terms as the parent project.
