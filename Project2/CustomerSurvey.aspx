<%@ Page Language="C#" Title="Customer Survey" AutoEventWireup="True" MasterPageFile="~/Site.master" CodeBehind="CustomerSurvey.aspx.cs" Inherits="Project2.CustomerSurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
        <div class="form-group col-sm-9">
            <label class="col-sm-3">
                            Enter your customer ID:
             </label>
            <div class="col-sm-3">
                <asp:TextBox CssClass="form-control" ID="customerID" runat="server" CausesValidation="True"></asp:TextBox>
            </div>
            <div class="col-sm-6">
                <asp:Button ID="btnGetIncidents" CssClass="btn btn-primary" runat="server" Text="Get Incidents" OnClick="btnGetIncidents_Click" ValidationGroup="Incidents" />
                <asp:RequiredFieldValidator ID="cstValid" runat="server" ErrorMessage="Please Enter a Customer ID" ControlToValidate="customerID" CssClass="text-danger" ValidationGroup="Incidents"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="typeValidator" runat="server" ControlToValidate="customerID" CssClass="text-danger" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Incidents">Should be an integer</asp:CompareValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-6">
                <asp:ListBox ID="lstIncident" CssClass="form-control" runat="server" Enabled="False">
                </asp:ListBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="No Incidents" ControlToValidate="lstIncident" CssClass="text-danger" ValidationGroup="IncidentSubmit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblValid" runat="server" CssClass="text-danger" Text="No Incidents" Visible="False"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IncidentID], [CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title] FROM [Incidents] ORDER BY [DateClosed]"></asp:SqlDataSource>
            </div>          
        </div>
        <div class="form-group">
            <label class="col-sm-6 ">
                Please rate this incident by the following categories
            </label>
            <div class="form-group col-sm-12">
                <label class="col-sm-2" for="rdioResponse">
                    Response time: 
                </label>
                <div class="rdioLst col-sm-6"> <asp:RadioButtonList ID="rdioResponse" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="False">
                    <asp:ListItem Value="1">Not Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat Satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely Satisfied</asp:ListItem>
                </asp:RadioButtonList></div>
               
            </div>
                <div class="form-group col-sm-12">
                <label class="col-sm-2" for="rdioEfficiency">
                    Technician efficiency: 
                </label>
                <div class="rdioLst col-sm-6"> <asp:RadioButtonList ID="rdioEfficiency" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow" Enabled="False">
                    <asp:ListItem Value="1">Not Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat Satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely Satisfied</asp:ListItem>
                </asp:RadioButtonList></div>
               
            </div>
                <div class="form-group col-sm-12">
                <label class="col-sm-2" for="rdioResolution">
                    Problem resolution: 
                </label>
                <div class="rdioLst col-sm-6"> <asp:RadioButtonList ID="rdioResolution" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow" Enabled="False">
                    <asp:ListItem Value="1">Not Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat Satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely Satisfied</asp:ListItem>
                </asp:RadioButtonList></div>
               
            </div>
        </div>
        <div class="form-group col-sm-12">
            <label class="col-sm-2">
                Additional Comments:
            </label>
            <div class="col-sm-6">
            <asp:TextBox ID="txtComments" CssClass="form-control" runat="server" Height="80px" Width="305px" Enabled="False"></asp:TextBox></div>
        </div>
        <div class="form-group rdioLst col-sm-9">
            <div class="col-sm-6">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Please contact me to discuss this incident" Enabled="False" /></div>
            <div class=" col-sm-12 col-sm-offset-1">
                <asp:RadioButtonList ID="rdioContact" runat="server" Enabled="False">
                    <asp:ListItem>Contact by email</asp:ListItem>
                    <asp:ListItem>Contact by phone</asp:ListItem>
                </asp:RadioButtonList>
        </div>
        <div class="form-group col-sm-6">
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" Enabled="False" OnClick="btnSubmit_Click" ValidationGroup="IncidentSubmit" />
          </div>
     </asp:Content>