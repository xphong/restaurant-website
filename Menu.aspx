<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Project Part 2--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" EnableTheming="false" %>
<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<%-- Left Content --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" runat="server">
<asp:Label ID="lbl_menuheader" runat="server" Text="Phong's Restaurant Menu" EnableTheming="true" SkinID="header2" />

<%-- SiteMap Path --%>
<br />
<asp:SiteMapPath ID="smp_main" runat="server" />

<br /><br />
<%-- Set data source for SQL connection --%>
<asp:SqlDataSource ID="sds_main" runat="server" 
    ConnectionString="<%$ ConnectionStrings:hnhp0025DBConnectionString %>" 
    SelectCommand="SELECT * FROM [menu]" />


<%-- Generate grid view for menu using sql data source --%>
<asp:GridView ID="grv_menu" runat="server" AutoGenerateColumns="false" DataSourceID="sds_main" BorderColor="#336699" 
                  BorderStyle="Solid" BorderWidth="2px" CellPadding="5" OnRowCommand="grv_menu_RowCommand" >
        <rowstyle backcolor="LightCyan" forecolor="DarkBlue" />
        <alternatingrowstyle backcolor="LightGray"  forecolor="DarkBlue" />
        <Columns>
            <asp:BoundField DataField="Food"  HeaderText="Food" />
            <%-- More Details button: when clicked on - makes second grid view visible --%>
            <asp:ButtonField ButtonType="button" CommandName="MoreDetail" HeaderText="More Details" Text="More Details" />
        </Columns>

</asp:GridView> 

<br /><br />
<asp:Label ID="lbl_details" runat="server" Text="More Details" Visible="false" />
<br />
<%-- Generate second grid view for menu details using sql data source --%>
<asp:GridView ID="grv_desc" runat="server" AutoGenerateColumns="false" DataSourceID="sds_main" BorderColor="#333333" 
                  BorderStyle="Solid" BorderWidth="2px" CellPadding="5" Visible="false" >
        <%-- Lists columns to be displayed --%>
        <Columns>
            <asp:BoundField DataField="id"  HeaderText="ID" SortExpression="id" />
            <asp:BoundField DataField="Food"  HeaderText="Food" />
            <asp:BoundField DataField="Description"  HeaderText="Description" />
            <asp:BoundField DataField="Price"  HeaderText="Price" />
</Columns>

</asp:GridView> 
<%-- Chicken Image --%>
<asp:Image ID="img_chicken" runat="server" ImageUrl="App_Themes/Theme1/chicken.jpg" AlternateText="Chicken" Visible="false" />
<%-- Steak Image --%>
<asp:Image ID="img_steak" runat="server" ImageUrl="App_Themes/Theme1/steak.jpg" AlternateText="Steak" Visible="false" />
<%-- Prok Image --%>
<asp:Image ID="img_pork" runat="server" ImageUrl="App_Themes/Theme1/pork.jpg" AlternateText="Pork" Visible="false" />

   
</asp:Content>

<%-- Right Content --%>
<asp:Content ID="RightContent" ContentPlaceHolderID="cph_contentright" runat="server">
<h2>Coming Soon...</h2>


<asp:SqlDataSource ID="sds_text" runat="server" 
    ConnectionString="<%$ ConnectionStrings:hnhp0025DBConnectionString %>" 
    SelectCommand="SELECT * FROM [contenttext] WHERE id = 4 " />

<%-- Food items that are coming soon --%>
<asp:Repeater ID="rpt_text" runat="server" DataSourceID="sds_text">
    <ItemTemplate>
        <asp:Label ID="lbl_text" 
         runat="server" Text= '<%# Eval("text") %>'></asp:Label>
    </ItemTemplate>
</asp:Repeater>
<br /><br />
<asp:Image ID="img_ribs" runat="server" ImageUrl="App_Themes/Theme1/ribs.jpg" AlternateText="Ribs" />
<br /><br />
</asp:Content>