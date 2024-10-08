# Docker image for running .NET 6 in an Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet-6/blob/main/LICENSE) [![Build](https://img.shields.io/github/actions/workflow/status/swissgrc/docker-azure-pipelines-dotnet-6/publish.yml?branch=develop&style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet-6/actions/workflows/publish.yml) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=swissgrc_docker-azure-pipelines-dotnet-6&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=swissgrc_docker-azure-pipelines-dotnet-6) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet)
<!-- markdownlint-restore -->

Docker image to run .NET 6 in [Azure Pipelines container jobs].
The image contains also Docker CLI to access Docker engine on the agent.

## Usage

This image can be used to run .NET 6 in [Azure Pipelines container jobs].

### Azure Pipelines Container Job

To use the image in an Azure Pipelines Container Job, add one of the following example tasks and use it with the `container` property.

The following example shows the container used for a deployment step which shows .NET version:

```yaml
  - stage: deploy
    jobs:
      - deployment: runDotNet
        container: swissgrc/azure-pipelines-dotnet:latest
        environment: smarthotel-dev
        strategy:
          runOnce:
            deploy:
              steps:
                - bash: |
                    dotnet --version
```

### Tags

| Tag        | Description                                                                                     | Base Image                 | .NET SDK | Size                                                                                                                              |
|------------|-------------------------------------------------------------------------------------------------|----------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------|
| 6          | Latest stable release (from `main` branch)                                                      | azure-pipelines-git:2.46.0 | 6.0.425  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6?style=flat-square)          |
| 6-unstable | Latest unstable release (from `develop` branch)                                                 | azure-pipelines-git:2.47.0 | 6.0.427  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6-unstable?style=flat-square) |
| 6.0.301    | [.NET SDK 6.0.301](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.6/6.0.6.md)   | debian:11.3-slim           | 6.0.301  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.301?style=flat-square)    |
| 6.0.302    | [.NET SDK 6.0.302](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.7/6.0.7.md)   | debian:11.3-slim           | 6.0.302  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.302?style=flat-square)    |
| 6.0.302.1  | [.NET SDK 6.0.302](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.7/6.0.7.md)   | debian:11.3-slim           | 6.0.302  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.302.1?style=flat-square)  |
| 6.0.400    | [.NET SDK 6.0.400](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.8/6.0.8.md)   | debian:11.3-slim           | 6.0.400  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.400?style=flat-square)    |
| 6.0.401    | [.NET SDK 6.0.401](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.9/6.0.9.md)   | debian:11.5-slim           | 6.0.401  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.401?style=flat-square)    |
| 6.0.402    | [.NET SDK 6.0.402](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.10/6.0.10.md) | debian:11.5-slim           | 6.0.402  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.402?style=flat-square)    |
| 6.0.403    | [.NET SDK 6.0.403](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.11/6.0.11.md) | debian:11.5-slim           | 6.0.403  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.403?style=flat-square)    |
| 6.0.404    | [.NET SDK 6.0.404](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.12/6.0.12.md) | debian:11.5-slim           | 6.0.404  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.404?style=flat-square)    |
| 6.0.405    | [.NET SDK 6.0.405](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.13/6.0.13.md) | debian:11.6-slim           | 6.0.405  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.405?style=flat-square)    |
| 6.0.406    | [.NET SDK 6.0.406](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.14/6.0.14.md) | debian:11.6-slim           | 6.0.406  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.406?style=flat-square)    |
| 6.0.407    | [.NET SDK 6.0.407](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.15/6.0.15.md) | debian:11.6-slim           | 6.0.407  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.407?style=flat-square)    |
| 6.0.408    | [.NET SDK 6.0.408](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.16/6.0.16.md) | debian:11.6-slim           | 6.0.408  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.408?style=flat-square)    |
| 6.0.410    | [.NET SDK 6.0.410](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.18/6.0.18.md) | azure-pipelines-git:2.39.2 | 6.0.410  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.410?style=flat-square)    |
| 6.0.411    | [.NET SDK 6.0.411](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.19/6.0.19.md) | azure-pipelines-git:2.39.2 | 6.0.411  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.411?style=flat-square)    |
| 6.0.412    | [.NET SDK 6.0.412](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.20/6.0.20.md) | azure-pipelines-git:2.39.2 | 6.0.412  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.412?style=flat-square)    |
| 6.0.413    | [.NET SDK 6.0.413](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.21/6.0.21.md) | azure-pipelines-git:2.39.2 | 6.0.413  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.413?style=flat-square)    |
| 6.0.414    | [.NET SDK 6.0.414](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.22/6.0.22.md) | azure-pipelines-git:2.39.2 | 6.0.414  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.414?style=flat-square)    |
| 6.0.415    | [.NET SDK 6.0.415](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.23/6.0.23.md) | azure-pipelines-git:2.39.2 | 6.0.415  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.415?style=flat-square)    |
| 6.0.416    | [.NET SDK 6.0.416](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.24/6.0.24.md) | azure-pipelines-git:2.42.0 | 6.0.416  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.416?style=flat-square)    |
| 6.0.417    | [.NET SDK 6.0.417](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.25/6.0.25.md) | azure-pipelines-git:2.42.1 | 6.0.417  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.417?style=flat-square)    |
| 6.0.418    | [.NET SDK 6.0.418](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.26/6.0.26.md) | azure-pipelines-git:2.43.0 | 6.0.418  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.418?style=flat-square)    |
| 6.0.419    | [.NET SDK 6.0.419](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.27/6.0.27.md) | azure-pipelines-git:2.43.1 | 6.0.419  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.419?style=flat-square)    |
| 6.0.420    | [.NET SDK 6.0.420](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.28/6.0.28.md) | azure-pipelines-git:2.44.0 | 6.0.420  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.420?style=flat-square)    |
| 6.0.421    | [.NET SDK 6.0.421](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.29/6.0.29.md) | azure-pipelines-git:2.44.0 | 6.0.421  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.421?style=flat-square)    |
| 6.0.422    | [.NET SDK 6.0.422](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.30/6.0.30.md) | azure-pipelines-git:2.45.1 | 6.0.422  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.422?style=flat-square)    |
| 6.0.423    | [.NET SDK 6.0.423](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.31/6.0.31.md) | azure-pipelines-git:2.45.1 | 6.0.423  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.423?style=flat-square)    |
| 6.0.424    | [.NET SDK 6.0.424](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.32/6.0.32.md) | azure-pipelines-git:2.45.2 | 6.0.424  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.424?style=flat-square)    |
| 6.0.425    | [.NET SDK 6.0.425](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.33/6.0.33.md) | azure-pipelines-git:2.46.0 | 6.0.425  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.425?style=flat-square)    |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
