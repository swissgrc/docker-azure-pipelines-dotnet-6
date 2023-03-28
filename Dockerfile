# Base image containing dependencies used in builder and final image
FROM debian:11.6-slim AS base

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# renovate: datasource=repology depName=debian_11/ca-certificates versioning=loose
ENV CACERTIFICATES_VERSION=20210119

RUN apt-get update -y && \
  # Install necessary dependencies
  apt-get install -y --no-install-recommends ca-certificates=${CACERTIFICATES_VERSION} && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*


# Builder image
FROM base AS build

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# renovate: datasource=repology depName=debian_11/curl versioning=loose
ENV CURL_VERSION=7.74.0-1.3+deb11u7
# renovate: datasource=repology depName=debian_11/lsb-release versioning=loose
ENV LSBRELEASE_VERSION=11.1.0
# renovate: datasource=repology depName=debian_11/gnupg2 versioning=loose
ENV GNUPG_VERSION=2.2.27-2+deb11u2

RUN apt-get update -y && \
  # Install necessary dependencies
  apt-get install -y --no-install-recommends curl=${CURL_VERSION} lsb-release=${LSBRELEASE_VERSION} gnupg=${GNUPG_VERSION} && \
  # Add Git LFS PPA
  curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
  # Add Dockers public key
  mkdir -p /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  # Add Dockers APT repository to the list of sources
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  # Add .NET PPA
  curl -o /tmp/packages-microsoft-prod.deb https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb && \
  dpkg -i /tmp/packages-microsoft-prod.deb && \
  rm -rf /tmp/*

# Final image
FROM base AS final

LABEL org.opencontainers.image.vendor="Swiss GRC AG"
LABEL org.opencontainers.image.authors="Swiss GRC AG <opensource@swissgrc.com>"
LABEL org.opencontainers.image.title="azure-pipelines-dotnet"
LABEL org.opencontainers.image.documentation="https://github.com/swissgrc/docker-azure-pipelines-dotnet"

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /
# Copy Docker & Git LFS keyring
COPY --from=build /etc/apt/keyrings/ /etc/apt/keyrings
# Copy .NET keyring
COPY --from=build /etc/apt/trusted.gpg.d/ /etc/apt/trusted.gpg.d
COPY --from=build /etc/apt/sources.list.d/ /etc/apt/sources.list.d

# renovate: datasource=repology depName=debian_11_backports/git versioning=loose
ENV GIT_VERSION=1:2.39.2-1~bpo11+1

RUN echo "deb http://deb.debian.org/debian bullseye-backports main" | tee /etc/apt/sources.list.d/bullseye-backports.list && \
  apt-get update -y && \
  # Install Git
  apt-get install -y --no-install-recommends -t bullseye-backports git=${GIT_VERSION} && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  # Smoke test
  git version

# Install Git LFS

# renovate: datasource=github-tags depName=git-lfs/git-lfs extractVersion=^v(?<version>.*)$
ENV GITLFS_VERSION=3.3.0

RUN apt-get update -y && \
  # Install Git LFS
  apt-get install -y --no-install-recommends git-lfs=${GITLFS_VERSION}  && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  # Smoke test
  git lfs version

# Install Docker CLI

# renovate: datasource=github-tags depName=docker/cli extractVersion=^v(?<version>.*)$
ENV DOCKERCLI_VERSION=23.0.2

RUN apt-get update -y && \
  # Install Docker CLI
  apt-get install -y --no-install-recommends docker-ce-cli=5:${DOCKERCLI_VERSION}-1~debian.11~bullseye && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  # Smoke test
  docker --version

# Install .NET 6

# renovate: datasource=github-tags depName=dotnet/sdk extractVersion=^v(?<version>.*)$
ENV DOTNET_VERSION=6.0.407

ENV \
    # Do not show first run text
    DOTNET_NOLOGO=true \
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true \
    # Disable telemetry
    DOTNET_CLI_TELEMETRY_OPTOUT=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps performance
    NUGET_XMLDOC_MODE=skip

RUN apt-get update -y && \
  # Install .NET 6
  apt-get install -y --no-install-recommends dotnet-sdk-6.0=${DOTNET_VERSION}-1 && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  # Smoke test
  dotnet --version
