# Folding@Home Docker images

## Introduction

This repository contains Docker images for the Folding@Home project. Folding@Home is a distributed computing project for disease research that simulates protein folding, computational drug design, and other types of molecular dynamics.

The repository includes two Docker images:

1. **Folding@Home Client Docker image**: This image runs the Folding@Home client, which connects to the Folding@Home network and performs calculations.

2. **Folding@Home Node Docker image**: This image runs a Folding@Home Node, which can be used to manage and monitor multiple Folding@Home clients.

Each Docker image is configurable via environment variables, allowing you to customize the behavior of the Folding@Home client and node. Detailed instructions for running the Docker images are provided below.

## Folding@Home Client Docker image

### Environment variables for Client container

| Variable Name   | Description                                                    | Default value |
|-----------------|----------------------------------------------------------------|---------------|
| FOLD_USER       | Your username on FAH portal                                    | `Anonymous`   |
| FOLD_PASSKEY    | Your passkey on FAH portal                                     | ``            |
| FOLD_TEAM       | Your team number on FAH portal                                 | `0`           |
| FOLD_ALLOW_IP   | IP addresses allowed to connect to your FAH client             | ``            |
| FOLD_ON_IDLE    | Whether the FAH client should run only when the system is idle | `false`       |
| FOLD_EXTRA_ARGS | Additional command line arguments for the FAH client           | ``            |

### How to run Folding@Home client with docker

You can run the Folding@Home client Docker container with the following command:

```bash
docker run -e FOLD_USER=<your_username> \
           -e FOLD_PASSKEY=<your_passkey> \
           -e FOLD_TEAM=<your_team_number> \
           -e FOLD_ALLOW_IP=<allowed_ips> \
           -e FOLD_ON_IDLE=<true_or_false> \
           -e FOLD_EXTRA_ARGS=<extra_args> \
           -v <persistent_volume>:/var/lib/fahclient/ \
           ghcr.io/l13t/fah-client-bastet
```

Replace `<your_username>`, `<your_passkey>`, `<your_team_number>`, `<allowed_ips>`, `<true_or_false>`, `<extra_args>`, and `<persistent_volume>` with your actual values.

Alternatively, you can use an environment file:

```bash
docker run --env-file .dockerenv -v <persistent_volume>:/var/lib/fahclient/ ghcr.io/l13t/fah-client-bastet
```

In this case, `.dockerenv` should contain the environment variables you want to enable for your setup.

Remember all processes inside a container are running by default with a `fah-client` user that has UID 19000 and GID 19000.

## Folding@Home Node Docker image

### Environment variables for Node container

| Variable Name             | Description                                  | Default value | Required |
|---------------------------|----------------------------------------------|---------------|----------|
| NODE_ADMINS               | Admin users for the node                     | -             | true     |
| NODE_DOMAINS              | Domains that the node should serve           | -             | true     |
| NODE_GOOGLE_CLIENT_ID     | Google client ID for authentication          | -             | true     |
| NODE_GOOGLE_CLIENT_SECRET | Google client secret for authentication      | -             | true     |
| NODE_GOOGLE_REDIRECT_BASE | Base URL for Google authentication redirects | -             | true     |
| NODE_HTTP_ADDRESSES       | HTTP addresses the node should listen on     | `0.0.0.0:80`  | false    |
| NODE_HTTPS_ADDRESSES      | HTTPS addresses the node should listen on    | `0.0.0.0:443` | false    |

### How to run Folding@Home Node with docker

You can run the Folding@Home Node Docker container with the following command:

```bash
docker run -e NODE_ADMINS=<admin_users> \
           -e NODE_DOMAINS=<domains> \
           -e NODE_GOOGLE_CLIENT_ID=<google_client_id> \
           -e NODE_GOOGLE_CLIENT_SECRET=<google_client_secret> \
           -e NODE_GOOGLE_REDIRECT_BASE=<google_redirect_base> \
           -e NODE_HTTP_ADDRESSES=<http_addresses> \
           -e NODE_HTTPS_ADDRESSES=<https_addresses> \
           -v <persistent_volume>:/var/lib/fahclient/ \
           ghcr.io/l13t/fah-node-bastet
```

Replace `<admin_users>`, `<domains>`, `<google_client_id>`, `<google_client_secret>`, `<google_redirect_base>`, `<http_addresses>`, `<https_addresses>`, and `<persistent_volume>` with your actual values.

Alternatively, you can use an environment file:

```bash
docker run --env-file .dockerenv -v <persistent_volume>:/var/lib/fahclient/ ghcr.io/l13t/fah-node-bastet
```

In this case, .dockerenv should contain the environment variables you want to enable for your setup.

Remember all processes inside a container are running by default with a `fah-node` user that has UID 19000 and GID 19000.
