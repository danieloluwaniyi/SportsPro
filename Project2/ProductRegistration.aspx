<%@ Page Title="Product Registration" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ProductRegistration.aspx.cs" Inherits="Project2.ProductRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="col-sm-9">
        <div class="col-sm-3">
            Enter your Customer ID: 
        </div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCustID" CssClass="form-control" ValidationGroup="customer" CausesValidation="True" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqdCustValid" runat="server" ErrorMessage="Must Enter Customer Number"
                CssClass=" text-danger" ControlToValidate="txtCustID" ValidationGroup="customer"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidCustID" runat="server" ControlToValidate="txtCustID"
                CssClass=" text-danger" ErrorMessage="Incorrect DataType" Operator="DataTypeCheck" Type="Integer" ValidationGroup="customer"></asp:CompareValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtCustID"
                CssClass="text-danger" ValidationGroup="customer" OnServerValidate="CustomValidator1_ServerValidate" ErrorMessage="No Such Customer"></asp:CustomValidator>

        </div>
        <div class="col-sm-3">
            <asp:Button ID="btnGetCustomer" CssClass="btn btn-primary" runat="server" Text="Get Customer" ValidationGroup="customer" />

        </div>

    </div>
    <div class="col-sm-9">
        <div class="col-sm-3">
            Customer:
        </div>
        <div class="col-sm-3">
            <asp:Label ID="lblCust" runat="server"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCustID" Name="CustomerID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div><br />
    <div class="col-sm-9">
        <div class="col-sm-3">
            Product:
        </div>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlProducts" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ProductCode"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductCode], [Name] FROM [Products] ORDER BY [Name]"></asp:SqlDataSource>

            <asp:RequiredFieldValidator ID="rqdProducts" CssClass="text-danger" runat="server" ErrorMessage="Please select a product"
                ControlToValidate="ddlProducts" ValidationGroup="RegisterProduct"></asp:RequiredFieldValidator>
        </div>

    </div>
    <div class="col-sm-9">
        <asp:Button ID="btnRegister" ValidationGroup="RegisterProduct" Enabled="false" CssClass="btn btn-primary"
            runat="server" Text="Register" OnClick="btnRegister_Click" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Registrations] WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode" InsertCommand="INSERT INTO [Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (@CustomerID, @ProductCode, @RegistrationDate)" SelectCommand="SELECT * FROM [Registrations] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Registrations] SET [RegistrationDate] = @RegistrationDate WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ProductCode" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ProductCode" />
            <asp:Parameter Name="RegistrationDate" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCustID" Name="CustomerID" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="RegistrationDate" />
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ProductCode" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
