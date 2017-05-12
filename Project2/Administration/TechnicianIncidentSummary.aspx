<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="TechnicianIncidentSummary.aspx.cs" Inherits="Project2.Administration.TechnicianIncidentSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
     <label class="col-sm-5 control-label">Select a technician: </label>
    <div class="col-sm-5">
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="TechID" AutoPostBack="True"></asp:DropDownList>
        
        
        
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllTechnicians" TypeName="Project2.Models.TechnicianDB" ConflictDetection="CompareAllValues">

        </asp:ObjectDataSource>
        <asp:GridView ID="grdTechIncidents" CssClass="table table-bordered table-striped table-condensed" 
             runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
            <Columns>
                <asp:BoundField DataField="DateOpened" HeaderText="Date Opened" />
                <asp:BoundField DataField="Product" HeaderText="Product" />
                <asp:BoundField DataField="Customer" HeaderText="Customer" />
            </Columns>
        </asp:GridView>
        
        
   
        
        
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetOpenTechIncidents" TypeName="Project2.Models.IncidentDB">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="techID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        
   
        
        
    </div>
</asp:Content>

