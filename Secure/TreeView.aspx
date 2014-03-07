<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Project Part 2--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/MasterPage.master" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="Default2" %>
<%@ MasterType VirtualPath="~/Secure/MasterPage.master" %>

<asp:Content ID="ContentLeft" ContentPlaceHolderID="cph_contentleft" Runat="Server">
        <asp:Label ID="lbl_trv" runat="server" Text="TreeView of SiteMap" />
        <br /><br />
        <%-- Set data source for sitemap --%>
        <asp:SiteMapDataSource ID="sds_tree" runat="server" />
        <%-- Treeview of the website site map --%>
        <asp:TreeView ID="trv_1" runat="server" DataSourceID="sds_tree" ShowLines="true">
        </asp:TreeView>
        <br />
</asp:Content>

<asp:Content ID="ContentRight" ContentPlaceHolderID="cph_contentright" Runat="Server">
</asp:Content>
