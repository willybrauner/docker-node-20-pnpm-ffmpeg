# Docker node-pnpm-ffmpeg

Alpine image with Node, pnpm and ffmpeg, published as `willybrownhair/node-{NODE_MAJOR}-pnpm-ffmpeg`.

## Tags

- `{NODE_VERSION}-pnpm{PNPM_VERSION}` (ex: `24.21.0-pnpm12.6.0`): immutable, reference this one in docker-compose
- `latest`: moves on each publish

Previous images (`node-20-pnpm-ffmpeg`, `node-22-pnpm-ffmpeg`) are kept on Docker Hub for rollback.

## Publish a new version

```bash
# 1. Build locally for the current platform and check node / pnpm / ffmpeg
./test.sh 24.21.0 12.6.0

# 2. Build amd64 + arm64 and push both tags
./build-and-push.sh 24.21.0 12.6.0
```

`PNPM_VERSION` must match the `packageManager` field of the projects using the image.
