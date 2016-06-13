<%@ Page Title="Stan magazynu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StanMagazynu.aspx.cs" Inherits="Projekt2s7334.StanMagazynu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
    $(document).ready(function () {
    $('#<%=lblNoRecords.ClientID%>').css('display', 'none');

    $('#<%=btnSubmit.ClientID%>').click(function (e) {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none'); 
        $("#<%=gdRows.ClientID%> tr:has(td)").hide();

        var iCounter = 0;
        var sSearchTerm = $('#<%=txtSearch.ClientID%>').val();

        if (sSearchTerm.length == 0)
        {
            $("#<%=gdRows.ClientID%> tr:has(td)").show();
            return false;
        }       
        $("#<%=gdRows.ClientID%> tr:has(td)").children().each(function () {
            var cellText = $(this).text().toLowerCase();
            if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0)
            {
                $(this).parent().show();
                iCounter++;
                return true;
            }
        });
        if (iCounter == 0) {
            $('#<%=lblNoRecords.ClientID%>').css('display', '');
        }
        e.preventDefault();
    })
    })
    </script>

    <div class="row">
        <div class="col-md-4">           
                   
        </div>
        <div class="col-md-4">
  
    <div class="input-group">
      <asp:TextBox type="text" class="form-control" placeholder="szukaj..." id="txtSearch" runat="server"> </asp:TextBox>
      <span class="input-group-btn">
        <asp:Button class="btn btn-default" type="button" id="btnSubmit" Text="szukaj" runat="server" />
      </span>
    </div><!-- /input-group -->

            </div>
        <div class="col-md-4">           
                   
        </div>
        </div>

     <div class="row">
        <div class="col-md-12">           
                   
    <div><br /> <p> produkty według dostępności: </p>
</div>
&nbsp;<asp:GridView ID="gdRows" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_towaru,id_kategorii1" DataSourceID="TowaryDS" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="nazwaTowaru" HeaderText="nazwa" SortExpression="nazwaTowaru" />
                <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
                <asp:CheckBoxField DataField="dostepnosc" HeaderText="dostepnosc" SortExpression="dostepnosc" />
                <asp:BoundField DataField="opis" HeaderText="opis" SortExpression="opis" />
                <asp:BoundField DataField="nazwaKategorii" HeaderText="kategoria" SortExpression="nazwaKategorii" />
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
        <asp:SqlDataSource ID="TowaryDS" runat="server" ConnectionString="<%$ ConnectionStrings:s7334ConnectionString %>" SelectCommand="sel_towary" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
       <asp:Label ID="lblNoRecords" runat="server" Text="brak wyników"></asp:Label>

            </div>
         </div>

</asp:Content>
