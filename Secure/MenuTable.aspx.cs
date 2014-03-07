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

public partial class Secure_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Menu Table Admin";
        Master.pp_masterTitle = "Phong's Restaurant - Menu Table";
    }


    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                menuClass objMenu = new menuClass();
                objMenu.MenuFood = txt_foodI.Text.ToString();
                objMenu.MenuDescription = txt_descI.Text.ToString();
                objMenu.MenuPrice = Convert.ToDecimal(txt_priceI.Text.ToString());
                lbl_msg.Text = objMenu.insertMenu();
                _subRebind();
                break;
            case "Update":
                _showUpdate(e.CommandArgument.ToString());
                break;
            case "Delete":
                _showDelete(e.CommandArgument.ToString());
                break;
            case "Cancel":
                txt_foodI.Text = string.Empty;
                txt_descI.Text = string.Empty;
                txt_priceI.Text = string.Empty;
                break;
        }
    }

    protected void subUpdate(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtFood = (TextBox)e.Item.FindControl("txt_foodU");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");
                TextBox txtPrice = (TextBox)e.Item.FindControl("txt_priceU");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");

                menuClass objMenu = new menuClass();

                objMenu.MenuID = Int32.Parse(hdfID.Value.ToString());
                objMenu.MenuFood = txtFood.Text.ToString();
                objMenu.MenuDescription = txtDesc.Text.ToString();
                objMenu.MenuPrice = Convert.ToDecimal(txtPrice.Text.ToString());

                lbl_msg.Text = objMenu.updateMenu();
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    protected void subDelete(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Delete":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                menuClass objMenu = new menuClass();
                objMenu.MenuID = Int32.Parse(hdfID.Value.ToString());
                lbl_msg.Text = objMenu.deleteMenu();
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    private void _showUpdate(string id)
    {
        _PanelControl(pnl_update);
        menuClass objMenu = new menuClass();
        rpt_update.DataSource = objMenu.getMenuByID(Int32.Parse(id));
        rpt_update.DataBind();
    }


    private void _showDelete(string id)
    {
        _PanelControl(pnl_delete);
        menuClass objMenu = new menuClass();
        rpt_delete.DataSource = objMenu.getMenuByID(Int32.Parse(id));
        rpt_delete.DataBind();
    }

    private void _PanelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_update.Visible = false;
        pnl_delete.Visible = false;
        pnl.Visible = true;
    }

    private void _subRebind()
    {
        txt_foodI.Text = string.Empty;
        txt_descI.Text = string.Empty;
        txt_priceI.Text = string.Empty;
        menuClass objMenu = new menuClass();
        rpt_all.DataSource = objMenu.getMenu();
        rpt_all.DataBind();
        _PanelControl(pnl_all);

    }


}