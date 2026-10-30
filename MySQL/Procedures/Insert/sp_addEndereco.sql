-- ================================================
-- Stored Procedure: sp_AddEndereco
-- Descrição: Procedure para inserção de novos Endereços
-- Autor: Otávio Augusto Canola do Carmo
-- Data Criação: 30/10/2026
-- ================================================

USE dbSannus;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_addEndereco //

CREATE PROCEDURE sp_addEndereco
(
	IN p_cep VARCHAR(9),
	IN p_logradouro VARCHAR(50),
	IN p_bairro VARCHAR(50),
	IN p_cidade VARCHAR(100),
	IN p_uf CHAR(2)
)

BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;

	START TRANSACTION;

	INSERT INTO Tbl_Endereco (cep, logradouro, bairro, cidade, uf) VALUES
	(p_cep, p_logradouro, p_bairro, p_cidade, p_uf);

	COMMIT;

END //
