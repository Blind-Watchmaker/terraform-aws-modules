# Scripts

This directory contains utility scripts for setting up and managing the Terraform AWS Modules project.

## Bootstrap Scripts

### `bootstrap-oidc.sh`

This script sets up GitHub OIDC (OpenID Connect) authentication for GitHub Actions, allowing your CI/CD pipeline to authenticate with AWS without storing long-lived access keys.

## What is GitHub OIDC?

GitHub OIDC allows GitHub Actions to assume AWS roles using short-lived tokens instead of storing AWS access keys as secrets. This is more secure because:

- **No long-lived credentials** stored in GitHub
- **Tokens expire automatically** (1 hour)
- **Repository-specific** access control
- **Automatic rotation** of tokens

## Prerequisites

Before running the bootstrap script, ensure you have:

### 1. AWS CLI Installed and Configured

```bash
# Check if AWS CLI is installed
aws --version

# Check if you're authenticated
aws sts get-caller-identity
```

If not configured, run:
```bash
aws configure
# Enter your AWS Access Key ID, Secret Access Key, and region
```

### 2. Required AWS Permissions

Your AWS credentials need these permissions:

- `iam:CreateOpenIDConnectProvider`
- `iam:CreatePolicy`
- `iam:CreateRole`
- `iam:AttachRolePolicy`
- `iam:TagRole`
- `iam:TagPolicy`
- `iam:TagOpenIDConnectProvider`

**Note**: The root account has all these permissions by default.

### 3. Make Script Executable

```bash
chmod +x scripts/bootstrap-oidc.sh
```

## Running the Bootstrap Script

### From Project Root
```bash
./scripts/bootstrap-oidc.sh
```

### From Scripts Directory
```bash
cd scripts
./bootstrap-oidc.sh
```

## What the Script Does

The bootstrap script creates the following AWS resources:

### 1. OIDC Identity Provider
- **Purpose**: Allows GitHub to authenticate with AWS
- **URL**: `https://token.actions.githubusercontent.com`
- **Client ID**: `sts.amazonaws.com`
- **Thumbprint**: GitHub's certificate thumbprint for verification

### 2. IAM Policy
- **Name**: `github-actions-terraform-policy`
- **Purpose**: Defines what AWS resources GitHub Actions can access
- **Permissions**: Limited to test resources (S3 buckets, DynamoDB tables, IAM roles)

### 3. IAM Role
- **Name**: `github-actions-terraform-role`
- **Purpose**: Role that GitHub Actions can assume
- **Trust Policy**: Only allows GitHub Actions from your specific repository

### 4. Policy Attachment
- Attaches the policy to the role
- Enables the role to perform the defined actions

## Configuration

The script uses these configurable variables:

```bash
GITHUB_REPO="Blind-Watchmaker/terraform-aws-modules"  # Your GitHub repository
ROLE_NAME="github-actions-terraform-role"            # Name of the IAM role
POLICY_NAME="github-actions-terraform-policy"         # Name of the IAM policy
```

## Output

After successful execution, the script outputs:

```bash
Setup complete!
Role ARN: arn:aws:iam::123456789012:role/github-actions-terraform-role
Add this to your GitHub Action workflow.
```


## Using the Role in GitHub Actions

Copy the Role ARN and add it to your GitHub Action workflow:

```yaml
- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v4
  with:
    role-to-assume: arn:aws:iam::123456789012:role/github-actions-terraform-role
    aws-region: us-west-2
```

## Security Features

### Repository Restriction
The trust policy restricts access to your specific repository:

```json
{
  "Condition": {
    "StringLike": {
      "token.actions.githubusercontent.com:sub": "repo:Blind-Watchmaker/terraform-aws-modules:*"
    }
  }
}
```

### Resource Restrictions
The policy limits access to test resources only:

- **S3**: Only buckets matching `test-bucket-*`
- **DynamoDB**: Only tables matching `test-table-*`
- **IAM**: Full access (needed for Terraform testing)

## Troubleshooting

### Permission Errors
If you get permission errors:
- Verify your AWS credentials have the required IAM permissions
- Check you're authenticated to the correct AWS account
- Ensure you're not using a restricted corporate account

### Resources Already Exist
The script handles existing resources gracefully:
- Uses `|| echo "may already exist"` to prevent failures
- Safe to run multiple times
- Won't overwrite existing resources

### Verification
Check if resources were created successfully:

```bash
# Check the role
aws iam get-role --role-name github-actions-terraform-role

# Check the policy
aws iam get-policy --policy-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):policy/github-actions-terraform-policy

# Check the OIDC provider
aws iam get-open-id-connect-provider --open-id-connect-provider-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):oidc-provider/token.actions.githubusercontent.com
```

## Cleanup

To remove the created resources:

```bash
# Detach policy from role
aws iam detach-role-policy --role-name github-actions-terraform-role --policy-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):policy/github-actions-terraform-policy

# Delete role
aws iam delete-role --role-name github-actions-terraform-role

# Delete policy
aws iam delete-policy --policy-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):policy/github-actions-terraform-policy

# Delete OIDC provider
aws iam delete-open-id-connect-provider --open-id-connect-provider-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):oidc-provider/token.actions.githubusercontent.com
```

## Security Best Practices

1. **Use root account only for initial setup**
2. **Enable MFA on your root account**
3. **Create IAM users for day-to-day operations**
4. **Regularly rotate access keys**
5. **Monitor CloudTrail logs for unusual activity**
6. **Use least privilege access principles**

## Next Steps

After running the bootstrap script:

1. **Update your GitHub Action** with the role ARN
2. **Test your CI/CD pipeline**
3. **Create IAM users** with Terraform for better security
4. **Implement proper access controls** for production use

## Related Documentation

- [GitHub OIDC Documentation](https://docs.github.com/en/actions/deployment/security/hardening-your-deployments/about-security-hardening-with-openid-connect)
- [AWS IAM OIDC Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)