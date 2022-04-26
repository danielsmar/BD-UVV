## Implementação no PostgreSQL
O [PostgreSQL](https://www.postgresql.org) é o SGBD relacional open-source mais
avançado que existe hoje em dia. Apesar dele ser mais “difícil” que usar do que o
MariaBD/MySQL, ele é excelente para estudar e aprender sobre bancos de dados
pois ele têm funcionalidades avançadas que não são encontradas em muitos SGBD
comerciais.

## Execultando o Script do Postgres

#### 1. Baixe o arquivo Script_Postgres.sql

#### 2. Abra o Terminal de comando em seu computador

#### 3. Execulte o Script
      psql -U postgres -W -f /CAMINHO_ONDE_SALVOU_O_DOWNLOAD_DO_SCRIPT/Script_Postgres.sql
#### 4. Após execultar, o terminal vai pedir a senha do usuário postgres, se estiver usando a [Virtual Box dbserver](https://www.computacaoraiz.com.br/2022/03/17/maquina-virtual-para-o-estudo-de-sistemas-de-gerenciamento-de-bancos-de-dados-db-server/), a senha é computacao@raiz.
#### 5. Em seguida vai pedir a senha do usuário que foi criado (senha:123456).

#### 6. Após o login com o novo usuário o script vai ser execultado e criar o banco de dados.

## Script para Postgres rodando na [Virtual Box dbserver](https://www.computacaoraiz.com.br/2022/03/17/maquina-virtual-para-o-estudo-de-sistemas-de-gerenciamento-de-bancos-de-dados-db-server/)

<img align="center" alt="gif" height="290" style="border-radius:50px;" src="https://github.com/danielsmar/portfolio/blob/main/img/Pset_Postgres.gif">

## Implementação no MariaDB
[MariaDB](https://mariadb.com) é baseado no MySQL e está disponível sob os termos da licença GPL v2.

É desenvolvido pela Comunidade MariaDB com o principal administrador a Monty Program Ab.

MariaDB é mantido atualizado com a última versão do MySQL.

Na maioria dos aspectos o MariaDB vai funcionar exatamente como o MySQL: todos os comandos, interfaces, bibliotecas e APIs que existem no MySQL também existem no MariaDB. Não há nenhuma necessidade de converter um bancos de dados para migrar para o MariaDB.

## Execultando o Script do MariaDB


#### 1. Baixe o arquivo Script_Postgres.sql

#### 2. Abra o Terminal de comando em seu computador

#### 3. Se conecte ao MariaDB usando esse comando:                
                  mysql -u root -p               
#### 4. Após execultar esse comando, o terminal vai pedir a senha do usuário root do MariaDB, se estiver usando a [Virtual Box dbserver](https://www.computacaoraiz.com.br/2022/03/17/maquina-virtual-para-o-estudo-de-sistemas-de-gerenciamento-de-bancos-de-dados-db-server/), a senha é computacao@raiz.

#### 5. Em seguida execulte o seguinte código:
            source /CAMINHO_ONDE_SALVOU_O_DOWNLOAD_DO_SCRIPT/Script_MariaDB.sql

#### 6. Após execultar o script, o banco de dados sera criado.

## Script para MariaDB rodando na [Virtual Box dbserver](https://www.computacaoraiz.com.br/2022/03/17/maquina-virtual-para-o-estudo-de-sistemas-de-gerenciamento-de-bancos-de-dados-db-server/)

<img align="center" alt="gif" height="290" style="border-radius:50px;" src="https://github.com/danielsmar/portfolio/blob/main/img/Pset_MariaDB.gif">
