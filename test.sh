#!/bin/bash
# Build the image locally for the current platform only (no push) and check its tools
# Usage: ./test.sh [NODE_VERSION] [PNPM_VERSION]
set -euo pipefail

NODE_VERSION="${1:-24.21.0}"
PNPM_VERSION="${2:-12.6.0}"
IMAGE="node-pnpm-ffmpeg:test"

docker buildx build \
  --build-arg NODE_VERSION="${NODE_VERSION}" \
  --build-arg PNPM_VERSION="${PNPM_VERSION}" \
  -f Dockerfile \
  -t "${IMAGE}" \
  --load .

docker run --rm "${IMAGE}" sh -c "echo node \$(node -v) && echo pnpm \$(pnpm -v) && ffmpeg -version | head -1"
