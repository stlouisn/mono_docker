FROM stlouisn/ubuntu:rolling

RUN \

    export DEBIAN_FRONTEND=noninteractive && \

    # Update apt-cache
    apt-get update && \

    # Install temporary-tools
    apt-get install -y --no-install-recommends \
        gnupg \
        dirmngr && \

    # Add mono repository
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list && \
        
    # Update apt-cache
    apt-get update && \

    # Install Mono
    apt-get install -y --no-install-recommends \
        mono-runtime \
        libmono-cil-dev && \

    # Remove temporary-tools
    apt-get purge -y \
        gnupg \
        dirmngr && \

    # Clean apt-cache
    apt-get autoremove -y --purge && \
    apt-get clean -y && \
    apt-get autoclean -y && \

    # Cleanup temporary folders
    rm -rf \
        /root/.cache \
        /root/.wget-hsts \
        /tmp/* \
        /var/lib/apt/lists/*
