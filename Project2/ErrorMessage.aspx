<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ErrorMessage.aspx.cs" Inherits="Project2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="col-md-9">
        <h2>
            An unrecoverable error has occured.
        </h2>
    </div>
    <div class="col-md-12">
        <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger"></asp:Label>
    </div>
    <div class="col-md-3">
        <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" CssClass="btn btn-primary" Text="Return" />
    </div>
</asp:Content>
