#!/bin/bash


#   Parametros
#   
#   $1 - Nome do crawler na AWS.
#   $2 - AWS Access Key.
#   $3 - AWS Secret Access Key.
#   $4 - Regiao AWS.
#


python3 <path>/getStatusCrawler.py --nc $1 --key $2 --saKey $3 --reg $4
