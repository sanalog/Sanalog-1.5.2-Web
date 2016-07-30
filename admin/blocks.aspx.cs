using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Drawing;

public partial class admin_bloklar : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", "").Replace("-", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblUCApp WHERE UCId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz bloklar silindi.", false);
                    GVSyf.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
            else
            {
                Snlg_Hata.ziyaretci.HataGosterHatali("Bu işlemi yapmak için yetkili değilsiniz.", false);
                return;
               
            }
        }

        if (IsPostBack)
            GridSayfala(GVSyf, "Sayfalama");
    }

    protected void GVSyf_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVSyf, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
}
