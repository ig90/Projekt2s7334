<%@ Page Title="Pracownicy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pracownicy.aspx.cs" Inherits="Projekt2s7334.Pracownicy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <h2><%: Title %></h2>
    <div class="row">     
        <div class="col-md-12">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_pracownika,id_stanowiska1" DataSourceID="PracownicyDB" ForeColor="#333333" GridLines="None" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="imie" HeaderText="Imię" SortExpression="imie" />
            <asp:BoundField DataField="nazwisko" HeaderText="Nazwisko" SortExpression="nazwisko" />
            <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
            <asp:BoundField DataField="kodPocztowy" HeaderText="kod pocztowy" SortExpression="kodPocztowy" />
            <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
            <asp:BoundField DataField="nrDomu" HeaderText="nr domu" SortExpression="nrDomu" />
            <asp:BoundField DataField="nrMieszkania" HeaderText="nr mieszkania" SortExpression="nrMieszkania" />
            <asp:BoundField DataField="uwagi" HeaderText="uwagi" SortExpression="uwagi" />
            <asp:BoundField DataField="nazwaStanowiska" HeaderText="nazwa stanowiska" SortExpression="nazwaStanowiska" />
            <asp:BoundField DataField="opis" HeaderText="opis" SortExpression="opis" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
     </asp:GridView>
     <asp:SqlDataSource ID="PracownicyDB" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="sel_pracownicy" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
            </div>
        </div>
</asp:Content>
