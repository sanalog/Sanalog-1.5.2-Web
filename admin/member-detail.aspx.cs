using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Snlg_DataBase;
using System.Data;

public partial class admin_uyedetay : Snlg_AdminBaseClass
{
    protected string resimAdi = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["uid"] == null && !Page.IsPostBack)
            FVUye.ChangeMode(FormViewMode.Insert);
    }

    protected void SDSUye_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }

        e.Command.Parameters["@Sifre"].Value = Snlg_ConfigValues.MD5Olustur(e.Command.Parameters["@Sifre"].Value.ToString());

        
    }
    protected void SDSUye_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Üye oluşturuldu.", true);
            Response.Redirect(Request.Url.AbsoluteUri, true);
        }
        else
        {
            e.ExceptionHandled = true;
            if (e.Exception.Message.Contains("$#sqlhata1#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali("Bu kullanıcı adı başkası tarafından kullanılıyor.", false);
            else if (e.Exception.Message.Contains("$#sqlhata2#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali("Bu E-posta adresi başkası tarafından kullanılıyor.", false);
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
            }
            try { File.Delete(Server.MapPath("~/uploads/user/" + resimAdi)); }
            catch { }
        }
    }
    protected void SDSUye_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }

        if (!string.IsNullOrEmpty(((TextBox)FVUye.FindControl("TSifre")).Text))
            e.Command.Parameters["@Sifre"].Value = Snlg_ConfigValues.MD5Olustur(((TextBox)FVUye.FindControl("TSifre")).Text);

    }

    protected void SDSUye_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (!string.IsNullOrEmpty(resimAdi))
            {
                Image img = ((Image)FVUye.FindControl("ImgRes"));
                try { File.Delete(Server.MapPath(img.ImageUrl)); }
                catch { }
            }

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
            e.ExceptionHandled = true;
            if (e.Exception.Message.Contains("$#sqlhata1#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali("Bu kullanıcı adı başkası tarafından kullanılıyor.", false);
            else if (e.Exception.Message.Contains("$#sqlhata2#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali("Bu E-posta adresi başkası tarafından kullanılıyor.", false);
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
            }
            try { File.Delete(Server.MapPath("~/uploads/user/" + resimAdi)); }
            catch { }
        }
    }
    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?uid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["uid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
    protected void SDSUye_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki üye bilgileri silindi.", false);
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
    protected void SDSUye_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
            e.Cancel = true;
    }
    protected void LinkRSil_Click(object sender, EventArgs e)
    {//resim silniyor.

        if (!YetkiKontrol(pageName + "-Delete"))
            return;

        Image img = (Image)FVUye.FindControl("ilk");
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        int silinen = vt.SorguCalistir("UPDATE snlg_V1.TblUyeDetay SET Resim = NULL WHERE UyeId = @uid ", System.Data.CommandType.Text, new Snlg_DBParameter[] { new Snlg_DBParameter("@uid", SqlDbType.Int, Request.QueryString["uid"]) });
        vt.Kapat();
        if (silinen > 0)
            try { System.IO.File.Delete(Server.MapPath(img.ImageUrl)); }
            catch { }
       
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
        FVUye.DataBind();

    }
  
}