-- ================================================
-- Stored Procedure: sp_ReporEstoque
-- Descrição: Procedure para fazer o processo de compras de produto com o fornecedor
-- Autor: Otávio Augusto Canola do Carmo
-- Data Criação: 10/07/2026
-- ================================================

DELIMITER //

DROP PROCEDURE IF EXISTS sp_ReporEstoque //

-- Criação Procedure
CREATE PROCEDURE sp_ReporEstoque
(
	-- Compra
	IN p_id_Fornecedor INT,
	IN p_total_Compra DECIMAL (10,2),
	IN p_itens LONGTEXT
)

BEGIN

	DECLARE v_id_Compra INT;
	DECLARE v_idx INT DEFAULT 0;
	DECLARE v_total_elementos INT;

	DECLARE v_id_Produto INT;
	DECLARE v_qnt INT;
	DECLARE v_valor_Unitario DECIMAL(8,2);
	DECLARE v_cod VARCHAR(10);
	DECLARE v_validade DATE;
	DECLARE v_posicao VARCHAR(30);

	DECLARE v_id_Produto_Compra INT;
	DECLARE v_id_Lote INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;

	START TRANSACTION;

	INSERT INTO Tbl_Compra (id_Fornecedor, data_Compra, total_Compra) 
	VALUES (p_id_Fornecedor, CURDATE(), p_total_Compra);

	SET v_id_Compra = LAST_INSERT_ID();

	-- Conta a quantidade de elementos no array JSON
	SET v_total_elementos = JSON_LENGTH(p_itens);

	-- Loop para percorrer o JSON e gerar os relacionamentos dependentes (Compra -> Lote -> Estoque)
	WHILE v_idx < v_total_elementos DO

		SELECT 
			JSON_UNQUOTE(JSON_EXTRACT(p_itens, CONCAT('$[', v_idx, '].id_Produto'))),
			JSON_UNQUOTE(JSON_EXTRACT(p_itens, CONCAT('$[', v_idx, '].qnt'))),
			JSON_UNQUOTE(JSON_EXTRACT(p_itens, CONCAT('$[', v_idx, '].valor_Unitario'))),
			JSON_UNQUOTE(JSON_EXTRACT(p_itens, CONCAT('$[', v_idx, '].cod'))),
			JSON_UNQUOTE(JSON_EXTRACT(p_itens, CONCAT('$[', v_idx, '].validade'))),
			JSON_UNQUOTE(JSON_EXTRACT(p_itens, CONCAT('$[', v_idx, '].posicao')))
		INTO 
			v_id_Produto, v_qnt, v_valor_Unitario, v_cod, v_validade, v_posicao;

		INSERT INTO Tbl_Produto_Compra (id_Compra, id_Produto, qnt, valor_Unitario) 
		VALUES (v_id_Compra, v_id_Produto, v_qnt, v_valor_Unitario);

		SET v_id_Produto_Compra = LAST_INSERT_ID();

		INSERT INTO Tbl_Lote (id_Produto_Compra, cod, qnt, validade) 
		VALUES (v_id_Produto_Compra, v_cod, v_qnt, v_validade);

		SET v_id_Lote = LAST_INSERT_ID();

		INSERT INTO Tbl_Estoque (id_Lote, posicao) 
		VALUES (v_id_Lote, v_posicao);

		SET v_idx = v_idx + 1;
	END WHILE;

	COMMIT;
END //

DELIMITER ;