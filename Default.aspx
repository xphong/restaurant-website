<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Project Part 2--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableTheming="false" %>
<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/MasterPage.master"%>

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
<asp:Label ID="lbl_homeheader" runat="server" Text="Welcome to Phong's Restaurant" EnableTheming="true" SkinID="header2" />
<br />
<%-- Steak Image --%>
<asp:Image ID="img_steak" runat="server" ImageUrl="App_Themes/Theme1/steak.jpg" AlternateText="Steak" />
<br />
<%-- About Text --%>
<asp:Repeater ID="rpt_text" runat="server" DataSourceID="sds_text">
    <ItemTemplate>
        <asp:Label ID="lbl_text" 
         runat="server" Text= '<%# Eval("text") %>'></asp:Label>
    </ItemTemplate>
</asp:Repeater>
<br />
<%-- Chicken Image --%>
<asp:Image ID="img_chicken" runat="server" ImageUrl="App_Themes/Theme1/chicken.jpg" AlternateText="Chicken" />
<br />
<%-- Repeater --%>

<asp:Repeater ID="rpt_menu" runat="server" DataSourceID="sds_main">
    <ItemTemplate>
        <asp:Label ID="lbl_foodrepeater" 
         runat="server" Text= '<%# Eval("Food") %>' EnableTheming="true" SkinID="italictext" ></asp:Label>
    </ItemTemplate>
</asp:Repeater>

</asp:Content> <%-- end left content --%>