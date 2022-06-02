# OpenVSCode Python

Small example of a Docker container that clones a Python repo on boot and exposes it in openvscode-server.

## Usage

To build the image:

```
docker build -t gitpod-docker .
```

To run the container:

```
docker run --rm -it -p 3000:3000 gitpod-docker https://github.com/jrderuiter/penguins
```
