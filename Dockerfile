# Use a more recent Ubuntu base image (e.g., 20.04)
FROM ubuntu:20.04

# Set non-interactive mode to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies for Ansible, Python 3, Git, and other tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    software-properties-common \
    sshpass \
    curl \
    apt-transport-https \
    git \
    && pip3 install --upgrade pip \
    && pip3 install ansible pywinrm \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add SQLCMD tools to PATH
ENV PATH="$PATH:/opt/mssql-tools/bin"

# Set Python 3 as the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Optional: Set the working directory in the container
# WORKDIR /workspace

# Optional: Run Ansible commands from the entry point
CMD ["/bin/bash"]
