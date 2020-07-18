# O que é Ansible

>Ansible é uma ferramenta Open-source de provisionamento, gerência de configurações e implantação de software. Essa tecnologia não utiliza agentes, já que faz uso apenas de SSH para se comunicar com os hosts.

### As 3 coisas mais importantes.

## Inventário
Tratase do arquivo:
```
/etc/ansible/hosts
```
Contém a lista de hosts que serão gerenciados pelo ansible.


## Módulos

São os programas e pacotes que são utilizados para gerenciar os hosts.
Os módulos podem ser evocados utilizando, comandos ad-hoc ou através de playbooks

## Tarefas

É o que o ansible irá enviar para os hosts executar.

## Exemplo de comandos:
### Ad-hoc
```shell
ansible all -m ping
```

### Playbooks

```yaml
- hosts: all
  tasks:
  - name: Criando um arquivo
    file: path=/home/ansible/hello-world.txt state=touch
```