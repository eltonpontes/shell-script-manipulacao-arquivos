#!/bin/bash

reposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
if [ $reposta_http -eq 200 ]
then
    echo "Está tudo ok com o servidor"
else
    echo "Houve um problema no servidor, tentando reiniciar"
    systemctl restart apache2
    echo "Servidor reiniciando"
fi