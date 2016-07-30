using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Linq;

public partial class admin_urunler : Snlg_AdminBaseClass
{
    protected DataTable _DTKtgler;
    protected DataTable DTKtgler
    {
        get
        {
            if (_DTKtgler == null)
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                _DTKtgler = vt.DataTableOlustur("SELECT TMA.KtgId, TMA.UstId, TMA.Sira, TMA.Resim, TMA.Aktif, TMI.KtgAd FROM snlg_V1.TblUrunKtgApp AS TMA LEFT OUTER JOIN snlg_V1.TblUrunKtgDetay AS TMI ON TMA.KtgId = TMI.KtgId AND TMI.Dil = " + Snlg_ConfigValues.defaultLangId, CommandType.Text);
                vt.Kapat();
                _DTKtgler.PrimaryKey = new DataColumn[] { _DTKtgler.Columns["KtgId"] };
            }
            return _DTKtgler;
        }
        set { _DTKtgler = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {//ust kategori için ddl dolduruluyor
            DDLKtg.Items.Clear();
            DDLKtg.Items.Add(new ListItem("Tüm Kategorileri Göster", ""));
            DDLDoldur(DTKtgler.Select("UstId IS NULL"), "", null, DDLKtg);
        }
        else
            GridSayfala(GVUrun, "Sayfalama");


        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    using (SqlDataReader Sdr = vt.DBReaderOlustur("snlg_V1.msp_UrunSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@UrunId", SqlDbType.VarChar, Request.Form["HdnSil"]) }))
                    {
                        //if (Sdr.Read())
                        //    foreach (string resim in Sdr[0].ToString().TrimEnd(',').Split(','))
                        //    {
                        //        try
                        //        {
                        //            File.Delete(Server.MapPath("~/uploads/urun/k_u_" + resim.Trim()));
                        //            File.Delete(Server.MapPath("~/uploads/urun/u_" + resim.Trim()));
                        //        }
                        //        catch { }
                        //    }
                    }
                    HdnHataTur.Value = "basarili";
                    HdnHata.Value = "Seçtiğiniz ürünler silindi.";
                    GVUrun.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    HdnHataTur.Value = "hatali";
                    HdnHata.Value = "Beklenmeyen bir hata oluştu.";
                }
                vt.Kapat();
            }
        }

    }

    protected void DDLDoldur(DataRow[] drc, string alt, string secilenUst, DropDownList ddl)
    {
        foreach (DataRow dr in drc)
        {
            ListItem li = new ListItem(alt + " " + dr["KtgAd"].ToString(), dr["KtgId"].ToString());

            //seçilen kategori hangi kategorinin içindeyse o seçili olarak gelsin.
            if (secilenUst == dr["KtgId"].ToString())
                li.Selected = true;
            ddl.Items.Add(li);
            DDLDoldur(DTKtgler.Select("UstId = " + dr["KtgId"].ToString()), alt + ":::", li.Value, ddl);
        }
    }

    protected void BtnAraKapat_Click(object sender, EventArgs e)
    {
        TBUA.Text = "";
        TBUK.Text = "";
        SdsUrun.FilterExpression = "1=1";
        GVUrun.SelectedIndex = -1;
    }
    protected void BtnAra_Click(object sender, EventArgs e)
    {
        FiltreUygula();
    }
    protected void FiltreUygula()
    {
        GVUrun.SelectedIndex = -1;

        string filtre = "1=1";
        if (!string.IsNullOrEmpty(TBUK.Text))
            filtre += " AND UrunKodu LIKE '%" + TBUK.Text + "%' ";
        if (!string.IsNullOrEmpty(TBUA.Text))
            filtre += " AND UrunAd LIKE '%" + TBUA.Text + "%' ";


        SdsUrun.FilterExpression = filtre;
    }
    protected void GVUrun_Sorted(object sender, EventArgs e)
    {
        FiltreUygula();
    }
    protected void DDLKtg_SelectedIndexChanged(object sender, EventArgs e)
    {
        FiltreUygula();
    }
    
    protected void GVUrun_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVUrun, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    
    protected void lnkBtnKaydet_Click(object sender, EventArgs e)
    {
        try
        {
            int[] IDDegeri = (from p in Request.Form["id"].Split(',')
                              select int.Parse(p)).ToArray();
            int sira = 1;
            foreach (int id in IDDegeri)
            {
                this.SiralamaGuncelle(id, sira);
                sira += 1;
            }

        }
        catch (Exception)
        {}
      
        Response.Redirect(Request.Url.AbsolutePath);
    }
    private void SiralamaGuncelle(int id, int sira)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string sorgu = string.Format("UPDATE snlg_V1.TblUrunApp SET Sira={0} WHERE UrunId = {1}", sira, id);
        vt.SorguCalistir(sorgu, System.Data.CommandType.Text);

    }

    protected void txtFiyat_TextChanged(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            return;
        try
        {
            
            TextBox txtFiyat = (TextBox)sender;
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            string id = GVUrun.DataKeys[index].Value.ToString();

            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            vt.Ac();
            int silinen = vt.SorguCalistir("UPDATE snlg_V1.TblUrunApp SET Fiyat = @fiyat WHERE UrunId = @id ",
                System.Data.CommandType.Text, new Snlg_DBParameter[2] { new Snlg_DBParameter("@fiyat", SqlDbType.Decimal, txtFiyat.Text), new Snlg_DBParameter("@id", SqlDbType.SmallInt, id) });
            vt.Kapat();
        }
        catch (Exception)
        {
            
        }
       
      
    }

    protected void DDLKtg_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (DDLKtg.SelectedIndex!=0)
        {
            sirala.Visible = true;
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            string sqlSorgu = string.Format(@"SELECT  TblUrunApp.UrunId, TblUrunApp.Sira, TblUrunDetay.UrunAd,TblUrunApp.Resim AS DefaultResim,TblUrunApp.Fiyat,
	                                            TblUrunApp.Gorunurluk, TblUrunApp.UrunKodu
	                                            FROM    snlg_V1.TblUrunApp INNER JOIN
                                                          snlg_V1.TblUrunDetay ON TblUrunApp.UrunId = TblUrunDetay.UrunId INNER JOIN
                                                           snlg_V1.TblUrun_Kategori ON TblUrunApp.UrunId = TblUrun_Kategori.UrunId
	                                            WHERE   (TblUrunDetay.Dil ={0}) AND (TblUrun_Kategori.KtgId ={1})
	                                            ORDER BY TblUrunApp.Sira ASC", Snlg_ConfigValues.defaultLangId, DDLKtg.SelectedValue);
            GrdSiralama.DataSource = vt.DataTableOlustur(sqlSorgu, System.Data.CommandType.Text);
            GrdSiralama.DataBind();
        }
        else
        {
            GrdSiralama.DataSource = null;
            GrdSiralama.DataBind();
            sirala.Visible = false;
        }
       
    }
}