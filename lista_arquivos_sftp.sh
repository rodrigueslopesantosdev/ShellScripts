#!/bin/bash
#---------------------------------------
#  Arquivo: lista_arquivos_sftp.sh
#
#  Descrição: script Shell para listar os arquivos em um diretorio SFTP.
#  Parametros: 
#      $1: servidor SFTP
#      $2: usuario
#      $3: caminho do diretorio
#  Data de criacao: 21/10/2019

sftp -q $2@$1:$3 <<<"ls -1" | grep -v '^sftp>'
