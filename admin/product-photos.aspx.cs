using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using Snlg_DataBase;
using System.Data;
using System.Text.RegularExpressions;
using System.Linq;

public partial class admin_urun_resimleri : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            BindGrdView();
        }
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen resimler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    //seçilen resimleri tablodan al sonra sil sonra da varsayılan resim (silindiyse) başka resim tanımla
                    using (SqlDataReader sdr = vt.DBReaderOlustur(@"
SELECT Resim FROM snlg_V1.TblUrunResim WHERE ResimId IN (" + Request.Form["HdnSil"] + @") AND UrunId=@UrunId;               
DELETE FROM snlg_V1.TblUrunResim WHERE ResimId IN (" + Request.Form["HdnSil"] + @") AND UrunId=@UrunId;               
UPDATE snlg_V1.TblUrunApp SET Resim = (SELECT TOP (1) Resim FROM snlg_V1.TblUrunResim WHERE (UrunId = @UrunId)) 
    WHERE (UrunId = @UrunId) 
        AND NOT EXISTS(SELECT TUA.UrunId FROM snlg_V1.TblUrunApp AS TUA 
                                            INNER JOIN snlg_V1.TblUrunResim AS TUR ON TUA.UrunId = TUR.UrunId AND TUA.Resim = TUR.Resim 
                        WHERE (TUA.UrunId = @UrunId));", CommandType.Text, new Snlg_DBParameter[1] { new Snlg_DBParameter("@UrunId", SqlDbType.Int, Request.QueryString["uid"]) }))
                    {
                        //while (sdr.Read())
                        //    try
                        //    {
                        //        File.Delete(Server.MapPath("~/uploads/urun/u_" + sdr["Resim"].ToString()));
                        //        File.Delete(Server.MapPath("~/uploads/urun/k_u_" + sdr["Resim"].ToString()));
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
                Snlg_Hata.ziyaretci.HataGosterBasarili("Seçilen resimler silindi.", true);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }


        if (Request.QueryString["uid"] != null)
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            SqlDataReader SDRUrunBilgisi = vt.DBReaderOlustur("SELECT * FROM  snlg_V1.TblUrunDetay WHERE UrunId=@UrunId", CommandType.Text, new Snlg_DBParameter[1] { new Snlg_DBParameter("@UrunId", SqlDbType.Int, Request.QueryString["uid"]) });

            if (SDRUrunBilgisi.Read())
            {
                LblUrunAdi.Text = SDRUrunBilgisi["UrunAd"].ToString();
            }
            vt.Kapat();
        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.QueryString["uid"]))
            Response.Redirect("products.aspx", true);

    }

    protected void BtnSaveImage_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            return;
        
        try
        {
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
            DBPrms[0] = new Snlg_DBParameter("@UrunId", SqlDbType.Int, Request.QueryString["uid"]);
            DBPrms[1] = new Snlg_DBParameter("@Resim", SqlDbType.VarChar, HdnImg.Value);

            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            vt.SorguCalistir("snlg_V1.msp_UrunResimEkle", CommandType.StoredProcedure, DBPrms);
            vt.Kapat();
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
        }
    }
    protected void LinkDefault_Command(object sender, CommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
            return;

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        try
        {
            vt.SorguCalistir("UPDATE snlg_V1.TblUrunApp SET Resim = (SELECT Resim FROM snlg_V1.TblUrunResim WHERE ResimId=@ResimId) WHERE UrunId = @UrunId", CommandType.Text, new Snlg_DBParameter[2] { new Snlg_DBParameter("@UrunId", SqlDbType.Int, Request.QueryString["uid"]), new Snlg_DBParameter("@ResimId", SqlDbType.Int, e.CommandArgument.ToString()) });
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        vt.Kapat();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Vitrin resmi kaydedildi.", true);
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    private void BindGrdView()
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string sqlSorgu = string.Format(@"SELECT * FROM snlg_V1.TblUrunResim WHERE UrunId={0} ORDER BY Sira ASC",Request.QueryString["uid"].ToString());
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
        string sorgu = string.Format("UPDATE snlg_V1.TblUrunResim SET Sira={0} WHERE ResimId = {1}", sira, id);
        vt.SorguCalistir(sorgu, System.Data.CommandType.Text);

    }
    
}
