# Server setup:
apt update && apt install -y git

# Project repo
git clone [https://github.com/arun4infra/runpod-worker-comfy-flux1-dev-2r8n  ](https://github.com/arun4infra/runpod-worker-comfy-flux1-dev.git)  
cd runpod-worker-comfy-flux1-dev  
chmod +x ./build.sh  
export HUGGINGFACE_ACCESS_TOKEN=hf_  
./build.sh Dockerfile.gen flux1-dev-gen-gguf  
docker push arun4infra/runpod-worker-comfy:flux1-dev-gen-gguf  

# Validate
docker run --rm arun4infra/runpod-worker-comfy:flux1-dev-gen-gguf ls -la /comfyui/models/clip  
docker run --rm arun4infra/runpod-worker-comfy:flux1-dev-gen-gguf ls -la /comfyui/custom_nodes  
docker run --rm arun4infra/runpod-worker-comfy:flux1-dev-gen-gguf  ls -la /comfyui/models/loras/

# Push docker image
docker login  
docker push arun4infra/runpod-worker-comfy:flux1-dev-gen

----------------------------------
[RECOMENDED]
# For Local General lora build:
./build.sh Dockerfile.gen flux1-dev-gen-gguf

docker push arun4infra/runpod-worker-comfy:flux1-dev-gen-gguf

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
