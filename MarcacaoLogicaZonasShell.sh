#!/bin/bash


#    Parametros
#
#    $1- AWS Access Key usada para inicar a sessão.
#    $2- AWS Secret Access Key usada para inicar a sessão.
#    $3- Região da AWS do onde o banco de dados do Athena está configurado.
#    $4- Hostname Apache Atlas.
#    $5- Porta de conexão Apache Atlas.
#    $6- Usuário para autenticação Apache Atlas.
#    $7- Password para autenticação Apache Atlas.
#    $8- Nome do banco de dados no AWS Glue.
#    $9- Nome da tabela no AWS Glue.
#    $10- Nome da classificação ou tag para associar ao termo técnico.
#    $11- Breve descrição sobre a classificação.
#    $12- Localização da tabela/arquivo no Data Lake.
#
python3 <path>/MarcacaoLogicaZonas.py --key "$1" --saKey "$2" --reg "$3" --ht "$4" --pt "$5" --us "$6" --pw "$7" --db "$8" --tb "$9" --cf "${10}" --ds "${11}" --ph "${12}"

