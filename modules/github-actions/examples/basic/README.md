# Basic GitHub Actions Example

This example demonstrates how to use the GitHub Actions module to create the necessary AWS IAM infrastructure for GitHub Actions OIDC authentication.

## What This Example Creates

- IAM role for GitHub Actions OIDC authentication
- IAM policy with least-privilege permissions for Terraform and Route53
- Policy attachment linking the role and policy

## Usage

1. Update the variables in `variables.tf` with your desired values
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Review the plan:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration

The example uses these default values:
- AWS Region: `ca-central-1`
- GitHub Repository: `willmusgrave/portfolio-dns-infra`
- Branch: `main`
- S3 Bucket: `tfstate-route53-portfolio`
- DynamoDB Table: `terraform-locks-portfolio`
- Role Name: `Terraform-Route53-GHA-Role`
- Policy Name: `Terraform-Route53-GHA-Policy`

You can override these by setting the corresponding variables or updating the defaults in `variables.tf`.

## GitHub Actions Workflow Integration

After applying this configuration, you can use the created role in your GitHub Actions workflow:

```yaml
name: Terraform Deploy
on:
  push:
    branches: [main]

jobs:
  terraform:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      contents: read
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: ${{ secrets.AWS_ROLE_ARN }}
          aws-region: ca-central-1
      
      - name: Terraform Init
        run: terraform init
      
      - name: Terraform Plan
        run: terraform plan
      
      - name: Terraform Apply
        run: terraform apply -auto-approve
```

## Required GitHub Secrets

You need to set the following secret in your GitHub repository:
- `AWS_ROLE_ARN`: The ARN of the IAM role (output from `iam_role_arn`)

## Important Notes

- Ensure the GitHub repository name matches your actual repository
- The branch specified must exist in your repository
- The S3 bucket and DynamoDB table must exist before using this role
- This role provides permissions for Route53 and Terraform state management only
- The role can only be assumed from the specified repository and branch

## Security Considerations

- The role uses OIDC authentication (no long-lived credentials)
- Permissions are scoped to specific S3 bucket and DynamoDB table
- Role assumption is restricted to the specified repository and branch
- All actions are logged in CloudTrail for audit purposes

## Troubleshooting

### Common Issues

1. **Role assumption fails**: Verify the repository name and branch are correct
2. **Permission denied**: Ensure the S3 bucket and DynamoDB table exist
3. **OIDC provider not found**: The OIDC provider is automatically created by AWS when first used

### Verification Steps

1. Check that the IAM role exists in the AWS Console
2. Verify the trust policy allows your GitHub repository
3. Confirm the IAM policy has the required permissions
4. Test the role assumption in GitHub Actions