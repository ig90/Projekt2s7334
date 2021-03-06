USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[dodaj_transakcje]

@id_towaru Int,
@cena money,
@ilosc Int,
@wartosc money,
@id_pracownika Int,
@id_kontrahenta Int,
@data_operacji DateTime,
@typ nvarchar(10)

AS
     BEGIN
         SET NOCOUNT ON;

		 SET IDENTITY_INSERT Specyfikacja_transakcji ON
			DECLARE @tID int
			INSERT INTO Transakcje (id_pracownika, id_kontrahenta, data_operacji, typ) VALUES (@id_pracownika, @id_kontrahenta, @data_operacji, @typ);
			SELECT @tID = SCOPE_IDENTITY();
			INSERT INTO Specyfikacja_transakcji (id_transakcji, wartosc, ilosc, id_towaru) VALUES (@tID, @wartosc, @ilosc, @id_towaru );
		 SET IDENTITY_INSERT Specyfikacja_transakcji OFF
    
	 END;