#!/bin/bash

CAMINHO_BACKUP=~/Documents/projeto-github/shell-script-manipulacao-arquivos/backup_mutillidae_amazon
cd $CAMINHO_BACKUP

data=$(date +%F)
if [ ! -d $data ]
then 
    mkdir $data
fi

tabelas=$( mysql -u root mutillidae -e "show tables;" | grep -v tables)
for tabela in $tabelas
do 
    mysqldump -u root mutillidae $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done