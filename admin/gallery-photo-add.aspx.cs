using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using Snlg_DataBase;
using System.Data;
using System.Linq;

public partial class admin_galeriyeresimekle : Snlg_AdminBaseClass
{

    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Request.QueryString["rid"] == null && !Page.IsPostBack)
            Response.Redirect("gallery-photos.aspx", true);
    }

    protected void SDSResim_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
    }

    protected void SDSResim_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
    }

    protected void SDSResim_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki resim bilgileri silindi.", false);
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
            linkler += string.Format("<a href='?rid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["rid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        YetkiKontrol(pageName + "-Update", true);
    }
    protected void SDSResim_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            e.Cancel = true;
            return;
        }
    }
    protected string Resim_ismi_olustur(string uzanti, string yol)
    {
        Random rnd = new Random();
        string rakam = "";
        do
        {
            rakam = rnd.Next().ToString();
        } while (File.Exists(Server.MapPath(yol + rakam + uzanti)));

        return rakam + uzanti;
    }

    protected void BtnRSil_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            return;

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        vt.SorguCalistir("UPDATE snlg_v1.TblResimGaleriResimlerApp SET Resim = NULL WHERE RId = " + Request.QueryString["rid"], CommandType.Text);
        vt.Kapat();
        FVResim.DataBind();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
    }

   
}