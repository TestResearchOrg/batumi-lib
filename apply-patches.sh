#!/bin/bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

cp -r patches /tmp/patches

git pull
git checkout master
git checkout -b patched-master

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

for PATCH in /tmp/patches/*.patch; do
  git am "$PATCH"
done

git push --set-upstream origin patched-master

git log -1
