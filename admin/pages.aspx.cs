using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class admin_pages : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("snlg_V1.msp_SayfaSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@SayfaId", SqlDbType.VarChar, Request.Form["HdnSil"]) });
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz sayfalar silindi.", false);

                    Response.Redirect(Request.Url.AbsolutePath);
                }
                catch (Exception exc)
                {
                    //Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    //Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }
        else
        {
            GridSayfala(GVSyf, "Sayfalama");
        }


    }

    protected void GVSyf_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVSyf, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }


}
