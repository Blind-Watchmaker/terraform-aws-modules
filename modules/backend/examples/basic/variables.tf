variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
  default     = "ca-central-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for Terraform state storage"
  type        = string
  default     = "my-terraform-state-bucket"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
  default     = "my-terraform-locks"
}

variable "tags" {
  description = "A map of tags to apply to contained resources"
  type        = map(string)
  default     = {
    Environment = "example"
    Project     = "terraform-backend"
  }
}