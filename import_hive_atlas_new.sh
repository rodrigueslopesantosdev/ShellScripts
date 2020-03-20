#!/usr/bin/expect -f

# Parameters:
#
# userAtlas: usuario do serviço Apache Atlas com permissao de fazer operacoes de bridge-hook.
# passUserAtlas: senha do usuario do serviço Apache Atlas.
#
#

#atribui o timeout do script para permitir toda a execução do comando.
set timeout -1

set userAtlas [lindex $argv 0]
set passUserAtlas [lindex $argv 1]

spawn ./import-hive.sh
expect "Enter username for atlas :- "
send "$userAtlas\r"
expect "Enter password for atlas :- "
send "$passUserAtlas\r"
expect eof
