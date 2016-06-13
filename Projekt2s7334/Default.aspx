<%@ Page Title="Strona główna" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Projekt2s7334._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="jumbotron">
    <div class="row">
        <div class="col-md-4">           
            <h2>Dzień dobry!</h2>          
        </div>
        <div class="col-md-4">
            <h4>Stan magazynu</h4>
            <p>
                <a class="btn btn-primary btn-large" runat="server" href="~/StanMagazynu">Stan magazynu</a>
            </p>
        </div>
        <div class="col-md-4">     
            <p> proszę zajrzeć do zakładki <a runat="server" href="~/About">About</a>! </p>     
        </div>
        </div>
    </div>
</asp:Content>
