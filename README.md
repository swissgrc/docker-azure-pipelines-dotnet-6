# Docker image for running .NET in an Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet/blob/main/LICENSE) [![Build](https://img.shields.io/github/workflow/status/swissgrc/docker-azure-pipelines-dotnet/Build/develop?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet/actions/workflows/publish.yml) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet)
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

| Tag        | Description                                                                                   | Base Image       | Docker CLI | .NET SDK | Size                                                                                                                             |
|------------|-----------------------------------------------------------------------------------------------|------------------|------------|----------|----------------------------------------------------------------------------------------------------------------------------------|
| latest     | Latest stable release (from `main` branch)                                                    | debian:11.5-slim | 20.10.18   | 6.0.401  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/latest?style=flat-square)    |
| unstable   | Latest unstable release (from `develop` branch)                                               | debian:11.5-slim | 20.10.18   | 6.0.401  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/unstable?style=flat-square)  |
| 6.0.301    | [.NET SDK 6.0.301](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.6/6.0.6.md) | debian:11.3-slim | 20.10.17   | 6.0.301  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.301?style=flat-square)   |
| 6.0.302    | [.NET SDK 6.0.302](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.7/6.0.7.md) | debian:11.3-slim | 20.10.17   | 6.0.302  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.302?style=flat-square)   |
| 6.0.302.1  | [.NET SDK 6.0.302](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.7/6.0.7.md) | debian:11.3-slim | 20.10.17   | 6.0.302  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.302.1?style=flat-square) |
| 6.0.400    | [.NET SDK 6.0.400](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.8/6.0.8.md) | debian:11.3-slim | 20.10.17   | 6.0.400  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.400?style=flat-square)   |
| 6.0.401    | [.NET SDK 6.0.401](https://github.com/dotnet/core/blob/main/release-notes/6.0/6.0.9/6.0.9.md) | debian:11.5-slim | 20.10.18   | 6.0.401  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/6.0.401?style=flat-square)   |

### Configuration

These environment variables are supported:

| Environment variable   | Default value        | Description                                                      |
|------------------------|----------------------|------------------------------------------------------------------|
| DOCKERCLI_VERSION      | `20.10.18`           | Version of Docker CLI installed in the image.                    |
| DOTNET_VERSION         | `6.0.401`            | Version of .NET installed in the image.                          |
| CACERTIFICATES_VERSION | `20210119`           | Version of `ca-certificates` package used to install components. |
| CURL_VERSION           | `7.74.0-1.3+deb11u3` | Version of `curl` package used to install components.            |
| LSBRELEASE_VERSION     | `11.1.0`             | Version of `lsb-release` package used to install components.     |
| GNUPG_VERSION          | `2.2.27-2+deb11u2`   | Version of `gnupg` package used to install components.           |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
