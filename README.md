# Folding@Home Docker images

## Folding@Home Client Docker image

### Environment variables

| Variable Name   | Description                                                    | Default value |
|-----------------|----------------------------------------------------------------|---------------|
| FOLD_USER       | Your username on FAH portal                                    | `Anonymous`   |
| FOLD_PASSKEY    | Your passkey on FAH portal                                     | ``            |
| FOLD_TEAM       | Your team number on FAH portal                                 | `0`           |
| FOLD_ALLOW_IP   | IP addresses allowed to connect to your FAH client             | ``            |
| FOLD_ON_IDLE    | Whether the FAH client should run only when the system is idle | `false`       |
| FOLD_EXTRA_ARGS | Additional command line arguments for the FAH client           | ``            |

### How to run Folding@Home client with docker

```bash
docker run -v <persistant_volume>:/var/lib/fahclient/ ghcr.io/l13t/fah-client-bastet
```

or

```bash
docker run --env-file .dockerenv -v <persistant_volume>:/var/lib/fahclient/ ghcr.io/l13t/fah-client-bastet
```

`.dockerenv` should contain environment variables you want to enable for your setup.
