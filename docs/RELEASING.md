# Release Process

This document describes the release process for the Terraform AWS Modules
library.

## Release Types

### Patch Release (x.x.X)

- Bug fixes
- Documentation updates
- Security patches
- No breaking changes

### Minor Release (x.X.x)

- New features
- New modules
- Enhancements
- Backwards compatible changes

### Major Release (X.x.x)

- Breaking changes
- API changes
- Deprecated features removed
- Significant architectural changes

## Release Checklist

### Pre-Release

- [ ] All tests passing
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
- [ ] Version numbers updated
- [ ] Breaking changes documented
- [ ] Migration guides created (if needed)
- [ ] Security review completed

### Release Process Procedure

1. **Update CHANGELOG.md**
   - Move items from [Unreleased] to new version
   - Add release date
   - Include all changes

2. **Update Version Numbers**
   - Update module version variables (if used)
   - Update documentation references
   - Update example configurations

3. **Create Release Branch**

   ```bash
   git checkout -b release/v1.0.0
   git add .
   git commit -m "chore: prepare release v1.0.0"
   git push -u origin release/v1.0.0
   ```

4. **Create Pull Request**
   - Review all changes
   - Ensure tests pass
   - Get maintainer approval

5. **Merge and Tag**

   ```bash
   git checkout main
   git pull origin main
   git tag v1.0.0
   git push origin v1.0.0
   ```

6. **Create GitHub Release**
   - Use release notes from CHANGELOG.md
   - Include migration guides for breaking changes
   - Tag as latest release

### Post-Release

- [ ] Verify release artifacts
- [ ] Update dependent projects
- [ ] Announce release (if significant)
- [ ] Monitor for issues

## Automated Release Process

### GitHub Actions Workflow

```yaml
name: Release
on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Create Release
        uses: actions/create-release@v1
        with:
          tag_name: ${{ github.ref }}
          release_name: Release ${{ github.ref }}
          body: |
            See CHANGELOG.md for details
          draft: false
          prerelease: false
```

## Breaking Changes

### Planning Breaking Changes

1. **Announce Early**
   - Create issue with deprecation notice
   - Add deprecation warnings to code
   - Document timeline for removal

2. **Provide Migration Path**
   - Create migration guide
   - Provide examples
   - Offer support during transition

3. **Gradual Rollout**
   - Release with deprecation warnings
   - Allow time for users to migrate
   - Remove in next major version

### Breaking Change Checklist

- [ ] Deprecation notice added
- [ ] Migration guide created
- [ ] Timeline documented
- [ ] Community notified
- [ ] Support plan in place

## Version Numbering

### Semantic Versioning (SemVer)

- **MAJOR**: Incompatible API changes
- **MINOR**: Backwards compatible functionality
- **PATCH**: Backwards compatible bug fixes

### Examples

- `1.0.0` → `1.0.1` (patch: bug fix)
- `1.0.0` → `1.1.0` (minor: new feature)
- `1.0.0` → `2.0.0` (major: breaking change)

## Release Notes

### Format

```markdown
## [1.0.0] - 2024-01-15

### Added
- New backend module for Terraform state storage
- GitHub Actions module for OIDC authentication

### Changed
- Improved error handling in backend module

### Fixed
- Fixed DynamoDB table creation issue

### Security
- Enabled encryption by default for all storage resources
```

### Content Guidelines

- Use clear, concise language
- Include all significant changes
- Group changes by category
- Provide context for breaking changes

## Emergency Releases

### Hotfix Process

1. **Identify Critical Issue**
   - Security vulnerability
   - Data loss risk
   - Service outage

2. **Create Hotfix Branch**

   ```bash
   git checkout -b hotfix/v1.0.1
   # Make minimal fix
   git commit -m "fix: critical security issue"
   ```

3. **Fast-Track Release**
   - Expedited review process
   - Immediate release
   - Post-release documentation

## Release Communication

### Internal Communication

- Notify maintainers
- Update project documentation
- Brief team on changes

### External Communication

- GitHub release notes
- Community announcements (if significant)
- Migration guides for breaking changes

## Rollback Process

### When to Rollback

- Critical bugs discovered post-release
- Security vulnerabilities
- Performance regressions

### Rollback Steps

1. **Identify Issue**
2. **Create Hotfix**
3. **Release Patch Version**
4. **Communicate to Users**

## Quality Assurance

### Pre-Release Testing

- Automated test suite
- Manual testing
- Security scanning
- Performance testing

### Post-Release Monitoring

- Monitor issue reports
- Track adoption metrics
- Gather user feedback

## Release Schedule

### Regular Releases

- Patch releases: As needed
- Minor releases: Monthly
- Major releases: Quarterly

### Release Calendar

- Plan releases in advance
- Coordinate with dependent projects
- Avoid conflicts with holidays

---

*This release process ensures consistent, high-quality releases while
maintaining backwards compatibility and providing clear communication to
users.*
