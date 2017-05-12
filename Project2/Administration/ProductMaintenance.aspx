<%@ Page Title="Maintain Product" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" CodeBehind="ProductMaintenance.aspx.cs" Inherits="Project2.Administration.ProductMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="Server">
    <asp:GridView ID="grdProductMaintenance" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="ProductCode"
        DataSourceID="SqlDataSource1" CssClass="table table-bordered table-condensed">
        <Columns>
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" />
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvGridname" runat="server" 
                        ErrorMessage="Name is a required field" 
                        ControlToValidate="txtName" ValidationGroup="Edit"
                        CssClass="text-danger"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGridName" runat="server" 
                        Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Version" SortExpression="Version">
                <EditItemTemplate>
                    <asp:TextBox ID="txtVersion" runat="server" 
                        Text='<%# Bind("Version") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvGridVersion" runat="server" 
                        ErrorMessage="Version is a required field" 
                        ControlToValidate="txtVersion" ValidationGroup="Edit"
                        CssClass="text-danger"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGridVersion" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGrdReleaseDate" runat="server"
                         Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvGridDate" runat="server" 
                        ErrorMessage="Date is a required field" 
                        ControlToValidate="txtGrdReleaseDate" ValidationGroup="Edit"
                        CssClass="text-danger"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGrdDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" 
                 CausesValidation="True" ValidationGroup="Edit" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle CssClass="bg-halloween" BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle CssClass="altRow" />
        <EditRowStyle CssClass="warning" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate"
         InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}"
         SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]"
         UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Edit" CssClass="text-danger" />  
    <div class="col-xs-9">
        <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

        <asp:DetailsView ID="DetailsView1" runat="server" 
             AutoGenerateRows="False" 
             DataKeyNames="ProductCode" DataSourceID="SqlDataSource2"
              CssClass="table table-bordered table-condensed"
            DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted">
                                <HeaderTemplate>
                        <p>To add a new product, enter the product information
                            and click Add Product
                        </p>
                    </HeaderTemplate>
            <Fields>
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" NullDisplayText="mm/dd/yy" DataFormatString="{0:d}" />
                <asp:CommandField ShowInsertButton="True" ButtonType="Button" InsertText="Add Product" ShowCancelButton="False" />
            </Fields>
             <HeaderStyle CssClass="bg-halloween"/>
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @ProductCode" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" SelectCommand="SELECT * FROM [Products] WHERE ([ProductCode] = @ProductCode)" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @ProductCode">
            <DeleteParameters>
                <asp:Parameter Name="ProductCode" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="grdProductMaintenance" Name="ProductCode" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="ProductCode" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

