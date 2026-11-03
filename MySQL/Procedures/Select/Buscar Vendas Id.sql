-- ================================================
-- Stored Procedure: sp_ViewVendaId
-- Descrição: Procedure para visualizar as informações das vendas da farmácia com o where de id
-- Autor: Otávio Augusto Canola do Carmo
-- Data Criação: 03/11/2026
-- ================================================

USE dbSannus

DELIMITER //

DROP PROCEDURE IF EXISTS sp_ViewVendaId//

CREATE PROCEDURE sp_ViewVendaId
(
 IN p_id INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		RESIGNAL;
	END;

	START TRANSACTION;

		SELECT * FROM Tbl_Venda
		WHERE id = p_id;

		COMMIT;

END //

DELIMITER ; 

