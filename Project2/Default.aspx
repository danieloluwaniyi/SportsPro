<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" CodeBehind="Default.aspx.cs" Inherits="Project2._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="Server">
    <h1>Welcome!</h1>
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <a runat="server" href="~/Account/Login">
                <h3>Login</h3>
            </a>
            <a runat="server" href="~/Account/Register">
                <h3>Register</h3>
            </a>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Logout" OnLoggingOut="LoginStatus1_LoggingOut" LogoutPageUrl="~/" />
            <a runat="server" href="~/Account/Manage">Manage your Account</a>



        </LoggedInTemplate>

    </asp:LoginView>
</asp:Content>

