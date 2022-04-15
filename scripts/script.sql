DROP TABLE livro;
DROP TABLE leitor;
DROP TABLE livro_leitor;
DROP TABLE autor;

-- CRIAÇÕES
-- CRIAÇÕES
-- CRIAÇÕES

CREATE TABLE autor						(autor_id					INT AUTO_INCREMENT PRIMARY KEY,
										autor_nome					VARCHAR (100)
                                        );

CREATE TABLE livro	 					(livro_id					INT AUTO_INCREMENT PRIMARY KEY,
										titulo_livro				VARCHAR (100),
										autor_id					INT,
                                        classificacao				INT,
                                        CONSTRAINT autor_id_fk 		FOREIGN KEY (autor_id) 	REFERENCES autor 	(autor_id)
										);

CREATE TABLE leitor						(leitor_id					INT AUTO_INCREMENT PRIMARY KEY,
										leitor_nome					VARCHAR (100)
                                        );
										


CREATE TABLE livro_leitor				(livro_id					INT,
										leitor_id					INT,
										CONSTRAINT livro_id_fk 		FOREIGN KEY (livro_id) 	REFERENCES livro 	(livro_id),
										CONSTRAINT leitor_id_fk 	FOREIGN KEY (leitor_id) REFERENCES leitor 	(leitor_id)
                                        );



-- INSERÇÕES
-- INSERÇÕES
-- INSERÇÕES

INSERT INTO autor						(autor_nome
										) VALUES	
                                        ('Erico Verissimo'
										);


INSERT INTO livro 						(titulo_livro,
										classificacao,
                                        autor_id
										) VALUES				
                                        ('O Tempo e o Vento - O Continente 1',
										5,
                                        1
										);
                     
INSERT INTO livro 						(titulo_livro,
										classificacao,
                                        autor_id
										) VALUES	
                                        ('O Tempo e o Vento - O Continente 2',
										4,
                                        1
										);                     
                     
INSERT INTO livro 						(titulo_livro,
										classificacao,
                                        autor_id
										) VALUES	
                                        ('O Tempo e o Vento - O Retrato 1',
										5,
                                        1
										);
                                        
INSERT INTO livro 						(titulo_livro,
										classificacao,
                                        autor_id
										) VALUES	
                                        ('O Tempo e o Vento - O Retrato 2',
										5,
                                        1
										);                                        

INSERT INTO livro 						(titulo_livro,
										classificacao,
                                        autor_id
										) VALUES	
                                        ('O Tempo e o Vento - O Arquipélago 1',
										5,
                                        1
										);

INSERT INTO livro 						(titulo_livro,
										classificacao,
                                        autor_id
										) VALUES	
                                        ('O Tempo e o Vento - O Arquipélago 2',
										5,
                                        1
										);                                      
                                        
INSERT INTO livro 						(titulo_livro,
										classificacao,
                                        autor_id
										) VALUES	
                                        ('O Tempo e o Vento - O Arquipélago 3',
										5,
                                        1
										);                     


INSERT INTO leitor						(leitor_nome
										) VALUES	
                                        ('Cleiton'
										);

INSERT INTO leitor						(leitor_nome
										) VALUES	
                                        ('Matheus'
										);

INSERT INTO leitor						(leitor_nome
										) VALUES	
                                        ('Juliana'
										);


INSERT INTO livro_leitor				(livro_id,
										leitor_id
										) VALUES	
                                        (1,
                                        1
										);

INSERT INTO livro_leitor				(livro_id,
										leitor_id
										) VALUES	
                                        (2,
                                        2
										);

INSERT INTO livro_leitor				(livro_id,
										leitor_id
										) VALUES	
                                        (5,
                                        3
										);
                    
SELECT * FROM livro;
SELECT * FROM autor;
SELECT * FROM leitor;
SELECT * FROM livro_leitor;
SELECT * FROM livro_leitor INNER JOIN leitor ON livro_leitor.leitor_id = leitor.leitor_id;



SELECT * FROM livro LEFT JOIN autor ON (livro.autor_id = autor.autor_id);