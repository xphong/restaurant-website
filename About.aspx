<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Project Part 2--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Default2"  EnableTheming="false"  %>

<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/MasterPage.master"%>

<%-- Left Content --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" Runat="Server">
    <%-- About page Content --%>
    <asp:Label ID="lbl_aboutheader" runat="server" Text="About Phong's Restaurant" EnableTheming="true" SkinID="header2" />
 
    <%-- SiteMap Path --%>
    <br />
    <asp:SiteMapPath ID="smp_main" runat="server" />
    <br /><br />
    <asp:SqlDataSource ID="sds_text" runat="server" 
    ConnectionString="<%$ ConnectionStrings:hnhp0025DBConnectionString %>" 
    SelectCommand="SELECT * FROM [contenttext] WHERE id = 3 " />

    <%-- about Labels --%>
    <asp:Repeater ID="rpt_text" runat="server" DataSourceID="sds_text">
    <ItemTemplate>
        <asp:Label ID="lbl_text" 
         runat="server" Text= '<%# Eval("text") %>'></asp:Label>
    </ItemTemplate>
</asp:Repeater>

<asp:Image ID="img_restaurant" runat="server" ImageUrl="App_Themes/Theme1/restaurant.jpg" AlternateText="Restaurant" />

</asp:Content>

<%-- Right Content --%>
<asp:Content ID="RightContent" ContentPlaceHolderID="cph_contentright" Runat="Server">
<br /><br />
    <asp:Image ID="img_bar" runat="server" ImageUrl="App_Themes/Theme1/bar.jpg" AlternateText="Bar" BorderStyle="Solid" BorderWidth="1px" BorderColor="#021a40" />
</asp:Content>

