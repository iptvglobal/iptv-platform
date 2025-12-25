#!/bin/bash
set -e

echo "Building IPTV Platform..."

# Install dependencies
pnpm install --frozen-lockfile

# Build client
echo "Building client..."
pnpm run build

# Run database migrations
echo "Running database migrations..."
pnpm drizzle-kit push --config drizzle.config.ts

echo "Build complete!"
