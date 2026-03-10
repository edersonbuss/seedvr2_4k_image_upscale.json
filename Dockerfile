# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow's custom nodes are not registry packages; cloning the GitHub repo(s) directly.
RUN git clone https://github.com/ainvfx/ComfyUI-SeedVR2_VideoUpscaler /comfyui/custom_nodes/ComfyUI-SeedVR2_VideoUpscaler
# Could not resolve custom node 'Note' (no aux_id provided)
# Could not resolve custom node 'Note' (no aux_id provided)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/blob/main/seedvr2_ema_7b_sharp_fp16.safetensors --relative-path models/diffusion_models --filename seedvr2_ema_7b_sharp_fp16.safetensors
RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/blob/main/ema_vae_fp16.safetensors --relative-path models/vae --filename ema_vae_fp16.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
