<%@ Page Title="" Language="C#" EnableEventValidation="true" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TrainerProfile.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">



                <fieldset>
                    <legend>Current Section</legend>
                   
                   
                    <asp:Repeater ID="dgTrainers" runat="server" OnItemCommand="dgTrainers_ItemCommand">
                        <HeaderTemplate>
                            <table class="table table-striped table-condensed">
                                <tr>
                                    <th>Section</th>
                                    <th>Total Students</th>
                                    <th> Total File</th>
                                    
                                    
                                    <th></th>
                                    <th></th>
                                </tr>           
                        </HeaderTemplate>
                        <ItemTemplate>  
                            
                            



                             <tr>
                                    <td><%#Eval("Courses.Name")%> [<%#Eval("TimeFrom")%>- <%#Eval("TimeTo")%>]</td>
                                  
                                    <td><%#GetTotalStudent(Eval("SectionID").ToString()) %></td>

                                 <td><%#GetTotalFiles(Eval("SectionID").ToString()) %></td>

                                    
                                    
                                  
                                    <td>
                                        <asp:LinkButton ID="lbSend" Text="send file" CommandName="sendfile" CommandArgument='<%#Eval("SectionID") %>' runat="server"></asp:LinkButton>
           
                                        
                                    </td>
                                     
                                    <td>
                                        <asp:LinkButton ID="lbView" Text="details" CommandName="viewfiles" CommandArgument='<%#Eval("SectionID") %>' runat="server"></asp:LinkButton>
                                     
                                     
                                        
           
                                        
                                    </td>
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

