using System.Web.UI;
using System.IO;
using Snlg_DataBase;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;
using System;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class admin_duyurular : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    using (SqlDataReader Sdr = vt.DBReaderOlustur("snlg_V1.msp_DuyuruSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@DuyuruId", SqlDbType.VarChar, Request.Form["HdnSil"]) }))
                    {
                        //if (Sdr.Read())
                        //    try
                        //    {
                        //        foreach (string resim in Sdr[0].ToString().TrimEnd(',').Split(','))
                        //            File.Delete(Server.MapPath("~/uploads/haber/dyr_" + resim));
                        //    }
                        //    catch { }
                    }
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz duyurular silindi.", false);
                    GVHbr.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }

        if (IsPostBack)
            GridSayfala(GVHbr, "Sayfalama");
    }

    protected void GVHbr_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVHbr, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
}