using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Data;
using System;
using System.Drawing;

public partial class admin_uyeler : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (IsPostBack)
            GridSayfala(GVUye, "Sayfalama");

        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    object resimler = vt.ScalarSorguCalistir("snlg_V1.msp_UyeSil", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Uyeler", SqlDbType.VarChar, Request.Form["HdnSil"]), new Snlg_DBParameter("@AdminId", SqlDbType.VarChar, Snlg_ConfigValues.AdminId)  });
                    try
                    {
                        foreach (string resim in resimler.ToString().TrimEnd(',').Split(','))
                            File.Delete(Server.MapPath("~/uploads/user/" + resim));
                    }
                    catch { }
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz üyeler silindi.", false);
                    GVUye.DataBind();
                }
                catch (Exception exc)
                {
                    if (exc.Message.Contains("$#sqlhata1#$"))
                        Snlg_Hata.ziyaretci.HataGosterHatali("Bu kullanıcı yönetici olarak tanımlanmıştır, silinemez.", false);
                    else
                    {
                        Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                        Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                    }
                }
                vt.Kapat();
            }
        }
    }
    protected void GVUye_DataBound(object sender, System.EventArgs e)
    {
        GridSayfala(GVUye, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
}