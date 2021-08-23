#!/bin/bash

memoria_total=$(free | grep -i mem |  awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem |  awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')
memorialivre=$(free -h | grep -i mem |  awk '{ print $3 }')

echo "Alto consumo de memoria. consumo livre e de $memorialivre"
