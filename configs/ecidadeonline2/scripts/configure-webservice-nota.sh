#!/bin/bash

cd e-cidadeonline2

NOTA_HOST=$1
NOTA_PORT=$2

if [ -e public/webservice/wsdlValidations/producao/modelo1.wsdl.dist ]; then
   cp public/webservice/wsdlValidations/producao/modelo1.wsdl.dist public/webservice/wsdlValidations/producao/modelo1.wsdl
    sed -i "s|{URL}|${NOTA_HOST}:${NOTA_PORT}|g" public/webservice/wsdlValidations/producao/modelo1.wsdl
else
     cp public/webservice/wsdlValidations/modelo1.wsdl.dist public/webservice/wsdlValidations/modelo1.wsdl
     sed -i "s|{\$CAMINHO_SERVER}|${NOTA_HOST}:${NOTA_PORT}|g" public/webservice/wsdlValidations/modelo1.wsdl
fi

if [ -e public/webservice/wsdlValidations/homologacao/modelo1.wsdl.dist ]; then
   cp public/webservice/wsdlValidations/homologacao/modelo1.wsdl.dist public/webservice/wsdlValidations/homologacao/modelo1.wsdl
   sed -i "s|{URL}|${NOTA_HOST}:${NOTA_PORT}|g" public/webservice/wsdlValidations/homologacao/modelo1.wsdl
fi

if [ -e public/webservice/wsdlValidations/integracao/modelo1.wsdl.dist ]; then
  cp public/webservice/wsdlValidations/integracao/modelo1.wsdl.dist public/webservice/wsdlValidations/integracao/modelo1.wsdl
  sed -i "s|{URL}|${NOTA_HOST}:${NOTA_PORT}|g" public/webservice/wsdlValidations/integracao/modelo1.wsdl
fi

cd ..