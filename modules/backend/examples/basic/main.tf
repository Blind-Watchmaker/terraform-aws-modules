provider "aws" {
  region = var.aws_region
}

module "backend" {
  source = "../../"

  aws_region          = var.aws_region
  s3_bucket_name      = var.s3_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}