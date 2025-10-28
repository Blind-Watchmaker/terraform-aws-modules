terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

resource "aws_s3_bucket" "main" {
  bucket = var.s3_bucket_name

  tags = merge({
    Name      = "Terraform State Bucket"
    Purpose   = "Terraform State Storage"
    ManagedBy = "Terraform"
    Module    = "backend"
    Service   = "Terraform Backend"
  }, var.tags)

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "main" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  tags = merge({
    Name      = "Terraform State Locks"
    Purpose   = "Terraform State Locking"
    ManagedBy = "Terraform"
    Module    = "backend"
    Service   = "Terraform Backend"
  }, var.tags)

  attribute {
    name = "LockID"
    type = "S"
  }
}
