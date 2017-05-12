<%@ Page Title="Contact List"Language="C#" AutoEventWireup="True"  MasterPageFile="~/Site.master" CodeBehind="ContactList.aspx.cs" Inherits="Project2.ContactList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
        <div class="row">
            <div class="col-sm-12"><p>Contact List:</p></div>
            <div class="col-sm-6">
                <div class="form-group">
                    <div class ="col-sm-12">
                        <asp:ListBox ID="lstCustomer" runat="server" CssClass="form-control" ></asp:ListBox>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <div class="form-group">
                        <div class="col-sm-12">
                       <asp:Button ID="btnRemove" runat="server" Text="Remove Contact" CssClass="btn" Width="182px" OnClick="btnRemove_Click" />
                    </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-12">
                        <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" CssClass="btn" Width="182px" OnClick="btnEmpty_Click" />
                    </div>
                    </div>
                    
                </div>
            </div>
        </div><%--End of Row 1 --%>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <asp:Label ID="lblMessage" EnableViewState="False" CssClass="text-info col-sm-12" runat="server"></asp:Label>
                </div>
                
                <div class="form-group"><%--buttons --%>
                    <div class="col-sm-12">
                        <asp:Button ID="btnAddCustomer" CssClass="btn " runat="server" Text="Select Additional Customers" PostBackUrl="~/Administration/CustomerDisplay" />
                       
                    </div>
                </div>

            </div>
        </div>
      </asp:Content>
