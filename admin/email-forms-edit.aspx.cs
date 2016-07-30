using System;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using Snlg_DataBase;
using System.Data;

public partial class admin_varsayilan_eposta_duzenle : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["epid"] == null && !Page.IsPostBack)
            FV.ChangeMode(FormViewMode.Insert);
    }

    protected void SDS_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }

        if (e.Command.Parameters["@Mesaj"].Value != null && e.Command.Parameters["@Mesaj"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Mesaj içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Mesaj"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
    }

    protected void SDS_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("E-posta şablonu oluşturuldu.", true);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }

    protected void SDS_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }

        if (e.Command.Parameters["@Mesaj"].Value != null && e.Command.Parameters["@Mesaj"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Mesaj içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Mesaj"].Value.ToString().Length.ToString() + " karakterdir.",false);
            return;
        }
    }

    protected void SDS_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

  

    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
}