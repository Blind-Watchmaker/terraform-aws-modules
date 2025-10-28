provider "aws" {
  region = var.aws_region
}

module "github_actions_role" {
  source = "../../"

  github_repo         = var.github_repo
  branch              = var.branch
  s3_bucket_name      = var.s3_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  aws_region          = var.aws_region
  role_name           = var.role_name
  policy_name         = var.policy_name
}
