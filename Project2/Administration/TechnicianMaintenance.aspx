<%@ Page Title="Maintain Technician" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" CodeBehind="TechnicianMaintenance.aspx.cs" Inherits="Project2.Administration.TechnicianMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="Server">
    <label class="col-sm-5">Please select a product:</label>
    <div class="col-sm-5">
        <asp:DropDownList ID="drpTech" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="TechID" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [Name]"></asp:SqlDataSource>
    </div>
    <asp:FormView ID="FormView1" runat="server" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_OnInsert" OnItemUpdated="FormView1_OnUpdate" DataKeyNames="TechID" CssClass="table table-bordered table-condensed" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <EditItemTemplate>
            TechID:
            <asp:Label ID="TechIDLabel1" runat="server" Text='<%# Eval("TechID") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            Selected Technician
        </HeaderTemplate>
        <InsertItemTemplate>
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
             <asp:RequiredFieldValidator ID="rfvInsertName" CssClass="text-danger" runat="server" ErrorMessage="Name is a required field" ControlToValidate="NameTextBox"></asp:RequiredFieldValidator>
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
             <asp:RequiredFieldValidator ID="rfvInsertEmail" CssClass="text-danger" runat="server" ErrorMessage="Email is a required field" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>
            <br />
            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <asp:RequiredFieldValidator ID="rfvInsertPhone" CssClass="text-danger" runat="server" ErrorMessage="Phone number is a required field" ControlToValidate="PhoneTextBox"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="col-md-12  ">
                <div class="col-md-4 ">
                    TechID:
                </div>
                <div class="col-md-8 ">
                    <asp:Label ID="TechIDLabel" runat="server" Text='<%# Eval("TechID") %>' />
                </div>
            </div>
            <hr />
            <div class="col-md-12  ">
                <div class="col-md-4 ">
                    Name:
                </div>
                <div class="col-md-8 ">
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                </div>
            </div>
            <hr />
            <div class="col-md-12  ">
                <div class="col-md-4 ">
                    Email:
                </div>
                <div class="col-md-8 ">
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                </div>
            </div>
            <hr />
            <div class="col-md-12  ">
                <div class="col-md-4 ">
                    Phone:
                </div>
                <div class="col-md-8">
                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                </div>
            </div>

            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />

        </ItemTemplate>
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:FormView>
    <p>
        <asp:Label ID="lblError" runat="server" EnableViewState="false"
            CssClass="text-text-danger"></asp:Label>
    </p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = @TechID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone">
        <DeleteParameters>
            <asp:Parameter Name="original_TechID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="drpTech" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="original_TechID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

