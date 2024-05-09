FROM fedora:40

SHELL ["/bin/bash", "-c"]

# Install baseline packages
RUN dnf install -y \
    bash \
    ca-certificates \
    curl \
    htop \
    jq \
    man \
    python3 \
    python3-pip \
    sudo \
    systemd \
    systemd-sysv \
    unzip \
    vim \
    wget \
    rsync && \
    dnf group install -y "Development Tools"

# Make typing unicode characters in the terminal work.
ENV LANG en_US.UTF-8

# Add a user `coder` so that you're not developing as the `root` user
RUN useradd coder \
    --create-home \
    --shell=/bin/bash \
    --uid=1000 \
    --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

USER coder