variable "github_repo" {
  description = "GitHub repository in format <username>/<repo>"
  type        = string
}

variable "branch" {
  description = "Branch allowed to assume this role"
  type        = string
  default     = "main"
}

variable "s3_bucket_name" {
  description = "S3 bucket used for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table used for Terraform state locking"
  type        = string
}

variable "aws_region" {
  description = "AWS region for backend resources"
  type        = string
  default     = "ca-central-1"
}

variable "role_name" {
  description = "Name for the IAM role"
  type        = string
  default     = "Terraform-Route53-GHA-Role"
}

variable "policy_name" {
  description = "Name for the IAM policy"
  type        = string
  default     = "Terraform-Route53-GHA-Policy"
}

variable "tags" {
  description = "A map of tags to apply to contained resources"
  type        = map(string)
  default     = {}
}
