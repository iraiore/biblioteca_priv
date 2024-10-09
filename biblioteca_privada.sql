#Aluno: Pedro Yago

CREATE DATABASE biblioteca_priv;
USE biblioteca_priv;

#TABELA UF 
CREATE TABLE uf(
	id_uf int auto_increment primary key not null,
    sigla_uf varchar (2),
    nome_estado varchar (100)
);

#POPULANDO A TABELA UF
INSERT INTO uf VALUES (1,'RO','Rondonia'),
					  (2,'SP','Sao Paulo'),
                      (3,'RR','Roraima'),
                      (4,'AM','Amazonas'),
                      (5,'MG','Minas Gerais');
#SELECT * FROM uf; 

#TABELA MUNICIPIO
CREATE TABLE municipio(
	id_mun int auto_increment primary key not null,
    nome_num varchar(100),
    id_uf_fk int not null,
    FOREIGN KEY	(id_uf_fk) REFERENCES uf (id_uf)
);

#POPULANDO A TABELA MUNICIPIO
INSERT INTO municipio VALUES (1,'Ji-Parana','1'),
							 (2,'Belo Horizonte','5'),
							 (3,'Boa Vista','3'),
							 (4,'Cacoal','1'),
							 (5,'Itu','2');
#SELECT * FROM municipio; 

#TABELA ENDERECO
CREATE TABLE endereco(
	id_end int auto_increment primary key not null,
    logradouro_end varchar(100) null,
    numero_end varchar(10) not null,
    bairro_end varchar(100),
    #municipio_end varchar(100) not null
    #uf_end varchar(2)
    id_mun_fk int not null,
    FOREIGN KEY (id_mun_fk) REFERENCES municipio (id_mun)
);

#POPULANDO A TABAELA ENDERECO
INSERT INTO endereco values (1, 'Dom Auguto', '216', 'centro',1),
							(2, 'Sangue Bom', '150', 'Mungozinho',2),
                            (3, 'Lua de Prata', '21A', 'Trenera',2),
                            (4, 'Benevel', '2115', 'Gameleira',3),
                            (5, 'Saturnalia', '30', 'Casa Bonita',4);
#SELECT * FROM endereco; 

#TABELA PESSOA
CREATE TABLE pessoa(
	id_pes int auto_increment primary key not null,
    nome_pes varchar(100) not null,
    data_nasc_pes date,
    cpf_pes varchar(14),
    id_end_fk int not null,
    FOREIGN KEY (id_end_fk) REFERENCES endereco (id_end)
);

#POPULANDO A TABAELA PESSOA
INSERT INTO pessoa values (1, 'Paulo Machado', '1992-07-02', '258.256.985-09',1),
						  (2, 'Ana Reboucas', '1984-12-28', '456.457.987-13',2),
                          (3, 'Alcione Guaicurus', '1990-09-13', '753.456.524-05',2),
                          (4, 'Lucas Scheffer', '2000-03-06', '548.458.415-45',4),
                          (5, 'Angelo Miguel', '2002-01-08', '235.465.115-22',5);
#SELECT * FROM pessoa;                           
                          
#TABELA FUNCIONARIO
CREATE TABLE funcionario(
	id_fun int auto_increment primary key not null,
    ctps_fun varchar(12),
    data_admis_fun date not null,
    data_demis_fun date ,
    salario_fun double not null,
    id_pes_fk int not  null,
    FOREIGN KEY (id_pes_fk) REFERENCES pessoa (id_pes)
);
#POPULANDO A TABAELA FUNCIONARIO
INSERT INTO funcionario values (1, '1234567/1234', '2010-03-15', null, 1890.25, 1),
							   (2, '2345678/2345', '2013-07-22','2016-11-08', 1250.28, 3),
							   (3, '3456789/3456', '2016-11-08', null, 1350.89, 2),
							   (4, '4567890/4567', '2019-02-19', null,  1580.89, 4),
                               (5, '5678901/5678', '2022-08-05', null, 2250.87, 5);
#SELECT * FROM funcionario;   

#TABELA ALUNO
CREATE TABLE aluno(
	id_alu int auto_increment primary key not null,
    ra_alu varchar(100) not null,
    data_ingresso_alun date not null,
    data_formatura_alun date,
    curso_alu varchar(100),
    id_pes_fk int not null,
    FOREIGN KEY (id_pes_fk) REFERENCES pessoa (id_pes)
);

#POPULANDO A TABAELA ALUNO
INSERT INTO aluno values (1, '10000', '2010-03-15', null, 'Analise e Desenvolvimento de Sistemas', 1),
						 (2, '10001', '2013-07-22','2016-11-08', 'Engenharia de Produção', 3),
						 (3, '10002', '2016-11-08', null, 'Engenharia Civil', 2),
						 (4, '10003', '2019-02-19', null,  'Egenharia Agronomica', 4),
                         (5, '10004', '2022-08-05', null, 'Ciencias Contabeis', 5);
#SELECT * FROM aluno;

#TABELA FORNECEDOR
CREATE TABLE fornecedor(
	id_for int auto_increment primary key not null,
    nome_for varchar(100),
    razao_soc_for varchar(100),
    cnpj_for varchar(18),
    contato_for varchar(100),
    id_end_fk int not null,
    FOREIGN KEY (id_end_fk) REFERENCES endereco (id_end)
);

#POPULANDO A TABAELA FORNECEDOR
INSERT INTO fornecedor values (1, 'livravria nunes', 'livravria nunes ltda', '12.345.678/0001-90', 'contato@livrarianunes.com.br', 1),
							  (2, 'sebinho do lucas','sebinho do lucas ltda', '23.456.789/0001-01', 'atendimento@sebinhodolucas.com.br', 3),
							  (3, 'livros e livros', 'livros e livros ltda', '34.567.890/0001-12', 'info@livroselivros.com.br', 2),
							  (4, 'paginas escritas livraria', 'paginas escritas livraria ltda', '45.678.901/0001-23', 'suporte@paginasescritas.com.br', 4),
							  (5, 'livros antigos', 'livros antigos ltda', '56.789.012/0001-34', 'contato@livrosantigos.com.br', 5);
#SELECT * FROM fornecedor;

#TABELA LIVRO
CREATE TABLE livro(
	id_liv int auto_increment primary key not null,
    titulo_liv varchar(100) not null,
    autor_liv varchar(100) not null,
    isbn_liv varchar(100),
    editora_liv varchar(100),
    num_pag_liv int not null
);

#POPULANDO A TABAELA LIVRO
INSERT INTO livro values (1,'A Jornada do Herói', 'Ana Silva', '978-3-16-148410-0', 'Editora Aventura', 320),
							  (2, 'Mistério na Floresta', 'Carlos Souza', '978-1-23-456789-7', 'Editora Mistério', 250),
							  (3, 'O Futuro da Humanidade', 'Mariana Costa', '978-0-12-345678-9', 'Editora Ciência', 400),
							  (4, 'Amor e Destino', 'Pedro Oliveira', '978-4-56-789012-3', 'Editora Romance', 280),
							  (5, 'Segredos do Passado', 'Fernanda Lima', '978-7-89-012345-6', 'Editora História', 350);
#SELECT * FROM livro;

#TABELA COMPRA
CREATE TABLE compra(
	id_com int auto_increment primary key not null,
    valor_com double not null,
    data_com date not null,
    id_fun_fk int not null,
    id_for_fk int not null,
    FOREIGN KEY (id_fun_fk) REFERENCES funcionario (id_fun) 
);

#POPULANDO A TABAELA COMPRA
INSERT INTO compra values (1, 40.50, '2024-03-15', 1, 4),
						  (2, 33.23, '2024-05-15', 3, 4),
						  (3, 48.82, '2024-06-22', 5, 3),
						  (4, 52.61, '2024-01-12', 3, 1),
						  (5, 91.99, '2024-12-15', 2, 2);
#SELECT * FROM compra;

#TABELA VEDA
CREATE TABLE venda(
	id_ven int auto_increment primary key not null,
    data_ven date null,
    valor_ven double not null,
    id_alu_fk int not null,
    FOREIGN KEY (id_alu_fk) REFERENCES aluno (id_alu) 
);

#POPULANDO A TABAELA VENDA
INSERT INTO venda values (1, '2024-03-15', 40.50, 1),
						 (2, '2024-05-15', 33.23, 3),
						 (3, '2024-06-22', 48.82, 5),
						 (4, '2024-01-12', 52.61, 3),
						 (5, '2024-12-15', 91.99, 2);
#SELECT * FROM venda;

#TABELA CAIXA
CREATE TABLE caixa(
	id_cai int auto_increment primary key not null,
    data_aber_cai date not null,
    data_fec_cai date not null,
    numero_cai int  not null,
    saldo_ini_cai double not null,
    saldo_fin_cai double not null,
    total_ent_cai double not null,
    total_sai_cai double not null,
    id_fun_fk int not null,
    FOREIGN KEY (id_fun_fk) REFERENCES funcionario (id_fun)
);

#POPULANDO A TABAELA CAIXA
INSERT INTO caixa values (1, '2024-03-15','2024-03-15', 1, 40.50, 230.15, 98.65, 172, 1),
						 (2, '2024-05-15','2024-05-15', 2, 33.23, 320.15, 164.38, 189, 3),
						 (3, '2024-06-22','2024-06-22', 3, 48.82, 450.78, 322.6, 177, 5),
						 (4, '2024-01-12','2024-01-12', 3, 52.61, 569.78, 444.39, 178, 3),
						 (5, '2024-12-15','2024-12-15', 2, 91.99, 587.25, 496.24, 183, 2);
SELECT * FROM caixa;

#TABELA EMPRESTIMO
CREATE TABLE emprestimo(
	id_emp int auto_increment primary key not null,
    valor_emp double not null,
    data_emp date not null,
    data_devolucao_emp date not null,
    status_emp varchar(100),
    id_alu_fk int,
    FOREIGN KEY (id_alu_fk) REFERENCES aluno (id_alu)
);

#POPULANDO A TABAELA EMPRESTIMO
INSERT INTO emprestimo values (1, 40.50, '2024-03-15','2024-03-21', null, 1),
							  (2, 33.23, '2024-05-15','2024-05-21', null, 3),
							  (3, 48.82, '2024-06-22','2024-07-5', null, 5),
							  (4, 52.61, '2024-01-12','2024-01-19', null, 3),
							  (5, 91.99, '2024-12-15','2024-12-21', null, 2);
#SELECT * FROM emprestimo;

#TABELA MULTA
CREATE TABLE multa(
	id_mul int auto_increment primary key not null,
    valor_mul double not null,
    prazo_mul date not null,
    id_emp_fk int,
    FOREIGN KEY (id_emp_fk) REFERENCES emprestimo (id_emp) 
);

#POPULANDO A TABAELA MULTA
INSERT INTO multa values (1, 40.50, '2024-03-15', 1),
						 (2, 33.23, '2024-05-15', 3),
						 (3, 48.82, '2024-06-22', 5),
						 (4, 52.61, '2024-01-12', 3),
						 (5, 91.99, '2024-12-15', 2);
#SELECT * FROM MULTA;

#TABELA RECEBIMENTO
CREATE TABLE recebimento(
	id_rec int auto_increment primary key not null,
    data_rec date not null,
    valor_rec double not null,
    data_venc_rec date not null,
    status_rec varchar(100),
    id_emp_fk int not null,
    id_ven_fk int not null,
    id_cai_fk int not null,
    id_mul_fk int,
    FOREIGN KEY (id_emp_fk) REFERENCES emprestimo (id_emp),
    FOREIGN KEY (id_ven_fk) REFERENCES venda (id_ven),
    FOREIGN KEY (id_cai_fk) REFERENCES caixa (id_cai),
    FOREIGN KEY (id_mul_fk) REFERENCES multa (id_mul)
    
);

#POPULANDO A TABAELA RECEBIMENTO
INSERT INTO recebimento values (1, '2024-02-15', 40.50, '2024-03-15', null, 1, 2, 3, 1),
						       (2, '2024-04-15', 33.23, '2024-05-15', null, 3, 3, 2, 1),
							   (3, '2024-05-22', 48.82, '2024-06-22', null, 5, 2, 1, 1),
							   (4, '2024-01-12', 52.61, '2024-02-12', null, 2, 5, 3, 1),
							   (5, '2024-11-15', 91.99, '2024-12-15', null, 2, 4, 3, 1);
#SELECT * FROM RECEBIMENTO;

#TABELA LIVRO_VENDA
CREATE TABLE livro_venda(
	id_liv_ven int auto_increment primary key not null,
    qtd_liv_ven int not null,
    valor_liv_ven double not null,
    id_ven_fk int not null,
    id_liv_fk int not null,
    FOREIGN KEY (id_ven_fk) REFERENCES venda (id_ven),
    FOREIGN KEY (id_liv_fk) REFERENCES livro (id_liv)
);

#POPULANDO A TABAELA LIVRO_VENDA
INSERT INTO livro_venda values (1, 5, 40.50, 3, 1),
						 (2, 6, 33.23, 2, 1),
						 (3, 8, 48.82, 1, 1),
						 (4, 9, 52.61, 3, 1),
						 (5, 8, 91.99, 3, 1);
SELECT * FROM livro_venda;

#TABELA LIVRO_COMPRA
CREATE TABLE livro_compra(
	id_liv_com int auto_increment primary key not null,
    qtd_liv_com int not null,
    valor_lib_com double not null,
	id_com_fk int not null,
    id_liv_fk int not null,
    FOREIGN KEY (id_com_fk) REFERENCES compra (id_com),
    FOREIGN KEY (id_liv_fk) REFERENCES livro (id_liv)
);

#POPULANDO A TABAELA LIVRO_COMPRA
INSERT INTO livro_compra values (1, 5, 40.50, 3, 1),
								(2, 6, 33.23, 2, 1),
								(3, 8, 48.82, 1, 1),
								(4, 9, 52.61, 3, 1),
								(5, 8, 91.99, 3, 1);
#SELECT * FROM livro_compra;

#TABELA LIVRO_EMPRESTIMO
CREATE TABLE livro_emprestimo(
	id_liv_emp int auto_increment primary key not null,
    qtd_liv_emp int not null,
	id_emp_fk int not null,
    id_liv_fk int not null,
    FOREIGN KEY (id_emp_fk) REFERENCES emprestimo (id_emp),
    FOREIGN KEY (id_liv_fk) REFERENCES livro (id_liv)
);

#POPULANDO A TABAELA LIVRO_EMPRESTIMO
INSERT INTO livro_emprestimo values (1, 5, 3, 1),
									(2, 6, 2, 1),
									(3, 8, 1, 1),
									(4, 9, 3, 1),
									(5, 8, 3, 1);
#SELECT * FROM livro_emprestimo;

#TABELA EMPRESTIMMO_FUNCIONARIO
CREATE TABLE emprestimo_funcionario(
	id_emp_fun int auto_increment primary key not null,
    qtd_emp_fun int not null,
	id_emp_fk int not null,
    id_fun_fk int not null,
    FOREIGN KEY (id_emp_fk) REFERENCES emprestimo (id_emp),
    FOREIGN KEY (id_fun_fk) REFERENCES funcionario (id_fun)
);

#POPULANDO A TABAELA LIVRO_FUNCIONARIO
INSERT INTO emprestimo_funcionario values (1, 5, 3, 1),
										  (2, 6, 2, 1),
										  (3, 8, 1, 1),
										  (4, 9, 3, 1),
										  (5, 8, 3, 1);
#SELECT * FROM emprestimo_funcionario;

#TABELA VENDA_FUNCIONARIO
CREATE TABLE venda_funcionario(
	id_ven_fun int auto_increment primary key not null,
    qtd_ven_fun int not null,
	id_fun_fk int not null,
    id_ven_fk int not null,
    FOREIGN KEY (id_fun_fk) REFERENCES funcionario (id_fun),
    FOREIGN KEY (id_ven_fk) REFERENCES venda (id_ven)
);

#POPULANDO A TABAELA VENDA_FUNCIONARIO
INSERT INTO venda_funcionario values (1, 5, 3, 1),
									 (2, 6, 2, 1),
									 (3, 8, 1, 1),
									 (4, 9, 3, 1),
									 (5, 8, 3, 1);
#SELECT * FROM venda_funcionario;

#Adicione o atributo idade na tabela Pessoa após o abrituo data de nascimento com o ALTER TABLE
ALTER TABLE pessoa ADD COLUMN idade_pes int after data_nasc_pes;

