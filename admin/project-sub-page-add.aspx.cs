using System;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class admin_proje_alt_bilgi_ekle : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["paltid"] == null && !Page.IsPostBack)
            FVIcerik.ChangeMode(FormViewMode.Insert);
    }

    protected void SDSPrjSyf_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }

        if (e.Command.Parameters["@Icerik"].Value != null && e.Command.Parameters["@Icerik"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Detaylı Bilgi Bölümü 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Icerik"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
    }

    protected void SDSPrjSyf_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Proje oluşturuldu.", true);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }

    protected void SDSPrjSyf_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }

        if (e.Command.Parameters["@Icerik"].Value != null && e.Command.Parameters["@Icerik"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Detaylı Bilgi Bölümü 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Icerik"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
    }

    protected void SDSPrjSyf_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

    protected void SDSPrjSyf_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki Detaylı Bilgi Bölümü silindi.", false);
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
            linkler += string.Format("<a href='?paltid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["paltid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
   
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
    protected void SDSPrjSyf_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }
}