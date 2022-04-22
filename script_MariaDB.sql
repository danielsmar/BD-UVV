create user danielm identified by '123456';

create database uvv;

grant all privileges on uvv.* to danielm; 

CREATE TABLE uvv.funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(60),
                sexo CHAR(1) CHECK(sexo= 'M' OR sexo= 'F'),
                salario NUMERIC(10,2) CHECK(salario>0),
                cpf_supervisor CHAR(11) CHECK(cpf_supervisor != cpf),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT cpf_pk PRIMARY KEY (cpf) 
                
);

CREATE TABLE uvv.dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1) CHECK(sexo= 'M' OR sexo= 'F'),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                CONSTRAINT dependente_pk PRIMARY KEY (cpf_funcionario, nome_dependente)
);

CREATE TABLE uvv.departamento (
                numero_departamento INTEGER NOT NULL CHECK (numero_departamento>=0),
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT departamento_pk PRIMARY KEY (numero_departamento)
);

CREATE UNIQUE INDEX departamento_ak
 ON uvv.departamento
 ( nome_departamento );


CREATE TABLE uvv.projeto (
                numero_projeto INTEGER NOT NULL CHECK (numero_projeto>=0),
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INTEGER NOT NULL CHECK(numero_departamento>=0),
                CONSTRAINT projeto_pk PRIMARY KEY (numero_projeto)
);

CREATE UNIQUE INDEX projeto_ak
 ON uvv.projeto
 ( nome_projeto );

CREATE TABLE uvv.trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INTEGER NOT NULL CHECK (numero_projeto>=0),
                horas NUMERIC(3,1) CHECK(horas>=0),
                CONSTRAINT trabalha_em_pk PRIMARY KEY (cpf_funcionario, numero_projeto)
);


CREATE TABLE uvv.localizacoes_departamento (
                numero_departamento INTEGER NOT NULL CHECK (numero_departamento>=0),
                local VARCHAR(15) NOT NULL,
                CONSTRAINT localizacoes_departamento_pk PRIMARY KEY (numero_departamento, local)
);
