USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[del_kontrahent]

@id_kontrahenta Int

AS
     BEGIN
         SET NOCOUNT ON;

		 DELETE FROM Kontrahenci
		 WHERE id_kontrahenta = @id_kontrahenta;
	 END;