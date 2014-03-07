<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Final Project 
username: admin, password: admin
Independent Initiative: Search inside View Menu--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/MasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" EnableTheming="false" %>
<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/Secure/MasterPage.master" %>

<%-- Left Content --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" runat="server">
<asp:Label ID="lbl_menuheader" runat="server" Text="View Menu Table" EnableTheming="true" SkinID="header2" />
    <br /><br />
    <%-- Search box, dropdownlist, button --%>
    <asp:TextBox ID="txt_search" runat="server" />
    <asp:DropDownList ID="ddl_search" runat="server">
        <asp:ListItem>Food</asp:ListItem>
        <asp:ListItem>Description</asp:ListItem>
        <asp:ListItem>Price</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="subSearch" />

    <%-- gridview of menu table: has sorting --%>
    <br /><br />
    <asp:GridView ID="grv_menu" runat="server" AllowSorting="true" OnSorting="subSort" AlternatingRowStyle-BackColor="Lavender" RowStyle-BackColor="LavenderBlush" />
   
</asp:Content>

<%-- Right Content --%>
<asp:Content ID="RightContent" ContentPlaceHolderID="cph_contentright" runat="server">
    <br />
    <asp:HyperLink ID="hyp_viewmenu" runat="server" NavigateUrl="~/Menu.aspx">
    View Menu Page
    </asp:HyperLink>
</asp:Content>