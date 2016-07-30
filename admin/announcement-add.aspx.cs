using System;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using Snlg_DataBase;
using System.Data;

public partial class admin_duyuruduzenle : Snlg_AdminBaseClass
{
    protected string resimAdi = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["did"] == null && !Page.IsPostBack)
            FVDuyuru.ChangeMode(FormViewMode.Insert);
    }

    protected void SDSDyr_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }
        if (e.Command.Parameters["@Duyuru"].Value != null && e.Command.Parameters["@Duyuru"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Duyuru içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Duyuru"].Value.ToString().Length.ToString() + " karakterdir.",false);
            return;
        }
    }

    protected void SDSDyr_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Duyuru oluşturuldu.", true);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu."+e.Exception.Message, true);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }

    protected void SDSDyr_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }
        if (e.Command.Parameters["@Duyuru"].Value != null && e.Command.Parameters["@Duyuru"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Duyuru içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Duyuru"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
    }

    protected void SDSDyr_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

    protected void SDSDyr_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki duyuru içeriği silindi.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void FVDuyuru_DataBound(object sender, EventArgs e)
    {
        if (FVDuyuru.CurrentMode == FormViewMode.Insert)
        {
            ((RadioButtonList)FVDuyuru.FindControl("RBL1")).SelectedIndex = 0;
            ((TextBox)FVDuyuru.FindControl("TbTarih")).Text = DateTime.Today.ToShortDateString();
        }
    }

    protected void LinkRSil_Click(object sender, EventArgs e)
    {//resim silniyor.
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            return;
        }

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        int silinen = vt.SorguCalistir("UPDATE snlg_V1.TblDuyuruApp SET Resim = NULL WHERE DuyuruId = @DuyuruId ", CommandType.Text, new Snlg_DBParameter[] { new Snlg_DBParameter("@DuyuruId", SqlDbType.Int, Request.QueryString["did"]) });
        vt.Kapat();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
        FVDuyuru.DataBind();
    }

    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?did={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["did"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
    protected void SDSDyr_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }
}