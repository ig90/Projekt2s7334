USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sel_kontrahenci]

AS
     BEGIN
         SET NOCOUNT ON;
		 SELECT * FROM Kontrahenci;		
	 END;