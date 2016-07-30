using System.Web.UI.WebControls;
using System;
using System.Web.UI;
using System.Drawing;

public partial class admin_sablonlar : Snlg_AdminBaseClass
{
    protected void SdsSbl_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (e.Exception.Message.Contains("DELETE statement conflicted"))
            {
                HdnHataTur.Value = "alert alert-danger";
                HdnHata.Value = "Bu şablon başka bir sayfa tarafından kullanıldığı için silinemez. Silme için bu şablonu kullanan sayfaları başka bir şablona aktarmalısınız.";
            }
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
                HdnHataTur.Value = "alert alert-danger";
                HdnHata.Value = "Beklenmeyen bir hata oluştu.";
            }
        }
        else
        {
            HdnHataTur.Value = "alert alert-success";
            HdnHata.Value = "Şablon silindi.";
        }
    }
    protected void SdsSbl_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            HdnHataTur.Value = "alert alert-success";
            HdnHata.Value = "Şablon oluşturuldu.";
            GvSbl.DataBind();
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
                GvSbl.UpdateRow(satir.RowIndex, true);
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
                GvSbl.UpdateRow(satir.RowIndex, true);
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
            GridSayfala(GvSbl, "Sayfalama");
    }
    protected void GvSbl_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GvSbl, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void SdsSbl_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }
    protected void SdsSbl_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            e.Cancel = true;
    }
}
