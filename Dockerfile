# Base stage
FROM node:20-alpine AS base

# Install pnpm globally
RUN npm install -g pnpm

# Install ffmpeg for video generation
RUN apk add --no-cache ffmpeg
