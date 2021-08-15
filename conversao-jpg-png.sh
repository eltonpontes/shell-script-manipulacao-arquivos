#!/bin/bash

converte_imagem(){
cd ~/Downloads/imagens-livros
dir=~/Downloads/imagens-livros/png
if [ -d "$dir" ]
then
	echo "O diretório $dir existe"
else	
	echo "O diretório $dir não existe \n vamos cria-lo"
	mkdir $dir
fi

	echo "### iniciando conversão de arquivos ###"
for imagem in *.jpg

do
	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
        convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png

done

}
converte_imagem 2>erros_conversao.txt
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve uma falha no proceesso"
fi

