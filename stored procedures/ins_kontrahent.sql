USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ins_kontrahent]

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

		 INSERT INTO Kontrahenci (nazwa_kontrahenta,Miasto,kodPocztowy,ulica,nrDomu,nrMieszkania,typ,nrTelefonu,opis)
		 VALUES (@nazwa_kontrahenta, @Miasto, @kodPocztowy, @ulica, @nrDomu, @nrMieszkania, @typ, @nrTelefonu, @opis);

	 END;