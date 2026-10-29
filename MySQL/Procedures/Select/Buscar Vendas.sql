-- ================================================
-- Stored Procedure: sp_ViewVendas
-- Descrição: Procedure para visualizar as informações das vendas da farmácia
-- Autor: Otávio Augusto Canola do Carmo
-- Data Criação: 24/07/2026
-- ================================================

DELIMITER //

-- Criação Procedure
CREATE PROCEDURE sp_ViewVendas
(
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        RESIGNAL;
	END;
    
	START TRANSACTION;
		
        BEGIN 
			SELECT cliente.nome AS cliente, funcionario.nome AS funcionario, p.nome, v.valor, v.data_Venda, v.canal_Venda FROM Tbl_Venda v
			INNER JOIN Tbl_Usuario cliente ON v.id_Cliente = cliente.id
			INNER JOIN Tbl_Funcionario f ON v.id_Funcionario = f.id 
			INNER JOIN Tbl_Usuario funcionario ON f.id_Usuario = funcionario.id
			INNER JOIN Tbl_Produto_Venda pv ON pv.id_Venda = v.id
			INNER JOIN Tbl_Produto p ON pv.id_Produto = p.id;
		END;
	END //