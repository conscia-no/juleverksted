FROM python:3.12-alpine

RUN apk add --no-cache \
    openssh \
    sshpass \
    build-base \
    libffi-dev \
    openssl-dev

RUN python3 -m venv /opt/ansible-venv

RUN /opt/ansible-venv/bin/pip install --upgrade pip && \
    /opt/ansible-venv/bin/pip install ansible ciscoisesdk

ENV PATH="/opt/ansible-venv/bin:$PATH"

# Her installerer du de collectionene du trenger
RUN ansible-galaxy collection install cisco.ise

WORKDIR /ansible
CMD [ "ansible-playbook", "$1"]