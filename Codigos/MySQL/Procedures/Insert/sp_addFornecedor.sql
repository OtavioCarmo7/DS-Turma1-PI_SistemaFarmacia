-- ================================================
-- Stored Procedure: sp_AddFornecedor
-- Descrição: Procedure para inserção de novos fornecedores
-- Autor: Otávio Augusto Canola do Carmo
-- Data Criação: 03/07/2026
-- ================================================

DELIMITER //

DROP PROCEDURE IF EXISTS sp_AddFornecedor //

-- Criação Procedure
CREATE PROCEDURE sp_AddFornecedor
(
	-- Fornecedor
	IN p_nome VARCHAR(255),
	IN p_cnpj CHAR(14),
	IN p_email VARCHAR(255),
	IN p_telefone VARCHAR(14),

	-- Endereço
	IN p_cep VARCHAR(9),
	IN p_logradouro VARCHAR(50),
	IN p_bairro VARCHAR(50),
	IN p_cidade VARCHAR(100),
	IN p_uf CHAR(2), 

	-- Endereço Fornecedor
	IN p_id_Fornecedor INT,
	IN p_id_Endereco INT,
	IN p_numero VARCHAR(5),
	IN p_complemento VARCHAR(20),
	IN p_referencia VARCHAR(100)
)
BEGIN

	DECLARE v_existe INT DEFAULT 0;
    DECLARE v_ultimo_id INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        RESIGNAL;
	END;
    
    START TRANSACTION;
    
	-- Se existir já um fornecedor cadastrado com o mesmo cnpj ele manda a mensagem
	SELECT COUNT(1)
	INTO v_existe
    FROM Tbl_Fornecedor 
	WHERE cnpj = p_cnpj
    FOR UPDATE;

	IF v_existe > 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fornecedor com CNPJ informado já cadastrado.';
	END IF;

	INSERT INTO Tbl_Fornecedor (nome, cnpj, email) 
	VALUES (p_nome, p_cnpj, p_email);

	SET v_ultimo_Id = LAST_INSERT_ID();

	IF ROW_COUNT() = 1 THEN
		INSERT INTO Tbl_Telefone_Fornecedor (id_Fornecedor, telefone) 
		VALUES (v_ultimo_Id, p_telefone);

		INSERT INTO Tbl_Fornecedor_Endereco (id_Fornecedor, id_Endereco, numero, complemento, referencia) 
		VALUES (v_ultimo_Id, p_id_Endereco, p_numero, p_complemento, p_referencia);

		COMMIT;
	ELSE
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Falha ao adicionar o fornecedor.';
	END IF;
END //

DELIMITER ;