# motivationalApp

The app that will tell you what you want when you need it

## Localization

The app uses Flutter's generated localizations with English and Italian resources
stored in `lib/l10n/`.

## Release flow

Create a release tag with:

```bash
./scripts/tag-release.sh vX.Y.Z
```

That script updates `pubspec.yaml`, commits the version bump, pushes it, creates
an annotated tag, and pushes the tag. Pushing a `v*` tag triggers GitHub Actions
to build two signed Android release artifacts and publish them to the GitHub
Release:

- a direct-distribution APK with the Buy Me a Coffee About dialog
- a Play Store AAB with the repository-based About dialog

Release versions use the format `X.Y.Z+NNNNN` in `pubspec.yaml`, where the
build number is derived from the tag:

- `v2.0.4` -> `2.0.4+20004`
- `v2.1.0` -> `2.1.0+20100`

The release workflow expects these GitHub secrets:

- `KEYSTORE_BASE64`
- `KEYSTORE_PASSWORD`
- `KEY_PASSWORD`
- `KEY_ALIAS`
