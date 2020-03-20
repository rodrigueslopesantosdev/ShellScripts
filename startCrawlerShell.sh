#!/bin/bash


#Parametros do script startCrawler.py
#   
#  $1 - nome do crawler
#  $2 - AWS Access Key
#  $3 - AWS Access Security Key
#  $4 - Regiao da AWS onde o crawler esta instalado
#

python3 /home/nifi/scripts/startCrawler.py --nc $1 --key $2 --saKey $3 --reg $4
