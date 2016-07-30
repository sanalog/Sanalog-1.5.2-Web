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

public partial class admin_block_attributes : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.QueryString["ucid"]))
            Response.Redirect("blocks.aspx");

        
    }
    protected void LinkEdit_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            return;
        }

        try
        {
            foreach (GridViewRow satir in GVSyf.Rows)
                if (satir.RowType == DataControlRowType.DataRow)
                    GVSyf.UpdateRow(satir.RowIndex, true);

            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler güncellendi.", false);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }
    protected void SDSSyflar_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            e.Cancel = true;
            return;
        }
    }
    protected void SDSSyflar_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Nitelik silindi.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali(e.Exception.Message.Replace("'", "") + "Beklenmeyen bir hata oluştu.", false);
        }
    }
    protected void SDSSyflar_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }
    }
    protected void SDSSyflar_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Nitelik tanımlandı.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
        GVSyf.DataBind();
    }

}
