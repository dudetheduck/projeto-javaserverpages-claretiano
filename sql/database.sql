CREATE DATABASE base_dados;

use base_dados;

CREATE TABLE editora (
    id INT AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE livro (
    id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(120) NOT NULL,
    autor VARCHAR(60) NOT NULL,
    ano INT NOT NULL,
    preco DOUBLE,
    foto VARCHAR(45) NOT NULL,
    idEditora INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idEditora)
        REFERENCES editora (id)
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    senha VARCHAR(32) NOT NULL,
    admin boolean not null default false,
    PRIMARY KEY (id)
);

insert into usuario(nome, senha, admin) values
    ("admin", "admin", true);
   
insert into usuario(nome, senha) values
    ("user", "user");


SELECT 
    *
FROM
    usuario;