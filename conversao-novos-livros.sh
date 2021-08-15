#!/bin/bash

converte_imagem(){
    cd ~/Downloads/imagens-livros
    dir=~/Downloads/imagens-livros/png
    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png

}

verificacao_pasta(){

    if [ -d "$dir" ]
    then
	    echo "O diretório $dir existe"
    else	
	    echo "O diretório $dir não existe \n vamos cria-lo"
	    mkdir $dir
    fi
	    echo "### iniciando conversão de arquivos ###"
    
}

varreder_diretorio (){
    cd $1
    for arquivo in *
    do
            local caminho_arquivo=$(find ~/Downloads/imagens-livros/ -name $arquivo)
            if [ -d $caminho_arquivo ]
            then
                    varreder_diretorio $caminho_arquivo
            else
                    converte_imagem $caminho_arquivo
            fi
    done
}

varreder_diretorio ~/Downloads/imagens-livros/ 

if [ $? -eq 0 ]
then
	echo "Conversao realizada com sucesso"
else
	echo "Houve uma falha no proceesso"
fi