![Docker Pulls](https://img.shields.io/docker/pulls/reliqcontainers/comfyui)[![Container image build](https://github.com/reliq-hq/docker-comfyui/actions/workflows/docker.yml/badge.svg)](https://github.com/reliq-hq/docker-comfyui/actions/workflows/docker.yml)

# Docker ComfyUI for Intel XPU

This project provides Docker images to run [ComfyUI](https://github.com/comfyanonymous/ComfyUI) with XPU acceleration on Intel Arc Series GPUs (Alchemist and Battlemage).

## Features

- **XPU Acceleration:** Utilizes Intel's Extension for PyTorch (IPEX) to leverage Intel Arc GPUs for faster performance.
- **Dockerized:** Encapsulated in a Docker container for easy deployment and portability.
- **Pre-configured:** Includes ComfyUI and the ComfyUI-Manager for a quick start.

## Prerequisites

- Docker installed on your system.
- An Intel Arc Series GPU, A770 (Alchemist) and B580 (Battlemage) are supported.
- Intel graphics drivers installed on the host machine.

## Getting Started

To run the pre-built image from Github Container repo, you can use the following command:

```bash
docker run -p 8188:8188 --device /dev/dri \
    -v ./models:/app/models \
    -v ./user:/app/user \
    -v ./custom_nodes:/app/custom_nodes \
    ghcr.io/reliq-hq/comfyui:xpu-master
```

The image is also available on Docker Hub: https://hub.docker.com/r/reliqcontainers/comfyui

This command will:
- Start the ComfyUI container.
- Expose the ComfyUI web interface on port `8188`.
- Mount the `/dev/dri` device to enable GPU access.
- Mount local `./models`, `./user` and `./custom_nodes` directories for persistent storage of models, user data and extra nodes.

## Building the Image

You can also build the Docker image locally using the provided `Dockerfile.xpu`:

```bash
docker build -t docker-comfyui -f Dockerfile.xpu .
```

Once the build is complete, you can run the image using the `docker run` command from the "Getting Started" section, replacing `ghcr.io/reliq-hq/comfyui:xpu-master` with `docker-comfyui`.

## Configuration

- **Port:** The ComfyUI web interface is exposed on port `8188`.
- **Volumes:**
    - `/app/models`:  Used for storing ComfyUI models.
    - `/app/user`: Used for storing user-specific data and configurations.
    - `/app/custom_nodes`: Used to store installed custom_nodes.

## License

This project is licensed under the terms of the LICENSE file.
