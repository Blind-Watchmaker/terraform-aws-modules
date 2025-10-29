#!/bin/bash
set -e

# Configuration
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
GITHUB_REPO="Blind-Watchmaker/terraform-aws-modules"
ROLE_NAME="github-actions-terraform-role"
POLICY_NAME="github-actions-terraform-policy"

echo "Setting up GitHub OIDC for repository: $GITHUB_REPO"
echo "AWS Account ID: $AWS_ACCOUNT_ID"

# Create OIDC Identity Provider
echo "Creating OIDC Identity Provider..."
aws iam create-open-id-connect-provider \
    --url https://token.actions.githubusercontent.com \
    --client-id-list sts.amazonaws.com \
    --thumbprint-list 6938fd4d98bab03faadb97b34396831e3780aea1 \
    --tags Key=Purpose,Value=GitHubActions Key=Repository,Value="$GITHUB_REPO" || echo "Provider may already exist"

# Create IAM Policy
echo "Creating IAM Policy..."
cat > /tmp/github-actions-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteBucket",
                "s3:GetBucketLocation",
                "s3:GetBucketVersioning",
                "s3:PutBucketVersioning",
                "s3:PutBucketEncryption",
                "s3:GetBucketEncryption",
                "s3:PutBucketPublicAccessBlock",
                "s3:GetBucketPublicAccessBlock",
                "s3:PutBucketPolicy",
                "s3:GetBucketPolicy",
                "s3:DeleteBucketPolicy",
                "s3:PutBucketTagging",
                "s3:GetBucketTagging",
                "s3:DeleteBucketTagging",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::test-bucket-*",
                "arn:aws:s3:::test-bucket-*/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:CreateTable",
                "dynamodb:DeleteTable",
                "dynamodb:DescribeTable",
                "dynamodb:PutItem",
                "dynamodb:GetItem",
                "dynamodb:UpdateItem",
                "dynamodb:DeleteItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:ListTables",
                "dynamodb:TagResource",
                "dynamodb:UntagResource",
                "dynamodb:ListTagsOfResource"
            ],
            "Resource": "arn:aws:dynamodb:*:*:table/test-table-*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:GetRole",
                "iam:AttachRolePolicy",
                "iam:DetachRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:PassRole",
                "iam:CreatePolicy",
                "iam:DeletePolicy",
                "iam:GetPolicy",
                "iam:ListPolicies",
                "iam:TagRole",
                "iam:UntagRole",
                "iam:ListRoleTags"
            ],
            "Resource": "*"
        }
    ]
}
EOF

aws iam create-policy \
    --policy-name "$POLICY_NAME" \
    --policy-document file:///tmp/github-actions-policy.json \
    --description "Policy for GitHub Actions Terraform testing" || echo "Policy may already exist"

# Create Trust Policy
echo "Creating Trust Policy..."
cat > /tmp/trust-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::$AWS_ACCOUNT_ID:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:$GITHUB_REPO:*"
                }
            }
        }
    ]
}
EOF

# Create IAM Role
echo "Creating IAM Role..."
aws iam create-role \
    --role-name "$ROLE_NAME" \
    --assume-role-policy-document file:///tmp/trust-policy.json \
    --description "Role for GitHub Actions Terraform testing" \
    --tags Key=Purpose,Value=GitHubActions Key=Repository,Value="$GITHUB_REPO" || echo "Role may already exist"

# Attach Policy to Role
echo "Attaching Policy to Role..."
aws iam attach-role-policy \
    --role-name "$ROLE_NAME" \
    --policy-arn "arn:aws:iam::$AWS_ACCOUNT_ID:policy/$POLICY_NAME"

echo "Setup complete!"
echo "Role ARN: arn:aws:iam::$AWS_ACCOUNT_ID:role/$ROLE_NAME"
echo "Add this to your GitHub Action workflow."