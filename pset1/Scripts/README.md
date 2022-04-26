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

## Implementação no MariaDB
Execultando o Script do MariaDB

mysql -u root -p
senha: computacao@raiz

Execultar o Script
source /CAMINHO ONDE SALVOU O DOWNLOAD/Script_MariaDB.sql
