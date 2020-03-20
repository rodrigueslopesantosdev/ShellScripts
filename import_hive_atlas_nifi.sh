#!/bin/bash

#   Script para execucao do script Atlas hook-bridge import-hive.sh localizado na máquina master AWS EMR.
#
#   Parametros:
#   $1: AWS EMR master hostname
#   $2: Usario Apache Atlas com permissao de execucao do script import-hive.sh
#   $3: Password do usuario Apache Atlas definido no parametro $2
#   $4: Nome do arquivo de autorizacao para execucao do script
#

#Diretorio onde os arquivos de resposta do Glue sao armazenados.
dirArquivos=<path>/arquivosRespostaGlue

#Parametros do script
atlasHostname=$1
atlasUser=$2
atlasPasswdUser=$3
arquivoAutorizacao=$4

#Variaveis internas de controle do ciclo de espera pelo arquivo de autorizacao.
timeOut=60
cicloTimeOut=10
cicloContador=0
achouArquivo=0

#Espera de 30 segundos para o iniciar a busca pelo arquivo de autorizacao.
sleep 30

#Loop para o ciclo de busca do arquivo de autorizacao
while (( "$cicloContador" < "$cicloTimeOut" ))
do
	#Loop para buscar o arquivo de autorizacao no diretorio de resposta dos arquivos do Glue.
	for i in $(ls $dirArquivos); do
		#Teste para verificar se o arquivo encontrado no diretório é igual ao passado pelo parâmetro.
		if [ "$i" = "$arquivoAutorizacao" ]
		then
			let achouArquivo=1
		fi
	done

	#Teste para verificar se o arquivo de autorizacao foi encontrado, permitindo interromper o ciclo de busca.
	if [ "$achouArquivo" = 0 ]
	then
                #Tempo de espera para iniciar um novo ciclo de busca.
		sleep $timeOut
		let cicloContador=$cilcoContador+1
	else
                #Se o arquivo de autorizacao foi encontrado, entao o ciclo de busca pode ser encerrado, economizando processamento.
		let cicloContador=$cicloTimeOut
	fi
done

#Testa se o arquivo de autorizacao foi encontrado para que o comando via SSH abaixo posssa ser executado.
if [ "$achouArquivo" = 1 ]
then
	ssh ec2-user@$atlasHostname "export HIVE_HOME=/usr/lib/hive && cd /apache/atlas/bin/ && ./import_hive_atlas_new.sh $atlasUser $atlasPasswdUser"
fi

