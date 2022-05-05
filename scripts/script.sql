USE db_app_db2;

DROP TABLE livro;
DROP TABLE leitor;
DROP TABLE livro_leitor;
DROP TABLE autor;
DROP TABLE biblioteca;

-- CRIAÇÕES
-- CRIAÇÕES
-- CRIAÇÕES

-- PENDÊNCIAS
-- Falta criar o auto-relacionamento (Amizade)

CREATE TABLE autor						(autor_id							INT AUTO_INCREMENT PRIMARY KEY,
										autor_nome							VARCHAR (100)
                                        );		
		
CREATE TABLE livro	 					(livro_id							INT AUTO_INCREMENT PRIMARY KEY,
										titulo_livro						VARCHAR (100),
										autor_id							INT,
                                        classificacao						INT,
                                        CONSTRAINT autor_id_fk 				FOREIGN KEY (autor_id) 	REFERENCES autor 	(autor_id)
										);		
		
CREATE TABLE leitor						(leitor_id							INT AUTO_INCREMENT PRIMARY KEY,
										leitor_nome							VARCHAR (100)
                                        );
										


CREATE TABLE leitura					(livro_id							INT,
										leitor_id							INT,
										CONSTRAINT livro_id_fk 				FOREIGN KEY (livro_id) 	REFERENCES livro 	(livro_id),
										CONSTRAINT leitor_id_fk 			FOREIGN KEY (leitor_id) REFERENCES leitor 	(leitor_id)
                                        );

CREATE TABLE biblioteca					(biblioteca_id						INT AUTO_INCREMENT PRIMARY KEY,
										categoria							VARCHAR (100),
                                        comentario							VARCHAR (1500),
										livro_id							INT,
										leitor_id							INT,
                                        CONSTRAINT livro_id_biblio_fk 		FOREIGN KEY (livro_id) 	REFERENCES livro 	(livro_id),
										CONSTRAINT leitor_id_biblio_fk 		FOREIGN KEY (leitor_id) REFERENCES leitor 	(leitor_id)
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


INSERT INTO leitura						(livro_id,
										leitor_id
										) VALUES	
                                        (1,
                                        1
										);

INSERT INTO leitura						(livro_id,
										leitor_id
										) VALUES	
                                        (2,
                                        2
										);

INSERT INTO leitura						(livro_id,
										leitor_id
										) VALUES	
                                        (5,
                                        3
										);
                    
                    
INSERT INTO biblioteca					(categoria,
										comentario,
                                        livro_id,
                                        leitor_id
                                        ) VALUES
                                        ('Romance',
                                        'O tempo e o vento é uma coleção chiclete, daquelas que você não cosegue parar de ler. 
                                        Consigo entender porque deu origem a novelas e minisséries. Resumidamente, é uma história sobre várias gerações de mulheres fortes e homens machistas. 
                                        O Continente é a parte mais legal. Ana Terra é uma personagem forte e cativante. 
                                        E a história de amor dela é a mais bonita. Muitas pessoas amam Um Certo Capitão Rodrigo, talvez ele fosse popular no passado. 
                                        Eu achei um belo de um machista, que só me irritou.',
                                        1,
                                        2 -- MATHEUS
                                        );

INSERT INTO biblioteca					(categoria,
										comentario,
                                        livro_id,
                                        leitor_id
                                        ) VALUES
                                        ('Romance',
                                        'O tempo e o vento é uma coleção chiclete, daquelas que você não cosegue parar de ler. 
                                        Consigo entender porque deu origem a novelas e minisséries. Resumidamente, é uma história sobre várias gerações de mulheres fortes e homens machistas. 
                                        O Continente é a parte mais legal.',
                                        2,
                                        3 -- JULIANA
                                        );

INSERT INTO biblioteca					(categoria,
										comentario,
                                        livro_id,
                                        leitor_id
                                        ) VALUES
                                        ('Romance',
                                        'Muitas pessoas amam Um Certo Capitão Rodrigo, talvez ele fosse popular no passado. 
                                        Eu achei um belo de um machista, que só me irritou.',
                                        3,
                                        3 -- JULIANA
                                        );

INSERT INTO biblioteca					(categoria,
										comentario,
                                        livro_id,
                                        leitor_id
                                        ) VALUES
                                        ('Romance',
                                        'Amei',
                                        3,
                                        2 -- MATHEUS
                                        );

INSERT INTO biblioteca					(categoria,
										comentario,
                                        livro_id,
                                        leitor_id
                                        ) VALUES
                                        ('Romance',
                                        'Muito Bom!',
                                        4,
                                        3 -- JULIANA
                                        );

INSERT INTO biblioteca					(categoria,
										comentario,
                                        livro_id,
                                        leitor_id
                                        ) VALUES
                                        ('Romance',
                                        'Gostei bastante do livro',
                                        1,
                                        1 -- CLEITON
                                        );

INSERT INTO biblioteca					(categoria,
										comentario,
                                        livro_id,
                                        leitor_id
                                        ) VALUES
                                        ('Romance',
                                        'Esperava mais. Volume 1 foi muito melhor.',
                                        5,
                                        1 -- CLEITON
                                        );
                    
SELECT * FROM livro;
SELECT * FROM autor;
SELECT * FROM leitor;
SELECT * FROM biblioteca;
SELECT * FROM leitura;
SELECT * FROM leitura INNER JOIN leitor ON leitura.leitor_id = leitor.leitor_id;

SELECT * FROM livro LEFT JOIN autor ON (livro.autor_id = autor.autor_id);

SELECT leitor_nome, titulo_livro
		FROM leitura AS ll
        JOIN leitor AS le
        JOIN livro AS li
			ON ll.leitor_id = le.leitor_id AND ll.livro_id = li.livro_id;
            
 SELECT titulo_livro, autor_nome, classificacao
		FROM livro AS li
        JOIN autor AS au
			ON au.autor_id = li.autor_id;

SELECT leitor_nome, categoria, comentario, titulo_livro
		FROM leitor
        JOIN biblioteca
        JOIN livro
			ON livro.livro_id = biblioteca.livro_id AND biblioteca.leitor_id = leitor.leitor_id;