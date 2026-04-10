#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <tag>" >&2
  exit 1
fi

tag="$1"
version="${tag#v}"

if [[ "$tag" == "$version" ]]; then
  echo "tag must start with v (example: v1.2.3)" >&2
  exit 1
fi

if [[ ! "$version" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  echo "tag must match v<major>.<minor>.<patch> (example: v2.0.5)" >&2
  exit 1
fi

major="${BASH_REMATCH[1]}"
minor="${BASH_REMATCH[2]}"
patch="${BASH_REMATCH[3]}"
build_code=$((10#$major * 10000 + 10#$minor * 100 + 10#$patch))
pubspec_version="${version}+${build_code}"

if [[ ! -f "pubspec.yaml" ]]; then
  echo "pubspec.yaml not found" >&2
  exit 1
fi

if ! grep -q "^version:" pubspec.yaml; then
  echo "version field not found in pubspec.yaml" >&2
  exit 1
fi

sed -i.bak -E "s/^version: .*/version: ${pubspec_version}/" pubspec.yaml
rm -f pubspec.yaml.bak

git add pubspec.yaml

if git diff --cached --quiet; then
  echo "pubspec.yaml already set to version ${pubspec_version}; skipping version bump commit"
else
  git commit -m "Bump version to ${tag}"
  git push
fi

git tag -a "$tag" -m "Release $tag"
git push origin "$tag"
