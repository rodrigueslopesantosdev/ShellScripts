#!/bin/bash

#  Parametros do script Python
#  
#  $1 - AWS Access Key usada para iniciar a sessão.
#  $2 - AWS Secret Access Key usada para iniciar a sessão.
#  $3 - Região da AWS onde o storage gateway está configurado.
#



python3 <path>/refreshCacheStorageGateway.py --key $1 --saKey $2 --reg $3
