#!/bin/bash
echo "Criando usuários do sistema...."
echo "Explicando comandos"
echo "useradd -> cria um novo usuario"
echo "useradd -c ->  cria um novo usuario com comentaario"
echo "useradd -s ->  cria um novo usuario especificando o shell"
echo "useradd -p ->  cria um novo usuario especificando a senha, porem a senha fica criptografa e é preciso usar $(openssl passwd -crypt Senha123)  para passar a senha descriptgrafada"

echo "criando o usuarios fabianoteixeira com final 10,11,12 e 13"
useradd fabianoteixeira10 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd fabianoteixeira10 -e

useradd fabianoteixeira11 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd fabianoteixeira11 -e

useradd fabianoteixeira12 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd fabianoteixeira12 -e

useradd fabianoteixeira13 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd fabianoteixeira13 -e

echo "Finalizado!!"