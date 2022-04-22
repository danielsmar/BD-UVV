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

ALTER TABLE uvv.departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES uvv.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
 
ALTER TABLE uvv.departamento ADD CONSTRAINT funcionario_departamento_fk1
FOREIGN KEY (cpf_gerente)
REFERENCES uvv.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE uvv.dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES uvv.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE uvv.trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES uvv.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE uvv.funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES uvv.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE uvv.localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES uvv.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE uvv.projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES uvv.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE uvv.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES uvv.projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

INSERT INTO uvv.funcionario(
    cpf, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
    VALUES (88866555576, 'Jorge', 'E', 'Brito', '1937/11/10', 'Rua do Horto 35 São Paulo, SP', 'M', 55000,NULL, 1),
           (98765432168,'Jennifer','S', 'Souza', '1941/06/20','Av.Arthur d Lima, 54, Santo André, SP', 'F', 43000,88866555576, 4),
           (99988777767,'Alice','J', 'Zelaya', '1968/01/19','Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, 98765432168, 4),
           (98798798733,'André','V', 'Pereira', '1969/03/29','Rua Timbira,35, São Paulo, SP', 'M', 25000, 98765432168, 4),
           (33344555587,'Fernando','T', 'Wong', '1955/12/08','Rua da Lapa, 34, São Paulo, SP', 'M', 40000, 88866555576, 5),
           (45345345376,'Joice','A', 'Leite', '1972/07/31','Av.Lucas Obes 74, São Paulo, SP', 'F', 25000, 33344555587, 5),
           (66688444476,'Ronaldo','K', 'Lima', '1962/09/15','Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, 33344555587, 5),
           (12345678966,'João','B', 'Silva', '1965/01/09','Rua das Flores, 751,São Paulo, SP', 'M', 30000, 33344555587, 5);

INSERT INTO uvv.departamento(
	numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente)
	VALUES (5,'Pesquisa',33344555587 , '1988/05/22'),
           (4,'Administração',98765432168 , '1995/01/01'),
           (1,'Matriz',88866555576, '1981/06/19');
		   
INSERT INTO uvv.localizacoes_departamento(
	numero_departamento, local)
	VALUES (1, 'São Paulo'),
           (4, 'Mauá'),
           (5, 'Santo André'),
           (5, 'Itu'),
           (5, 'São Paulo');
		   
INSERT INTO uvv.projeto(
	numero_projeto, nome_projeto, local_projeto, numero_departamento)
	VALUES (1, 'ProdutoX', 'Santo André', 5),
           (2, 'ProdutoY', 'Itu', 5),
           (3, 'ProdutoZ', 'São Paulo', 5),
           (10, 'Informatização', 'Mauá', 4),
           (20, 'Reorganização', 'São Paulo', 1),
           (30, 'Novosbenefícios', 'Mauá', 4);

INSERT INTO uvv.dependente(
	cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
	VALUES (33344555587, 'Alicia', 'F', '1986/04/05', 'Filha'),
           (33344555587, 'Tiago', 'M', '1983/10/25', 'Filho'),
           (33344555587, 'Janaina', 'F', '1958/05/03', 'Esposa'),
           (98765432168, 'Antonio', 'M', '1942/02/28', 'Marido'),
           (12345678966, 'Michael', 'M', '1988/01/04', 'Filho'),
           (12345678966, 'Alicia', 'F', '1988/12/30', 'Filha'),
           (12345678966, 'Elizabeth', 'F', '1967/05/05', 'Esposa');
	 
INSERT INTO uvv.trabalha_em(
	cpf_funcionario, numero_projeto, horas)
	VALUES (12345678966, 1, 32.5),
           (12345678966, 2, 7.5),
           (66688444476, 3, 40.0),
           (45345345376, 1, 20.0),
           (45345345376, 2, 20.0),
           (33344555587, 2, 10.0),
           (33344555587, 3, 10.0),
           (33344555587, 10, 10.0),
           (33344555587, 20, 10.0),
           (99988777767, 30, 30.0),
           (99988777767, 10, 10.0),
           (98798798733, 10, 35.0),
           (98798798733, 30, 5.0),
           (98765432168, 30, 20.0),
           (98765432168, 20, 15.0),
           (88866555576, 20, NULL);

