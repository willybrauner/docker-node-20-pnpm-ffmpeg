# Node version (full version, ex: 24.22.3), set by build-and-push.sh
ARG NODE_VERSION=24.22.3

# Base stage
FROM node:${NODE_VERSION}-alpine AS base

# Install pnpm globally, pinned to the version used by the projects (packageManager)
ARG PNPM_VERSION=12.6.0
RUN npm install -g pnpm@${PNPM_VERSION}

# Install ffmpeg for video generation
RUN apk add --no-cache ffmpeg
