USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[upd_kontrahent]

@id_kontrahenta Int,
@nazwa_kontrahenta nvarchar(30),
@Miasto nvarchar(30),
@kodPocztowy nvarchar (6),
@ulica nvarchar(20),
@nrDomu nvarchar(4),
@nrMieszkania nvarchar(4),
@typ nvarchar(1),
@nrTelefonu nvarchar(13),
@opis nvarchar(255)

AS
     BEGIN
         SET NOCOUNT ON;

		 UPDATE Kontrahenci SET nazwa_kontrahenta = @nazwa_kontrahenta, Miasto = @Miasto, kodPocztowy = @kodPocztowy, ulica=@ulica, nrDomu = @nrDomu, nrMieszkania=@nrMieszkania,
		 typ=@typ, nrTelefonu=@nrTelefonu, opis=@opis
		 WHERE id_kontrahenta=@id_kontrahenta;
	 END;