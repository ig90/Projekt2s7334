<%@ Page Title="Produkty" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Produkty.aspx.cs" Inherits="Projekt2s7334.Produkty" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="row">
        <div class="col-md-2">
            </div>
        <div class="col-md-8">    
    <h3>Produkty według kategorii</h3>
    <div class="btn-group">
    <asp:DropDownList class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ID="KategorieDropDownList" runat="server" AutoPostBack="True" DataSourceID="KategorieDS" DataTextField="nazwaKategorii" DataValueField="id_kategorii" Width="187px"></asp:DropDownList>
    </div>
    <asp:SqlDataSource ID="KategorieDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="SELECT [id_kategorii], [nazwaKategorii] FROM [Kategorie]"></asp:SqlDataSource>
    <div><br /></div>
    <asp:GridView ID="TowaryGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_towaru" DataSourceID="TowaryDS" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="nazwaTowaru" HeaderText="nazwa" SortExpression="nazwaTowaru" />
            <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
            <asp:CheckBoxField DataField="dostepnosc" HeaderText="dostepnosc" SortExpression="dostepnosc" />
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
    <asp:SqlDataSource ID="TowaryDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="SELECT [nazwaTowaru], [id_towaru], [cena], [dostepnosc], [opis], [id_kategorii] FROM [Towary] WHERE ([id_kategorii] = @id_kategorii)">
        <SelectParameters>
            <asp:ControlParameter ControlID="KategorieDropDownList" DefaultValue="1" Name="id_kategorii" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            </div>
        <div class="col-md-2">
            </div>
    </div>
</asp:Content>