<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" CodeBehind="ContactUs.aspx.cs" Inherits="Project2.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
    <div class="col-sm-6 col-lg-9">
        <div class="col-sm-9 col-lg-9">
            <h2 class="col-sm-6">How to contact us</h2>
        </div>
       <div class="col-sm-9 col-lg-12">
           <p class="col-sm-9"> If you ever have any questions or comments about our products,
               please be sure to contact us in whatever way is most convenient for you
           </p>
       </div>
        <div class="col-sm-9">
            <label class="col-sm-3">
                Phone:
            </label>
            <div class="col-sm-6">
                <p>
                    1-800-555-0400
                </p>
                <p>
                    Weekdays, 8 to 5 Pacific Time
                </p>
            </div>
        </div>
        <div class=" col-sm-9">
            <label class="col-sm-3">
                Email:
            </label>
            <div class="col-sm-6">
                <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="mailto:sportspro@sportsprosoftware.com"
                  Text="sportspro@sportsprosoftware.com"
                    runat="server"/>
            </div>
        </div>
        <div class="col-sm-9">
            <label class="col-sm-3">
                Fax:
            </label>
            <div class="col-sm-6">
                <p>
                    1-559-555-2732
                </p>
            </div>
        </div>
        <div class=" col-sm-9">
            <label class="col-sm-3">
                Address:
            </label>
            <div class="col-sm-6">
                <p>
                    SportsPro Software, Inc.<br />
                    1500 N Main Street<br />
                    Fresno, California 93710
                </p>
            </div>
        </div>


    </div>
</asp:Content>

