<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="NoAccess.aspx.cs" Inherits="Project2.NoAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
        <div class="col-md-9">
        <h2>
            No Access
        </h2>

    </div>
    <div class="col-md-12">
        <p>
           The resource you requested cannot be found
        </p>
    </div>
    <div class="col-md-3">
        <asp:button CssClass="btn btn-primary" ID="btnReturn" runat="server" OnClick="btnReturn_Click" text="Return to Home Page" />
    </div>
</asp:Content>
