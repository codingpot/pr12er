#!/bin/bash

base_dir="$(dirname -- "${BASH_SOURCE[0]}")"
find "${base_dir}" -type f ! -name '*.sh' -exec install -C -m 755 {} .git/hooks/ \;
