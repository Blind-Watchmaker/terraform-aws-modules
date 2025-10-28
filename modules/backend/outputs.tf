output "s3_bucket" {
  description = "The name of the S3 bucket used for Terraform state"
  value       = aws_s3_bucket.main.id
}

output "dynamodb_table" {
  description = "The name of the DynamoDB table used for state locking"
  value       = aws_dynamodb_table.main.name
}
