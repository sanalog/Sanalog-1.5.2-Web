using System.Web.UI.WebControls;
using System;
using System.Web.UI;
using System.Drawing;

public partial class admin_yetkileri_duzenle : Snlg_AdminBaseClass
{
    protected void Sds_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
                HdnHataTur.Value = "alert alert-danger";
                HdnHata.Value = "Beklenmeyen bir hata oluştu.";
            }
        }
    }
    protected void Sds_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            HdnHataTur.Value = "alert alert-danger";
            HdnHata.Value = "Beklenmeyen bir hata oluştu.";
        }
    }
    protected void Sds_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            HdnHataTur.Value = "alert alert-success";
            HdnHata.Value = "Yetki tanımlandı.";
            Gv.DataBind();
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            HdnHataTur.Value = "alert alert-danger";
            HdnHata.Value = "Beklenmeyen bir hata oluştu.";
        }
    }
    protected void TBAd_TextChanged(object sender, System.EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            try
            {
                GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
                Gv.UpdateRow(satir.RowIndex, true);
                HdnHataTur.Value = "alert alert-success";
                HdnHata.Value = "Değişiklikler kaydedildi.";
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                HdnHataTur.Value = "alert alert-danger";
                HdnHata.Value = "Beklenmeyen bir hata oluştu.";
            }
        }
    }
    protected void T1_TextChanged(object sender, System.EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            try
            {
                GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
                Gv.UpdateRow(satir.RowIndex, true);
                HdnHataTur.Value = "alert alert-success";
                HdnHata.Value = "Değişiklikler kaydedildi.";
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                HdnHataTur.Value = "alert alert-danger";
                HdnHata.Value = "Beklenmeyen bir hata oluştu.";
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            GridSayfala(Gv, "Sayfalama");
    }
    protected void Gv_DataBound(object sender, EventArgs e)
    {
        GridSayfala(Gv, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void Sds_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            e.Cancel = true;
            return;
        }
    }
    protected void Sds_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }
    }
}
