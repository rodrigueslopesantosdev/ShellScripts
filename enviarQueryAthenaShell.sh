#!/bin/bash

#    Parametros
#    $1-  Athena Database
#    $2 - AWS Access Key
#    $3 - AWS Secret Access Key
#    $4 - Regiao AWS
#


python3 /home/nifi/scripts/enviarQueryAthena.py --db $1 --key $2 --saKey $3 --reg $4
