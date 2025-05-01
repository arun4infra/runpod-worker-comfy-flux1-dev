# Project repo
git clone https://github.com/Arun4you/runpod-worker-comfy-flux1-dev-2r8n

----------------------------------
[RECOMENDED]
# For Local General lora build:
./build.sh Dockerfile.gen flux1-dev-lora-gen-gguf

docker push arun4infra/runpod-worker-comfy:flux1-dev-gen

# For Local Arun lora build:
./build.sh Dockerfile.arunlora flux1-dev-lora-2r8n-d1g2

docker push arun4infra/runpod-worker-comfy:flux1-dev-2r8n-d1g2

----------------------------------

[LAST OPTION: NOT RECOMENDED]
# Cloud Arun Lora build and push
1. First create cloud project "runpod-worker-comfy-flux1-dev" 
2. Connect the cloud builder to local docker
3. Execute below,
docker buildx build \
  --builder cloud-arun4infra-runpod-worker-comfy-flux1-dev \
  --build-arg MODEL_TYPE=flux1-dev-lora-2r8n-d1g2 \
  --build-arg HUGGINGFACE_ACCESS_TOKEN=<> \
  -t arun4infra/runpod-worker-comfy:flux1-dev-2r8n-d1g2 \
  --platform linux/amd64 \
  --push \
  .
