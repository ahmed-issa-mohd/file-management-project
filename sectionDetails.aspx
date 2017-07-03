<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sectionDetails.aspx.cs" Inherits="sectionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">

    <style>
        .x {
            margin-left:81px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <div class="x y">
    <fieldset>
        <legend>Section Details</legend>
        <div class="col-sm-12">
            <div class="col-sm-3">Trainer: [<asp:Label ID="lblTrainerName" CssClass="text-primary" runat="server" />]</div>
            <div class="col-sm-3">Course: [<asp:Label ID="lblCourse" CssClass="text-primary" runat="server" />]</div>
            <div class="col-sm-3">Days: [<asp:Label ID="lblDays" CssClass="text-primary" runat="server" />]</div>
            <div class="col-sm-3">Time: [<asp:Label ID="lblTime" CssClass="text-primary" runat="server" />]</div>


        </div>
    </fieldset>
     <fieldset>
        <legend>Files</legend>
             <asp:Repeater ID="repFiles" runat="server">
            <HeaderTemplate>
                <div class="col-sm-12 bg-primary hidden-xs visible-lg visible-md visible-sm">
                    <div class="col-sm-3"><b>File</b></div>
                    <div class="col-sm-3"><b>Date Added</b></div>
                    <div class="col-sm-3"><b>Description</b></div>                
                    <div class="col-sm-3">&nbsp;</div>
                    
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="col-sm-12 thumbnail">

                    <div class="col-sm-3"><%#Eval("URL") %></div>
                    <div class="col-sm-3"><%#Eval("DateAdded") %></div>
                    <div class="col-sm-3"><%#Eval("Description") %></div>
                    
                    <div class="col-sm-3">
                        <a class="download" data-fileid ='<%#Eval("ID") %>' href='Contents/Uploads/<%#Eval("URL") %>'><span style="color:blue;">download</span></a>
                        <a class="glyphicon glyphicon-comment x " href="#"></a>
                    </div>
                    
                </div>
            </ItemTemplate>
        </asp:Repeater>
     </fieldset>
    <script src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.download').click(function () {
                var parameters = { 
                    fileId: $(this).attr('data-fileid'),
                    userId: '<%=((Account)Session["user"]).ID%>'
                  
                    }
                            $.ajax({
                                type: "POST",
                                url: "webservice.asmx/updateSeen",
                                data: JSON.stringify( parameters),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                    
                                },
                                error: function (e) {
                  
                                }
                            });
            })
           
        });
    </script>
        </div>
</asp:Content>

