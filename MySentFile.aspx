<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MySentFile.aspx.cs" Inherits="MySentFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <fieldset>
        <legend>Files Sent To Section [
            <asp:Label ID="lblSectionTitle" runat="server" />
            ]</legend>
        <a href="TrainerProfile.aspx">back to sections</a>
        <asp:Repeater ID="repFiles" runat="server" OnItemCommand="repFiles_ItemCommand">
            <HeaderTemplate>
                <div class="col-sm-12 bg-primary hidden-xs visible-lg visible-md visible-sm">
                    <div class="col-sm-2"><b>File</b></div>
                    <div class="col-sm-3"><b>Date Added</b></div>
                    <div class="col-sm-3"><b>Description</b></div>
                    <div class="col-sm-1"><b>Total Receipients</b></div>
                    <div class="col-sm-1">&nbsp;</div>
                    <div class="col-sm-1">&nbsp;</div>
                    <div class="col-sm-1">Download by</div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="col-sm-12 thumbnail">

                    <div class="col-sm-2"><%#Eval("URL") %></div>
                    <div class="col-sm-3"><%#Eval("DateAdded") %></div>
                    <div class="col-sm-3"><%#Eval("Description") %></div>
                    <div class="col-sm-1"><%#GetReceipients(Eval("ID").ToString()) %> </div>
                    <div class="col-sm-1"><asp:LinkButton ID="lbEdit" CommandName="edit" CommandArgument='<%#Eval("ID") %>' Text="edit" runat="server" /></div>
                    <div class="col-sm-1"><asp:LinkButton ID="lbDelete" CommandName="delete" CommandArgument='<%#Eval("ID") %>' Text="delete" runat="server" /></div>
                    <div class="col-sm-1"><%#GetReceipientsDown(Eval("ID").ToString()) %> </div>
                 

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </fieldset>

    


</asp:Content>
