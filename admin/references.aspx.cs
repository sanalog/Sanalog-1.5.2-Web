using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using System;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;

public partial class admin_referanslar : Snlg_AdminBaseClass
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {//ust kategori için ddl dolduruluyor

            DDLKtg.Items.Clear();
            DDLKtg.Items.Add(new ListItem("Tüm Kategorileri Göster", ""));
            DataTable dt = new DataTable();
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            dt = vt.DataTableOlustur("SELECT snlg_V1.TblReferansKtgApp.KtgId, snlg_V1.TblReferansKtgDetay.KtgAd FROM snlg_V1.TblReferansKtgApp LEFT OUTER JOIN snlg_V1.TblReferansKtgDetay ON snlg_V1.TblReferansKtgApp.KtgId = snlg_V1.TblReferansKtgDetay.KtgId AND snlg_V1.TblReferansKtgDetay.Dil= " + Snlg_ConfigValues.defaultLangId, CommandType.Text);
            foreach (DataRow dr in dt.Rows)
            {
                DDLKtg.Items.Add(new ListItem(dr["KtgAd"].ToString(), dr["KtgId"].ToString()));
            }
            vt.Kapat();
        }
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    using (SqlDataReader Sdr = vt.DBReaderOlustur("snlg_V1.msp_ReferansSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@RId", SqlDbType.VarChar, Request.Form["HdnSil"]) }))
                    {
                        //if (Sdr.Read())
                        //    try
                        //    {
                        //        foreach (string resim in Sdr[0].ToString().TrimEnd(',').Split(','))
                        //            File.Delete(Server.MapPath("~/uploads/referans/rf_" + resim));
                        //    }
                        //    catch { }
                    }
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz referanslar silindi.", false);
                    GVResim.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }

            
        }
      
    }
    
    protected void SDSResim_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void GVResim_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVResim, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
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
        string sorgu = string.Format("UPDATE snlg_V1.TblReferansApp SET Sira={0} WHERE RId = {1}", sira, id);
        vt.SorguCalistir(sorgu, System.Data.CommandType.Text);

    }
    
    public void BindGrvd(string id)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string sqlSorgu = string.Format("SELECT * FROM snlg_V1.TblReferansApp WHERE KtgId = {0} ORDER BY Sira ASC", DDLKtg.SelectedValue);
        GrdSiralama.DataSource = vt.DataTableOlustur(sqlSorgu, System.Data.CommandType.Text);
        GrdSiralama.DataBind();
    }
    protected void DDLKtg_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLKtg.SelectedIndex!=0)
        {
            siralama.Visible = true;
            BindGrvd(DDLKtg.SelectedValue);
        }
        else
        {
            siralama.Visible = false;

        }
        
    }
}