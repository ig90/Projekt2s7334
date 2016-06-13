USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[del_transakcja]

@id_transkacji Int

AS
     BEGIN
         SET NOCOUNT ON;

	DELETE FROM Specyfikacja_transakcji WHERE id_transakcji=@id_transkacji;
	DELETE FROM Transakcje WHERE id_transakcji=@id_transkacji;

	 END;