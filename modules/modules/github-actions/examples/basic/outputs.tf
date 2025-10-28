output "iam_role_arn" {
  description = "ARN of the IAM role for GitHub Actions"
  value       = module.github_actions_role.iam_role_arn
}

output "iam_role_name" {
  description = "Name of the IAM role for GitHub Actions"
  value       = module.github_actions_role.iam_role_name
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy for GitHub Actions"
  value       = module.github_actions_role.iam_policy_arn
}

output "iam_policy_name" {
  description = "Name of the IAM policy for GitHub Actions"
  value       = module.github_actions_role.iam_policy_name
}

output "github_actions_config" {
  description = "Configuration values needed for GitHub Actions workflow"
  value = {
    role_arn  = module.github_actions_role.iam_role_arn
    region    = var.aws_region
    repo      = var.github_repo
    branch    = var.branch
  }
}