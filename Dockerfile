FROM ubuntu:20.04

# Copy Python dependency file inside container, then install dependencies using pip.
COPY requirements.txt .

RUN apt-get update; \
    apt -y install sshpass; \
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get install -y vim; \
    apt-get install -y jq; \
    apt-get clean all
RUN pip3 install --upgrade pip; \
    pip3 install -r requirements.txt; 

# Copy Ansible dependency file inside container, then install dependencies using ansible-galaxy
COPY requirements.yaml .
RUN ansible-galaxy collection install -r requirements.yaml

COPY testansiblelocal.yml .
COPY readmeDocker.md .

## When Docker container is executed, execute the testansiblelocal.yml Ansible playbook
#CMD ["ansible-playbook", "testansiblelocal.yml"]