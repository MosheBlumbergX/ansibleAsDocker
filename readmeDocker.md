# ansibleAsDocker


Test your ansible 

```
ansible-playbook -i localhost testansiblelocal.yml

ssh-keygen -q -t rsa -N '' -C dba@$(hostname)  -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
cat ~/.ssh/id_rsa


ansible-playbook -i hosts.yml touchauthorized_keys.yml 
```

