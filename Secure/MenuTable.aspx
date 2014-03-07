<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Final Project
username: admin, password: admin
Independent Initiative: Search inside View Menu
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/MasterPage.master" AutoEventWireup="true" CodeFile="MenuTable.aspx.cs" Inherits="Secure_Default2" EnableTheming="false" %>
<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/Secure/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_contentleft" Runat="Server">
        <%-- Panels/Repeaters for Menu table --%>
        <asp:Label ID="lbl_menuheader" runat="server" Text="Menu Table" EnableTheming="true" SkinID="header2" /><br /><br />
        <asp:Panel ID="pnl_all" runat="server">
        <asp:Label ID="lbl_msg" runat="server" /><br />
            <table cellpadding="3" cellspacing="5">
            <thead style="background-color:#BDB76B;">
                <tr>
                    <th><asp:Label ID="lbl_food" runat="server" Text="Food" /></th>
                    <th><asp:Label ID="lbl_option1" runat="server" Text="Edit" /></th>
                    <th><asp:Label ID="lbl_option2" runat="server" Text="Delete" /></th>
                </tr>
            </thead>
            <tbody style="background-color:#F5F5DC;">
                <asp:Repeater ID="rpt_all" runat="server">
                    <ItemTemplate>
                        <tr>
                        <td><%#Eval("MenuFood") %></td>
                        <td><asp:LinkButton ID="btn_update" runat="server" Text="Edit" CommandName="Update" CommandArgument='<%#Eval("MenuID") %>' OnCommand="subAdmin" /> </td>
                        <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("MenuID") %>' OnCommand="subAdmin" /> </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
            </table>
        </asp:Panel>
        <br />
        <asp:Panel ID="pnl_update" runat="server">
            <table cellpadding="2" cellspacing="3">
                <thead>
                    <tr>
                        <th><asp:Label ID="lbl_foodU" runat="server" Text="Food" /></th>
                        <th><asp:Label ID="lbl_descU" runat="server" Text="Description" /></th>
                        <th><asp:Label ID="lbl_priceU" runat="server" Text="Price" /></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpdate">
                        <ItemTemplate>
                        <tr>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("MenuID") %>' />
                            <td><asp:TextBox ID="txt_foodU" runat="server" Text='<%#Eval("MenuFood") %>' /></td>
                            <td><asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("MenuDescription") %>' /></td>
                            <td><asp:TextBox ID="txt_priceU" runat="server" Text='<%#Eval("MenuPrice") %>' /></td>
                        </tr>
                        <tr>
                            <td><asp:RequiredFieldValidator ID="rfv_foodU" runat="server" Text="*Required" ControlToValidate="txt_foodU" ValidationGroup="update" /></td>
                            <td><asp:RequiredFieldValidator ID="rfv_descU" runat="server" Text="*Required" ControlToValidate="txt_descU" ValidationGroup="update" /></td>
                            <td><asp:RequiredFieldValidator ID="rfv_priceU" runat="server" Text="*Required" ControlToValidate="txt_priceU" ValidationGroup="update" /></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                            </td>
                        </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnl_delete" runat="server">
            <asp:Label ID="lbl_delete" runat="server" Text="Are you sure you want to delete this record?" ForeColor="Red" />
            <table cellpadding="2" cellspacing="3">
            <thead>
                <tr>
                    <th><asp:Label ID="lbl_foodD" runat="server" Text="Food" /></th>
                    <th><asp:Label ID="lbl_descD" runat="server" Text="Description" /></th>
                    <th><asp:Label ID="lbl_priceD" runat="server" Text="Price" /></th>
                </tr>
            </thead>
            <tbody>
            <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subDelete">
            <ItemTemplate>
                <tr>
                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("MenuID") %>' />
                    <td><asp:Label ID="lbl_foodD" runat="server" Text='<%#Eval("MenuFood") %>' /></td>
                    <td><asp:Label ID="lbl_descD" runat="server" Text='<%#Eval("MenuDescription") %>' /></td>
                    <td><asp:Label ID="lbl_priceD" runat="server" Text='<%#Eval("MenuPrice") %>' /></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                    </td>
                </tr>
            </ItemTemplate>
            </asp:Repeater>
            </tbody>
            </table><%-- End table --%>
        </asp:Panel><%-- End panel --%>

        <br />
        <hr /><br />
        <asp:Label ID="lbl_insert" runat="server" Text="Insert" EnableTheming="true" SkinID="header2" /><br />
        <%-- Insert menu item template --%>
        <asp:Label ID="lbl_foodI" runat="server" Text="Food" AssociatedControlID="txt_foodI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_foodI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_foodI" runat="server" Text="*Required" ControlToValidate="txt_foodI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_descI" runat="server" Text="Description" AssociatedControlID="txt_descI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_descI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_descI" runat="server" Text="*Required" ControlToValidate="txt_descI" ValidationGroup="insert" />
        <br />
         <asp:Label ID="lbl_priceI" runat="server" Text="Price" AssociatedControlID="txt_priceI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_priceI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_priceI" runat="server" Text="*Required" ControlToValidate="txt_priceI" ValidationGroup="insert" />
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" OnCommand="subAdmin" CausesValidation="false" />
        
</asp:Content><%-- End left content --%>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_contentright" Runat="Server">
    <br />
    <asp:HyperLink ID="hyp_viewmenu" runat="server" NavigateUrl="~/Secure/Menu.aspx">
    View Menu Table
    </asp:HyperLink>

</asp:Content>

