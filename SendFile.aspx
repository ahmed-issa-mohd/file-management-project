<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SendFile.aspx.cs" Inherits="SendFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
    <script type="text/javascript">
       
        
    </script>
    
        <script src="JavaScript2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
       <fieldset id="gg">
               <legend>Students</legend>
               <div id="studentHolder">
              
                           <asp:CheckBoxList ID="cblStudent" runat="server"></asp:CheckBoxList>
                   <asp:Button ID="btn1" Text="select all " runat="server" class="btn btn-danger" OnClick="btn1_Click" />
                   
               </div>
           </fieldset>
          <fieldset>
              <legend>File Information</legend>
              <div class="col-sm-12">
                  <div class="form-group">
                      <label for="fuURL">file</label>
                      <asp:FileUpload   runat="server" ID="fuURL" CssClass="form-control" />
                  </div>
                  <div class="form-group">
                      <label for="txtDescription">Description</label>
                      <asp:TextBox   runat="server" ID="txtDescription" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                  </div>
              </div>
          </fieldset>
    <asp:Button Text="Submit" runat="server" CssClass="btn btn-primary" OnClick="Unnamed_Click"/>
    <a href="TrainerProfile.aspx">back to list</a>
</asp:Content>

