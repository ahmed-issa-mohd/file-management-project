<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <fieldset>
        <legend >
          Edit User Information  
        </legend>   
        
         <div class="row">
                 <label for="txtUserName" class="y">user name</label>
                 <asp:TextBox type="text" ID="txtUserName" CssClass="form-control"   runat="server"  />
          </div>
          <div class="row">
                 <label for="txtEmail" class="y">email</label>

                 <asp:TextBox type="text" ID="txtEmail" CssClass="form-control" runat="server"  />
          </div>
          <div class="row">
              &nbsp;
          </div>
        <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" CssClass="btn btn-info"/><a href="changepassword.aspx">change password</a>
        <asp:Label ID="lblResult" runat="server" />
         </fieldset>

</asp:Content>

