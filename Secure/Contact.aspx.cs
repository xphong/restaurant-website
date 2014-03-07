/*
 * Phong Huynh - 810194340, hnhp0025
 * Web Application Development
 * Final Project
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Binds gridview on page load
        if (!IsPostBack)
        {
            _subBind();
        }
    }


    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Contact Admin";
        Master.pp_masterTitle = "Phong's Restaurant - Contact";
    }

    // Subroutine to bind gridview
    private void _subBind()
    {
        contactClass objContact = new contactClass();
        grv_contact.DataSource = objContact.getContact();
        grv_contact.DataBind();

    }
    
    // Makes fields editable on gridview
    protected void EditContact(object sender, GridViewEditEventArgs e)
    {
        grv_contact.EditIndex = e.NewEditIndex;
        _subBind();
    }

    // Cancel Edit: changes editable fields back
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grv_contact.EditIndex = -1;
        _subBind();
    }

    // Update contact: updates the selected contact row
    protected void UpdateContact(object sender, GridViewUpdateEventArgs e)
    {
        contactClass objContact = new contactClass();
        objContact.ContactID = Int32.Parse(((Label)grv_contact.Rows[e.RowIndex].FindControl("lbl_contactID")).Text);
        objContact.ContactFname = ((TextBox)grv_contact.Rows[e.RowIndex].FindControl("txt_contactFnameU")).Text;
        objContact.ContactLname = ((TextBox)grv_contact.Rows[e.RowIndex].FindControl("txt_contactLnameU")).Text;
        objContact.ContactEmail = ((TextBox)grv_contact.Rows[e.RowIndex].FindControl("txt_contactEmailU")).Text;
        objContact.ContactMessage = ((TextBox)grv_contact.Rows[e.RowIndex].FindControl("txt_contactMessageU")).Text;
        lbl_msg.Text = objContact.updateContact();
        grv_contact.EditIndex = -1;
        _subBind();
    }

    // Deletes selected contact row
    protected void DeleteContact(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;

        contactClass objContact = new contactClass();
        objContact.ContactID = Int32.Parse(lnkDelete.CommandArgument);
        lbl_msg.Text = objContact.deleteContact();
        _subBind();
    }

    // Insert new contact
    protected void InsertContact(object sender, EventArgs e)
    {
        contactClass objContact = new contactClass();
        objContact.ContactFname = txt_contactFnameI.Text.ToString();
        objContact.ContactLname = txt_contactLnameI.Text.ToString();
        objContact.ContactEmail = txt_contactEmailI.Text.ToString();
        objContact.ContactMessage = txt_contactMessageI.Text.ToString();
        lbl_msg.Text = objContact.insertContact();
        _subBind();
    }

    // Clear textboxes for insert
    protected void Cancel(object sender, EventArgs e)
    {
        txt_contactFnameI.Text = "";
        txt_contactLnameI.Text = "";
        txt_contactEmailI.Text = "";
        txt_contactMessageI.Text = "";
    }



}