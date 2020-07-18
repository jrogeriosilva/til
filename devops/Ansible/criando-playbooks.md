# Criando e executando playbooks em ansible

Playbooks são como uma receita de bolo escrita em yaml. Playbooks Idempotentes,  são construídos de forma que adicionar  açúcar duas vezes não influenciará no seu resultado final.


Playbooks são iniciados com:
```yaml
---
```

E devem ser obrigatóriamente indentados para funcionarem.
```yaml
- hosts: all
 # Isso é um exemplo de comentário. Use # para comentar o código.
  become: true
  tasks:
  - name: Criando um arquivo
    file: path=/home/ansible/hello-world.txt state=touch
```

[Fonte](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html)