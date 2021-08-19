#!/bin/bash

reposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
if [ $reposta_http -ne 200 ]
then
mail -s "Servidor fora do ar" eltonpg@gmail.com<<del 
Servidor caiu, favor verificar.
del
    systemctl restart apache2
fi