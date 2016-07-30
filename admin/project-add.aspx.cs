using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Web.UI;
using Snlg_DataBase;

public partial class admin_projeekle : Snlg_AdminBaseClass
{
    protected string resimAdi = "";
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
        if (Request.QueryString["projeid"] == null && !Page.IsPostBack)
            FVIcerik.ChangeMode(FormViewMode.Insert);
    }

    protected void SDSPrj_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //seçilen kategorilerr için sql hazrılanıyor
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }


        string ktgSql = "";
        ListBox lb = (ListBox)FVIcerik.FindControl("ListKtg");
        foreach (ListItem item in lb.Items)
            if (item.Selected)
                ktgSql += string.Format("INSERT INTO snlg_V1.TblProje_Kategori (ProjeId, KtgId) VALUES (@ProjeId, {0}); ", item.Value);
        e.Command.Parameters["@KtgSql"].Value = ktgSql;
    }

    protected void SDSPrj_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Proje oluşturuldu.", true);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }

    protected void SDSPrj_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            e.Cancel = true;


        //seçilen kategorilerr için sql hazrılanıyor
        string ktgSql = "";
        ListBox lb = (ListBox)FVIcerik.FindControl("ListKtg");
        foreach (ListItem item in lb.Items)
            if (item.Selected)
                ktgSql += string.Format("INSERT INTO snlg_V1.TblProje_Kategori (ProjeId, KtgId) VALUES (@ProjeId, {0}); ", item.Value);
        e.Command.Parameters["@KtgSql"].Value = ktgSql;
    }

    protected void SDSPrj_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

    protected void SDSPrj_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki proje içeriği silindi.", false);
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
            ListDoldur(DTMakKtgler.Select("UstId = " + dr["KtgId"].ToString()), alt + ":::", Listbox);
        }
    }

    protected void FVIcerik_DataBound(object sender, EventArgs e)
    {
        if (FVIcerik.CurrentMode == FormViewMode.ReadOnly)
            return;

        ListBox lb = (ListBox)FVIcerik.FindControl("ListKtg");
        lb.Items.Clear();
        ListDoldur(DTMakKtgler.Select("UstId IS NULL"), null, lb);

        if (FVIcerik.CurrentMode == FormViewMode.Edit)
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            SqlDataReader SDRKtgler = vt.DBReaderOlustur("SELECT ProjeId, KtgId FROM snlg_V1.TblProje_Kategori WHERE ProjeId = " + Request.QueryString["projeid"], CommandType.Text);
            while (SDRKtgler.Read())
                try { lb.Items.FindByValue(SDRKtgler["KtgId"].ToString()).Selected = true; }
                catch { }

            SDRKtgler.Close();
            vt.Kapat();

            DropDownList DDLLinks = (DropDownList)FVIcerik.FindControl("DDLLinks");
            foreach (ListItem item in DDLLinks.Items)
                item.Text += Snlg_ConfigValues.urlExtension;
        }
    }

    protected void LinkRSil_Click(object sender, EventArgs e)
    {//resim silniyor.
        if (!YetkiKontrol(pageName + "-Delete"))
            return;

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        int silinen = vt.SorguCalistir("UPDATE snlg_V1.TblProjeApp SET Resim = NULL WHERE ProjeId = @ProjeId ", System.Data.CommandType.Text, new Snlg_DBParameter[] { new Snlg_DBParameter("@ProjeId", SqlDbType.Int, Request.QueryString["projeid"]) });
        vt.Kapat();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
        FVIcerik.DataBind();
    }
    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?projeid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["projeid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
    protected void SDSPrj_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }
}