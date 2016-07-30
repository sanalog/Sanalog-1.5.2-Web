using System;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using Snlg_DataBase;
using System.Data;

public partial class admin_haberduzenle : Snlg_AdminBaseClass
{
    protected string resimAdi = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["hid"] == null && !Page.IsPostBack)
            FVHaber.ChangeMode(FormViewMode.Insert);
    }

    protected void SDSHbr_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }

        if (e.Command.Parameters["@Haber"].Value != null && e.Command.Parameters["@Haber"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Haber içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Haber"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
    }

    protected void SDSHbr_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Haber oluşturuldu.", true);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }

    protected void SDSHbr_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }

        if (e.Command.Parameters["@Haber"].Value != null && e.Command.Parameters["@Haber"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Haber içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Haber"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
    }

    protected void SDSHbr_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

    protected void SDSHbr_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki haber içeriği silindi.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void FVHaber_DataBound(object sender, EventArgs e)
    {
        if (FVHaber.CurrentMode == FormViewMode.Insert)
            ((TextBox)FVHaber.FindControl("TbTarih")).Text = DateTime.Today.ToShortDateString();
        
    }

    protected void LinkRSil_Click(object sender, EventArgs e)
    {//resim silniyor.
        if (!YetkiKontrol(pageName + "-Delete"))
            return;


        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        int silinen = vt.SorguCalistir("UPDATE snlg_V1.TblHaberApp SET Resim = NULL WHERE HaberId = @HaberId ", System.Data.CommandType.Text, new Snlg_DBParameter[] { new Snlg_DBParameter("@HaberId", SqlDbType.Int, Request.QueryString["hid"]) });
        vt.Kapat();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
        FVHaber.DataBind();
    }

    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?hid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["hid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
    protected void SDSHbr_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }
}