using System;
using System.Web.UI.WebControls;

public partial class admin_anketduzenle : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["aid"] == null && !Page.IsPostBack)
            FVAnket.ChangeMode(FormViewMode.Insert);

        //butonlar duruma göre gösterilip gizleniyor
        BtnKaydet2.Visible = !string.IsNullOrEmpty(Request.QueryString["aid"]);
        BtnSil.Visible = Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  && !string.IsNullOrEmpty(Request.QueryString["aid"]);
    }

    protected string DilleriListele(object diller)
    {
        string[] dizi = diller.ToString().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
        if (dizi.Length <= 2)
            return "";

        string linkler = "";
        for (int i = 0; i < dizi.Length; i += 2)
            linkler += string.Format("<a href='?aid={0}&dil={1}'><img src='/admin/common/images/flags/{1}.png' alt='{2}' title='{2}' /></a>", Request.QueryString["aid"], dizi[i].Trim(), dizi[i + 1].Trim());
        return linkler;
    }
    protected void BtnKaydet_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
            return;


        if (FVAnket.CurrentMode == FormViewMode.Insert)
        {
            try
            {
                FVAnket.InsertItem(true);
                Snlg_Hata.ziyaretci.HataGosterBasarili("Anketiniz oluşturuldu.", true);
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
            }
            Response.Redirect(Request.Url.AbsolutePath, true);
        }
        else
        {
            try { FVAnket.UpdateItem(true); }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                return;
            }

            if (Request.Form["HdnYeni"] == "1")
            {
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", true);
                Response.Redirect(Request.Url.AbsolutePath, true);
            }
            else
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
        }
    }
    protected void BtnSil_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Delete"))
        {
            try
            {
                FVAnket.DeleteItem();
                Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz dildeki anket içeriği silindi.", false);
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
            }
        }
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
}
