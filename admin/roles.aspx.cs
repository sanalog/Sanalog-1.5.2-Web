using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Drawing;

public partial class admin_roller : Snlg_AdminBaseClass
{
    protected void T1_TextChanged(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            try
            {
                GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
                GVRol.UpdateRow(satir.RowIndex, true);
                HdnHataTur.Value = "basarili";
                HdnHata.Value = "Değişiklikler kaydedildi.";
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                HdnHataTur.Value = "hatali";
                HdnHata.Value = "Beklenmeyen bir hata oluştu.";
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            GridSayfala(GVRol, "Sayfalama");

        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblRoller WHERE RolId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz guruplar silindi.", false);
                    GVRol.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }
    }
    protected void GVRol_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVRol, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void SDSRol_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            e.Cancel = true;
    }
}