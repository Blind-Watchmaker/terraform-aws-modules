# Contributing to Terraform AWS Modules

Thank you for your interest in contributing to the Terraform AWS Modules library! This document provides guidelines for contributing to this project.

## Getting Started

### Prerequisites
- Terraform >= 1.0
- AWS Provider >= 4.0
- Git
- GitHub account

### Development Setup
1. Fork the repository
2. Clone your fork locally
3. Create a feature branch
4. Make your changes
5. Test your changes
6. Submit a pull request

## Contribution Guidelines

### Code Standards

#### Terraform Best Practices
- Follow [Google's Terraform best practices](https://docs.cloud.google.com/docs/terraform/best-practices/general-style-structure)
- Use consistent formatting (`terraform fmt`)
- Include comprehensive documentation
- Write meaningful commit messages

#### Module Standards
- All modules must follow the standard structure
- Include required files: `main.tf`, `variables.tf`, `outputs.tf`, `README.md`
- All variables must have descriptions and types
- All outputs must have descriptions
- Include examples in the `examples/` directory

#### Resource Naming
- Use `main` for single resources of each type
- Use descriptive names for multiple resources
- Follow Google's naming conventions

### Documentation Standards

#### Module README
Each module must include:
- Clear description and purpose
- Usage examples
- Input/output tables
- Security considerations
- Cost considerations

#### Code Comments
- Document complex logic
- Explain non-obvious decisions
- Include TODO comments for future improvements

### Testing Requirements

#### Automated Testing
- All modules must pass GitHub Actions workflows
- Terraform validation must pass
- Example configurations must work
- No linting errors

#### Manual Testing
- Test with different variable combinations
- Verify outputs are correct
- Test upgrade/downgrade scenarios

## Pull Request Process

### Before Submitting
1. Ensure your changes follow the code standards
2. Test your changes thoroughly
3. Update documentation as needed
4. Check that all tests pass

### Pull Request Template
Use the provided pull request template to ensure all required information is included.

### Review Process
1. Automated tests must pass
2. Code review by maintainers
3. Documentation review
4. Security review (if applicable)

### Approval Requirements
- At least one maintainer approval
- All automated tests passing
- No security issues identified

## Issue Reporting

### Bug Reports
Use the bug report template and include:
- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Environment information
- Terraform configuration example

### Feature Requests
Use the feature request template and include:
- Clear description of the feature
- Use case and benefits
- Proposed implementation
- Breaking change considerations

## Module Development

### Creating New Modules

#### Planning
1. Identify the need and use case
2. Research existing solutions
3. Design the module interface
4. Plan the implementation

#### Implementation
1. Create module structure
2. Implement resources
3. Add variables and outputs
4. Write documentation
5. Create examples
6. Add tests

#### Review
1. Self-review against standards
2. Peer review
3. Security review
4. Documentation review

### Modifying Existing Modules

#### Backwards Compatibility
- Avoid breaking changes when possible
- Use deprecation warnings for planned breaking changes
- Provide migration guides

#### Version Bumping
- Patch: Bug fixes
- Minor: New features (backwards compatible)
- Major: Breaking changes

## Security Guidelines

### Sensitive Information
- Never commit secrets or credentials
- Use environment variables for sensitive data
- Document security considerations

### Permissions
- Follow principle of least privilege
- Document all required permissions
- Use specific resource ARNs

### Dependencies
- Keep dependencies up to date
- Review security advisories
- Use trusted sources

## Release Process

### Version Management
- Follow semantic versioning
- Update CHANGELOG.md
- Create GitHub releases
- Tag releases appropriately

### Communication
- Announce breaking changes
- Provide migration guides
- Document new features

## Community Guidelines

### Code of Conduct
- Be respectful and inclusive
- Provide constructive feedback
- Help others learn and grow

### Communication
- Use clear, professional language
- Provide context for issues and requests
- Be patient with questions and feedback

## Getting Help

### Documentation
- Check module README files
- Review examples
- Read architecture documentation

### Community
- Open GitHub issues for questions
- Participate in discussions
- Share knowledge and experiences

## Recognition

Contributors will be recognized in:
- CHANGELOG.md
- GitHub releases
- Project documentation

---

*Thank you for contributing to the Terraform AWS Modules library!*