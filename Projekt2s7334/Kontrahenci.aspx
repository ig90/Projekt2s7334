<%@ Page Title="Kontrahenci" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kontrahenci.aspx.cs" Inherits="Projekt2s7334.Kontrahenci" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <h2><%: Title %></h2>
     <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
              <h3>Dodaj kontrahenta:</h3>
            <div class="input-group">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole wymagane!" ControlToValidate="txtNazwa_kontrahenta"></asp:RequiredFieldValidator>
    <asp:TextBox type="text" class="form-control" placeholder="Nazwa" aria-describedby="basic-addon1" ID="txtNazwa_kontrahenta" runat="server"></asp:TextBox> <br />
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMiasto" FilterMode="InvalidChars" InvalidChars="1234567890!@#$^&amp;*()_-=+[]{};:'&quot;/?&gt;&lt;.,`|\" />
    <asp:TextBox type="text" class="form-control" placeholder="miasto" aria-describedby="basic-addon1" ID="txtMiasto" runat="server"></asp:TextBox> <br />              
    <asp:TextBox type="text" class="form-control" placeholder="kod pocztowy" aria-describedby="basic-addon1" ID="txtKodPocztowy" runat="server" ControlToValidate="txtKodPocztowy"></asp:TextBox> <br />
    <asp:TextBox type="text" class="form-control" placeholder="ulica" aria-describedby="basic-addon1" ID="txtUlica" runat="server"></asp:TextBox> <br />
    <asp:TextBox type="text" class="form-control" placeholder="nr domu" aria-describedby="basic-addon1" ID="txtNrDomu" runat="server"></asp:TextBox> <br />
    <asp:TextBox type="text" class="form-control" placeholder="nr mieszkania" aria-describedby="basic-addon1" ID="txtNrMieszkania" runat="server"></asp:TextBox> <br />
    <asp:Label ID="typLabel" runat="server" Text="Typ: "></asp:Label>
    <asp:DropDownList class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ID="TypDropDownList" runat="server" Height="38px" Width="251px"> 
        <asp:ListItem>O</asp:ListItem>
        <asp:ListItem>F</asp:ListItem>
                </asp:DropDownList> <br />
    <asp:TextBox type="text" class="form-control" placeholder="nr telefonu" aria-describedby="basic-addon1" ID="txtNrTelefonu" runat="server"></asp:TextBox> <br />
    <asp:TextBox type="text" class="form-control" placeholder="opis" aria-describedby="basic-addon1" ID="txtOpis" runat="server"></asp:TextBox> <br />
                </div>
    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Czy na pewno zapisać?" TargetControlID="bttnZapisz" />
    <asp:Button class="btn btn-primary btn-large" ID="bttnZapisz" runat="server" Text="Zapisz" OnClick="bttnZapisz_Click" />
           <div><br /></div>       
    <asp:GridView ID="KontrahenciGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_kontrahenta" DataSourceID="KontrahenciDS" ForeColor="#333333" GridLines="None" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="nazwa_kontrahenta" HeaderText="nazwa" SortExpression="nazwa_kontrahenta" />
            <asp:BoundField DataField="Miasto" HeaderText="Miasto" SortExpression="Miasto" />
            <asp:BoundField DataField="kodPocztowy" HeaderText="kod pocztowy" SortExpression="kodPocztowy" />
            <asp:BoundField DataField="ulica" HeaderText="ulica" SortExpression="ulica" />
            <asp:BoundField DataField="nrDomu" HeaderText="nr domu" SortExpression="nrDomu" />
            <asp:BoundField DataField="nrMieszkania" HeaderText="nr mieszkania" SortExpression="nrMieszkania" />
            <asp:BoundField DataField="typ" HeaderText="typ" SortExpression="typ" />
            <asp:BoundField DataField="nrTelefonu" HeaderText="nr telefonu" SortExpression="nrTelefonu" />
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
        <asp:SqlDataSource ID="KontrahenciDS" runat="server"
             ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>"
             SelectCommand="sel_kontrahenci" SelectCommandType="StoredProcedure"
             UpdateCommand="upd_kontrahent" UpdateCommandType="StoredProcedure"
             DeleteCommand="del_kontrahent" DeleteCommandType="StoredProcedure"
             InsertCommand="ins_kontrahent" InsertCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_kontrahenta" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_kontrahenta" Type="Int32" />
                <asp:Parameter Name="nazwa_kontrahenta" Type="String" />
                <asp:Parameter Name="Miasto" Type="String" />
                <asp:Parameter Name="kodPocztowy" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="nrDomu" Type="String" />
                <asp:Parameter Name="nrMieszkania" Type="String" />
                <asp:Parameter Name="typ" Type="String" />
                <asp:Parameter Name="nrTelefonu" Type="String" />
                <asp:Parameter Name="opis" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="id_kontrahenta" Type="Int32" />
                <asp:Parameter Name="nazwa_kontrahenta" Type="String" />
                <asp:Parameter Name="Miasto" Type="String" />
                <asp:Parameter Name="kodPocztowy" Type="String" />
                <asp:Parameter Name="ulica" Type="String" />
                <asp:Parameter Name="nrDomu" Type="String" />
                <asp:Parameter Name="nrMieszkania" Type="String" />
                <asp:Parameter Name="typ" Type="String" />
                <asp:Parameter Name="nrTelefonu" Type="String" />
                <asp:Parameter Name="opis" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</asp:Content>