<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>
    
    <%-- Multiview: used to hide the coupon form--%>
    <asp:MultiView ID="mtv_form" runat="server" ActiveViewIndex="0">
    <%-- View 1: sign up button --%>
    <asp:View ID="view1" runat="server">
            <asp:Label ID="lbl_signup" runat="server" Text="Sign up for our coupons!" />
            <asp:Button ID="btn_nextview" runat="server" Text="Sign Up" CommandName="NextView" />
    </asp:View>

    <%-- View 2: Wizard Form --%>
    <asp:View ID="view2" runat="server">
        <%-- Wizard Step --%>
        <asp:Wizard ID="wzd_form1" runat="server" ActiveStepIndex="0">
       
            <WizardSteps>
                <%-- Wizard Step 1: Introduction --%>
                <asp:WizardStep id="wds_1" runat="server" title="Step 1">
                <h2>Coupon Form</h2>
                <asp:Label ID="lbl_start" runat="server" Text="Please complete the following form to sign up for coupons/deals" />
                </asp:WizardStep>

                <%-- Wizard Step 2: Information Form --%>
                <asp:WizardStep ID="wds_2" runat="server" Title="Step 2">
                <%-- First Form --%>
                <h2>Coupon Form</h2>
                <asp:Label ID="lbl_fname" runat="server" Text="*First Name: " AssociatedControlID="txt_fname" />
                <asp:TextBox ID="txt_fname" runat="server" />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" Text="Empty value" ErrorMessage="Please enter your first name." ControlToValidate="txt_fname" display="Dynamic" SetFocusOnError="true"  ValidationGroup="coupon_form" />
                <%-- checking if value entered is text format  --%>
                <asp:RegularExpressionValidator ID="rev_fname" runat="server" Text="Invalid name" ErrorMessage="Please enter your correct first name." ControlToValidate="txt_fname" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ValidationGroup="coupon_form" />
                <br />
                <asp:Label ID="lbl_lname" runat="server" Text="*Last Name: " AssociatedControlID="txt_lname" />
                <asp:TextBox ID="txt_lname" runat="server" />
                <%-- checking if empty  --%>
                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" Text="Empty value" ErrorMessage="Please enter your last name." ControlToValidate="txt_lname" display="Dynamic" SetFocusOnError="true"  ValidationGroup="coupon_form" />
                <%-- checking if value entered is text format  --%>
                <asp:RegularExpressionValidator ID="rev_lname" runat="server" Text="Invalid name" ErrorMessage="Please enter your correct last name." ControlToValidate="txt_lname" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ValidationGroup="coupon_form" />
                <br />
                <asp:Label ID="lbl_age" runat="server" Text="*Age: " AssociatedControlID="txt_age" />
                <asp:TextBox ID="txt_age" runat="server" />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfv_age" runat="server" Text="Empty value" ErrorMessage="Please enter your age." ControlToValidate="txt_age" display="Dynamic" SetFocusOnError="true"  ValidationGroup="coupon_form" />
                <%-- checking if range is correct for age 12-65 --%>
                <asp:RangeValidator ID="rav_age" runat="server" Text="Invalid Age (12-65)" ErrorMessage="Please enter your correct age (12-65)" ControlToValidate="txt_age" SetFocusOnError="true" MinimumValue="12" MaximumValue="65" Type="Integer" ValidationGroup="coupon_form" />
                <br />
                <asp:Label ID="lbl_gender" runat="server" Text="Gender: " AssociatedControlID="rbl_gender" />
                <%-- Radio button list for gender --%>
                <asp:RadioButtonList ID="rbl_gender" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" >
                    <asp:ListItem Text="Male" />
                    <asp:ListItem Text="Female" />
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="lbl_email" runat="server" Text="*Email: " AssociatedControlID="txt_email" />
                <asp:TextBox ID="txt_email" runat="server" />
                <%-- checking if email format using regular expression --%>
                <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="Invalid email format" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ErrorMessage="Please enter a correct email address." ValidationGroup="coupon_form" />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfb_email" runat="server" ControlToValidate="txt_email" display="dynamic" SetFocusOnError="true" Text="Empty value" ErrorMessage="Please enter an email address." ValidationGroup="coupon_form" />
                <br />
                <asp:Label ID="lbl_email2" runat="server" Text="*Repeat Email: " AssociatedControlID="txt_email2" />
                <asp:TextBox ID="txt_email2" runat="server"  />
                <%-- checking if emails match using compare validator --%>
                <asp:CompareValidator ID="cov_email" runat="server" Text="Emails do not match" ControlToValidate="txt_email2" ControlToCompare="txt_email" Operator="Equal" ErrorMessage="Emails do not match" ValidationGroup="coupon_form" />
                <%-- checking if empty --%>
                <asp:RequiredFieldValidator ID="rfb_email2" runat="server" Text="Empty value" ErrorMessage="Please enter an email address." ControlToValidate="txt_email2" display="dynamic" SetFocusOnError="true"  ValidationGroup="coupon_form"  />          
                
                <p>*Required</p>
                <%-- Validation Summary for information form --%>
                <asp:ValidationSummary ID="vds_info" runat="server" HeaderText="Form Errors:" DisplayMode="List" ValidationGroup="coupon_form" />
                <br /> 
                <br />
                </asp:WizardStep>
                
                <%-- Final Wizard Step: Continue to next form --%>
                <asp:WizardStep ID="wds_final" runat="server" Title="Final Step" StepType="Complete" >
                <asp:Label ID="lbl_output" runat="server"/>
                </asp:WizardStep>

            </WizardSteps>
           
         

            <%-- Finish Navigation Template: used to control the finish button so that it checks for validation --%>
            <FinishNavigationTemplate>
                <asp:Button ID="btn_Previous" runat="server" Text="Previous" CommandName="MovePrevious" />
                <asp:Button ID="btn_Finish" runat="server" Text="Finish" CommandName="MoveComplete" ValidationGroup="coupon_form" OnClick="subSubmit" CausesValidation="true" />
            </FinishNavigationTemplate>
         </asp:Wizard>
    </asp:View>
    

</asp:MultiView>
