USE db_app_db2;
                           
# View de Leitores com Leituras Finalizadas com Group by
CREATE VIEW leitores_com_leituras_finalizadas AS
	SELECT le.leitor_nome, li.*
		FROM leitor le
		JOIN leitura li 
			ON ( le.leitor_id = li.leitor_id )
		WHERE li.fim IS NOT NULL
		ORDER BY livro_id DESC;
 
 SELECT * FROM leitores_com_leituras_finalizadas;
 
 
# Criação de Função que retorna o titulo de um livro passando o ID por parâmetro  
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION RETORNA_TITULO_LIVRO;

DELIMITER /
CREATE FUNCTION RETORNA_TITULO_LIVRO(varx INT)
RETURNS VARCHAR(100)
BEGIN
   DECLARE titulo_do_livro VARCHAR(100);
   
   SET @titulo_do_livro = (SELECT livro.titulo_livro FROM livro WHERE livro_id = varx);
   
   RETURN @titulo_do_livro;
END/
DELIMITER ;

SELECT RETORNA_TITULO_LIVRO(2);


# Criação de Procedure para inserção de um livro
DELIMITER / 
CREATE PROCEDURE livro_insert(titulo_livrox VARCHAR(100), autor_idx INT, classificacaox INT)
 BEGIN
 	 INSERT INTO livro (titulo_livro, autor_id, classificacao)
VALUES (titulo_livrox, autor_idx, classificacaox);
END /
DELIMITER ;

CALL livro_insert ('Clarissa', 1, 5);

SELECT * FROM livro;


# Criação de Trigger para armazenar LOG de inserção de Livros
CREATE TABLE log_livro (titulo_livro  VARCHAR(100),
					   autor_id INT,
					   classificacao INT
					   );

DROP TRIGGER MEUS_LIVROS_AFT_INS;;

DELIMITER //
CREATE TRIGGER MEUS_LIVROS_AFT_INS
AFTER INSERT ON log_livro FOR EACH ROW
BEGIN   
   SET NEW.titulo_livro = SUBSTRING(NEW.titulo_livro,1,1);
   SET NEW.autor_id = SUBSTRING(NEW.autor_id,1,1);
   SET NEW.classificacao = SUBSTRING(NEW.classificacao,1,1);
   
   CALL LOG('CM',0,'NEW.titulo_livro', NEW.titulo_livro);
   CALL LOG('CM',0,'NEW.autor_id', NEW.autor_id);
   CALL LOG('CM',0,'NEW.classificacao', NEW.classificacao);
END//


# Criação de Event para adicionar um livro após 10 segundos chamando a procedure
DROP EVENT insere_livro_10_segundos;

DELIMITER /
CREATE EVENT insere_livro_10_segundos
	ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 10 SECOND
    DO
		CALL livro_insert ('Clarissa', 1, 5);
		/
DELIMITER ;    

SELECT * FROM livro;