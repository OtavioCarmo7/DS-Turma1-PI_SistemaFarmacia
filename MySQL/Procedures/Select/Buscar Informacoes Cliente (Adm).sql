-- ================================================
-- Stored Procedure: sp_ViewCliente
-- Descrição: Procedure para visualizar as informações da conta do cliente selecionado pelo admin
-- Autor: Otávio Augusto Canola do Carmo
-- Data Criação: 24/07/2026
-- ================================================

DELIMITER //

-- Criação Procedure
CREATE PROCEDURE sp_ViewCliente 
(
	IN p_id_Cliente INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
    START TRANSACTION;
    
	SELECT u.nome, u.email, t.telefone, u.data_Nasc FROM Tbl_Usuario u
	INNER JOIN Tbl_Telefone_Usuario t ON t.id_Usuario = u.id 
	INNER JOIN Tbl_Cliente c ON c.id_Usuario = u.id
	WHERE u.id = @id_Cliente;
    
	COMMIT;
END //

DELIMITER ;