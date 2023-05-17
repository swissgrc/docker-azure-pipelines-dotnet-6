# Docker image for running .NET in an Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet/blob/main/LICENSE) [![Build](https://img.shields.io/github/actions/workflow/status/swissgrc/docker-azure-pipelines-dotnet/publish.yml?branch=develop&style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet/actions/workflows/publish.yml) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=swissgrc_docker-azure-pipelines-dotnet&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=swissgrc_docker-azure-pipelines-dotnet) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet)
<!-- markdownlint-restore -->

Docker image to run .NET in [Azure Pipelines container jobs].
The image contains also Docker CLI to access Docker engine on the agent.

## Usage

This image can be used to run .NET in [Azure Pipelines container jobs].

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

| Tag        | Description                                                                                     | Base Image       | Docker CLI | Docker Compose | .NET SDK | Git                  | Git LFS | Size                                                                                                                             |
|------------|-------------------------------------------------------------------------------------------------|------------------|------------|----------------|----------|----------------------|---------|----------------------------------------------------------------------------------------------------------------------------------|
| latest     | Latest stable release (from `main` branch)                                                      | debian:11.6-slim | 23.0.3     | N/A            | 6.0.408  | 1:2.39.2-1~bpo11+1   | 3.3.0   | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/latest?style=flat-square)    |
| unstable   | Latest unstable release (from `develop` branch)                                                 | debian:11.7-slim | 24.0.0     | 2.17.3         | 6.0.408  | 1:2.39.2-1~bpo11+1   | 3.3.0   | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/unstable?style=flat-square)  |
| 6.0.301    | [.NET SDK 6.0.301](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.6/6.0.6.md)   | debian:11.3-slim | 20.10.17   | N/A            | 6.0.301  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.301?style=flat-square)   |
| 6.0.302    | [.NET SDK 6.0.302](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.7/6.0.7.md)   | debian:11.3-slim | 20.10.17   | N/A            | 6.0.302  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.302?style=flat-square)   |
| 6.0.302.1  | [.NET SDK 6.0.302](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.7/6.0.7.md)   | debian:11.3-slim | 20.10.17   | N/A            | 6.0.302  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.302.1?style=flat-square) |
| 6.0.400    | [.NET SDK 6.0.400](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.8/6.0.8.md)   | debian:11.3-slim | 20.10.17   | N/A            | 6.0.400  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.400?style=flat-square)   |
| 6.0.401    | [.NET SDK 6.0.401](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.9/6.0.9.md)   | debian:11.5-slim | 20.10.18   | N/A            | 6.0.401  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.401?style=flat-square)   |
| 6.0.402    | [.NET SDK 6.0.402](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.10/6.0.10.md) | debian:11.5-slim | 20.10.18   | N/A            | 6.0.402  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.402?style=flat-square)   |
| 6.0.403    | [.NET SDK 6.0.403](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.11/6.0.11.md) | debian:11.5-slim | 20.10.21   | N/A            | 6.0.403  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.403?style=flat-square)   |
| 6.0.404    | [.NET SDK 6.0.404](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.12/6.0.12.md) | debian:11.5-slim | 20.10.21   | N/A            | 6.0.404  | N/A                  | N/A     | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.404?style=flat-square)   |
| 6.0.405    | [.NET SDK 6.0.405](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.13/6.0.13.md) | debian:11.6-slim | 20.10.22   | N/A            | 6.0.405  | N/A                  | 3.3.0   | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.405?style=flat-square)   |
| 6.0.406    | [.NET SDK 6.0.406](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.14/6.0.14.md) | debian:11.6-slim | 23.0.1     | N/A            | 6.0.406  | 1:2.39.1-0.1~bpo11+1 | 3.3.0   | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.406?style=flat-square)   |
| 6.0.407    | [.NET SDK 6.0.407](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.15/6.0.15.md) | debian:11.6-slim | 23.0.1     | N/A            | 6.0.407  | 1:2.39.2-1~bpo11+1   | 3.3.0   | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.407?style=flat-square)   |
| 6.0.408    | [.NET SDK 6.0.408](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.16/6.0.16.md) | debian:11.6-slim | 23.0.3     | N/A            | 6.0.408  | 1:2.39.2-1~bpo11+1   | 3.3.0   | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.408?style=flat-square)   |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
