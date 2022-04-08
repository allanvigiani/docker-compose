#!/bin/bash
ECIDADE_INSTIT=$1

cd e-cidadeonline2

CONFIG_FILE="application/configs/webservice-ecidade.ini"

sed -i "s|DB_instit[ \s]*=[ \s].*|DB_instit = '${ECIDADE_INSTIT}';|g" ${CONFIG_FILE}
sed -i "s|DB_id_usuario[ \s]*=[ \s].*|DB_id_usuario = '1';|g" ${CONFIG_FILE}
sed -i "s|DB_login[ \s]*=[ \s].*|DB_login = 'dbseller';|g" ${CONFIG_FILE}
sed -i "s|DB_ip[ \s]*=[ \s].*|DB_ip = '127.0.0.1';|g" ${CONFIG_FILE}
sed -i "s|SERVER_ADDR[ \s]*=[ \s].*|SERVER_ADDR = '127.0.0.1';|g" ${CONFIG_FILE}
sed -i "s|SERVER_PORT[ \s]*=[ \s].*|SERVER_PORT = '80';|g" ${CONFIG_FILE}
sed -i "s|SERVER_ADMIN[ \s]*=[ \s].*|SERVER_ADMIN = 'everton@cattosistemas.com.br';|g" ${CONFIG_FILE}
sed -i "s|HTTP_HOST[ \s]*=[ \s].*|HTTP_HOST = 'localhost';|g" ${CONFIG_FILE}

cd ..