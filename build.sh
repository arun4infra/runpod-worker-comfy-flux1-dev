#!/bin/bash

# export HUGGINGFACE_ACCESS_TOKEN=hf_yourtoken
# Usage: ./build.sh [dockerfile] [model_type] [tag]
# Example: ./build.sh Dockerfile.loras flux1-dev-lora-2r8n-d1g2 my-image:latest

# Default values
DOCKERFILE=${1:-Dockerfile}
MODEL_TYPE=${2:-flux1-dev}
TAG=${3:-arun4infra/runpod-worker-comfy:latest}
PLATFORM="linux/amd64"

# Require HUGGINGFACE_ACCESS_TOKEN to be set
if [[ -z "${HUGGINGFACE_ACCESS_TOKEN}" ]]; then
  echo "❌ HUGGINGFACE_ACCESS_TOKEN environment variable not set"
  exit 1
fi

echo "🛠️  Building Docker image with:"
echo "  Dockerfile: $DOCKERFILE"
echo "  Model type: $MODEL_TYPE"
echo "  Tag:        $TAG"
echo "  Platform:   $PLATFORM"

docker build -f "$DOCKERFILE" \
  --build-arg MODEL_TYPE="$MODEL_TYPE" \
  --build-arg HUGGINGFACE_ACCESS_TOKEN="$HUGGINGFACE_ACCESS_TOKEN" \
  -t "$TAG" \
  --platform "$PLATFORM" \
  .

echo "✅ Build complete: $TAG"