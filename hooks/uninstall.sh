#!/bin/bash

base_dir="$(dirname -- "${BASH_SOURCE[0]}")"
find "${base_dir}" -type f ! -name '*.sh' -print0 | xargs -I _ rm -f .git/_
