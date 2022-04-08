FROM php:5.6-apache

RUN \
  apt-get update && \
  apt-get install -y libpq-dev libxml2-dev libcurl4-openssl-dev libmcrypt-dev curl libbz2-dev libpng-dev libfreetype6-dev libgd-dev vim

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql pgsql opcache zip soap bcmath bz2 json mbstring mcrypt xml xmlrpc


# Adiciona Melhorias da bliblioteca GD (requirido pro catptcha fontes FreeType)
RUN apt-get update && apt-get install -y libpng-dev 
RUN apt-get install -y \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev

RUN docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir \
    --enable-gd-native-ttf

RUN docker-php-ext-install gd

#RUN apt-get update &&\
#    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates git &&\
#    rm -rf /var/lib/apt/lists/*

# Habilita mod_rewrite
RUN a2enmod rewrite proxy_http

# Configura VHOST da aplicação
COPY resources/vhost.conf "$APACHE_CONFDIR/sites-available/000-default.conf"
ADD resources/php.ini /usr/local/etc/php/

RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug

RUN echo 'zend_extension="/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so"' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.auto_trace=0' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.collect_params=4' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.default_enable=1' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.force_display_errors=0 ' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.show_error_trace=0' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.trace_format=1 ' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_connect_back=1' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.profiler_enable=0' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.profiler_output_dir="/var/www/html/e-cidadeonline2/logs"' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_autostart=1' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_host=host.docker.internal' >> /usr/local/etc/php/php.ini


##ARG PACKAGE_NAME="e-cidadeonline2.tar.gz"
# Copia e extrai os fontes

##ADD resources/$PACKAGE_NAME /var/www/html/

ENV NOTA_VERSION 1
ENV ECIDADE_HOST "jenkins.dbseller.com.br"
ENV ECIDADE_PORT "80"
ENV WEBSERVICE_CLIENTE_USER c4ca4238a0b923820dcc509a6f75849b

ENV ECIDADE_INSTIT "1"

ENV NOTA_HOST "localhost"
ENV NOTA_PORT "80"
ENV NOTA_DBNAME ""
ENV NOTA_DBHOST ""
ENV NOTA_DBPASSWORD ""
ENV NOTA_DBPORT ""
ENV NOTA_DBUSER ""

##ADD scripts/configure-app.sh /usr/local/bin/
##ADD scripts/configure-database.sh /usr/local/bin/
##ADD scripts/configure-webservice-ecidade.sh /usr/local/bin/
##ADD scripts/configure-webservice-nota.sh /usr/local/bin/

##ADD scripts/shellinaboxd /usr/local/bin/
# Personalizacao do SHELL
ADD resources/.bashrc /root/

# Personalizacao do shellinaboxd
##ADD resources/black-on-white.css /root/

# Configura aplicação
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
