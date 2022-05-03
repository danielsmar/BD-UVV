--PSET 2

--questao 1
SELECT numero_departamento, 
       AVG(salario) AS media
FROM funcionario 
GROUP BY numero_departamento
order BY numero_departamento ;

--questao 2
SELECT sexo, 
       AVG(salario) AS media
FROM funcionario 
GROUP BY sexo
ORDER BY sexo ;

--questao 3
select
	f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome,
	f.data_nascimento,
	DATE_PART('year', current_date) - DATE_PART('year', f.data_nascimento) as idade,
	f.salario,
	d.nome_departamento
from
	funcionario f

join departamento d on f.numero_departamento = d.numero_departamento 
order by nome_departamento 

--questão 4
select
	f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as nome_completo,
	DATE_PART('year', current_date) - DATE_PART('year', f.data_nascimento) as idade,
	f.salario as salario_atual,
	(case when (f.salario < '35000') then f.salario*1.2
		  when (f.salario >= '35000') then f.salario*1.15 end ) as novo_salario
from funcionario f 


--questao 05
select
	f.primeiro_nome || ' ' || f.nome_meio || ' ' || f.ultimo_nome as nome_completo,
	f.salario,
	d.nome_departamento,
	(case when(f.cpf_supervisor = '98765432168')then 'Jennifer S Souza' 
		  when(f.cpf_supervisor = '33344555587')then 'Fernando T Wong' 
		  when(f.cpf_supervisor = '88866555576')then 'Jorge	E Brito'end) as nome_gerente
	
from
	funcionario f

join departamento d on f.numero_departamento = d.numero_departamento 
order by nome_departamento  asc,salario desc

--questao 06
select 
	(case when(f.cpf = d.cpf_funcionario)then f.primeiro_nome || ' ' || f.nome_meio || ' ' || f.ultimo_nome end) as funcionario_com_dependente,
    d2.nome_departamento as trabalha_no_departamento,
    d.nome_dependente,
    DATE_PART('year', current_date) - DATE_PART('year', d.data_nascimento) as idade,
    (case when(d.sexo = 'M')then 'Masculino'
    	  when(d.sexo = 'F')then 'Feminino'end) as sexo
from 
	funcionario f 
join dependente d on f.cpf =d.cpf_funcionario 
join departamento d2 on f.numero_departamento = d2.numero_departamento 	
	
--questao 07
select 
	 f.primeiro_nome||' '||f.nome_meio ||' '||f.ultimo_nome as nome_completo,
	 f.salario,
	 d.nome_departamento 
from 
	funcionario f 
	
join departamento d on f.numero_departamento =d.numero_departamento 
where f.cpf not in (select d.cpf_funcionario from dependente d)
