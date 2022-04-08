# Container para build do e-cidadeonline2

## Build Dockerfile

```$ docker build nota -t nota-teste```

### Build environment variables
 
|      Var      |                              Description                               |        Default         |
|---------------|------------------------------------------------------------------------|------------------------|
| http_proxy    | Endere�o do proxy utilizado nos containers de build (opcional)         |                        |
| https_proxy   | Endere�o do proxy https utilizado nos containers de build (opcional)   |                        |
| PACKAGE\_NAME | Nome do arquivo de refer�ncia para a build dentro da pasta _resources_ | e-cidadeonline2.tar.gz |

Exemplo: ```docker build ... --build-arg VAR1_NAME="VAR1_VALUE" --build-arg VAR2_NAME="VAR2_VALUE"```

## Run container

```shell
$ docker run --rm -P -it \ 
  -e ECIDADE_HOST="jenkins.dbseller.com.br" \
  -e ECIDADE_PORT=24360 \
  -e NOTA_DBNAME=auto_nfsealegrete_20170618_v011726 \
  -e NOTA_DBHOST=pgs01.dbseller.com.br \
  -e NOTA_DBPORT=5435 \
  -e NOTA_DBUSER=postgres \
  nota-teste
```

### Environment variables

|            Var            |                Description                |          Default Value           |
|---------------------------|-------------------------------------------|----------------------------------|
| NOTA_VERSION              | Vers�o da aplica��o                       | 1                                |
| ECIDADE_HOST              | Host do e-cidade no qual o nota interage  | "jenkins.dbseller.com.br"        |
| ECIDADE_PORT              | Porta do e-cidade no qual o nota interage | "80"                             |
| WEBSERVICE\_CLIENTE\_USER | Hash do usu�rio de acesso ao e-cidade     | c4ca4238a0b923820dcc509a6f75849b |
| NOTA_DBNAME               | Nome do banco do nota                     | ""                               |
| NOTA_DBHOST               | Host do banco do nota                     | ""                               |
| NOTA_DBPASSWORD           | Senha do banco do nota                    | ""                               |
| NOTA_DBPORT               | Porta do banco do nota                    | ""                               |
| NOTA_DBUSER               | Usu�rio do banco do nota                  | ""                               |
| ECIDADE\_INSTIT           | Id da instituicao do e-cidade             | "1"                              |

## Available scripts

```shell
$ docker exec <CONTAINER> <SCRIPT> <PARAMS>
```

### configure-app.sh 

```shell
$ configure-app.sh "$WEBSERVICE_CLIENTE_USER" "$NOTA_VERSION" "$ECIDADE_HOST" "$ECIDADE_PORT"
```

|           Param            |                Description                 |
|----------------------------|--------------------------------------------|
| $WEBSERVICE\_CLIENTE\_USER | Usu�rio de integra��o entre nota e ecidade |
| $NOTA\_VERSION             | Vers�o da aplica��o                        |
| $ECIDADE\_HOST             | Host do e-cidade                           |
| $ECIDADE_PORT             | Porta do e-cidade                          |

### configure-database.sh

```shell
$ configure-database.sh "$NOTA_DBHOST" "$NOTA_DBPORT" "$NOTA_DBUSER" "$NOTA_DBPASSWORD" "$NOTA_DBNAME"
```

|      Param       |   Description    |
|------------------|------------------|
| $NOTA\_DBHOST     | Host do banco    |
| $NOTA\_DBPORT     | Porta do banco   |
| $NOTA\_DBUSER     | Usu�rio do banco |
| $NOTA\_DBPASSWORD | Senha do banco   |
| $NOTA\_DBNAME     | Nome do banco    |

### configure-webservice-ecidade.sh

```shell
$ configure-webservice-ecidade.sh "$ECIDADE_INSTIT"
```

|      Param       |          Description          |
|------------------|-------------------------------|
| $ECIDADE\_INSTIT | Id da instituicao do e-cidade |


N�o h� par�metros neste script.

### configure-webservice-nota.sh

```shell
$ configure-webservice-nota.sh "$NOTA_HOST" "$NOTA_PORT"
```

|    Param    |    Description     |
|-------------|--------------------|
| $NOTA\_HOST | Host da aplica��o  |
| $NOTA\_PORT | Porta da aplica��o |
