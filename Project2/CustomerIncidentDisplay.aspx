<%@ Page Title="Customer Incident Display" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="Project2.CustomerIncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="form-group">
        <label id="lblCust" for="ddlCust"
            class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
            Select a customer:
        </label>
        <div class="col-xs-6 col-sm-3">
            <asp:DropDownList ID="ddlCust" AutoPostBack="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-12 col-sm-offset-1 col-sm-9">
            <asp:DataList ID="dlIncidentItems" CssClass="table table-bordered table-striped table-condensed" runat="server" DataSourceID="SqlDataSource2">
                <HeaderTemplate>
                    <span class="col-xs-6">Product/Incident</span>
                    <span class="col-xs-2 text-right">Tech Name</span>
                    <span class="col-xs-2 text-right">Opened</span>
                    <span class="col-xs-2 text-right">Closed</span>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="form-group col-xs-6">
                    <asp:Label ID="ProductNameLabel"   runat="server" Text='<%# Eval("ProductName") %>' /><br />
                    <asp:Label ID="DescriptionLabel"  runat="server" Text='<%# Eval("Description") %>' />
                    </div>
                    <asp:Label ID="Tech_NameLabel" CssClass="col-xs-2 text-right" runat="server" Text='<%# Eval("[Tech Name]") %>' />
                    <asp:Label ID="OpenedLabel" CssClass="col-xs-2 text-right" runat="server" Text='<%# Eval("Opened","{0:MM/dd/yyyy}") %>' />
                    <asp:Label ID="ClosedLabel" CssClass="col-xs-2 text-right" runat="server" Text='<%# Eval("Closed","{0:MM/dd/yyyy}") %>' />
                </ItemTemplate>

            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.Description AS Description, Products.Name AS ProductName, Technicians.Name AS [Tech Name], Incidents.DateOpened AS Opened, Incidents.DateClosed AS Closed FROM Incidents INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID WHERE (Customers.CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCust" Name="CustomerID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>

