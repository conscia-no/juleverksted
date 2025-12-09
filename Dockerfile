# Use a minimal base image
FROM python:3.12-alpine

# Install build dependencies
RUN apk add --no-cache \
    openssh \
    sshpass \
    build-base \
    libffi-dev \
    openssl-dev

# Create virtual environment
RUN python3 -m venv /opt/ansible-venv

# Install Ansible
RUN /opt/ansible-venv/bin/pip install --upgrade pip && \
    /opt/ansible-venv/bin/pip install ansible

ENV PATH="/opt/ansible-venv/bin:$PATH"

RUN ansible-galaxy collection install cisco.ise

WORKDIR /ansible
CMD [ "ansible-playbook", "$1"]