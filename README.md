# ansibleAsDocker

A repository to host a docker image with: 
* Ansible 
* CP-Ansible
* Discovery Service for migration between manual and automated install


This Repo checks every night (3am) for the latest cp-ansible release , build or rebuild the image and pushes it to Docker Hub
Once a new release is out, it will be build the image and pushes it to Docker Hub on the next schedule. 



You can Also change to the desired branch if needed. 

[CP Ansible Docs](https://docs.confluent.io/ansible/current/overview.html)  
[cp-ansible](https://github.com/confluentinc/cp-ansible)  
[cp-discovery](https://github.com/confluentinc/cp-discovery)  
[Docker Hub Images - Ready to use](https://hub.docker.com/r/mosheblumberg/mosheblumbergansible)   


## Reference  

* [ansible-docker-example](https://github.com/ChristopherJHart/ansible-docker-example/tree/main)
* [Ansible Docker](https://hackmd.io/@the-ansible-book/B1y5tXers)
* [how-to-build-and-execute-ansible-automation-with-docker](https://www.cbtnuggets.com/blog/technology/devops/how-to-build-and-execute-ansible-automation-with-docker)
  * [git](https://www.cbtnuggets.com/blog/technology/devops/how-to-build-and-execute-ansible-automation-with-docker)



