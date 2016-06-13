USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sel_towary]

AS
     BEGIN
         SET NOCOUNT ON;

		 SELECT * FROM Towary AS t, Kategorie AS k
		 WHERE t.id_kategorii=k.id_kategorii
		 ORDER BY t.dostepnosc;
	 END;