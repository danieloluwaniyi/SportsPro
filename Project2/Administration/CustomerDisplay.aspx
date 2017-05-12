<%@ Page Title="Customer Display"Language="C#" AutoEventWireup="True"  MasterPageFile="~/Site.master" CodeBehind="CustomerDisplay.aspx.cs" Inherits="Project2.CustomerDisplay" %>


            <asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
               
                    <%--select customer--%>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            Select a customer:
                        </label>
                        <div class="col-sm-3">

                            <asp:DropDownList ID="customerName" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>

                        </div>
                    </div>
                    <div class="form-group"><%--Address--%>

                        <label class="col-sm-3 control-label">
                            Address:
                        </label>
                        <div class="col-sm-4">
                            <h4>
                                <asp:Label ID="lblAddress" runat="server"></asp:Label></h4>
                            <h4>
                                <asp:Label ID="lblCity" runat="server"></asp:Label></h4>
                        </div>
                    </div>
                    <div class="form-group"><%--Phone--%>

                        <label class="col-sm-3 control-label"">
                            Phone:
                        </label>
                        <div class="col-sm-5">
                            <h4>
                                <asp:Label ID="lblPhone" runat="server"></asp:Label></h4>
                        </div>
                    </div>
                    
                    <div class="form-group"><%--Email--%>

                        <label class="col-sm-3 control-label">
                            Email:
                        </label>
                        <div class="col-sm-5">
                            <h4>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label></h4>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDuplicateCust" EnableViewState="False" CssClass="col-sm-offset-3 text-danger" runat="server"></asp:Label>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1">
                            <asp:Button ID="btnAddContact" runat="server" Text="Add to Contact List" CssClass="btn btn-primary auto-style2" OnClick="btnAddContact_Click" Width="156px" CausesValidation="False" />
                            <asp:Button ID="btnDispContact" runat="server" Text="Display Contact List" CssClass="btn btn-primary auto-style1" Width="155px" CausesValidation="False" PostBackUrl="~/Administration/ContactList" />
                            <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomerSurvey.aspx">Click Here for Survey Page</asp:HyperLink>--%>
                        </div>
           
                    </div>
                </asp:Content>
