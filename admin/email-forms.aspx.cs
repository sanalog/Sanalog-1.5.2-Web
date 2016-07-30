using System.Web.UI;
using System.IO;
using System.Data;
using System.Text.RegularExpressions;
using Snlg_DataBase;
using System.Data.SqlClient;
using System;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class admin_varsayilan_epostalar : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Delete"))
        {
            if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
            {//seçilen değerler varsa siliniyor
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("snlg_V1.msp_EPostaSablonSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@EPId", SqlDbType.VarChar, Request.Form["HdnSil"])});
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz e-posta şablonu silindi.", false);
                    GV.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }
        else
        {
            Snlg_Hata.ziyaretci.HataGosterHatali("Bu işlemi yapmak için yetkili değilsiniz.", false);
            return;
        }

        if (IsPostBack)
            GridSayfala(GV, "Sayfalama");
    }

    protected void GV_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GV, "Sayfalama");
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
}