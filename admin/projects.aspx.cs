using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Text.RegularExpressions;
using Snlg_DataBase;
using System.Drawing;
using System.Linq;

public partial class admin_Projeler : Snlg_AdminBaseClass
{
    protected DataTable _DTMakKtgler;
    protected DataTable DTMakKtgler
    {
        get
        {
            if (_DTMakKtgler == null)
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                _DTMakKtgler = vt.DataTableOlustur("SELECT TMA.KtgId, TMA.UstId, TMA.Sira, TMA.Resim, TMA.Aktif, TMI.KtgAd FROM snlg_V1.TblProjeKtgApp AS TMA LEFT OUTER JOIN snlg_V1.TblProjeKtgDetay AS TMI ON TMA.KtgId = TMI.KtgId AND TMI.Dil = " + Snlg_ConfigValues.defaultLangId, CommandType.Text);
                vt.Kapat();
                _DTMakKtgler.PrimaryKey = new DataColumn[] { _DTMakKtgler.Columns["KtgId"] };
            }
            return _DTMakKtgler;
        }
        set { _DTMakKtgler = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {//ust kategori için ddl dolduruluyor
            DDLKtg.Items.Clear();
            DDLKtg.Items.Add(new ListItem("Tüm Kategorileri Göster", ""));
            DDLDoldur(DTMakKtgler.Select("UstId IS NULL"), "", null, DDLKtg);
            
        }
        else
            GridSayfala(GVIcerikler, "Sayfalama");

        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    using (SqlDataReader Sdr = vt.DBReaderOlustur("snlg_V1.msp_ProjeSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@ProjeId", SqlDbType.VarChar, Request.Form["HdnSil"]) }))
                    {
                        //if (Sdr.Read())
                        //    try
                        //    {
                        //        foreach (string resim in Sdr[0].ToString().TrimEnd(',').Split(','))
                        //            File.Delete(Server.MapPath("~/uploads/proje/prj_" + resim));
                        //    }
                        //    catch { }
                    }
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz kategoriler silindi.", false);
                    GVIcerikler.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu. " + exc.Message, false);
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
            DDLDoldur(DTMakKtgler.Select("UstId = " + dr["KtgId"].ToString()), alt + ":::", li.Value, ddl);
        }
    }
    protected void GVIcerikler_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVIcerikler, "Sayfalama");
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
        string sorgu = string.Format("UPDATE snlg_V1.TblProjeApp SET Sira={0} WHERE ProjeId = {1}", sira, id);
        vt.SorguCalistir(sorgu, System.Data.CommandType.Text);

    }

    protected void DDLKtg_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            sirala.Visible = true;
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            string sqlSorgu = string.Format(@"SELECT TblProjeApp.ProjeId, TblProjeApp.Sira, TblProjeDetay.Baslik,
	                                        TblProjeApp.Aktif, TblProjeApp.ProjeUrl
                                            FROM    snlg_V1.TblProjeApp INNER JOIN
                                                      snlg_V1.TblProjeDetay ON TblProjeApp.ProjeId = TblProjeDetay.ProjeId LEFT OUTER JOIN
                                                      snlg_V1.TblProje_Kategori ON TblProjeApp.ProjeId = TblProje_Kategori.ProjeId
                                            WHERE(TblProjeDetay.Dil = {0}) AND(TblProje_Kategori.KtgId ={1}) ORDER BY TblProjeApp.Sira ASC", Snlg_ConfigValues.defaultLangId, DDLKtg.SelectedValue);
            GrdSiralama.DataSource = vt.DataTableOlustur(sqlSorgu, System.Data.CommandType.Text);
            GrdSiralama.DataBind();
        }
        catch (Exception)
        {
            GrdSiralama.DataSource = null;
            GrdSiralama.DataBind();

            sirala.Visible = false;
        }
       

      

    }
}