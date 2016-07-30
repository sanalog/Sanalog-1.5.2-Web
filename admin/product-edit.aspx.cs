using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Web.UI;
using Snlg_DataBase;
using System.Web;

public partial class admin_urunduzenle : Snlg_AdminBaseClass
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
        if (Request.QueryString["uid"] == null && !Page.IsPostBack)
            FVDetay.ChangeMode(FormViewMode.Insert);

    }

    protected void SdsUrun_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }

        if (e.Command.Parameters["@Detay"].Value != null && e.Command.Parameters["@Detay"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Ürün Detayı 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Detay"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }

        //seçilen kategorilerr için sql hazrılanıyor
        string ktgSql = "";
        ListBox lb = (ListBox)FVDetay.FindControl("ListKtg");
        foreach (ListItem item in lb.Items)
            if (item.Selected)
                ktgSql += string.Format("INSERT INTO snlg_V1.TblUrun_Kategori (UrunId, KtgId) VALUES (@UrunId, {0}); ", item.Value);
        e.Command.Parameters["@KtgSql"].Value = ktgSql;
    }

    protected void SdsUrun_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Ürün kaydedildi.", true);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }

    protected void SdsUrun_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }


        if (e.Command.Parameters["@Detay"].Value != null && e.Command.Parameters["@Detay"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Ürün Detayı 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Detay"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }

        //seçilen kategorilerr için sql hazrılanıyor
        string ktgSql = "";
        ListBox lb = (ListBox)FVDetay.FindControl("ListKtg");
        foreach (ListItem item in lb.Items)
            if (item.Selected)
                ktgSql += string.Format("INSERT INTO snlg_V1.TblUrun_Kategori (UrunId, KtgId) VALUES (@UrunId, {0}); ", item.Value);
        e.Command.Parameters["@KtgSql"].Value = ktgSql;

    }

    protected void SdsUrun_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (Request.Form["HdnYeni"] == "1")
            {
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", true);
                Response.Redirect(Request.Url.AbsolutePath, true);
            }
            else
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void SdsUrun_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki ürün detayı silindi.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void ListDoldur(DataRow[] drc, string alt, ListBox Listbox)
    {
        foreach (DataRow dr in drc)
        {
            ListItem li = new ListItem(alt + " " + dr["KtgAd"].ToString(), dr["KtgId"].ToString());
            Listbox.Items.Add(li);
            ListDoldur(DTKtgler.Select("UstId = " + dr["KtgId"].ToString()), alt + ":::", Listbox);
        }
    }

    protected void FVDetay_DataBound(object sender, EventArgs e)
    {
        if (FVDetay.CurrentMode == FormViewMode.ReadOnly)
            return;
        
        ListBox lb = (ListBox)FVDetay.FindControl("ListKtg");
        lb.Items.Clear();
        ListDoldur(DTKtgler.Select("UstId IS NULL"), null, lb);

        if (FVDetay.CurrentMode == FormViewMode.Edit)
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            SqlDataReader SDRKtgler = vt.DBReaderOlustur("SELECT UrunId, KtgId FROM snlg_V1.TblUrun_Kategori WHERE UrunId = " + Request.QueryString["uid"], CommandType.Text);
            while (SDRKtgler.Read())
                try { lb.Items.FindByValue(SDRKtgler["KtgId"].ToString()).Selected = true; }
                catch { }

            SDRKtgler.Close();

            
            Repeater rpResmler=(Repeater)FVDetay.FindControl("rpResimler");
            DataTable dt = vt.DataTableOlustur("SELECT * FROM snlg_V1.TblUrunResim  WHERE UrunId=" + Request.QueryString["uid"], CommandType.Text);
            rpResmler.DataSource = dt;
            rpResmler.DataBind();
            
            vt.Kapat();
        }
    }

    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?uid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["uid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
    protected void SdsUrun_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }

}