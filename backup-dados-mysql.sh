#!/bin/bash

CAMINHO_BACKUP=~/Documents/projeto-github/shell-script-manipulacao-arquivos
cd $CAMINHO_BACKUP

if [ ! -d backupday ]
then
    mkdir backupday
fi

sudo mysqldump -u root $1 > $CAMINHO_BACKUP/backupday/$1.sql