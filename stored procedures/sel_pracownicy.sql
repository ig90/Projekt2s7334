USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sel_pracownicy]

AS
     BEGIN
         SET NOCOUNT ON;
		 SELECT * FROM Pracownicy as p, Stanowiska as s
		 WHERE p.id_stanowiska = s.id_stanowiska;
	 END;