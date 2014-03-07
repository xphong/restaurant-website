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
            if (!IsPostBack)
            {
                _subBind();
                _subBindDataList();
            }
        }

        // Page Load Complete: Sets Heading in master file
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            Master.pp_heading = "Content Admin";
            Master.pp_masterTitle = "Phong's Restaurant - Content";
        }

        // Subroutine to bind formview
        private void _subBind()
        {
            contentClass objContent = new contentClass();
            fmv_content.DataSource = objContent.getContent();
            fmv_content.DataBind();
        }

        private void _subBindDataList()
        {
            contentClass objContent = new contentClass();
            dtl_content.DataSource = objContent.getContent();
            dtl_content.DataBind();
        }
        
        // rebinds when the formview mode is changed
        protected void contentModeChanging(object sender, FormViewModeEventArgs e)
        {
            fmv_content.ChangeMode(e.NewMode);
            _subBind();
            _subBindDataList();
        }
        
        // rebinds when the next/previous button is clicked
        protected void contentPageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            fmv_content.PageIndex = e.NewPageIndex;
            _subBind();
            _subBindDataList();
        }

        // inserts new content
        protected void contentItemInserting(object sender, FormViewInsertEventArgs e)
        {
            TextBox txtPage = (TextBox)fmv_content.FindControl("txt_pageI") as TextBox;
            TextBox txtText = (TextBox)fmv_content.FindControl("txt_textI") as TextBox;

            contentClass objContent = new contentClass();
            objContent.ContentPage = txtPage.Text.ToString();
            objContent.ContentText = txtText.Text.ToString();

            lbl_msg.Text = objContent.insertContent();
            fmv_content.ChangeMode(FormViewMode.ReadOnly);
            _subBind();
            _subBindDataList(); // both binds are here to update both data bound controls
        }
        
        // update selected content
        protected void contentItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Label lblID = (Label)fmv_content.FindControl("lbl_idU") as Label;
            TextBox txtPage = (TextBox)fmv_content.FindControl("txt_pageU") as TextBox;
            TextBox txtText = (TextBox)fmv_content.FindControl("txt_textU") as TextBox;

            contentClass objContent = new contentClass();
            objContent.ContentID = Int32.Parse(lblID.Text.ToString());
            objContent.ContentPage = txtPage.Text.ToString();
            objContent.ContentText = txtText.Text.ToString();

            lbl_msg.Text = objContent.updateContent();
            fmv_content.ChangeMode(FormViewMode.ReadOnly); //sends users back to original table view
            _subBind();
            _subBindDataList();
        }
        
        // delete selected content
        protected void contentItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            Label lblID = (Label)fmv_content.FindControl("lbl_id") as Label;
            contentClass objContent = new contentClass();
            objContent.ContentID = Int32.Parse(lblID.Text.ToString());

            lbl_msg.Text = objContent.deleteContent();
            fmv_content.ChangeMode(FormViewMode.ReadOnly); //sends users back to original table view
            _subBind();
            _subBindDataList();

        }

        // rebind table to edit selected row
        protected void dtl_contentEdit(object sender, DataListCommandEventArgs e)
        {
            dtl_content.EditItemIndex = (int)e.Item.ItemIndex;
            _subBind();
            _subBindDataList();
        }
        
        // rebinds tables when user clicks cancel
        protected void dtl_contentCancel(object sender, DataListCommandEventArgs e)
        {
            dtl_content.EditItemIndex = -1;
            _subBind();
            _subBindDataList();
        }

        // delete selected content row
        protected void dtl_contentDelete(object sender, DataListCommandEventArgs e)
        {
            Label lblID = (Label)e.Item.FindControl("lbl_id");
            contentClass objContent = new contentClass();
            objContent.ContentID = Int32.Parse(lblID.Text.ToString());

            lbl_msg2.Text = objContent.deleteContent();
            _subBind();
            _subBindDataList();
        }

        // update selected content row
        protected void dtl_contentUpdate(object sender, DataListCommandEventArgs e)
        {
            Label lblID = (Label)e.Item.FindControl("lbl_idU") as Label;
            TextBox txtPage = (TextBox)e.Item.FindControl("txt_pageU") as TextBox;
            TextBox txtText = (TextBox)e.Item.FindControl("txt_textU") as TextBox;

            contentClass objContent = new contentClass();
            objContent.ContentID = Int32.Parse(lblID.Text.ToString());
            objContent.ContentPage = txtPage.Text.ToString();
            objContent.ContentText = txtText.Text.ToString();

            lbl_msg2.Text = objContent.updateContent();

            dtl_content.EditItemIndex = -1; // sends user back to original table iew
            _subBind();
            _subBindDataList();
        }

        // Insert new content for datalist
        protected void InsertContent(object sender, EventArgs e)
        {
            contentClass objContent = new contentClass();
            objContent.ContentPage = txt_pageI.Text.ToString();
            objContent.ContentText = txt_textI.Text.ToString();
            lbl_msg2.Text = objContent.insertContent();
            _subBind();
            _subBindDataList();
        }

        // Clear textboxes for insert
        protected void Cancel(object sender, EventArgs e)
        {
            txt_pageI.Text = "";
            txt_textI.Text = "";
        }


}

