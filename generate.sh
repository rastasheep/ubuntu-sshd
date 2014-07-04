#!/bin/bash
set -e

for v in */; do
  v="${v%/}"
  sed "s/%VERSION%/$v/g" Dockerfile.template > "$v/Dockerfile"
done
