<%--Phong Huynh - 810194340, hnhp0025
Web Application Development
Final Project
username: admin, password: admin
Independent Initiative: Search inside View Menu--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Default2"  EnableTheming="false"  %>

<%-- Set path for master page --%>
<%@ MasterType VirtualPath="~/Secure/MasterPage.master"%>

<%-- Left Content --%>
<asp:Content ID="LeftContent" ContentPlaceHolderID="cph_contentleft" Runat="Server">
    <asp:Label ID="lbl_ordersheader" runat="server" Text="Orders Table" EnableTheming="true" SkinID="header2" />

        <br />
        <asp:Label ID="lbl_msg" runat="server" />

    <br /><br />
    <%-- Gridview of contact table --%>
    <asp:GridView ID="grv_orders" runat="server" AutoGenerateColumns="false"
     OnRowEditing="EditOrders" OnRowUpdating="UpdateOrders" OnRowCancelingEdit="CancelEdit" AlternatingRowStyle-BackColor="YellowGreen" EditRowStyle-BackColor="Olive" RowStyle-BackColor="MediumSeaGreen">
        <Columns>
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("OrdersID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("OrdersName")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("OrdersName") %>' />
                <asp:RequiredFieldValidator ID="rfv_nameU" runat="server" Text="*Required" ControlToValidate="txt_nameU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Number">
            <ItemTemplate>
                <asp:Label ID="lbl_number" runat="server" Text='<%#Eval("OrdersNumber")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_numberU" runat="server" Text='<%#Eval("OrdersNumber") %>' />
                <asp:RequiredFieldValidator ID="rfv_numberU" runat="server" Text="*Required" ControlToValidate="txt_numberU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Food">
            <ItemTemplate>
                <asp:Label ID="lbl_food" runat="server" Text='<%#Eval("OrdersFood")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_foodU" runat="server" Text='<%#Eval("OrdersFood") %>' />
                <asp:RequiredFieldValidator ID="rfv_foodU" runat="server" Text="*Required" ControlToValidate="txt_foodU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Food Quantity">
            <ItemTemplate>
                <asp:Label ID="lbl_foodquantity" runat="server" Text='<%#Eval("OrdersFoodquantity")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_foodquantityU" runat="server" Text='<%#Eval("OrdersFoodquantity") %>' />
                <asp:RequiredFieldValidator ID="rfv_foodquantityU" runat="server" Text="*Required" ControlToValidate="txt_foodquantityU" ValidationGroup="update" />     
                <%-- 0-20 range validator --%>
                <asp:RangeValidator ID="rgv_foodquantityU" runat="server" Text="*Number Only" ControlToValidate="txt_foodquantityU" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="20" Type="Integer" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Drink">
            <ItemTemplate>
                <asp:Label ID="lbl_drink" runat="server" Text='<%#Eval("OrdersDrink")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_drinkU" runat="server" Text='<%#Eval("OrdersDrinkquantity") %>' />
                <asp:RequiredFieldValidator ID="rfv_drinkU" runat="server" Text="*Required" ControlToValidate="txt_drinkU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Drink Quantity">
            <ItemTemplate>
                <asp:Label ID="lbl_drinkquantity" runat="server" Text='<%#Eval("OrdersDrinkquantity")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_drinkquantityU" runat="server" Text='<%#Eval("OrdersDrinkquantity") %>' />
                <asp:RequiredFieldValidator ID="rfv_drinkquantityU" runat="server" Text="*Required" ControlToValidate="txt_drinkquantityU" ValidationGroup="update" />
                <asp:RangeValidator ID="rgv_drinkquantityU" runat="server" Text="*Number Only" ControlToValidate="txt_drinkquantityU" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="20" Type="Integer" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sauce">
            <ItemTemplate>
                <asp:Label ID="lbl_sauce" runat="server" Text='<%#Eval("OrdersSauce")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_sauceU" runat="server" Text='<%#Eval("OrdersSauce") %>' />
                <asp:RequiredFieldValidator ID="rfv_sauceU" runat="server" Text="*Required" ControlToValidate="txt_sauceU" ValidationGroup="update" />
                <%-- 0-1 range validator --%>
                <asp:RangeValidator ID="rgv_sauceU" runat="server" Text="*Number Only" ControlToValidate="txt_sauceU" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="1" Type="Integer" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Address">
            <ItemTemplate>
                <asp:Label ID="lbl_address" runat="server" Text='<%#Eval("OrdersAddress")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_addressU" runat="server" Text='<%#Eval("OrdersAddress") %>' />
                <asp:RequiredFieldValidator ID="rfv_addressU" runat="server" Text="*Required" ControlToValidate="txt_addressU" ValidationGroup="update" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnk_delete" runat="server" CommandArgument='<%#Eval("OrdersID") %>' Text="Delete" OnClientClick="return confirm('Delete this record?')" OnClick="DeleteOrders" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="true" ValidationGroup="update" />
        </Columns>
    </asp:GridView> <%-- End gridview --%>
    <br /><br />
        <hr /><br />
        <asp:Label ID="lbl_orderinsert" runat="server" Text="Insert" EnableTheming="true" SkinID="header2" />
        <br />
        <%-- Insert new contact template --%>
        <asp:Label ID="lbl_nameI" runat="server" Text="Name" AssociatedControlID="txt_nameI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_nameI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*Required" ControlToValidate="txt_nameI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_numberI" runat="server" Text="Number" AssociatedControlID="txt_numberI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_numberI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_numberI" runat="server" Text="*Required" ControlToValidate="txt_numberI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_foodI" runat="server" Text="Food" AssociatedControlID="txt_foodI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_foodI" runat="server" />
        
        <asp:RequiredFieldValidator ID="rfv_foodI" runat="server" Text="*Required" ControlToValidate="txt_foodI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_foodquantityI" runat="server" Text="Food Quantity" AssociatedControlID="txt_foodquantityI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_foodquantityI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_foodquantityI" runat="server" Text="*Required" ControlToValidate="txt_foodquantityI" ValidationGroup="insert" />
        <asp:RangeValidator ID="rgv_foodquantityI" runat="server" Text="*Number Only" ControlToValidate="txt_foodquantityI" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="20" Type="Integer" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_drinkI" runat="server" Text="Drink" AssociatedControlID="txt_drinkI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_drinkI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_drinkI" runat="server" Text="*Required" ControlToValidate="txt_drinkI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_drinkquantityI" runat="server" Text="Drink Quantity" AssociatedControlID="txt_drinkquantityI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_drinkquantityI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_drinkquantityI" runat="server" Text="*Required" ControlToValidate="txt_drinkquantityI" ValidationGroup="insert" />
        <asp:RangeValidator ID="rgv_drinkquantityI" runat="server" Text="*Number Only" ControlToValidate="txt_drinkquantityI" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="20" Type="Integer" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_sauceI" runat="server" Text="Sauce" AssociatedControlID="txt_sauceI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_sauceI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_sauceI" runat="server" Text="*Required" ControlToValidate="txt_sauceI" ValidationGroup="insert" />
        <asp:RangeValidator ID="rgv_sauceI" runat="server" Text="*Number Only" ControlToValidate="txt_sauceI" Display="Dynamic" SetFocusOnError="true" MinimumValue="0" MaximumValue="1" Type="Integer" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_addressI" runat="server" Text="Address" AssociatedControlID="txt_addressI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_addressI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_addressI" runat="server" Text="*Required" ControlToValidate="txt_addressI" ValidationGroup="insert" />
        <br /><br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert" OnClick="InsertOrders" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="Cancel"  CausesValidation="false"/>

</asp:Content>

<%-- Right Content --%>
<asp:Content ID="RightContent" ContentPlaceHolderID="cph_contentright" Runat="Server">
    <br />
    <asp:HyperLink ID="hyp_vieworder" runat="server" NavigateUrl="~/OrderForm.aspx">
    View Order Form Page
    </asp:HyperLink>
</asp:Content>

