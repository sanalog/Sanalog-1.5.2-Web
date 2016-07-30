using Snlg_DataBase;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_blok_duzenle : Snlg_AdminBaseClass
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ucid"] == null && !Page.IsPostBack)
            FVIcerik.ChangeMode(FormViewMode.Insert);
    }
    protected void SdsIcerik_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            FVIcerik.ChangeMode(FormViewMode.Insert);
        else
            FVIcerik.ChangeMode(FormViewMode.Edit);
    }
    protected void SdsIcerik_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Blok oluşturuldu.", true);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        Response.Redirect(Request.Url.AbsoluteUri, true);
    }
    protected void SdsIcerik_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

    protected void FVIcerik_DataBound(object sender, EventArgs e)
    {

        try
        {
            if (FVIcerik.CurrentMode == FormViewMode.Insert)
                ((RadioButtonList)FVIcerik.FindControl("RBL1")).SelectedIndex = 0;
            
            //ListBox list1 = (ListBox)FVIcerik.FindControl("List1");

            //Snlg_DBConnect vt = new Snlg_DBConnect(true);
            //SqlDataReader SDRKtgler = vt.DBReaderOlustur(@"SELECT TBDS.SablonId, TBDS.SablonAd FROM snlg_V1.TblDesignSablonlar AS TBDS 
            //                                       INNER JOIN snlg_V1.TblDesignSablonIcerik AS TBDSI ON
            //                                       TBDS.SablonId=TBDSI.SablonId WHERE TBDSI.UCId= " + Request.QueryString["ucid"], CommandType.Text);
            //while (SDRKtgler.Read())
            //    try { list1.Items.FindByValue(SDRKtgler["SablonId"].ToString()).Selected = true; }
            //    catch { }

            //SDRKtgler.Close();
            //vt.Kapat();
        }
        catch (Exception)
        { }

    }
    protected void SdsIcerik_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }
        try
        {
            if (e.Command.Parameters["@Icerik"].Value != null && e.Command.Parameters["@Icerik"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
            {
                e.Cancel = true;
                Snlg_Hata.ziyaretci.HataGosterHatali("Bilgiler kaydedilmedi! İçerik 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Icerik"].Value.ToString().Length.ToString() + " karakter.", false);
                return;
            }

            DropDownList DDLCont = (DropDownList)FVIcerik.FindControl("DDLCont");
            ListBox list1 = (ListBox)FVIcerik.FindControl("List1");
            string sorgu = "";

            if (!string.IsNullOrEmpty(DDLCont.SelectedValue))
            {
                foreach (ListItem li in list1.Items)
                {
                    if (li.Selected && !string.IsNullOrEmpty(li.Value))
                    {
                        sorgu += "INSERT INTO snlg_V1.TblDesignSablonIcerik (SablonId,ContainerId,UCId,Sira)";
                        sorgu += string.Format("VALUES ({0}, @ContainerId, @UCId, @Sira); ", li.Value);
                    }
                }
                e.Command.Parameters["@GosterilecekSablonlarSql"].Value = sorgu;
            }
        }
        catch { }
    }
    protected void SdsIcerik_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }
        try
        {
            if (Request.QueryString["bt"] == "1")
            {//eğer custom kontrol ise içeriği kontrol et
                if (e.Command.Parameters["@Icerik"].Value != null && e.Command.Parameters["@Icerik"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
                {
                    e.Cancel = true;
                    Snlg_Hata.ziyaretci.HataGosterHatali("Bilgiler kaydedilmedi! İçerik 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Icerik"].Value.ToString().Length.ToString() + " karakter.", false);
                    return;
                }
            }
            else
                e.Command.Parameters["@Icerik"].Value = DBNull.Value;

            DropDownList DDLCont = (DropDownList)FVIcerik.FindControl("DDLCont");
            ListBox list1 = (ListBox)FVIcerik.FindControl("List1");
            string sorgu = "";

            if (!string.IsNullOrEmpty(DDLCont.SelectedValue))
            {
                foreach (ListItem li in list1.Items)
                {
                    if (li.Selected && !string.IsNullOrEmpty(li.Value))
                    {
                        sorgu += "IF (NOT EXISTS(SELECT * FROM snlg_V1.TblDesignSablonIcerik WHERE (UCId = @UCId) AND SablonID = " + li.Value + ")) " + Environment.NewLine;
                        sorgu += string.Format("INSERT INTO snlg_V1.TblDesignSablonIcerik (SablonId,ContainerId,UCId,Sira) VALUES ({0}, @ContainerId, @UCId, @Sira); ", li.Value) + Environment.NewLine;
                        sorgu += "ELSE" + Environment.NewLine;
                        sorgu += string.Format("UPDATE snlg_V1.TblDesignSablonIcerik SET ContainerId=@ContainerId, Sira=@Sira WHERE (UCId = @UCId) AND SablonID = {0} ", li.Value) + Environment.NewLine;
                        sorgu += Environment.NewLine;
                    }
                }
                e.Command.Parameters["@ContainerId"].Value = DDLCont.SelectedValue;
                e.Command.Parameters["@GosterilecekSablonlarSql"].Value = sorgu;
            }
        }
        catch { }
    }
    protected void SdsIcerik_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki içerik silindi.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }
    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?ucid={0}&dil={1}&bt={3}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>",
               Request.QueryString["ucid"], dizi[i].Trim(), dizi[i + 1].Trim(), Request.QueryString["bt"]);
        return linkler;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
    protected void SdsIcerik_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            e.Cancel = true;
            return;
        }
    }
    protected void FVIcerik_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }

    protected void DDL_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        ddl.Items.Insert(0, new ListItem("Seçiniz", ""));
    }
    protected void List1_DataBound(object sender, EventArgs e)
    {
        ListBox ddl = (ListBox)sender;
        ddl.Items.Insert(0, new ListItem("Seçiniz", ""));
    }
    protected void LnkKaldir_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            return;
        }
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        vt.SorguCalistir("DELETE FROM snlg_V1.TblDesignSablonIcerik WHERE (UCId = " + Request.QueryString["ucid"] + ")", CommandType.Text);
        vt.Kapat();
    }
}
