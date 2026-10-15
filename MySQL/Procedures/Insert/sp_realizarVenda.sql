-- ================================================
-- Stored Procedure: sp_realizarVenda
-- Descrição: Procedure para fazer o processo de venda com o cliente
-- Autor: Otávio Augusto Canola do Carmo
-- Data Criação: 15/07/2026
-- ================================================

DELIMITER //

DROP PROCEDURE IF EXISTS sp_realizarVenda //

-- Criação Procedure
CREATE PROCEDURE sp_realizarVenda (	
	-- Variáveis

	-- Tabela: Venda
	IN p_id_Cliente INT,
	IN p_id_Funcionario INT,
	IN p_nfe VARCHAR(100),
	IN p_canal_Venda VARCHAR(20),

	-- Tabela: PagamentoVenda
	IN p_forma_Pagamento VARCHAR(9),
	IN p_valor_Pago DECIMAL(10,2),
	IN p_valor_Recebido DECIMAL(10,2),
	IN p_situacao VARCHAR(8),

	-- Tabela: ProdutoVenda
	IN p_itens LONGTEXT -- Array de JSON contendo os produtos
)
    
BEGIN
	DECLARE v_id_Venda INT;
	DECLARE v_valor_Total DECIMAL(10,2);
	DECLARE v_troco DECIMAL(10,2) DEFAULT NULL;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;

	-- Validação para pagamentos em dinheiro
	IF LOWER(p_forma_Pagamento) = 'dinheiro' THEN
		IF p_valor_Recebido IS NULL OR p_valor_Recebido < p_valor_Pago THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Valor recebido em dinheiro não pode ser menor que o valor pago.';
		END IF;
		SET v_troco = p_valor_Recebido - p_valor_Pago;
	END IF;

	START TRANSACTION;

	-- Calcula o valor total extraindo os itens diretamente do JSON
	SELECT SUM(qnt * valor_Unitario) INTO v_valor_Total
	FROM JSON_TABLE(
    p_itens,
    '$[*]' COLUMNS (
        qnt INT PATH '$.qnt',
        valor_Unitario DECIMAL(8,2) PATH '$.valor_Unitario'
    )
) AS jt;
	-- Insere a venda
	INSERT INTO Tbl_Venda (id_Cliente, id_Funcionario, nfe, valor, data_Venda, canal_Venda) 
	VALUES (p_id_Cliente, p_id_Funcionario, p_nfe, v_valor_Total, NOW(), p_canal_Venda);

	SET v_id_Venda = LAST_INSERT_ID();

	-- Insere todos os itens recebidos no JSON em lote
	INSERT INTO Tbl_Produto_Venda (id_Venda, id_Produto, qnt, valor_Unitario)
	SELECT 
		v_id_Venda, 
		jt.id_Produto, 
		jt.qnt, 
		jt.valor_Unitario
	FROM JSON_TABLE(
		p_itens,
		'$[*]' COLUMNS (
			id_Produto INT PATH '$.id_Produto',
			qnt INT PATH '$.qnt',
			valor_Unitario DECIMAL(8,2) PATH '$.valor_Unitario'
		)
	) AS jt;

	-- Registra as informações de pagamento
	INSERT INTO Tbl_Pagamento_Venda (id_Venda, forma_Pagamento, valor_Pago, valor_Recebido, troco, situacao) 
	VALUES (v_id_Venda, p_forma_Pagamento, p_valor_Pago, p_valor_Recebido, v_troco, p_situacao);

	COMMIT;
END //

DELIMITER ;