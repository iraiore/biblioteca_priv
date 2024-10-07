CREATE DATABASE biblioteca_priv;
USE biblioteca_priv;

#TABELA EMPRESTIMO
CREATE TABLE emprestimo(
	id_emp int auto_increment primary key not null,
    valor_emp double not null,
    data_emp date not null,
    data_devolucao_emp date not null,
    status_emp varchar(100)
);

#TABELA LIVRO
CREATE TABLE livro(
	id_liv int auto_increment primary key not null,
    titulo_liv varchar(100) not null,
    autor_liv varchar(100) not null,
    isbn_liv varchar(100),
    editora_liv varchar(100),
    num_pag_liv int not null
);
#TABELA RECEBIMENTO
CREATE TABLE recebimento(
	id_rec int auto_increment primary key not null,
    data_rec date not null,
    valor_rec double not null,
    data_venc_rec date not null,
    status_rec varchar(100)
);

#TABELA MULTA
CREATE TABLE multa(
	id_mul int auto_increment primary key not null,
    valor_mul double not null,
    prazo_mul date not null
);

#TABELA CAIXA
CREATE TABLE caixa(
	id_cai int auto_increment primary key not null,
    data_aber_cai date not null,
    data_fec_cai date not null,
    numero_cai int  not null,
    saldo_ini_cai double not null,
    saldo_fin_cai double not null,
    total_ent_cai double not null,
    total_sai_cai double not null
);

#TABELA VEDA
CREATE TABLE venda(
	id_ven int auto_increment primary key not null,
    data_ven date null,
    valor_ven double not null
);

#TABELA COMPRA
CREATE TABLE compra(
	id_com int auto_increment primary key not null,
    valor_com double not null,
    data_com date not null
);

#TABELA FORNECEDOR
CREATE TABLE fornecedor(
	id_for int auto_increment primary key not null,
    nome_for varchar(100),
    razao_soc_for varchar(100),
    cnpj_for varchar(18),
    contato_for varchar(100)
);

#TABELA ENDERECO
CREATE TABLE endereco(
	id_end int auto_increment primary key not null,
    logradouro_end varchar(100) null,
    numero_end varchar(10) not null,
    bairro_end varchar(100),
    municipio_end varchar(100) not null,
    uf_end varchar(2)
);

#TABELA FUNCIONARIO
CREATE TABLE funcionario(
	id_fun int auto_increment primary key not null,
    ctps_fun varchar(12),
    data_admis_fun date not null,
    data_demis_fun date ,
    salario_fun double not null
);

#TABELA ALUNO
CREATE TABLE aluno(
	id_alu int auto_increment primary key not null,
    ra_alu varchar(100) not null,
    data_ingresso_alun date not null,
    data_formatura_alun date,
    curso_alu varchar(100)
);

#TABELA PESSOA
CREATE TABLE pessoa(
	id_pes int auto_increment primary key not null,
    nome_pes varchar(100) not null,
    data_nasc_pes date,
    cpf_pes varchar(14)
);

#TABELA LIVRO_VENDA
CREATE TABLE livro_venda(
	id_liv_ven int auto_increment primary key not null,
    qtd_liv_ven int not null,
    valor_liv_ven double not null
);

#TABELA LIVRO_COMPRA
CREATE TABLE livro_compra(
	id_liv_com int auto_increment primary key not null,
    qtd_liv_com int not null,
    valor_lib_com double not null
);

#TABELA LIVRO_EMPRESTIMO
CREATE TABLE livro_emprestimo(
	id_liv_emp int auto_increment primary key not null,
    qtd_liv_emp int not null
);
#TABELA EMPRESTIMMO_FUNCIONARIO
CREATE TABLE emprestimo_funcionario(
	id_emp_fun int auto_increment primary key not null,
    qtd_emp_fun int not null
);