
#!/bin/bash

main(){
    criarDiretorio "/home/chroot/jail/bin/"
    criarDiretorio "/home/chroot/jail/home/"
    criarDiretorio "/home/chroot/jail/home/chrootUser/"
    criarDiretorio "/home/chroot/jail/proc/"
    criarDiretorio "/home/chroot/jail/etc/"
    criarDiretorio "/home/chroot/jail/lib/"
    criarDiretorio "/home/chroot/jail/lib64/"
    criarDiretorio "/home/chroot/jail/dev/"

    echo ">>>>>>>>>>>>>>>> Criando Grupo {chrootGroup}..."
    addgroup chrootGroup
    
    echo ">>>>>>>>>>>>>>>> Criando Usuário {chrootUser}..."
    adduser -G chrootGroup -s /bin/sh -D chrootUser
    echo -e "root\nroot" | passwd chrootUser

    echo ">>>>>>>>>>>>>>>> Alterando proprietário {/home/chroot/jail/home/chrootUser/}..."
    chown chrootUser:chrootGroup /home/chroot/jail/home/chrootUser/

}

criarDiretorio(){
  local DIR_NAME=$1
  if [ ! -d "$DIR_NAME" ]; then
    mkdir -p "$DIR_NAME"
    echo "Diretório '$DIR_NAME' criado com sucesso."
  else
    echo "Diretório '$DIR_NAME' já existe."
  fi     
}

main;