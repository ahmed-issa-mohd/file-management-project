<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style>        body {
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    
    
    <div class="row">

        <div class="col-sm-4">&nbsp;</div>
        <div class="col-sm-4"><img src="Contents/Balqa'_Applied_University.jpg" /> </div>
        <div class="col-sm-4">&nbsp;</div>

    </div>
    

    <div class="row" style="margin-top: 00px;">

        <div class="col-sm-2">&nbsp;</div>
        <div class="col-sm-8">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="txtEmail" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtEmail" CssClass="form-control"  runat="server" placeholder="Email"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" runat="server" ID="txtPassword" placeholder="Password" TextMode="Password"/>
                    </div>
                </div>
                

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button ID="btnLogin" Text="login" runat="server" CssClass="btn btn-default" OnClick="btnLogin_Click" />
                        
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                    <asp:Label CssClass="text-danger" ID="lblErrorMsg" runat="server" />
                    </div>
                </div>
            </div>
    </div>

    <div class="col-sm-2">&nbsp;</div>
    </div>
</asp:Content>
