DROP DATABASE IF EXISTS bookcatalogue
CREATE database IF NOT EXISTS bookcatalogue DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE bookcatalogue;

CREATE TABLE IF NOT EXISTS authors(
    id INT(6) NOT NULL AUTO_INCREMENT,
    author VARCHAR(32) NOT NULL UNIQUE,
    PRIMARY KEY(id)
    );
	
CREATE TABLE IF NOT EXISTS genres(
    id INT(6) NOT NULL AUTO_INCREMENT,
    genre VARCHAR(32) NOT NULL UNIQUE,
    PRIMARY KEY(id)
    );
	
CREATE TABLE IF NOT EXISTS books(
    id INT(6) NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
	price DECIMAL(6,2) DEFAULT NULL,
    PRIMARY KEY(id)
    );
	
CREATE TABLE IF NOT EXISTS descriptions(
    id_book INT(6) NOT NULL ,
    description TEXT(1000) NOT NULL,
	FOREIGN KEY(id_book) REFERENCES books(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
    );
	
CREATE TABLE IF NOT EXISTS authors_books(
    id_author INT(6) NOT NULL ,
    id_book INT(6) NOT NULL,
	FOREIGN KEY(id_author) REFERENCES authors(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(id_book) REFERENCES books(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
    );
	
CREATE TABLE IF NOT EXISTS genres_books(
    id_genre INT(6) NOT NULL ,
    id_book INT(6) NOT NULL,
	FOREIGN KEY(id_genre) REFERENCES genres(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(id_book) REFERENCES books(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
    );