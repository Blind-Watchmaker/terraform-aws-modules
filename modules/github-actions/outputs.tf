output "iam_role_arn" {
  description = "ARN of the IAM role for GitHub Actions"
  value       = aws_iam_role.main.arn
}

output "iam_role_name" {
  description = "Name of the IAM role for GitHub Actions"
  value       = aws_iam_role.main.name
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy for GitHub Actions"
  value       = aws_iam_policy.main.arn
}

output "iam_policy_name" {
  description = "Name of the IAM policy for GitHub Actions"
  value       = aws_iam_policy.main.name
}