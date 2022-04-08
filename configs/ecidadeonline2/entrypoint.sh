#!/bin/bash

APP_FILE="e-cidadeonline2/application/configs/application.ini"
##cp e-cidadeonline2/application/configs/application.ini.dist e-cidadeonline2/application/configs/application.ini
##cp e-cidadeonline2/application/configs/webservice-ecidade.ini.dist e-cidadeonline2/application/configs/webservice-ecidade.ini

##echo '' | tee -a ${APP_FILE}
##echo '[development : production]' | tee -a ${APP_FILE}
##echo 'phpSettings.display_errors = 1' | tee -a ${APP_FILE}
##echo 'phpSettings.display_startup_errors = 1' | tee -a ${APP_FILE}
##echo 'resources.frontController.params.displayExceptions = 1' | tee -a ${APP_FILE}

# Configura application.ini
##configure-app.sh "$WEBSERVICE_CLIENTE_USER" "$NOTA_VERSION" "$ECIDADE_HOST" "$ECIDADE_PORT"

# Configura conexao com o banco
##configure-database.sh "$NOTA_DBHOST" "$NOTA_DBPORT" "$NOTA_DBUSER" "$NOTA_DBPASSWORD" "$NOTA_DBNAME"

# Configura webservice-ecidade.ini
##configure-webservice-ecidade.sh "$ECIDADE_INSTIT"

# Configura webservice do nota
##configure-webservice-nota.sh "$NOTA_HOST" "$NOTA_PORT"

# Ajusta permissoes
##chmod -R 775 e-cidadeonline2
##chown -R www-data. e-cidadeonline2

# Start shellinaboxd
##/usr/local/bin/shellinaboxd --no-beep --css=/root/black-on-white.css -p 4200 -b -t -s /:www-data:www-data:/var/www/html:"/bin/bash"

# Start do apache
apache2-foreground
