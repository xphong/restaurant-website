<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Project Part 2
username: admin, password: admin
Independent Initiative: Search inside View Menu
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Default2"  EnableTheming="false"  %>

<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/Secure/MasterPage.master"%>

<%-- Left Content --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" Runat="Server">
    <asp:Label ID="lbl_contactheader" runat="server" Text="Contact Table" EnableTheming="true" SkinID="header2" />
        <br /><br />
        <asp:Label ID="lbl_msg" runat="server" />

    <br />
    <%-- Gridview of contact table --%>
    <asp:GridView ID="grv_contact" runat="server" AutoGenerateColumns="false"
     OnRowEditing="EditContact" OnRowUpdating="UpdateContact" OnRowCancelingEdit="CancelEdit" AlternatingRowStyle-BackColor="LightBlue" RowStyle-BackColor="LightSteelBlue" EditRowStyle-BackColor="LightSlateGray">
        <Columns>
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="lbl_contactID" runat="server" Text='<%#Eval("ContactID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="First Name">
            <ItemTemplate>
                <asp:Label ID="lbl_contactFname" runat="server" Text='<%#Eval("ContactFname")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_contactFnameU" runat="server" Text='<%#Eval("ContactFname") %>' />
                <asp:RequiredFieldValidator ID="rfv_fnameU" runat="server" Text="*Required" ControlToValidate="txt_contactFnameU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Last Name">
            <ItemTemplate>
                <asp:Label ID="lbl_contactLname" runat="server" Text='<%#Eval("ContactLname")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_contactLnameU" runat="server" Text='<%#Eval("ContactLname") %>' />
                <asp:RequiredFieldValidator ID="rfv_lnameU" runat="server" Text="*Required" ControlToValidate="txt_contactLnameU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="E-Mail">
            <ItemTemplate>
                <asp:Label ID="lbl_contactEmail" runat="server" Text='<%#Eval("ContactEmail")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_contactEmailU" runat="server" Text='<%#Eval("ContactEmail") %>' />
                <asp:RequiredFieldValidator ID="rfv_emailU" runat="server" Text="*Required" ControlToValidate="txt_contactEmailU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Message">
            <ItemTemplate>
                <asp:Label ID="lbl_contactMessage" runat="server" Text='<%#Eval("ContactMessage")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_contactMessageU" runat="server" Text='<%#Eval("ContactMessage") %>' />
                <asp:RequiredFieldValidator ID="rfv_messageU" runat="server" Text="*Required" ControlToValidate="txt_contactMessageU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnk_delete" runat="server" CommandArgument='<%#Eval("ContactID") %>' Text="Delete" OnClientClick="return confirm('Delete this record?')" OnClick="DeleteContact" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="true" ValidationGroup="update" />
        </Columns>
    </asp:GridView> <%-- End gridview --%>
    <br /> <br />
    <hr />
    <br /> 
    <asp:Label ID="lbl_contactheader2" runat="server" Text="Insert" EnableTheming="true" SkinID="header2" />
    <%-- Insert new contact template --%>
    <br />
        <asp:Label ID="lbl_contactFnameI" runat="server" Text="First Name" AssociatedControlID="txt_contactFnameI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_contactFnameI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_fnameI" runat="server" Text="*Required" ControlToValidate="txt_contactFnameI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_contactLnameI" runat="server" Text="Last Name" AssociatedControlID="txt_contactLnameI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_contactLnameI" runat="server" />
        
        <asp:RequiredFieldValidator ID="rfv_lnameI" runat="server" Text="*Required" ControlToValidate="txt_contactLnameI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_contactEmailI" runat="server" Text="E-Mail" AssociatedControlID="txt_contactEmailI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_contactEmailI" runat="server" />
        
        <asp:RequiredFieldValidator ID="rfv_emailI" runat="server" Text="*Required" ControlToValidate="txt_contactEmailI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_contactMessageI" runat="server" Text="Message" AssociatedControlID="txt_contactMessageI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_contactMessageI" runat="server" />
        
        <asp:RequiredFieldValidator ID="rfv_messageI" runat="server" Text="*Required" ControlToValidate="txt_contactMessageI" ValidationGroup="insert" />
        <br /><br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert" OnClick="InsertContact" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="Cancel"  CausesValidation="false"/>


</asp:Content> <%-- End left content --%>

<%-- Right Content --%>
<asp:Content ID="RightContent" ContentPlaceHolderID="cph_contentright" Runat="Server">
    <br />
    <asp:HyperLink ID="hyp_viewcontact" runat="server" NavigateUrl="~/Contact.aspx">
    View Contact Page
    </asp:HyperLink>
</asp:Content>

