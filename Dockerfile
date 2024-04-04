FROM --platform=linux/amd64 ubuntu:jammy

ARG  CP_VERSION=7.6.0

# Copy Python dependency file inside container, then install dependencies using pip.
COPY requirements.txt .
COPY community-general-7.5.6.tar.gz .

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

RUN ansible-galaxy collection install confluent.platform:${CP_VERSION};\
    ansible-galaxy collection install ansible.posix; 

RUN ansible-galaxy collection install community-general-7.5.6.tar.gz

COPY testansiblelocal.yml .
COPY readmeDocker.md .
COPY touchauthorized_keys.yml .
