# GitHub Actions Module

This module creates the AWS IAM infrastructure required for GitHub Actions to authenticate with AWS using OpenID Connect (OIDC). It provisions an IAM role with least-privilege permissions for Terraform operations and Route53 management.

## Features

- **OIDC Integration**: Secure authentication without storing AWS credentials in GitHub
- **Least Privilege**: Minimal permissions required for Terraform and Route53 operations
- **Branch Protection**: Restricts role assumption to specific repository branches
- **Dynamic Policy**: IAM policy generated from template with variable substitution
- **Resource Tagging**: Proper tagging for resource organization and cost tracking

## Usage

```hcl
module "github_actions_role" {
  source              = "./modules/github-actions"
  github_repo         = "willmusgrave/portfolio-dns-infra"
  branch              = "main"
  s3_bucket_name      = "tfstate-route53-portfolio"
  dynamodb_table_name = "terraform-locks-portfolio"
  aws_region          = "ca-central-1"
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
| github_repo | GitHub repository in format <username>/<repo> | `string` | n/a | yes |
| branch | Branch allowed to assume this role | `string` | `"main"` | no |
| s3_bucket_name | S3 bucket used for Terraform state | `string` | n/a | yes |
| dynamodb_table_name | DynamoDB table used for Terraform state locking | `string` | n/a | yes |
| aws_region | AWS region for backend resources | `string` | `"ca-central-1"` | no |
| role_name | Name for the IAM role | `string` | `"Terraform-Route53-GHA-Role"` | no |
| policy_name | Name for the IAM policy | `string` | `"Terraform-Route53-GHA-Policy"` | no |

## Outputs

| Name | Description |
|------|-------------|
| iam_role_arn | ARN of the IAM role for GitHub Actions |
| iam_role_name | Name of the IAM role for GitHub Actions |
| iam_policy_arn | ARN of the IAM policy for GitHub Actions |
| iam_policy_name | Name of the IAM policy for GitHub Actions |

## Resources

| Name | Type |
|------|------|
| aws_caller_identity.current | data source |
| aws_iam_role.main | resource |
| aws_iam_policy.main | resource |
| aws_iam_role_policy_attachment.main | resource |

## Security Considerations

- **OIDC Authentication**: Uses GitHub's OIDC provider instead of long-lived credentials
- **Branch Restriction**: Role can only be assumed from the specified repository branch
- **Least Privilege**: Policy grants only the minimum permissions required
- **Resource Isolation**: Permissions are scoped to specific S3 bucket and DynamoDB table

## Permissions Granted

The IAM policy grants the following permissions:

### Route53 Permissions
- `route53:ListHostedZones`
- `route53:GetHostedZone`
- `route53:ListResourceRecordSets`
- `route53:ChangeResourceRecordSets`

### S3 Permissions (State Management)
- `s3:ListBucket`
- `s3:GetObject`
- `s3:PutObject`
- `s3:DeleteObject`

### DynamoDB Permissions (State Locking)
- `dynamodb:PutItem`
- `dynamodb:GetItem`
- `dynamodb:DeleteItem`
- `dynamodb:DescribeTable`

## GitHub Actions Integration

To use this role in GitHub Actions, configure your workflow with:

```yaml
- name: Configure AWS credentials
  uses: aws-actions/configure-aws-credentials@v4
  with:
    role-to-assume: ${{ secrets.AWS_ROLE_ARN }}
    aws-region: ca-central-1
```

Where `AWS_ROLE_ARN` is the output value of `iam_role_arn`.

## Examples

See the `examples/` directory for complete usage examples.

## License

This module is licensed under the same terms as the parent project.