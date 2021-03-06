USE [s7334]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[show_transakcje]

AS
     BEGIN
         SET NOCOUNT ON;
  
	  SELECT t.id_transakcji, tw.nazwaTowaru, tw.cena, s.ilosc, s.wartosc, p.nazwisko, k.nazwa_kontrahenta, t.typ, t.data_operacji
      FROM Towary AS tw, Transakcje AS t, Specyfikacja_transakcji AS s, Kontrahenci As k, Pracownicy AS p 
      WHERE t.id_transakcji = s.id_transakcji AND tw.id_towaru = s.id_towaru AND t.id_kontrahenta=k.id_kontrahenta AND p.id_pracownika=t.id_pracownika
	  ORDER BY t.data_operacji DESC;

     END;
