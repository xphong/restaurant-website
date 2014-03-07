<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Project Part 2--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderForm.aspx.cs" Inherits="OrderForm" EnableTheming="false" %>
<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/MasterPage.master"%>

<%-- Content for Left div  --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" Runat="Server">
    <%-- title Heading --%>
    <asp:Label ID="lbl_header2" runat="server" Text="Order Online" EnableTheming="true" SkinID="header2" />
    <br />
    <%-- SiteMap Path --%>
    <asp:SiteMapPath ID="smp_main" runat="server" />

    <br /><br />

    <%-- Set data source for SQL connection --%>
<asp:SqlDataSource ID="sds_main" runat="server" 
    ConnectionString="<%$ ConnectionStrings:hnhp0025DBConnectionString %>" 
    SelectCommand="SELECT * FROM [menu]" />

    <%-- form Heading --%>
    <asp:Label ID="lbl_orderform" runat="server" Text="Order Form" EnableTheming="true" SkinID="header2" />
    <br />
    <%-- Option Label and Drop down list --%>
    <asp:Label runat="server" Text="Option: " AssociatedControlID="ddl_option" EnableTheming="true" />
    <asp:DropDownList ID="ddl_option" runat="server" AutoPostBack="true" OnSelectedIndexChanged="subOption">
        <asp:ListItem>Pick Up</asp:ListItem>
        <asp:ListItem>Delivery</asp:ListItem>
    </asp:DropDownList>
    <br />
    <%-- Name label and textbox --%>
    <asp:Label ID="lbl_name" runat="server" Text="Name: " AssociatedControlID="txt_name" EnableTheming="true" />
    <asp:TextBox ID="txt_name" runat="server" CssClass="orderbox" />
    <%-- checking if empty --%>
    <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="Empty value" ErrorMessage="Please enter your name." ControlToValidate="txt_name" display="Dynamic" SetFocusOnError="true"  ValidationGroup="order_form" />
    <%-- checking if value entered is text format  --%>
    <asp:RegularExpressionValidator ID="rev_name" runat="server" Text="Invalid name" ErrorMessage="Please enter your correct name." ControlToValidate="txt_name" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ValidationGroup="order_form" />
    <br />
    <%-- Phone Number label and textbox  --%>
    <asp:Label ID="lbl_number" runat="server" Text="Phone-Number: " AssociatedControlID="txt_number" EnableTheming="true" />
    <asp:TextBox ID="txt_number" runat="server" CssClass="orderbox" />
     <%-- checking if empty --%>
    <asp:RequiredFieldValidator ID="rfv_number" runat="server" Text="Empty value" ErrorMessage="Please enter your phone number." ControlToValidate="txt_number" display="Dynamic" SetFocusOnError="true"  ValidationGroup="order_form" />
     <%-- checking if value entered is phone number format  --%>
    <asp:RegularExpressionValidator ID="rev_number" runat="server" Text="Invalid phone number, Format: ***-***-****" ErrorMessage="Please enter your correct phone number." ControlToValidate="txt_number" Display="Dynamic" SetFocusOnError="true" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="order_form" /> 
    <br />
    <%-- Food label and drop down list --%>
    <asp:Label ID="lbl_food" runat="server" Text="Food: " AssociatedControlID="ddl_food" EnableTheming="true" />
    <asp:DropDownList ID="ddl_food" runat="server" DataSourceID="sds_main" DataTextField="Food" DataValueField="Food" />
    <br />
    <%-- Quantity Label and text box --%>
    <asp:Label ID="lbl_quantityfood" runat="server" Text="Quantity: " AssociatedControlID="txt_quantityfood" EnableTheming="true" />
    <asp:TextBox ID="txt_quantityfood" runat="server" MaxLength="2" Columns="2" CssClass="orderbox" />
    <%-- checks if empty --%>
    <asp:RequiredFieldValidator ID="rfv_quantityfood" runat="server" Text="Empty value" ErrorMessage="Please enter your amount of food." ControlToValidate="txt_quantityfood" display="Dynamic" SetFocusOnError="true"  ValidationGroup="order_form" />
    <%-- checks for number range --%>
    <asp:RangeValidator ID="rgv_quantityfood" runat="server" Text="Invalid number of food (Maximum: 20)" ErrorMessage="Please enter correct food number. (Maximum: 20)" ControlToValidate="txt_quantityfood" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="20" Type="Integer" ValidationGroup="order_form" />
    <br />
    <%-- Drink label and radio button list  --%>
    <asp:Label ID="lbl_drink" runat="server" Text="Drink: " AssociatedControlID="rbl_drinks" EnableTheming="true" />
    <asp:RadioButtonList ID="rbl_drinks" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" >
        <asp:ListItem>Coca Cola</asp:ListItem>
        <asp:ListItem>Pepsi</asp:ListItem>
        <asp:ListItem>Sprite</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <%-- Quantity Label and text box --%>
    <asp:Label ID="lbl_quantitydrink" runat="server" Text="Quantity: " AssociatedControlID="txt_quantitydrink" EnableTheming="true" />
    <asp:TextBox ID="txt_quantitydrink" runat="server" MaxLength="2" Columns="2" CssClass="orderbox" />
    <%-- checks if empty --%>
    <asp:RequiredFieldValidator ID="rfv_quantitydrink" runat="server" Text="Empty value" ErrorMessage="Please enter your amount of drinks." ControlToValidate="txt_quantitydrink" display="Dynamic" SetFocusOnError="true"  ValidationGroup="order_form" />
    <%-- checks for number range --%>
    <asp:RangeValidator ID="rgv_quantitydrink" runat="server" Text="Invalid number of drinks. (Maximum: 20)" ErrorMessage="Please enter correct drink number. (Maximum: 20)" ControlToValidate="txt_quantitydrink" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="20" Type="Integer" ValidationGroup="order_form" />
    <br />

    <asp:CheckBox ID="cbx_sauce" runat="server" Text=" Extra Sauce? ($0.99)" />

    <br />
     <%-- Address label and textbox, visibility is false unless user selects delivery option  --%>
    <asp:Label ID="lbl_address" runat="server" Text="Delivery Address: " AssociatedControlID="txt_address" EnableTheming="true" Visible="false" />
    <%-- Has fake text so that validation goes through when pick up is selected --%>
    <asp:TextBox ID="txt_address" runat="server" Text="123 Fake Street" Visible="false" />
    <%-- checks if empty --%>
    <asp:RequiredFieldValidator ID="rfv_address" runat="server" Text="Empty value" ErrorMessage="Please enter your address." ControlToValidate="txt_address" display="Dynamic" SetFocusOnError="true"  ValidationGroup="order_form" />
    <%-- checks if correct address format --%>
     <asp:RegularExpressionValidator ID="rev_address" runat="server" Text="Invalid address, Format: 123 Fake Street" ErrorMessage="Please enter your correct address." ControlToValidate="txt_address" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\d{1,6}\040([A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,})$|^\d{1,6}\040([A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,})$|^\d{1,6}\040([A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,})$" ValidationGroup="order_form" />


    <br /><br />
    <%-- Submit and Clear Buttons --%>
    <asp:Button ID="btn_submit" runat="server" Text="Submit" onClick="subSubmit" ValidationGroup="order_form" CssClass="button" />
    <asp:Button ID="btn_clear" runat="server" Text="Clear" OnClick="subClear" CssClass="button"  />
    <%-- Validation Summary for order form --%>
    <asp:ValidationSummary ID="vds_order" runat="server" HeaderText="Form Errors:" DisplayMode="List" ValidationGroup="order_form" />
    <br />
    <%-- Output Label --%>
    <asp:Label ID="lbl_output" runat="server" />
    <br />
    <br />
</asp:Content> <%-- End left --%>


<%-- Content for right div --%>
