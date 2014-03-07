<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Secure_Login" EnableTheming="false" %>
<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/MasterPage.master"%>

<asp:Content id="leftcontent" ContentPlaceHolderID="cph_contentleft" runat="server">
    <div>
        <asp:Login ID="Login1" OnAuthenticate="Login1_Authenticate" runat="server" />
    </div>

</asp:Content>

<asp:Content id="rightcontent" ContentPlaceHolderID="cph_contentright" runat="server">
</asp:Content>