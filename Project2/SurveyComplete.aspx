<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="SurveyComplete.aspx.cs" Inherits="Project2.SurveyComplete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Complete</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/proStyle.css" rel="stylesheet" />

    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">
        
        <main class="container">
            <header class="jumbotron">
            <img src="Images/SportsImage.jpg" alt="logo" class="banner-style" />
            <h1 style="display: inline-block;">SportsPro</h1>
            <h4>Sports management software for the sports enthusiast</h4>
        </header>

            <div class="form-group col-sm-9 col-sm-offset-3">
                <p style="font-size: large; font-weight: bold">Thank you for your feedback!</p>
            </div>
            <div class ="form-group col-sm-9  col-sm-offset-3">
                <asp:Label ID="lblMessage" runat="server" Text="A customer service representative will contact you withing 24 hours" Visible="False"></asp:Label>
            </div>
            <div class ="form-group col-sm-9  col-sm-offset-3">
                <asp:Button ID="btnReturn" CssClass ="btn btn-primary" runat="server" Text="Return to Survey" OnClick="btnReturn_Click" />
            </div>
        </main>

    </form>
</body>
</html>