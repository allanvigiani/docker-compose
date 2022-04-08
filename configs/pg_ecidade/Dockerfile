FROM postgres:9.5

RUN apt-get update && apt-get -y upgrade

COPY pt_BR /usr/share/i18n/locales/pt_BR

RUN localedef -i de_DE -c -f ISO-8859-1 -A /usr/share/i18n/locales/pt_BR pt_BR.ISO-8859-1
ENV LANG pt_BR.ISO-8859-1
RUN export LC_ALL=pt_BR
RUN echo LC_ALL=pt_BR >> /etc/environment

RUN pg_createcluster -e LATIN1 9.5 main

COPY postgresql.conf /var/lib/postgresql/9.5/data/

RUN /etc/init.d/postgresql restart

#RUN psql -U postgres -h localhost -d template1 -c "create role ecidade with superuser login password 'ecidade'"
#RUN psql -U postgres -h localhost -d template1 -c "create role dbportal with superuser login password 'dbportal'"
#RUN psql -U postgres -h localhost -d template1 -c "create role dbseller with login password 'dbseller'"
#RUN psql -U postgres -h localhost -d template1 -c "create role      with login password 'plugin'"

