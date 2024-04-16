# ansibleAsDocker


You must download community-general-7.5.6.tar.gz and put it in each dir. 
https://galaxy.ansible.com/ui/repo/published/community/general/?version=7.5.6

Create docker image to use for cp ansible 


```
docker build -t mosheblumberg/mosheblumbergansible:ansible2.147CP7.5.3 .
```

Note the `.` (dot) at the end of command which denotes that Dockerfile is in current directory.

Validate image creation by checking image list

```
docker image ls mosheblumberg/mosheblumbergansible
```

Run Ansible inside a docker container

```
docker run --name cpansible -it mosheblumberg/mosheblumbergansible:ansible2.147CP7.5.3
ansible --version
```


Push your Ansible image to Docker Hub

```
docker login
docker push mosheblumberg/mosheblumbergansible:ansible2.147CP7.5.3
docker tag mosheblumberg/mosheblumbergansible mosheblumberg/mosheblumbergansible:rc1
docker image ls mosheblumberg/mosheblumbergansible
docker push mosheblumberg/mosheblumbergansible:rc1
```


Test your ansible 

```
ansible-playbook -i localhost testansiblelocal.yml
```


Scan image  
```
 docker scan mosheblumberg/mosheblumbergansible:ansible2.147CP7.5.3
```

Run the image with the attached directory 


```
mkdir /tmp/myhostsfiles
touch /tmp/myhostsfiles/hosts.yml
docker run --name cpansible -v /tmp/myhostsfiles:/data -it mosheblumberg/mosheblumbergansible:ansible2.147CP7.5.3 
```

Save docker image  
```
docker save  mosheblumberg/mosheblumbergansible > /tmp/mosheblumbergansible.tar
```

```
 docker load < /tmp/mosheblumbergansible.tar
```

# Discovery 

```


PYTHONPATH=. python3 discovery/main.py \
  --input /data/discovery.yml \
  --verbosity 7
```

## Reference  

* [ansible-docker-example](https://github.com/ChristopherJHart/ansible-docker-example/tree/main)
* [Ansible Docker](https://hackmd.io/@the-ansible-book/B1y5tXers)
* [how-to-build-and-execute-ansible-automation-with-docker](https://www.cbtnuggets.com/blog/technology/devops/how-to-build-and-execute-ansible-automation-with-docker)
  * [git](https://www.cbtnuggets.com/blog/technology/devops/how-to-build-and-execute-ansible-automation-with-docker)

