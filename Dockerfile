FROM python:3.12-alpine

RUN apk add --no-cache \
    openssh \
    sshpass \
    build-base \
    libffi-dev \
    openssl-dev

RUN python3 -m venv /opt/ansible-venv

RUN /opt/ansible-venv/bin/pip install --upgrade pip && \
    /opt/ansible-venv/bin/pip install ansible ciscoisesdk==2.4.0

ENV PATH="/opt/ansible-venv/bin:$PATH"

# Her installerer du de collectionene du trenger
RUN ansible-galaxy collection install cisco.ise==3.0.1

WORKDIR /ansible
CMD [ "/bin/bash"]