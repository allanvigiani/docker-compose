#!/bin/bash

WEBSERVICE_CLIENTE_USER=$1
NOTA_VERSION=$2
ECIDADE_HOST=$3
ECIDADE_PORT=$4

cd e-cidadeonline2

CONFIG_FILE="application/configs/application.ini"

sed -i "s|webservice.cliente.user[ \s]*=[ \s].*|webservice.cliente.user = \"${WEBSERVICE_CLIENTE_USER}\"|g" ${CONFIG_FILE}
sed -i 's|settings.application.cache[ \s]*=[ \s].*|settings.application.cache = "'${NOTA_VERSION}'"|g' ${CONFIG_FILE}
sed -i 's|ecidadeonline2.versao[ \s]*=[ \s].*|ecidadeonline2.versao = "'${NOTA_VERSION}'"|g' ${CONFIG_FILE}
sed -i 's|resources.mail.transport.host[ \s]*=[ \s].*|resources.mail.transport.host = "smtp.mailtrap.io"|g' ${CONFIG_FILE}
sed -i 's|resources.mail.transport.password[ \s]*=[ \s].*|resources.mail.transport.password = "c7d56a401d9e7d"|g' ${CONFIG_FILE}
sed -i 's|resources.mail.transport.port[ \s]*=[ \s].*|resources.mail.transport.port = "465"|g' ${CONFIG_FILE}
sed -i 's|resources.mail.transport.username[ \s]*=[ \s].*|resources.mail.transport.username = "7278bcb6c2d72b"|g' ${CONFIG_FILE}
sed -i 's|resources.mail.defaultFrom.email[ \s]*=[ \s].*|resources.mail.defaultFrom.email = "evertonch.bg@gmail.com"|g' ${CONFIG_FILE}
sed -i 's|resources.mail.defaultFrom.name[ \s]*=[ \s].*|resources.mail.defaultFrom.name = "NFS-e DESENVOLVIMENTO"|g' ${CONFIG_FILE}

## URL de conexao do webservice do ecidade
sed -i 's|webservice.client.uri[ \s]*=[ \s].*|webservice.client.uri = "http://'${ECIDADE_HOST}'"|g'  ${CONFIG_FILE}
sed -i 's|webservice.client.url[ \s]*=[ \s].*|webservice.client.url = "http://'${ECIDADE_HOST}'"|g'  ${CONFIG_FILE}
sed -i 's|webservice.client.location[ \s]*=[ \s].*|webservice.client.location = "http://'${ECIDADE_HOST}'/webservices/requisicao.webservice.php"|g' ${CONFIG_FILE}

#sed -i 's|webservice.client.uri[ \s]*=[ \s].*|webservice.client.uri = "http://'${ECIDADE_HOST}':'${ECIDADE_PORT}'"|g'  ${CONFIG_FILE}
#sed -i 's|webservice.client.url[ \s]*=[ \s].*|webservice.client.url = "http://'${ECIDADE_HOST}':'${ECIDADE_PORT}'"|g'  ${CONFIG_FILE}
#sed -i 's|webservice.client.location[ \s]*=[ \s].*|webservice.client.location = "http://'${ECIDADE_HOST}':'${ECIDADE_PORT}'/webservices/requisicao.webservice.php"|g' ${CONFIG_FILE}

cd ..
