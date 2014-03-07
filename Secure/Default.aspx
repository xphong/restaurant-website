<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Final Project
username: admin, password: admin
Independent Initiative: Search inside View Menu
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableTheming="false" %>
<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/Secure/MasterPage.master"%>

<%-- Left Content --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" Runat="Server">
    <%-- Set data source for SQL connection --%>
<asp:SqlDataSource ID="sds_main" runat="server" 
    ConnectionString="<%$ ConnectionStrings:hnhp0025DBConnectionString %>" 
    SelectCommand="SELECT * FROM [menu]" />
<asp:SqlDataSource ID="sds_text" runat="server" 
    ConnectionString="<%$ ConnectionStrings:hnhp0025DBConnectionString %>" 
    SelectCommand="SELECT * FROM [contenttext] WHERE id = 1 " />


<%-- Home page Content --%>
<asp:Label ID="lbl_homeheader" runat="server" Text="Welcome to content management system for Phong's Restauraunt" EnableTheming="true" SkinID="header2" />
<br />
<%-- Steak Image --%>
<br />
<%-- About Text --%>
<asp:Label ID="lbl_welcome" runat="server" Text="Here you can update and maintain your restauraunt website." />
</asp:Content> <%-- end left content --%> 

<asp:Content ID="Content2" ContentPlaceHolderID="cph_contentright" Runat="Server">
</asp:Content>

