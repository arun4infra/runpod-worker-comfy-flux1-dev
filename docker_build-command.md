1. git clone https://github.com/Arun4you/runpod-worker-comfy-flux1-dev-2r8n
2. docker build --build-arg MODEL_TYPE=flux1-dev-lora-2r8n-d1g2 --build-arg HUGGINGFACE_ACCESS_TOKEN=<hf_TOKEN> -t arun4you/runpod-worker-comfy:flux1-dev-2r8n-d1g2 --platform linux/amd64 .
3. docker push arun4you/runpod-worker-comfy:flux1-dev-2r8n-d1g2