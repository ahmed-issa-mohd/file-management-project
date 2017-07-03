<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Who.aspx.cs" Inherits="Who" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

     <asp:Repeater ID="repFiles" runat="server" >
            <HeaderTemplate>
                <div class="col-sm-12 bg-primary hidden-xs visible-lg visible-md visible-sm">
                                        <div class="col-sm-3"><b>Description</b></div>

                </div>
            </HeaderTemplate>
            <ItemTemplate>
             
            </ItemTemplate>
        </asp:Repeater>

</asp:Content>

