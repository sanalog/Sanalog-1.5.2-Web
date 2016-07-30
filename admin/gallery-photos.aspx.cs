using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using System;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Data;
using System.Linq;

public partial class admin_galeridekiresimler : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            GridSayfala(GVResim, "Sayfalama");
        else if (string.IsNullOrEmpty(Request.QueryString["gid"]))
            Response.Redirect("photo-galleries.aspx");

        if (!IsPostBack)
        {
            BindGrdView();
        }


        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {

                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                //using (SqlDataReader sdr = vt.DBReaderOlustur("SELECT Resim FROM snlg_V1.TblResimGaleriResimlerApp WHERE RId IN (" + Request.Form["HdnSil"] + ")", CommandType.Text))
                //{
                //    while (sdr.Read())
                //    {
                //        try
                //        {
                //            File.Delete(Server.MapPath("~" + sdr["Resim"].ToString()));
                //            File.Delete(Server.MapPath("~" + sdr["Resim"].ToString()));
                //        }
                //        catch { }
                //    }
                //}
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblResimGaleriResimlerApp WHERE RId IN (" + Request.Form["HdnSil"] + ")", CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz resimler silindi.", false);
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
                GVResim.DataBind();
            }
        }
    }
    protected void GVResim_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVResim, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void BtnSaveImage_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            return;
        try
        {
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];
            DBPrms[0] = new Snlg_DBParameter("@Bilgi", SqlDbType.NVarChar, "");
            DBPrms[1] = new Snlg_DBParameter("@GId", SqlDbType.Int, Request.QueryString["gid"]);
            DBPrms[2] = new Snlg_DBParameter("@Baslik", SqlDbType.NVarChar, "");
            DBPrms[3] = new Snlg_DBParameter("@Resim", SqlDbType.VarChar, HdnImg.Value);
            DBPrms[4] = new Snlg_DBParameter("@LinkUrl", SqlDbType.VarChar, "");

            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            vt.SorguCalistir("snlg_V1.msp_GaleriResimEkle", CommandType.StoredProcedure, DBPrms);
            vt.Kapat();
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
        }
    }
  
    private void BindGrdView()
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string sqlSorgu = string.Format(@"select *  from snlg_V1.TblResimGaleriResimlerApp WHERE GId={0} ORDER BY Sira ASC", Request.QueryString["gid"].ToString());
        GrdSiralama.DataSource = vt.DataTableOlustur(sqlSorgu, System.Data.CommandType.Text);
        GrdSiralama.DataBind();
    }
    protected void lnkBtnKaydet_Click(object sender, EventArgs e)
    {
        int[] IDDegeri = (from p in Request.Form["id"].Split(',')
                          select int.Parse(p)).ToArray();
        int sira = 1;
        foreach (int id in IDDegeri)
        {
            this.SiralamaGuncelle(id, sira);
            sira += 1;
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }
    private void SiralamaGuncelle(int id, int sira)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string sorgu = string.Format("UPDATE snlg_V1.TblResimGaleriResimlerApp SET Sira={0} WHERE RId = {1}", sira, id);
        vt.SorguCalistir(sorgu, System.Data.CommandType.Text);

    }
}