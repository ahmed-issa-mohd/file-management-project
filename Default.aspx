<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

    <asp:DataGrid ID="dg" runat="server"></asp:DataGrid>



    <fieldset>
        <legend class="y">
          Edit User Information  
        </legend>   
        
         <div class="row">
                 <label for="txtUserName" class="y">user name</label>
                 <asp:TextBox type="text" ID="txtName" CssClass="form-control x "   runat="server"  BackColor="LawnGreen" />
          </div>
          <div class="row">
                 <label for="txtEmail" class="y">email</label>

                 <asp:TextBox type="text" ID="txtPass" CssClass="form-control x" runat="server" BackColor="LawnGreen" />
          </div>
          <div class="row">
              &nbsp;
          </div>
        <asp:Button ID="btnSave" runat="server" Text="Save Changes"  CssClass="btn btn-info" OnClick="btnSave_Click"/>
        <asp:Label ID="lblResult" runat="server" />
         </fieldset>




</asp:Content>

