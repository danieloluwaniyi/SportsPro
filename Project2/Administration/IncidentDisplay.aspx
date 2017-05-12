<%@ Page Title="Display Incident" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="IncidentDisplay.aspx.cs" Inherits="Project2.Administration.IncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 482px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <div class=" altRow ">

                <%-- <div class="col-md-12">--%>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </div>
                    <div class="col-md-3  col-md-offset-1">
                        <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' />
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Eval("Technician") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Date Opened:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Date Closed:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Title:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Description:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </div>
                    <%-- </div>--%>
                </div>
                <hr />

            </div>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                DateOpened:
            <asp:TextBox ID="DateOpenedTextBox" runat="server" Text='<%# Bind("DateOpened") %>' />
                <br />
                DateClosed:
            <asp:TextBox ID="DateClosedTextBox" runat="server" Text='<%# Bind("DateClosed") %>' />
                <br />
                Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Technician:
            <asp:TextBox ID="TechnicianTextBox" runat="server" Text='<%# Bind("Technician") %>' />
                <br />
                Customer:
            <asp:TextBox ID="CustomerTextBox" runat="server" Text='<%# Bind("Customer") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                DateOpened:
            <asp:TextBox ID="DateOpenedTextBox" runat="server" Text='<%# Bind("DateOpened") %>' />
                <br />
                DateClosed:
            <asp:TextBox ID="DateClosedTextBox" runat="server" Text='<%# Bind("DateClosed") %>' />
                <br />
                Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Technician:
            <asp:TextBox ID="TechnicianTextBox" runat="server" Text='<%# Bind("Technician") %>' />
                <br />
                Customer:
            <asp:TextBox ID="CustomerTextBox" runat="server" Text='<%# Bind("Customer") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="itemRow ">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </div>
                    <div class="col-md-3  col-md-offset-1">
                        <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' />
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Eval("Technician") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Date Opened:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Date Closed:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Title:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        Description:
                    </div>
                    <div class="col-md-4 ">
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </div>
                </div>
                <hr />
        </ItemTemplate>
        <LayoutTemplate>
            <div class="col-md-12">
                <div class="" style="background-color:black;color:white;padding:20px;">
                    <div class="col-md-4">
                        <p>Product</p>
                    </div>
                    <div class="col-md-3 col-md-offset-1">
                        <p>Customer</p>
                    </div>
                    <div class="col-md-3">
                        <p>Technician</p>
                    </div>
                </div>
                <div id="itemPlaceholderContainer" runat="server" class=" col-md-12">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div class="col-md-12">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button"  />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                DateOpened:
            <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                <br />
                DateClosed:
            <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                <br />
                Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />
                Description:
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                <br />
                Technician:
            <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Eval("Technician") %>' />
                <br />
                Customer:
            <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Products.Name, Incidents.DateOpened, Incidents.DateClosed, Incidents.Title, Incidents.Description, Technicians.Name AS Technician, Customers.Name AS Customer FROM Incidents INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID"></asp:SqlDataSource>
</asp:Content>
