FROM --platform=linux/amd64 ubuntu:jammy

ARG VERSION
ARG CP_VERSION=${VERSION}
ARG COMMUNITY_CRYPTO=2.20.0
ARG COMMUNITY_GENERAL=8.6.1

# Copy Python dependency file inside container, then install dependencies using pip.
COPY requirements.txt .

RUN apt-get update; \
    apt -y install sshpass; \
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get install -y vim; \
    apt-get install -y jq; \
    apt-get install -y git; \
    apt-get clean all 
RUN pip3 install --upgrade pip; \
    pip3 install -r requirements.txt

RUN git clone https://github.com/confluentinc/cp-discovery.git /home/

# Install Ansible collections with fallback to git for all collections
# The Ansible Galaxy API (https://galaxy.ansible.com/api/) can be unreliable or down,
# causing HTTP 500 errors during collection installation. As a fallback, we install
# all collections directly from the git repository if the Galaxy install fails.
RUN (ansible-galaxy collection install ansible.posix || \
     ansible-galaxy collection install git+https://github.com/ansible-collections/ansible.posix.git) && \
    (ansible-galaxy collection install community.crypto:${COMMUNITY_CRYPTO} || \
     ansible-galaxy collection install git+https://github.com/ansible-collections/community.crypto.git,${COMMUNITY_CRYPTO}) && \
    (ansible-galaxy collection install community.general:${COMMUNITY_GENERAL} || \
     ansible-galaxy collection install git+https://github.com/ansible-collections/community.general.git,${COMMUNITY_GENERAL}) && \
    (ansible-galaxy collection install confluent.platform:${CP_VERSION} || \
     ansible-galaxy collection install git+https://github.com/confluentinc/cp-ansible.git,${CP_VERSION}-post) 

COPY testansiblelocal.yml .
COPY readmeDocker.md .
COPY touchauthorized_keys.yml .
