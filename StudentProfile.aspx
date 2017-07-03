<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

 <fieldset>
                    <legend>Current Section</legend>
                   
                   
                    <asp:Repeater ID="dgSection" runat="server">
                        <HeaderTemplate>
                            <table class="table table-striped table-condensed" >
                                <tr>
                                    <th>Section</th>
                                    
                                    <th> Total File</th>

                                    
                                    
                                    <th></th>
                                </tr>           
                        </HeaderTemplate>
                        <ItemTemplate>
                             <tr>
                                  <td><%#Eval("Section.Courses.Name")%> [<%#Eval("Section.TimeFrom")%> - <%#Eval("Section.TimeTo")%>]</td>
                                  
                                 <td><%#GetTotalFiles(Eval("SectionID").ToString()) %></td>

                                    
                                    
                                  
                                    <th>
                                       <a href='sectionDetails.aspx?sectionid=<%#Eval("SectionID") %>'>open</a>
                                       <!--  <p>open</p>-->
                                    </th>
                                </tr>
                        </ItemTemplate>
                      <FooterTemplate>
                         </table>
                      </FooterTemplate>
                  
                    </asp:Repeater>
                     <hr />
                                <h5>
                                    Total Section [<asp:Label ID="lblTotalSection" runat="server"></asp:Label>]

                                </h5>    
                              
                      
                </fieldset>
</asp:Content>

