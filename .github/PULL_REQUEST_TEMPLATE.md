# Pull Request

## Description

<!-- Provide a brief description of the changes in this PR -->

## Type of Change

<!-- Mark the relevant option with an "x" -->

- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] ✨ New feature (non-breaking change which adds functionality)
- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] 📚 Documentation update
- [ ] 🔧 Refactoring (no functional changes)
- [ ] ⚡ Performance improvement
- [ ] 🧪 Test improvements
- [ ] 🔒 Security enhancement

## Module(s) Affected

<!-- Mark the relevant modules with an "x" -->

- [ ] Other: <!-- Specify which module(s) -->

## Changes Made

<!-- Provide a detailed list of changes made -->

### Added
- <!-- List new features, modules, or functionality -->

### Changed
- <!-- List modifications to existing functionality -->

### Removed
- <!-- List removed features or functionality -->

### Fixed
- <!-- List bug fixes -->

## Testing

<!-- Describe the testing performed -->

- [ ] ✅ All existing tests pass
- [ ] ✅ New tests added for new functionality
- [ ] ✅ Manual testing completed
- [ ] ✅ Example configurations tested
- [ ] ✅ Terraform plan/apply successful in examples

### Test Commands Run

```bash
# Add the commands you ran to test your changes
terraform init
terraform validate
terraform plan
```

## Documentation

<!-- Mark completed documentation tasks with an "x" -->

- [ ] ✅ README.md updated (if applicable)
- [ ] ✅ Variable descriptions updated
- [ ] ✅ Output descriptions updated
- [ ] ✅ Example configurations updated
- [ ] ✅ CHANGELOG.md updated (if applicable)

## Breaking Changes

<!-- If this is a breaking change, describe what breaks and how to migrate -->

- [ ] This is NOT a breaking change
- [ ] This IS a breaking change

### Migration Guide (if breaking change)

<!-- Provide step-by-step migration instructions -->

## Version Bump

<!-- Mark the appropriate version bump -->

- [ ] Patch version bump (1.0.0 → 1.0.1) - Bug fixes
- [ ] Minor version bump (1.0.0 → 1.1.0) - New features, backwards compatible
- [ ] Major version bump (1.0.0 → 2.0.0) - Breaking changes
- [ ] No version bump needed

## Security Considerations

<!-- Describe any security implications -->

- [ ] No security implications
- [ ] Security review completed
- [ ] Sensitive data handling reviewed
- [ ] IAM permissions reviewed
- [ ] Network security reviewed

## Performance Impact

<!-- Describe any performance implications -->

- [ ] No performance impact
- [ ] Performance improvement
- [ ] Performance regression (explain below)

## Checklist

<!-- Mark completed items with an "x" -->

### Code Quality
- [ ] ✅ Code follows Terraform best practices
- [ ] ✅ Variables have proper descriptions and types
- [ ] ✅ Outputs have proper descriptions
- [ ] ✅ Resources have appropriate tags
- [ ] ✅ No hardcoded values
- [ ] ✅ Proper error handling

### Module Standards
- [ ] ✅ Follows Google's reusable module best practices
- [ ] ✅ No provider configuration in module
- [ ] ✅ Required providers block present
- [ ] ✅ All resources have outputs
- [ ] ✅ Tags variable exposed
- [ ] ✅ Examples directory present

### Documentation
- [ ] ✅ README.md is comprehensive
- [ ] ✅ Usage examples provided
- [ ] ✅ Input/output tables complete
- [ ] ✅ Security considerations documented
- [ ] ✅ Cost considerations documented

### Testing
- [ ] ✅ Example configurations work
- [ ] ✅ Terraform validate passes
- [ ] ✅ Terraform plan successful
- [ ] ✅ No linting errors

## Screenshots/Examples

<!-- If applicable, add screenshots or example outputs -->

## Related Issues

<!-- Link to any related issues -->

Fixes #<!-- issue number -->
Related to #<!-- issue number -->

## Additional Notes

<!-- Any additional information that reviewers should know -->

---

## Reviewer Checklist

<!-- For reviewers to check -->

- [ ] Code review completed
- [ ] Documentation review completed
- [ ] Testing verified
- [ ] Security implications considered
- [ ] Breaking changes identified
- [ ] Version bump appropriate
- [ ] Ready to merge

## Post-Merge Actions

<!-- Tasks to complete after merge -->

- [ ] Create GitHub release (if version bump)
- [ ] Update module documentation
- [ ] Notify stakeholders (if breaking change)
- [ ] Update dependent projects