## Modelo Lógico Elmasri

O Projeto Lógico de um banco de dados tem por objetivo avaliar as necessidades de uso do banco de dados pelos usuários/aplicações, realizando possíveis refinamentos para alcançar maior desempenho das operações sobre o banco de dados. A tarefa final do projeto lógico é a geração do esquema lógico, que representa uma descrição da estrutura do banco de dados que pode ser processada por um Sistema Gerenciador de Banco de Dados (SGBD). O Modelo Relacional representa o esquema lógico do banco de dados como uma coleção de relações que podem ser vistas como tabelas.
A ferramenta usada para isso foi o [SQL Power Architect](http://www.bestofbi.com/page/architect_download_os) para ambos os SGBDs.

## Criação do Modelo
Inicialmente criamos cada uma das tabelas descritas no projeto e inserimos cada atributo com suas restrições, como NOT NULL, Primary Key, VARCHAR, CHAR, etc.

Após a implementação das tabelas, chegou a hora de criar as relações entre as tabelas, ligar cada FK a sua respectiva PK e e definir seu tipo de relacionamento (1:N, 1:1 ...).
## Tipos de Relacionamentos
### Um para Um ( 1:1 )
São relacionamentos em que uma ocorrencia de uma entidade em A está associada no máximo a uma ocorrencia em uma entidade B e uma ocorrencia na entidade B está associada no máximo a uma ocorrencia na entidade A.
##
<img align="center" alt="gif" height="123" style="border-radius:50px;" src="http://www.cadcobol.com.br/db2_novo_tipos_relacionamentos_1_1.jpg">

### Um para Muitos ( 1:N )
Este é o principal relacionamento utilizado em bancos de dados relacionais, neste caso um registro na tabela tb01 pode ter muitos registros coincidentes em tb02, porém um registro na tabela tb02 possui apenas um registro coincidente na tabela tb01.
##
<img align="center" alt="gif" height="160" style="border-radius:50px;" src="http://www.cadcobol.com.br/db2_novo_tipos_relacionamentos_1_m.jpg">

### Muitos para Muitos ( N:N )
Uma ocorrencia de uma entidade em A está associada a qualquer número de ocorrencias na entidade B, e cada ocorrencia da entidade em B está associada a qualquer número de ocorrencias na entidade A.
##
<img align="center" alt="gif" height="163" style="border-radius:50px;" src="http://www.cadcobol.com.br/db2_novo_tipos_relacionamentos_m_m.jpg">

### Relacionamentos recursivos ou auto-relacionamentos
Os relacionamentos recursivos (também chamados de auto-relacionamentos) são casos especiais onde uma entidade se relaciona com si própria.
Apesar de serem relacionamentos muito raros, a sua utilização é muito importante em alguns casos.

Os auto-relacionamentos podem ser do tipo 1:1 (um-para-um), 1:N (um-para-muitos) ou N:M (muitosparamuitos), dependendo da política de negócio que estiver envolvida
##
<img align="center" alt="gif" height="163" style="border-radius:50px;" src="http://www.cadcobol.com.br/db2_novo_tipos_relacionamentos_auto.jpg">
