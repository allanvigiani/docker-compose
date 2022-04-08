FROM php:7.2-apache
LABEL maintainer="equipe.infraestrutura@dbseller.com.br"

# Instala as extensões PHP e módulos PECL.
RUN buildDeps="libbz2-dev libsasl2-dev" \
    runtimeDeps="curl git libfreetype6-dev libicu-dev libzip-dev libjpeg-dev libmcrypt-dev libpng-dev libpq-dev libxml2-dev gettext libxslt-dev firebird-dev libib-util libreadline-dev libedit-dev libfbclient2" \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y $buildDeps $runtimeDeps \
    && docker-php-ext-install bcmath bz2 calendar iconv intl mbstring opcache pdo_pgsql pgsql soap zip gettext \
    && docker-php-ext-install pdo_firebird interbase readline exif sysvmsg sockets shmop xmlrpc xsl wddx \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd 

# Cria o vhost com os parâmetros necessários para o e-cidade, e-cidadeonline, transparência e portal do aluno.
RUN echo '<VirtualHost *:80>\n\
        ServerAdmin equipe.infraestrutura@dbseller.com.br\n\
        DocumentRoot /var/www/html\n\
        LimitRequestLine 16382\n\
        LimitRequestFieldSize 16382\n\
        Timeout 12000\n\
        AddDefaultCharset ISO-8859-1\n\
        SetEnvIf Authorization "(.*)" HTTP_AUTHORIZATION=$1\n\
        <Directory /var/www/html>\n\
            Options +Indexes +FollowSymLinks +MultiViews\n\
            AllowOverride All\n\
            Require all granted\n\
        </Directory>\n\
	ErrorLog ${APACHE_LOG_DIR}/error.log\n\
	CustomLog ${APACHE_LOG_DIR}/access.log combined\n\
        RewriteEngine on\n\
</VirtualHost>\n '\
> /etc/apache2/sites-available/000-default.conf

# Habilita o módulo rewrite.
RUN a2enmod rewrite

# Configura o PHP.INI com os parâmetros necessários para o desenvolvimento.
RUN ln -s /dev/stderr /var/log/php_errors.log \
    && chown www-data. /var/log/php_errors.log \
    && chmod 777 /var/log/php_errors.log \
    && cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
    && sed -i "s/^short_open_tag.*/short_open_tag = On/g" /usr/local/etc/php/php.ini \
    && sed -i "s/^;date.timezone.*/date.timezone = \"America\/Sao_Paulo\"/g" /usr/local/etc/php/php.ini \
    && sed -i "s/^session.gc_maxlifetime.*/session.gc_maxlifetime = 7200/g" /usr/local/etc/php/php.ini \
    && sed -i "s/^;error_log.*/error_log = \/var\/log\/php_errors.log/" /usr/local/etc/php/php.ini \
    && sed -i "s/^;session.save_path.*/session.save_path = \/var\/lib\/php\/sessions/" /usr/local/etc/php/php.ini \
    && mkdir -p /var/lib/php/sessions \
    && chmod 777 /var/lib/php/sessions

# Instala o composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1

# Aceita os termos EULA para o pacote MS fonts
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

# Instala o libreoffice
RUN echo 'deb http://deb.debian.org/debian stretch main contrib non-free\n\
deb-src http://deb.debian.org/debian stretch main contrib non-free\n\
deb http://deb.debian.org/debian-security/ stretch/updates main contrib non-free\n\
deb-src http://deb.debian.org/debian-security/ stretch/updates main contrib non-free\n\
deb http://deb.debian.org/debian stretch-updates main contrib non-free\n\
deb-src http://deb.debian.org/debian stretch-updates main contrib non-free\n'\
> /etc/apt/source.list

RUN  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install libreoffice-writer

# Limpa o cache do apt
RUN apt-get purge -y --auto-remove $buildDeps \
    && rm -r /var/lib/apt/lists/*

COPY ./bashrc /root/.bashrc

RUN apt-get update && apt-get install python -y

# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && pip install pillow


