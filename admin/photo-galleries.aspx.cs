using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using Snlg_DataBase;
using System.Data;
using System.Text.RegularExpressions;
using System.Drawing;

public partial class admin_resimgalerileri : Snlg_AdminBaseClass
{
    protected void TBGal_TextChanged(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            try
            {
                GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
                GVGal.UpdateRow(satir.RowIndex, true);
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    using (SqlDataReader sdr = vt.DBReaderOlustur("SELECT Resim FROM snlg_V1.TblResimGaleriResimlerApp WHERE GId IN (" + Request.Form["HdnSil"] + "); DELETE FROM snlg_V1.TblResimGaleriApp WHERE GId IN (" + Request.Form["HdnSil"] + ") ;", CommandType.Text))
                    {
                        //while (sdr.Read())
                        //    try
                        //    {
                        //        File.Delete(Server.MapPath("~" + sdr["Resim"].ToString()));
                        //        File.Delete(Server.MapPath("~" + sdr["Resim"].ToString()));
                        //    }
                        //    catch { }
                    }
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
                }
                vt.Kapat();
                Snlg_Hata.ziyaretci.HataGosterBasarili("Seçilen galeriler silindi.", true);
                Response.Redirect(Request.Url.AbsolutePath);
            }
        }

        GridSayfala(GVGal, "Sayfalama");
    }

    protected void GVGal_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVGal, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
            
    }
    protected void SdsRGal_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            e.Cancel = true;
    }
}
