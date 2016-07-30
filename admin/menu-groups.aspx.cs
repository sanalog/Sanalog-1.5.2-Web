using Snlg_DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_menu_groups : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ucid"] == null && !Page.IsPostBack)
            FVIcerik.ChangeMode(FormViewMode.Insert);
    }
    protected void SdsIcerik_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            FVIcerik.ChangeMode(FormViewMode.Insert);
        else
            FVIcerik.ChangeMode(FormViewMode.Edit);
    }
    protected void SdsIcerik_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Yeni menü tanımlandı.", true);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu. " + e.Exception.Message.Replace("'", ""), true);
        }
        Response.Redirect(Request.Url.AbsoluteUri, true);
    }
    protected void SdsIcerik_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
    }
    protected void FVIcerik_DataBound(object sender, EventArgs e)
    {
        if (FVIcerik.CurrentMode == FormViewMode.Insert)
            ((RadioButtonList)FVIcerik.FindControl("RBL1")).SelectedIndex = 0;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }

    protected void SdsIcerik_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            e.Cancel = true;
    }

    protected void SdsIcerik_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
    }

    protected void Sdsicerikler_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }

    protected void Sdsicerikler_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Menü silindi.", false);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
        Response.Redirect(Request.Url.AbsolutePath);
    }

    protected void TBTitle_TextChanged(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            try
            {
                GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
                GVSyf.UpdateRow(satir.RowIndex, true);
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
            }
        }
    }

    protected void RBL1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            try
            {
                GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
                GVSyf.UpdateRow(satir.RowIndex, true);
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
            }
        }
    }
}
