#!/bin/bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

git pull
git checkout master
git rev-parse HEAD
