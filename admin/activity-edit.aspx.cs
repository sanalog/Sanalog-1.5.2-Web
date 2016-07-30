using System;
using System.Web.UI.WebControls;
using System.Web.UI;
using Snlg_DataBase;
using System.Data;

public partial class admin_etkinlikduzenle : Snlg_AdminBaseClass
{
    protected string resimAdi = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["eid"] == null && !Page.IsPostBack)
            FVEtk.ChangeMode(FormViewMode.Insert);
    }

    protected void SdsEtk_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }
        if (e.Command.Parameters["@Detay"].Value != null && e.Command.Parameters["@Detay"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Etkinlik içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Detay"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
       
    }
    protected void SdsEtk_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Etkinlik oluşturuldu.", true);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
        Response.Redirect(Request.Url.AbsolutePath, true);
    }
    protected void SdsEtk_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }
        
        if (e.Command.Parameters["@Detay"].Value != null && e.Command.Parameters["@Detay"].Value.ToString().Length > Snlg_ConfigValues.maxCharacterLimit)
        {
            e.Cancel = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Etkinlik içeriği 100.000 karakterden daha uzun olamaz. Girmiş olduğunuz içeriğin uzunluğu : " + e.Command.Parameters["@Detay"].Value.ToString().Length.ToString() + " karakterdir.", false);
            return;
        }
    }
    protected void SdsEtk_Updated(object sender, SqlDataSourceStatusEventArgs e)
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
    protected void SdsEtk_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki etkinlik içeriği silindi.", false);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }
    protected void FVEtk_DataBound(object sender, EventArgs e)
    {
        //CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        //_FileBrowser.BasePath = "/plugins/ckfinder/";
        //_FileBrowser.SetupCKEditor((CKEditor.NET.CKEditorControl)FVEtk.FindControl("CKE1"));
    }
    protected void LinkRSil_Click(object sender, EventArgs e)
    {//resim silniyor.
        if (!YetkiKontrol(pageName + "-Delete"))
             return;
        
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        int silinen = vt.SorguCalistir("UPDATE snlg_V1.TblEtkinlikApp SET Resim = NULL WHERE EtkinlikId = @EtkinlikId ", System.Data.CommandType.Text, new Snlg_DBParameter[] { new Snlg_DBParameter("@EtkinlikId", SqlDbType.Int, Request.QueryString["eid"]) });
        vt.Kapat();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
        FVEtk.DataBind();
    }

    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?eid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["eid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
    protected void SdsEtk_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            e.Cancel = true;
            return;
        }
        
    }
}