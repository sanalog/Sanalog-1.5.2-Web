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

public partial class admin_Makaleler : Snlg_AdminBaseClass
{
    protected DataTable _DTMakKtgler;
    protected DataTable DTMakKtgler
    {
        get
        {
            if (_DTMakKtgler == null)
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                _DTMakKtgler = vt.DataTableOlustur("SELECT TMA.KtgId, TMA.UstId, TMA.Sira, TMA.Resim, TMA.Aktif, TMI.KtgAd FROM snlg_V1.TblMakaleKtgApp AS TMA LEFT OUTER JOIN snlg_V1.TblMakaleKtgDetay AS TMI ON TMA.KtgId = TMI.KtgId AND TMI.Dil = " + Snlg_ConfigValues.defaultLangId, CommandType.Text);
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
                    using (SqlDataReader Sdr = vt.DBReaderOlustur("snlg_V1.msp_MakaleSil", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@MakId", SqlDbType.VarChar, Request.Form["HdnSil"])}))
                    {
                    }
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz makaleler silindi.", false);
                    
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
    
}