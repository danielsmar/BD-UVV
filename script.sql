
CREATE TABLE elmasri.funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(60),
                sexo CHAR(1),
                salario NUMERIC(10,2),
                cpf_supervisor CHAR(11),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT funcionario_pk PRIMARY KEY (cpf)
);
COMMENT ON TABLE elmasri.funcionario IS 'criação da tabela para armazenar os funcionários';


CREATE TABLE elmasri.dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                CONSTRAINT dependente_pk PRIMARY KEY (cpf_funcionario, nome_dependente)
);
COMMENT ON TABLE elmasri.dependente IS 'criação da tabela para armazenar os dependentes dos funcionários';


CREATE TABLE elmasri.departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT departamento_pk PRIMARY KEY (numero_departamento)
);
COMMENT ON TABLE elmasri.departamento IS 'criação da tabela para armazenar os departamentos';


CREATE UNIQUE INDEX departamento_ak
 ON elmasri.departamento
 ( nome_departamento );

CREATE TABLE elmasri.projeto (
                numero_projeto INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT projeto_pk PRIMARY KEY (numero_projeto)
);
COMMENT ON TABLE elmasri.projeto IS 'criação da tabela para armazenar os projetos';


CREATE UNIQUE INDEX projeto_ak
 ON elmasri.projeto
 ( nome_projeto );

CREATE TABLE elmasri.trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INTEGER NOT NULL,
                horas NUMERIC(3,1),
                CONSTRAINT trabalha_em_pk PRIMARY KEY (cpf_funcionario, numero_projeto)
);
COMMENT ON TABLE elmasri.trabalha_em IS 'criação da tabela de local de trabalho';


CREATE TABLE elmasri.localizacoes_departamento (
                numero_departamento INTEGER NOT NULL,
                local VARCHAR(15) NOT NULL,
                CONSTRAINT localizacoes_departamento_pk PRIMARY KEY (numero_departamento, local)
);
COMMENT ON TABLE elmasri.localizacoes_departamento IS 'criação da tabela para armazenar a localização dos departamentos';


ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionario_departamento_fk1
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

INSERT INTO elmasri.funcionario(
    cpf, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
    VALUES (88866555576, 'Jorge', 'E', 'Brito', '1937/11/10', 'Rua do Horto 35 São Paulo, SP', 'M', 55000,NULL, 1),
           (98765432168,'Jennifer','S', 'Souza', '1941/06/20','Av.Arthur d Lima, 54, Santo André, SP', 'F', 43000,88866555576, 4),
           (99988777767,'Alice','J', 'Zelaya', '1968/01/19','Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, 98765432168, 4),
           (98798798733,'André','V', 'Pereira', '1969/03/29','Rua Timbira,35, São Paulo, SP', 'M', 25000, 98765432168, 4),
           (33344555587,'Fernando','T', 'Wong', '1955/12/08','Rua da Lapa, 34, São Paulo, SP', 'M', 40000, 88866555576, 5),
           (45345345376,'Joice','A', 'Leite', '1972/07/31','Av.Lucas Obes 74, São Paulo, SP', 'F', 25000, 33344555587, 5),
           (66688444476,'Ronaldo','K', 'Lima', '1962/09/15','Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, 33344555587, 5),
           (12345678966,'João','B', 'Silva', '1965/01/09','Rua das Flores, 751,São Paulo, SP', 'M', 30000, 33344555587, 5);

INSERT INTO elmasri.departamento(
	numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente)
	VALUES (5,'Pesquisa',33344555587 , '1988/05/22'),
           (4,'Administração',98765432168 , '1995/01/01'),
           (1,'Matriz',88866555576, '1981/06/19');
		   
INSERT INTO elmasri.localizacoes_departamento(
	numero_departamento, local)
	VALUES (1, 'São Paulo'),
           (4, 'Mauá'),
           (5, 'Santo André'),
           (5, 'Itu'),
           (5, 'São Paulo');
		   
INSERT INTO elmasri.projeto(
	numero_projeto, nome_projeto, local_projeto, numero_departamento)
	VALUES (1, 'ProdutoX', 'Santo André', 5),
           (2, 'ProdutoY', 'Itu', 5),
           (3, 'ProdutoZ', 'São Paulo', 5),
           (10, 'Informatização', 'Mauá', 4),
           (20, 'Reorganização', 'São Paulo', 1),
           (30, 'Novosbenefícios', 'Mauá', 4);
