<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Projekt2s7334.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h4>Parę informacji w celu ułatwienia sprawdzania projektu:</h4>
    <p>
- Kontrahenci: działa edycja, usuwanie, dodawanie. <br />
- Dodawanie i edycja pracowników jeszcze nie zaimplementowana. <br />
- W zakładce "Transakcje" oraz "Kontrahenci" przycisk "zapisz" -> potwierdzenie (ajaxToolkit:ConfirmButtonExtender) <br />
- Nazwa kontrahenta -> pole wymagane (RequiredFieldValidator) <br />

- Transakcje -> pole "ilość" -> walidacja za pomocą ajaxToolkit:FilteredTextBoxExtender  (tylko cyfry) <br />
- Wybór daty przy pomocy ajaxToolkit:CalendarExtender <br />
- Filtrowanie pól przy dodawaniu kontrahentów (ajaxToolkit:FilteredTextBox - np. niemożliwe jest  <br />
   wpisać w polu "miasto" jakiejś cyfry lub znaku specjalnego) <br />
</p>
    <br />
    <p> 
Wykorzystanie jQuery: <br />
        <br />
- Wyszukiwanie produktów (zakładka "stan magazynu"). <br />
- Wyliczanie i przekazanie wartości transakcji do pola "wartość" (zakładka "Transakcje"). <br />
        <br />
Wygląd (co da się od razu zauważyć) przy wykorzystaniu Bootstrapa. <br />
        <br />
Słabe rozwiązanie: <br />
W transakcjach cena pojawia się w textboksie dopiero po wybraniu danego produktu <br />
 (przy produkcie ustawionym domyślnie cena pokaże się dopiero po jego ponownym wybraniu) 

    </p>
</asp:Content>
