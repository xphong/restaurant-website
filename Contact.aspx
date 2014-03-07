<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Project Part 2--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact"  EnableTheming="false"  %>

<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/MasterPage.master"%>




<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" Runat="Server">

<%-- Set data source for SQL connection --%>
<asp:SqlDataSource ID="sds_main" runat="server" 
    ConnectionString="<%$ ConnectionStrings:hnhp0025DBConnectionString %>" 
    SelectCommand="SELECT * FROM [contact]" 
    InsertCommand="INSERT INTO [contact] ([fname], [lname], [email], [message]) VALUES (@fname, @lname, @email, @message)" >

    <InsertParameters>
        <asp:Parameter Name="fname" Type="String" />
        <asp:Parameter Name="lname" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="message" Type="String" />
    </InsertParameters>
    </asp:SqlDataSource>

    <%-- Contact page Content --%>
    <asp:Label ID="lbl_contactheader" runat="server" Text="Contact Us" EnableTheming="true" SkinID="header2" />
 
    <%-- SiteMap Path --%>
    <br />
    <asp:SiteMapPath ID="smp_main" runat="server" />
    <br /><br />

    <%-- FormView used to insert contact information and message --%>
    <asp:FormView ID="fmv_contact" runat="server" DataSourceID="sds_main" 
        DataKeyNames="id" DefaultMode="Insert" >
        <InsertItemTemplate>
                <asp:Label ID="lbl_fname" runat="server" Text="*First Name: " AssociatedControlID="txt_fname" />
                <asp:TextBox ID="txt_fname" runat="server" Text='<%#Bind("fname") %>' CssClass="textbox"  />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" Text="Empty value" ErrorMessage="Please enter your first name." ControlToValidate="txt_fname" display="Dynamic" SetFocusOnError="true"  ValidationGroup="contact_form" />
                <%-- checking if value entered is text format  --%>
                <asp:RegularExpressionValidator ID="rev_fname" runat="server" Text="Invalid name" ErrorMessage="Please enter your correct first name." ControlToValidate="txt_fname" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ValidationGroup="contact_form" />
                <br />
                <asp:Label ID="lbl_lname" runat="server" Text="*Last Name: " AssociatedControlID="txt_lname" />
                <asp:TextBox ID="txt_lname" runat="server" Text='<%#Bind("lname") %>'  CssClass="textbox" />
                <%-- checking if empty  --%>
                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" Text="Empty value" ErrorMessage="Please enter your last name." ControlToValidate="txt_lname" display="Dynamic" SetFocusOnError="true"  ValidationGroup="contact_form" />
                <%-- checking if value entered is text format  --%>
                <asp:RegularExpressionValidator ID="rev_lname" runat="server" Text="Invalid name" ErrorMessage="Please enter your correct last name." ControlToValidate="txt_lname" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ValidationGroup="contact_form" />
                <br />
                <asp:Label ID="lbl_email" runat="server" Text="*Email: " AssociatedControlID="txt_email" />
                <asp:TextBox ID="txt_email" runat="server" Text='<%#Bind("email") %>'  CssClass="textbox" />
                <%-- checking if email format using regular expression --%>
                <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="Invalid email format" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ErrorMessage="Please enter a correct email address." ValidationGroup="contact_form" />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" display="dynamic" SetFocusOnError="true" Text="Empty value" ErrorMessage="Please enter an email address." ValidationGroup="contact_form" />
                <br />
                <asp:Label ID="lbl_email2" runat="server" Text="*Repeat Email: " AssociatedControlID="txt_email2" />
                <asp:TextBox ID="txt_email2" runat="server" CssClass="textbox"/>
                <%-- checking if emails match using compare validator --%>
                <asp:CompareValidator ID="cov_email" runat="server" Text="Emails do not match" ControlToValidate="txt_email2" ControlToCompare="txt_email" Operator="Equal" ErrorMessage="Emails do not match" ValidationGroup="contact_form" />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfv_email2" runat="server" Text="Empty value" ErrorMessage="Please enter an email address." ControlToValidate="txt_email2" display="dynamic" SetFocusOnError="true"  ValidationGroup="contact_form"  />          
                <br />
                <asp:Label ID="lbl_msg" runat="server" Text="*Message: " AssociatedControlID="txt_msg" />
                <asp:TextBox ID="txt_msg" runat="server" TextMode="MultiLine" MaxLength="300" Text='<%#Bind("message") %>'  CssClass="textbox" />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfv_message" runat="server" Text="Empty value" ErrorMessage="Please enter a message." ControlToValidate="txt_msg" display="dynamic" SetFocusOnError="true"  ValidationGroup="contact_form"  />          
                <br /> <br /><br />

                <%-- Submit button --%>
                <asp:Button ID="btn_submit" runat="server" Text="Submit" CommandName="Insert" ValidationGroup="contact_form" OnClick="subSubmit" CssClass="button"  />
                <%-- Validation Summary for contact form --%>
                <asp:ValidationSummary ID="vds_contact" runat="server" HeaderText="Form Errors:" DisplayMode="List" ValidationGroup="contact_form" />
        </InsertItemTemplate>
    </asp:FormView>

    <br /><br />
    <%-- Output Message --%>
    <asp:Label ID="lbl_output" runat="server" />

</asp:Content>


<asp:Content ID="RightContent" ContentPlaceHolderID="cph_contentright" Runat="Server">
</asp:Content>

