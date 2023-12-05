# ansibleAsDocker

Create docker image to use for cp ansible 


```
docker build -t mosheblumberg/mosheblumbergansible:latest .
```

Note the `.` (dot) at the end of command which denotes that Dockerfile is in current directory.

Validate image creation by checking image list

```
docker image ls mosheblumberg/mosheblumbergansible
```

Run Ansible inside a docker container

```
docker run -it mosheblumberg/mosheblumbergansible:latest
ansible --version
```


Push your Ansible image to Docker Hub

```
docker login
docker push mosheblumberg/mosheblumbergansible:latest
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
 docker scan mosheblumberg/mosheblumbergansible:latest
```

Run the image with the attached directory 


```
mkdir /tmp/myhostsfiles
touch /tmp/myhostsfiles/hosts.yml
docker run -v /tmp/myhostsfiles:/data -it mosheblumberg/mosheblumbergansible:latest 
```



## Reference  

* [ansible-docker-example](https://github.com/ChristopherJHart/ansible-docker-example/tree/main)
* [Ansible Docker](https://hackmd.io/@the-ansible-book/B1y5tXers)
* [how-to-build-and-execute-ansible-automation-with-docker](https://www.cbtnuggets.com/blog/technology/devops/how-to-build-and-execute-ansible-automation-with-docker)
  * [git](https://www.cbtnuggets.com/blog/technology/devops/how-to-build-and-execute-ansible-automation-with-docker)