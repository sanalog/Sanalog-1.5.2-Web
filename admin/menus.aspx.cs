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

public partial class admin_menus : Snlg_AdminBaseClass
{
    protected string dil = HttpContext.Current.Request.QueryString["dil"];
    protected string editedMenuID = HttpContext.Current.Request.QueryString["mid"];
    protected string UCId = HttpContext.Current.Request.QueryString["gid"];
    DataTable dtMenuGroup;

    protected DataTable _DTMenuler;
    protected DataTable DTMenuler
    {
        get
        {
            if (_DTMenuler == null)
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                _DTMenuler = vt.DataTableOlustur("SELECT TMA.MenuId, TMA.Hedef, TMA.UstId, TMA.Sira, TMA.Resim, TMA.Aktif, TMI.MenuLink, ISNULL(TMI.MenuItem, (SELECT TOP(1) MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuID = TMA.MenuID AND Dil = " + Snlg_ConfigValues.defaultLangId + ")) AS MenuItem FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN snlg_V1.TblMenuDetay AS TMI ON TMA.MenuId = TMI.MenuId AND TMI.Dil = " + dil + " WHERE TMA.UCId = " + UCId, CommandType.Text);
                vt.Kapat();
                _DTMenuler.PrimaryKey = new DataColumn[] { _DTMenuler.Columns["MenuId"] };
            }
            return _DTMenuler;
        }
        set { _DTMenuler = value; }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(UCId))
            UCId = "-1";

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        dtMenuGroup = vt.DataTableOlustur("SELECT * FROM snlg_V1.TblUcApp WHERE BlokType = 'Menu' ORDER BY Title", CommandType.Text);
        vt.Kapat();
        if (dtMenuGroup.Rows.Count < 1)
        {
            Snlg_Hata.ziyaretci.HataGosterUyari("Menü oluşturmadan önce bir menü grubu tanımlamalısınız.", true);
            Response.Redirect("menu-groups.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(dil))
            dil = Snlg_ConfigValues.defaultLangId;

        if (editedMenuID == null && !Page.IsPostBack)
        {
            FVSyf.ChangeMode(FormViewMode.Insert);
            LblFBas.Text = "Yeni Menü Öğesi Oluşturun";
        }
        else
        {
            LblFBas.Text = "Menü Bilgilerini Düzenleyin";
        }

        if (!Page.IsPostBack)
        {
            DDLMenuGroup.DataSource = dtMenuGroup;
            DDLMenuGroup.DataBind();
            DDLMenuGroup.Items.Insert(0, new ListItem("Seçiniz", "-1"));

            DDLMenuGroup.ClearSelection();
            try { DDLMenuGroup.SelectedValue = UCId; }
            catch { }

            //memüler listeleniyor
            StringBuilder SBMenu = new StringBuilder();
            MenuleriDoldur(DTMenuler, SBMenu, DTMenuler.Select("UstId IS NULL", "Sira"));
            ltrMenu.Text = SBMenu.ToString();

            if (UCId == "-1")
                Pnl1.Visible = false;
            else
                Pnl1.Visible = true;
        }
    }

    protected void MenuleriDoldur(DataTable DTMenu, StringBuilder SBMenu, DataRow[] DRC)
    {

        for (int i = 0; i < DRC.Length; i++)
        {
            DataRow[] subMenus = DTMenu.Select("UstId = " + DRC[i]["MenuId"].ToString(), "Sira");

            SBMenu.AppendFormat("<li id='liMenu{0}'>", DRC[i]["MenuId"].ToString());

            string link = "";
            if (!string.IsNullOrEmpty(DRC[i]["MenuItem"].ToString()))
                link = string.Format(@"<span><b>{0}</b></span>", DRC[i]["MenuItem"].ToString());
            else
                link = @"<i class='fa fa-plus'></i>";


            if (subMenus.Length > 0)
            {
                SBMenu.AppendFormat(@"
                                <div class='accordion-heading'>
                                    <i class='fa fa-long-arrow-up'></i><i class='fa fa-long-arrow-down'></i>
                                    <a href='?mid={0}&Dil={3}&gid={2}'>{4}</a>
                                </div>
                                <ul class='nav nav-list collapsed collapse in' id='menu{0}'>
                            ", DRC[i]["MenuId"].ToString(), DRC[i]["MenuItem"].ToString(), UCId, dil, link);

                MenuleriDoldur(DTMenu, SBMenu, subMenus);

                SBMenu.Append("</ul>");
            }
            else
            {
                SBMenu.AppendFormat(@"
                                <i class='fa fa-long-arrow-up'></i><i class='fa fa-long-arrow-down'></i>
                                <input type='checkbox' name='CBSec' value='{0}' rel='Sec'/>
                                <span><a href='?mid={0}&Dil={3}&gid={2}'>{4}</a></span>
                            ", DRC[i]["MenuId"].ToString(), DRC[i]["MenuItem"].ToString(), UCId, dil, link);
            }

            SBMenu.Append("</li>");
        }
        return;
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
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Menü oluşturuldu.", true);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali(e.Exception.Message.Replace("'", "") + "Beklenmeyen bir hata oluştu.", true);
        }

    }
    protected void SDSSyf_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (Request.Form["HdnYeni"] == "1")
            {
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", true);
                Response.Redirect(Request.Url.AbsolutePath + "?gid=" + UCId);
            }
            else
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            Response.Redirect(Request.Url.AbsoluteUri, true);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }

    }
    protected void DDLDoldur(DataRow[] drc, string alt, DropDownList ddl)
    {
        foreach (DataRow dr in drc)
        {
            if (dr["MenuId"].ToString() == editedMenuID)
                continue;

            ListItem li = new ListItem(alt + " " + dr["MenuItem"].ToString(), dr["MenuId"].ToString());
            ddl.Items.Add(li);
            DDLDoldur(DTMenuler.Select("UstId = " + dr["MenuId"].ToString()), alt + ":::", ddl);
        }
    }
    protected void FVSyf_DataBound(object sender, EventArgs e)
    {
        DropDownList DDLLinks = (DropDownList)FVSyf.FindControl("DDLLinks");
        DropDownList DDLUst = (DropDownList)FVSyf.FindControl("DDLUst");
        try
        {
            DDLUst.Items.Clear();
            DDLUst.Items.Add(new ListItem("Ana Kategori Olsun", ""));
            DDLDoldur(DTMenuler.Select("UstId IS NULL", "Sira"), null, DDLUst);
        }
        catch { }
        DataRow satir = DTMenuler.Rows.Find(editedMenuID);
        try
        {
            if (satir == null || string.IsNullOrEmpty(satir["UstId"].ToString()))
                DDLUst.Items.FindByValue("").Selected = true;
            else
                DDLUst.Items.FindByValue(satir["UstId"].ToString()).Selected = true;
        }
        catch { }

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[1];
        DBPrms[0] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, dil);

        try
        {
            DDLLinks.DataSource = vt.DBReaderOlustur("snlg_V1.msp_LinkListele", CommandType.StoredProcedure, DBPrms);
            DDLLinks.DataBind();
        }
        catch { }
        vt.Kapat();

    }
    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?mid={0}&Dil={1}&gid={3}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", editedMenuID, dizi[i].Trim(), dizi[i + 1].Trim(), UCId, Snlg_ConfigValues.AdminThemePath);
        return linkler;
    }
    protected void SDSSyf_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki menü içeriği silindi.", false);
            Response.Redirect(Request.Url.AbsolutePath + "?gid=" + UCId);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void SDSSyf_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
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
            e.Command.Parameters["@UstId"].Value = DDLUst.SelectedValue;
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
            e.Command.Parameters["@UstId"].Value = DDLUst.SelectedValue;
    }
    protected void LKtgSil_Click(object sender, EventArgs e)
    {//ktg siliniyor
        if (!YetkiKontrol(pageName + "-Delete"))
            return;

        if (string.IsNullOrEmpty(Request.Form["CBSec"]))
        {
            Snlg_Hata.ziyaretci.HataGosterUyari("Herhangi bir seçim yapmadınız.", false);
            return;
        }

        DTMenuler = null;//verilerin son haliyle çekilmesi için önce boşaltılıyor

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        try
        {
            foreach (string id in Request.Form["CBSec"].Split(",".ToCharArray()))
            {
                vt.SorguCalistir("snlg_V1.msp_MenuKategoriSil", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@MenuId", SqlDbType.Int, id), new Snlg_DBParameter("@Dil", SqlDbType.Int, dil) });
            }
            Snlg_Hata.ziyaretci.HataGosterBasarili("Menü kaldırıldı.", true);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.HataGosterHatali("Menü altında başka Menü bulunduğu için silinemiyor.", true);
        }
        vt.Kapat();
        Response.Redirect(Request.Url.AbsolutePath + "?gid=" + UCId);
    }

    protected void DDLMenuGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsolutePath + "?gid=" + DDLMenuGroup.SelectedValue);
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
                SBSorgu.AppendFormat("UPDATE snlg_V1.TblMenuApp SET Sira = {0} WHERE MenuId = {1}; ", i.ToString(), list[i]);
        }
        try
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            vt.SorguCalistir(SBSorgu.ToString(), CommandType.Text);
            vt.Kapat();
            return "Sıralama kaydedildi.";
        }
        catch { return "Beklenmeyen bir hata oluştu."; }
    }
    protected void BtnRSil_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            return;

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        vt.SorguCalistir("UPDATE snlg_v1.TblMenuApp SET Resim = NULL WHERE MenuID = " + editedMenuID, CommandType.Text);
        vt.Kapat();
        FVSyf.DataBind();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
    }

}