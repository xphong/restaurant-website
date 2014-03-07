<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Final Project
username: admin, password: admin
Independent Initiative: Search inside View Menu
- Doing two controls for content because I don't have 5 tables
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/MasterPage.master" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Default2"  EnableTheming="false"  %>

<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/Secure/MasterPage.master"%>

<%-- Left Content --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" Runat="Server">
    <asp:Label ID="lbl_content" runat="server" Text="Edit Content" EnableTheming="true" SkinID="header2" />
    <br />
    <%-- shows success/failure message --%>
    <asp:Label ID="lbl_msg" runat="server" />
    <br /><br />
    <%-- Formview of contenttext table --%>
    <asp:FormView id="fmv_content" runat="server" AllowPaging="true" DataKeyNames="ContentID" 
     OnItemDeleting="contentItemDeleting" OnItemInserting="contentItemInserting" OnItemUpdating="contentItemUpdating" 
      OnModeChanging="contentModeChanging" OnPageIndexChanging="contentPageIndexChanging" >

        <PagerTemplate>
            <asp:LinkButton ID="lnk_pre" runat="server" Text="Previous" CommandName="Page" CommandArgument="Prev" />
            <asp:LinkButton ID="lnk_next" runat="server" Text="Next" CommandName="Page" CommandArgument="Next" />
        </PagerTemplate>

        <EditItemTemplate>
            <asp:Label ID="lbl_idtxtU" runat="server" Text="ID:" Font-Bold="true" />
            <asp:Label ID="lbl_idU" runat="server" Text='<%#Eval("ContentID") %>' /><br /><br />
            <asp:Label ID="lbl_pagetxtU" runat="server" Text="Page:" Font-Bold="true" />
            <asp:TextBox ID="txt_pageU" runat="server" Text='<%#Eval("ContentPage") %>' /><br /><br />
            <asp:RequiredFieldValidator ID="rfv_pageU" runat="server" Text="*Required" ControlToValidate="txt_pageU" ValidationGroup="update" />
            <asp:Label ID="lbl_texttxtU" runat="server" Text="Text:" Font-Bold="true" />
            <asp:TextBox ID="txt_textU" runat="server" Text='<%#Eval("ContentText") %>' /><br /><br />
            <asp:RequiredFieldValidator ID="rfv_textU" runat="server" Text="*Required" ControlToValidate="txt_textU" ValidationGroup="update" />
            <asp:Button ID="btn_updateU" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
            <asp:Button ID="btn_cancelU" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" /><br />
        </EditItemTemplate>

        <InsertItemTemplate>
            <asp:Label ID="lbl_pagetxtI" runat="server" Text="Page:" Font-Bold="true" />
            <asp:TextBox ID="txt_pageI" runat="server" /><br /><br />
            <asp:Label ID="lbl_texttxtI" runat="server" Text="Text:" Font-Bold="true" />
            <asp:TextBox ID="txt_textI" runat="server" /><br /><br />
             <asp:Button ID="btn_insertI" runat="server" Text="Insert" CommandName="Insert" />
            <asp:Button ID="btn_cancelI" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" /><br />
        </InsertItemTemplate>

        <ItemTemplate>
            <asp:Label ID="lbl_idtxt" runat="server" Text="ID:" Font-Bold="true" />
            <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("ContentID") %>' /><br /><br />
            <asp:Label ID="lbl_pagetxt" runat="server" Text="Page:" Font-Bold="true" />
            <asp:Label ID="lbl_page" runat="server" Text='<%#Eval("ContentPage") %>' /><br /><br />
            <asp:Label ID="lbl_texttxt" runat="server" Text="Text:" Font-Bold="true" />
            <asp:Label ID="lbl_text" runat="server" Text='<%#Eval("ContentText") %>' /><br /><br />
            <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" />
            <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Delete this record?')" />
            <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="New" /><br />

        </ItemTemplate>
      

      </asp:FormView>
      <br />
      <hr />
      <br /><br />
      <asp:Label ID="lbl_msg2" runat="server" />
      <%-- - Doing two controls for content because I don't have 5 tables --%>

      <%-- datalist of content table --%>
      <asp:DataList ID="dtl_content" runat="server" OnEditCommand="dtl_contentEdit" OnUpdateCommand="dtl_contentUpdate" OnCancelCommand="dtl_contentCancel" OnDeleteCommand="dtl_contentDelete">
                 
                 <HeaderTemplate>
                 <table  cellpadding="2" cellspacing="10">
                 <tr>
                        <td><asp:Label ID="lbl_idtxt" runat="server" Text="ID" Font-Bold="true" /></td>
                        <td><asp:Label ID="lbl_pagetxt" runat="server" Text="Page" Font-Bold="true" /></td>
                        <td><asp:Label ID="lbl_texttxt" runat="server" Text="Text" Font-Bold="true" /></td>
                    </tr>
                    </table>
                 </HeaderTemplate>

                 <ItemTemplate>
                 <table cellpadding="2" cellspacing="10">
                 <tr>
                        <td><asp:Label ID="lbl_id" runat="server" Text='<%#Eval("ContentID") %>' /></td>
                        <td><asp:Label ID="lbl_page" runat="server" Text='<%#Eval("ContentPage") %>' /></td>
                        <td> <asp:Label ID="lbl_text" runat="server" Text='<%#Eval("ContentText") %>' /></td>
                        <td><asp:LinkButton ID="lnk_edit" runat="server" Text="Edit" CommandName="Edit" /></td>
                        <td><asp:LinkButton ID="lnk_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Delete this record?')" /></td>
                  </tr>
                  </table>
                 </ItemTemplate>

                 <EditItemTemplate>
                    <table cellpadding="2" cellspacing="10">
                    <tr>
                        <td><asp:Label ID="lbl_idU" runat="server" Text='<%#Eval("ContentID") %>' /></td>
                        <td><asp:TextBox ID="txt_pageU" runat="server" Text='<%#Eval("ContentPage") %>' /></td>
                        <td> <asp:TextBox ID="txt_textU" runat="server" Text='<%#Eval("ContentText") %>' /></td>
                        <td><asp:LinkButton ID="lnk_update" runat="server" Text="Update" CommandName="Update" /></td>
                        <td><asp:LinkButton ID="lnk_cancel" runat="server" Text="Cancel" CommandName="Cancel" /></td>
                    </tr>
                    </table>
                 </EditItemTemplate>
      </asp:DataList>

      <br />
      <hr />
      <br />
        <asp:Label ID="lbl_contentheader2" runat="server" Text="Insert" EnableTheming="true" SkinID="header2" />
        <%-- Insert new contact template --%>
         <br />
        <asp:Label ID="lbl_pageI" runat="server" Text="Page" AssociatedControlID="txt_pageI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_pageI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_pageI" runat="server" Text="*Required" ControlToValidate="txt_pageI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_textI" runat="server" Text="Text" AssociatedControlID="txt_textI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_textI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_textI" runat="server" Text="*Required" ControlToValidate="txt_textI" ValidationGroup="insert" />
        <br /><br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert" OnClick="InsertContent" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="Cancel"  CausesValidation="false"/>



</asp:Content>

<%-- Right Content --%>
<asp:Content ID="RightContent" ContentPlaceHolderID="cph_contentright" Runat="Server">
    <br />
    <asp:HyperLink ID="hyp_viewhome" runat="server" NavigateUrl="~/Default.aspx"> View Home Page </asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="hyp_viewabout" runat="server" NavigateUrl="~/About.aspx"> View About Page </asp:HyperLink>
</asp:Content>

