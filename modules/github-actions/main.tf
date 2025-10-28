terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}
data "aws_caller_identity" "current" {}

resource "aws_iam_role" "main" {
  name = var.role_name

  tags = merge({
    Name        = "GitHub Actions OIDC Role"
    Purpose     = "GitHub Actions Authentication"
    ManagedBy   = "Terraform"
    Module      = "github-actions"
    Service     = "GitHub Actions"
  }, var.tags)

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_repo}:ref:refs/heads/${var.branch}"
          }
        }
      }
    ]
  })
}

# Render IAM policy dynamically
resource "aws_iam_policy" "main" {
  name   = var.policy_name

  tags = merge({
    Name        = "GitHub Actions IAM Policy"
    Purpose     = "GitHub Actions Permissions"
    ManagedBy   = "Terraform"
    Module      = "github-actions"
    Service     = "GitHub Actions"
  }, var.tags)

  policy = templatefile("${path.module}/policy.json.tpl", {
    s3_bucket_name     = var.s3_bucket_name
    dynamodb_table_name = var.dynamodb_table_name
    aws_region         = var.aws_region
    account_id         = data.aws_caller_identity.current.account_id
  })
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main.arn
}


