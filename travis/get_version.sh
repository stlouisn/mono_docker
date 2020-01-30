#!/usr/bin/env bash

set -euo pipefail

# Output mono version from mono-project:sources releases
echo "$(curl -fsSL --retry 5 --retry-delay 2 https://download.mono-project.com/sources/mono/ | grep 'tar.bz2' | tail -n 1 | awk -F '>mono-' {'print $2'} | awk -F '.tar.bz2' {'print $1'})"
