<%@ Page Title="Transakcje" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Transakcje.aspx.cs" Inherits="Projekt2s7334.Transakcje" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
     <script type="text/javascript">
         $(function () {
             var txtCena = $('input:text[id$=txtCena]').keyup(foo);
             var txtIlosc = $('input:text[id$=txtIlosc]').keyup(foo);
             function foo() {
                 var value1 = parseFloat(txtCena.val());
                 var value2 = parseFloat(txtIlosc.val());
                 var mul = value1 * value2;
                 $('input:text[id$=txtWartosc]').val(mul);
             }
         });
    </script>
      <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
     <h3>Dodaj Transakcje:</h3>
            <div class="input-group">
    <asp:DropDownList class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ID="KategorieDropDownList" runat="server" AutoPostBack="True" DataSourceID="KategorieDS" DataTextField="nazwaKategorii" DataValueField="id_kategorii" Height="38px" Width="273px"></asp:DropDownList> 
                <asp:SqlDataSource ID="KategorieDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="SELECT [nazwaKategorii], [id_kategorii] FROM [Kategorie]"></asp:SqlDataSource>
                <br />
    <asp:DropDownList class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ID="TowaryDropDownList" runat="server" AutoPostBack="True" AppendDataBoundItems="False" DataSourceID="TowaryDS" DataTextField="nazwaTowaru" DataValueField="id_towaru" OnSelectedIndexChanged="TowaryDropDownList_SelectedIndexChanged" Height="38px" Width="273px"></asp:DropDownList>
     <asp:SqlDataSource ID="TowaryDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="SELECT [id_towaru], [nazwaTowaru] FROM [Towary] WHERE ([id_kategorii] = @id_kategorii)">
        <SelectParameters>
            <asp:ControlParameter ControlID="KategorieDropDownList" Name="id_kategorii" PropertyName="SelectedValue" Type="Int32" />       
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox type="text" class="form-control" placeholder="cena" aria-describedby="basic-addon1" ID="txtCena" runat="server"></asp:TextBox> <br />
    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtIlosc" FilterType="Numbers" />
    <asp:TextBox type="text" class="form-control" placeholder="ilość" aria-describedby="basic-addon1" ID="txtIlosc" runat="server"></asp:TextBox> <br />                            
    <asp:TextBox type="text" class="form-control" placeholder="wartość" aria-describedby="basic-addon1" ID="txtWartosc" runat="server"></asp:TextBox> <br />         
    <asp:Label ID="pracownikLabel" runat="server" Text="Pracownik: "></asp:Label>
    <asp:DropDownList class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ID="PracownikDropDownList" runat="server" AutoPostBack="True" TargetControlID="PracownikDropDownList" DataSourceID="PracownicyDS" DataTextField="nazwisko" DataValueField="id_pracownika" Height="38px" Width="205px">
    <asp:ListItem Value="Wybierz pracownika">Wybierz pracownika</asp:ListItem>
                </asp:DropDownList> <br />
                <asp:SqlDataSource ID="PracownicyDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="sel_pracownicy" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:Label ID="kontrahentLabel" runat="server" Text="Kontrahent: "></asp:Label>
    <asp:DropDownList class="btn btn-default btn-sm dropdown-toggle" placeholder="kontrahent" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ID="KontrahentDropDownList" runat="server" AutoPostBack="True" DataSourceID="KontrahenciDS" DataTextField="nazwa_kontrahenta" DataValueField="id_kontrahenta" Height="38px" Width="205px"></asp:DropDownList>
                <asp:SqlDataSource ID="KontrahenciDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="sel_kontrahenci" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtData" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" TodaysDateFormat="dd,MM,yyyy" />
    <asp:TextBox type="text" class="form-control" placeholder="data" aria-describedby="basic-addon1" ID="txtData" runat="server"></asp:TextBox> <br />  
    <asp:DropDownList class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ID="TypDropDownList" runat="server" Height="38px" Width="273px">
                    <asp:ListItem Value="sprzedaż"></asp:ListItem>
                    <asp:ListItem>kupno</asp:ListItem>
    </asp:DropDownList>
           <br /></div>
    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Czy na pewno zapisać?" TargetControlID="bttnZapiszTransakcje" />
     <asp:Button class="btn btn-primary btn-large" ID="bttnZapiszTransakcje" runat="server" Text="Zapisz" OnClick="bttnZapiszTransakcje_Click" Width="147px" />
           <div> <br /> 
               <asp:GridView ID="transakcjeGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_transakcji" DataSourceID="TransakcjeDS" Width="832px" CellPadding="4" ForeColor="#333333" GridLines="None">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   <Columns>
                       <asp:BoundField DataField="nazwaTowaru" HeaderText="nazwa produktu" SortExpression="nazwaTowaru" />
                       <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
                       <asp:BoundField DataField="ilosc" HeaderText="ilość" SortExpression="ilosc" />
                       <asp:BoundField DataField="wartosc" HeaderText="wartość" SortExpression="wartosc" />
                       <asp:BoundField DataField="nazwisko" HeaderText="pracownik" SortExpression="nazwisko" />
                       <asp:BoundField DataField="nazwa_kontrahenta" HeaderText="kontrahent" SortExpression="nazwa_kontrahenta" />
                       <asp:BoundField DataField="typ" HeaderText="typ" SortExpression="typ" />
                       <asp:BoundField DataField="data_operacji" HeaderText="data" SortExpression="data_operacji" />
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
               <asp:SqlDataSource ID="TransakcjeDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="show_transakcje" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
               <br /></div> 
               <div class="col-md-2">
               </div>
            </div>
          </div>
</asp:Content>