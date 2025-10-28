---
name: Feature Request
about: Suggest an idea for our Terraform modules
title: '[FEATURE] '
labels: ['enhancement', 'needs-discussion']
assignees: ''
---

## Feature Summary

<!-- Provide a clear and concise description of the feature you'd like to see -->

## Module(s) Affected

<!-- Mark the relevant modules with an "x" -->

- [ ] backend
- [ ] github-actions
- [ ] New module needed
- [ ] Other: <!-- Specify which module(s) -->

## Problem Statement

<!-- Is your feature request related to a problem? Please describe -->

## Proposed Solution

<!-- Describe the solution you'd like -->

## Alternative Solutions

<!-- Describe any alternative solutions or workarounds you've considered -->

## Use Case

<!-- Describe the specific use case this feature would address -->

```hcl
# Example of how you would like to use this feature
module "example" {
  source = "github.com/willmusgrave/terraform-aws-modules//modules/backend"
  version = "~> 1.0"
  
  # New feature configuration
  new_feature = "example_value"
}
```

## Benefits

<!-- What benefits would this feature provide? -->

- [ ] Improves usability
- [ ] Adds new functionality
- [ ] Fixes a limitation
- [ ] Improves performance
- [ ] Enhances security
- [ ] Other: <!-- Specify -->

## Implementation Considerations

<!-- Any thoughts on how this might be implemented? -->

## Breaking Changes

<!-- Would this feature require breaking changes? -->

- [ ] No breaking changes required
- [ ] Minor breaking changes (backwards compatible with deprecation)
- [ ] Major breaking changes (requires major version bump)

## Additional Context

<!-- Add any other context, screenshots, or examples about the feature request here -->

## Priority

<!-- How important is this feature to you? -->

- [ ] Low - Nice to have
- [ ] Medium - Would be helpful
- [ ] High - Important for my use case
- [ ] Critical - Blocking my adoption

## Checklist

<!-- Mark completed items with an "x" -->

- [ ] I have searched existing issues to ensure this is not a duplicate
- [ ] I have provided a clear description of the feature
- [ ] I have explained the use case and benefits
- [ ] I have considered implementation implications
- [ ] I have provided example configuration if applicable