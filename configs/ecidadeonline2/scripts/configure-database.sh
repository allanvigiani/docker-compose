#!/bin/bash

NOTA_DBHOST=$1
NOTA_DBPORT=$2
NOTA_DBUSER=$3
NOTA_DBPASSWORD=$4
NOTA_DBNAME=$5

cd e-cidadeonline2

CONFIG_FILE="application/configs/application.ini"

sed -i "s|doctrine.connectionParameters.host[ \s]*=[ \s].*|doctrine.connectionParameters.host = \"${NOTA_DBHOST}\"|g" ${CONFIG_FILE}
sed -i "s|doctrine.connectionParameters.port[ \s]*=[ \s].*|doctrine.connectionParameters.port = \"${NOTA_DBPORT}\"|g" ${CONFIG_FILE}
sed -i "s|doctrine.connectionParameters.user[ \s]*=[ \s].*|doctrine.connectionParameters.user = \"${NOTA_DBUSER}\"|g" ${CONFIG_FILE}
sed -i "s|doctrine.connectionParameters.password[ \s]*=[ \s].*|doctrine.connectionParameters.password = \"${NOTA_DBPASSWORD}\"|g" ${CONFIG_FILE}
sed -i "s|doctrine.connectionParameters.dbname[ \s]*=[ \s].*|doctrine.connectionParameters.dbname = \"${NOTA_DBNAME}\"|g" ${CONFIG_FILE}

cd ..