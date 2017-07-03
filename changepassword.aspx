<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
      <fieldset>
        <legend>
         Change Password  
        </legend>   
        

         <div class="row">
                 <label for="txtOldPassword">old password</label>
                 <asp:TextBox type="text" ID="txtOldPassword" CssClass="form-control" runat="server" TextMode="Password" />
          </div>
          <div class="row">
                 
                
                 
               
          </div>
           <div class="row">
               <label for="txtNewPassword">new password</label>
                <div class="input-group">  
                  
                   <asp:TextBox type="text" ID="txtNewPassword" ClientIDMode="Static" CssClass="form-control" runat="server"  TextMode="Password"/>  
                 
                  <div class="input-group-addon">
                      <a href="javascript:void(0);"  class="showPassword"><span class="glyphicon glyphicon-eye-open"></span></a>
                  </div>
    </div>
           </div>
           <div class="row">
                 <label for="txtNewPassword">re-type password</label>
                 <asp:TextBox type="text" ID="txtRetypePassword" CssClass="form-control" runat="server"  TextMode="Password"/>
          </div>
          <div class="row">
              &nbsp;
          </div>
        <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" CssClass="btn btn-info"/>
        <asp:Label ID="lblResult" runat="server" />
         </fieldset>
    <script src="js/jquery.min.js"></script>
<script>
        $(document).ready(function(){
            $('.showPassword').click(function () {
              
              var element = $('#txtNewPassword');
              element.attr('type','text');
            });
            $('.showPassword').mouseleave(function () {
                var element = $('#txtNewPassword');
                element.attr('type', 'password');

            });
        });

    </script>
</asp:Content>
 
