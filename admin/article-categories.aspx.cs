using Snlg_DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_article_categories : Snlg_AdminBaseClass
{
    protected string dil = HttpContext.Current.Request.QueryString["dil"];
    string editetKtgID = HttpContext.Current.Request.QueryString["kid"];
    protected DataTable _DTMakKtgler;
    protected DataTable DTMakKtgler
    {
        get
        {
            if (_DTMakKtgler == null)
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                _DTMakKtgler = vt.DataTableOlustur("SELECT TMA.KtgId, TMA.UstId, TMA.Sira, TMA.Resim, TMA.Aktif, ISNULL(TMI.KtgAd, (SELECT TOP(1) KtgAd FROM snlg_V1.TblMakaleKtgDetay WHERE KtgId = TMA.KtgId AND Dil = " + Snlg_ConfigValues.defaultLangId + ")) AS KtgAd, TMI.SeoUrl FROM snlg_V1.TblMakaleKtgApp AS TMA LEFT OUTER JOIN snlg_V1.TblMakaleKtgDetay AS TMI ON TMA.KtgId = TMI.KtgId AND TMI.Dil = " + dil, CommandType.Text);
                vt.Kapat();
                _DTMakKtgler.PrimaryKey = new DataColumn[] { _DTMakKtgler.Columns["KtgId"] };
            }
            return _DTMakKtgler;
        }
        set { _DTMakKtgler = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(dil))
            dil = Snlg_ConfigValues.defaultLangId;

        if (Request.QueryString["kid"] == null && !Page.IsPostBack)
        {
            FVSyf.ChangeMode(FormViewMode.Insert);
            LblFBas.Text = "Yeni Kategori Oluşturun";
        }
        else
        {
            LblFBas.Text = "Kategori Bilgilerini Düzenleyin";
        }

        if (!Page.IsPostBack)
        {
            //memüler listeleniyor
            StringBuilder SBMenu = new StringBuilder();
            MenuleriDoldur(DTMakKtgler, SBMenu, DTMakKtgler.Select("UstId IS NULL", "Sira"));
            ltrMenu.Text = SBMenu.ToString();

        }

    }

    [WebMethod]
    public static string Siralama_Kaydet(string _siralama)
    {
        StringBuilder SBSorgu = new StringBuilder();
        string[] siralama = _siralama.Replace("liMenu", "").Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
        foreach (string altSira in siralama)
        {
            string[] list = altSira.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < list.Length; i++)
                SBSorgu.AppendFormat("UPDATE snlg_V1.TblMakaleKtgApp SET Sira = {0} WHERE KtgId = {1}; ", i.ToString(), list[i]);
        }
        try
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            vt.SorguCalistir(SBSorgu.ToString(), CommandType.Text);
            vt.Kapat();
            return "Sıralama kaydedildi.";
        }
        catch { return "Beklenmeyen bir hata oluştu..."; }
    }

    protected void SDSSyf_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            FVSyf.ChangeMode(FormViewMode.Insert);
        else
            FVSyf.ChangeMode(FormViewMode.Edit);
    }
    protected void SDSSyf_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Kategori oluşturuldu.", true);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali(e.Exception.Message.Replace("'", "") + "Beklenmeyen bir hata oluştu.", false);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }

    protected void SDSSyf_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

    protected void FVSyf_DataBound(object sender, EventArgs e)
    {
        DropDownList DDLUst = (DropDownList)FVSyf.FindControl("DDLUst");

        //ust Kategori için ddl dolduruluyor
        DDLUst.Items.Clear();
        DDLUst.Items.Add(new ListItem("Ana Kategori Olsun", ""));
        DDLDoldur(DTMakKtgler.Select("UstId IS NULL", "Sira"), "", null, DDLUst);

        DataRow satir = DTMakKtgler.Rows.Find(editetKtgID);
        try
        {
            if (satir == null || string.IsNullOrEmpty(satir["UstId"].ToString()))
                DDLUst.Items.FindByValue("").Selected = true;
            else
                DDLUst.Items.FindByValue(satir["UstId"].ToString()).Selected = true;
        }
        catch { }
    }

    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?kid={0}&Dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["kid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }

    protected void SDSSyf_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki kategori içeriği silindi.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
    }

    protected void SDSSyf_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }

    protected void BtnSil_Click(object sender, EventArgs e)
    {
        //ktg siliniyor
        if (YetkiKontrol(pageName + "-Delete"))
        {
            if (string.IsNullOrEmpty(Request.Form["CBSec"]))
            {
                Snlg_Hata.ziyaretci.HataGosterUyari("Herhangi bir seçim yapmadınız.", false);
                return;
            }


            DTMakKtgler = null;//verilerin son haliyle çekilmesi için önce boşaltılıyor

            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            try
            {
                foreach (string id in Request.Form["CBSec"].Split(",".ToCharArray()))
                {
                    vt.SorguCalistir("snlg_V1.msp_MakaleKtgSil", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@KtgId", SqlDbType.Int, id), new Snlg_DBParameter("@Dil", SqlDbType.Int, dil) });
                }
                Snlg_Hata.ziyaretci.HataGosterBasarili("Kategori kaldırıldı.", false);
            }
            catch (Exception exc)
            {
                if (exc.Message.Contains("FK_snlg_V1.TblMakaleKtgApp_snlg_V1.TblMakaleKtgApp"))
                    Snlg_Hata.ziyaretci.HataGosterHatali("Kategori altında başka Kategoriler bulunduğu için silinemiyor.", false);
                else
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
            }
            vt.Kapat();

            //işlemden sonra veriler dolduruluyor
            //memüler listeleniyor
            StringBuilder SBMenu = new StringBuilder();
            MenuleriDoldur(DTMakKtgler, SBMenu, DTMakKtgler.Select("UstId IS NULL", "Sira"));
            ltrMenu.Text = SBMenu.ToString();

            LblFBas.Text = "Yeni Kategori Oluşturun";


        }
    }
    protected void SDSSyf_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }
        DropDownList DDLUst = (DropDownList)FVSyf.FindControl("DDLUst");
        if (!string.IsNullOrEmpty(DDLUst.SelectedValue))
            e.Command.Parameters["@UstID"].Value = DDLUst.SelectedValue;
    }
    protected void SDSSyf_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }
        DropDownList DDLUst = (DropDownList)FVSyf.FindControl("DDLUst");
        if (!string.IsNullOrEmpty(DDLUst.SelectedValue))
            e.Command.Parameters["@UstID"].Value = DDLUst.SelectedValue;
    }
    protected void DDLDoldur(DataRow[] drc, string alt, string secilenUst, DropDownList ddl)
    {
        foreach (DataRow dr in drc)
        {
            //seçilen Kategorinin altındaki Kategorileri listelemesin sonrakine geçsin.
            if (dr["KtgId"].ToString() == editetKtgID)
                continue;

            ListItem li = new ListItem(alt + " " + dr["KtgAd"].ToString(), dr["KtgId"].ToString());
            //seçilen Kategori hangi Kategorinin içindeyse o seçili olarak gelsin.
            if (secilenUst == dr["KtgId"].ToString())
                li.Selected = true;
            ddl.Items.Add(li);
            DDLDoldur(DTMakKtgler.Select("UstId = " + dr["KtgId"].ToString(), "Sira"), alt + ":::", li.Value, ddl);
        }
    }
    protected void MenuleriDoldur(DataTable DTMenu, StringBuilder SBMenu, DataRow[] DRC)
    {
        for (int i = 0; i < DRC.Length; i++)
        {
            DataRow[] subMenus = DTMenu.Select("UstId = " + DRC[i]["KtgID"].ToString(), "Sira");

            SBMenu.AppendFormat("<li id='liMenu{0}'>", DRC[i]["KtgID"].ToString());

            string link = "";
            if (!string.IsNullOrEmpty(DRC[i]["KtgAd"].ToString()))
                link = string.Format(@"<span><b>{0}</b></span>", DRC[i]["KtgAd"].ToString());
            else
                link = @"<i class='fa fa-plus'></i>";


            if (subMenus.Length > 0)
            {
                SBMenu.AppendFormat(@"
                                <div class='accordion-heading'>
                                    <i class='fa fa-long-arrow-up'></i><i class='fa fa-long-arrow-down'></i>
                                    <a href='?kid={0}&Dil={2}'>{4}</a>
                                </div>
                                <ul class='nav nav-list collapsed collapse in' id='menu{0}'>
                            ", DRC[i]["KtgID"].ToString(), DRC[i]["KtgAd"].ToString(), Snlg_ConfigValues.defaultLangId, link);

                MenuleriDoldur(DTMenu, SBMenu, subMenus);

                SBMenu.Append("</ul>");
            }
            else
            {
                SBMenu.AppendFormat(@"
                                <i class='fa fa-long-arrow-up'></i><i class='fa fa-long-arrow-down'></i>
                                <input type='checkbox' name='CBSec' value='{0}'/>
                                <span><a href='?kid={0}&Dil={2}'>{3}</a></span>
                            ", DRC[i]["KtgID"].ToString(), DRC[i]["KtgAd"].ToString(), Snlg_ConfigValues.defaultLangId, link);
            }

            SBMenu.Append("</li>");
        }
        return;
    }
    protected void BtnRSil_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Delete"))
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            vt.SorguCalistir("UPDATE snlg_v1.TblMakaleKtgApp SET Resim = NULL WHERE KtgID = " + editetKtgID, CommandType.Text);
            vt.Kapat();
            FVSyf.DataBind();
            Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
        }

    }
}
