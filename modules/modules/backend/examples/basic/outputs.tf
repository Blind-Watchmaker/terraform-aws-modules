output "s3_bucket_name" {
  description = "The name of the S3 bucket used for Terraform state"
  value       = module.backend.s3_bucket
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for state locking"
  value       = module.backend.dynamodb_table
}