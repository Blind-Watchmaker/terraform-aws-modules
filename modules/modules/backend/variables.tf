variable "aws_region" {
  description = "AWS region for the backend"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to contained resources"
  type        = map(string)
  default     = {}
}
