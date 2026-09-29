#!/bin/bash
# Build and push the multi-platform image
# Usage: ./build-and-push.sh [NODE_VERSION] [PNPM_VERSION]
# ex:    ./build-and-push.sh 24.21.0 12.6.0
set -euo pipefail

NODE_VERSION="${1:-24.21.0}"
PNPM_VERSION="${2:-12.6.0}"
NODE_MAJOR="${NODE_VERSION%%.*}"
IMAGE="willybrownhair/node-${NODE_MAJOR}-pnpm-ffmpeg"
TAG="${NODE_VERSION}-pnpm${PNPM_VERSION}"

# Create and use CrossBuilder to be able to build for amd64 and arm64
docker buildx inspect CrossBuilder >/dev/null 2>&1 || docker buildx create --name CrossBuilder
docker buildx use CrossBuilder

echo "Building and pushing ${IMAGE}:${TAG} and ${IMAGE}:latest"
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg NODE_VERSION="${NODE_VERSION}" \
  --build-arg PNPM_VERSION="${PNPM_VERSION}" \
  -f Dockerfile \
  -t "${IMAGE}:${TAG}" \
  -t "${IMAGE}:latest" \
  --push .
