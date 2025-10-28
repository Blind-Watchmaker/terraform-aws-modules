---
name: Bug Report
about: Create a report to help us improve our Terraform modules
title: '[BUG] '
labels: ['bug', 'needs-triage']
assignees: ''
---

## Bug Description

<!-- Provide a clear and concise description of what the bug is -->

## Module(s) Affected

<!-- Mark the relevant modules with an "x" -->

- [ ] backend
- [ ] github-actions
- [ ] Other: <!-- Specify which module(s) -->

## Expected Behavior

<!-- A clear and concise description of what you expected to happen -->

## Actual Behavior

<!-- A clear and concise description of what actually happened -->

## Steps to Reproduce

<!-- Steps to reproduce the behavior -->

1. Go to '...'
2. Use module with '...'
3. Run '...'
4. See error

## Terraform Configuration

<!-- Please provide a minimal example that reproduces the issue -->

```hcl
module "example" {
  source = "github.com/willmusgrave/terraform-aws-modules//modules/backend"
  version = "~> 1.0"
  
  # Add your configuration here
}
```

## Error Output

<!-- If applicable, add error messages or logs -->


## Environment Information

<!-- Please complete the following information -->

- **Terraform Version**: <!-- e.g., 1.6.0 -->
- **AWS Provider Version**: <!-- e.g., 5.0.0 -->
- **Module Version**: <!-- e.g., 1.0.0 -->
- **Operating System**: <!-- e.g., Ubuntu 22.04, macOS 13.0, Windows 11 -->
- **AWS Region**: <!-- e.g., us-west-2 -->

## Additional Context

<!-- Add any other context about the problem here -->

## Workaround

<!-- If you have found a workaround, please describe it here -->

## Impact

<!-- Describe the impact of this bug -->

- [ ] Low - Minor inconvenience
- [ ] Medium - Affects functionality but workaround exists
- [ ] High - Breaks core functionality
- [ ] Critical - Security issue or data loss risk

## Checklist

<!-- Mark completed items with an "x" -->

- [ ] I have searched existing issues to ensure this is not a duplicate
- [ ] I have provided all the information requested above
- [ ] I have tested with the latest version of the module
- [ ] I have provided a minimal reproduction case
- [ ] I have included relevant error messages/logs