using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Snlg_DataBase;
using System.Data;
using System.Linq;

public partial class admin_proje_alt_bilgileri : Snlg_AdminBaseClass
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrdView();
        }
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("snlg_V1.msp_ProjeAltBilgiSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@ProjeAltId", SqlDbType.VarChar, Request.Form["HdnSil"])  });
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz proje sayfaları silindi.", false);
                    GVIcerikler.DataBind();
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
            GridSayfala(GVIcerikler, "Sayfalama");
    }

    protected void GVIcerikler_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVIcerikler, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }

    protected void DDLPrj_DataBound(object sender, EventArgs e)
    {
        try
        {
            DDLPrj.SelectedValue = Request.QueryString["pid"];
            GVIcerikler.DataBind();
        }
        catch { }
    }

    private void BindGrdView()
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string sqlSorgu = string.Format(@"SELECT  TblProjeAltBilgiApp.ProjeAltId, TblProjeAltBilgiApp.Sira, TblProjeAltBilgiDetay.Baslik,
                                            TblProjeAltBilgiApp.Gorunurluk, TblProjeAltBilgiDetay.SeoUrl
                                            FROM    snlg_V1.TblProjeAltBilgiApp INNER JOIN
                                                        snlg_V1.TblProjeAltBilgiDetay ON TblProjeAltBilgiApp.ProjeAltId = TblProjeAltBilgiDetay.ProjeAltId INNER JOIN
                                                        snlg_V1.TblProjeDetay ON TblProjeAltBilgiApp.ProjeId = TblProjeDetay.ProjeId
                                            WHERE   (TblProjeAltBilgiDetay.Dil = {0}) ORDER BY TblProjeAltBilgiApp.Sira ASC", Snlg_ConfigValues.defaultLangId);
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
        Response.Redirect(Request.Url.AbsolutePath);
    }
    private void SiralamaGuncelle(int id, int sira)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string sorgu = string.Format("UPDATE snlg_V1.TblProjeAltBilgiApp SET Sira={0} WHERE ProjeAltId = {1}", sira, id);
        vt.SorguCalistir(sorgu, System.Data.CommandType.Text);

    }
}