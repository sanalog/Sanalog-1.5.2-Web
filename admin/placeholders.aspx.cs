using System;
using System.Web.UI;
using Snlg_DataBase;
using System.Data;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System.Net;

public partial class admin_places : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            GridBind();

        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", "").Replace("-", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblPlaceHolders WHERE ContainerId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz yer tutucular silindi.", false);
                    GridBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }
    }

    protected void GridBind()
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        GV1.DataSource = vt.DBReaderOlustur("SELECT ContainerId, PHName, Title FROM snlg_V1.TblPlaceHolders ORDER BY PHName", CommandType.Text);
        GV1.DataBind();
        vt.Kapat();
    }

    protected void BtnKaydet_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            try
            {
                foreach (GridViewRow satir in GV1.Rows)
                {
                    Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
                    DBPrms[0] = new Snlg_DBParameter("@Title", SqlDbType.NVarChar, ((TextBox)satir.FindControl("TB")).Text, 100);
                    DBPrms[1] = new Snlg_DBParameter("@ContainerId", SqlDbType.SmallInt, GV1.DataKeys[satir.RowIndex].Value.ToString());
                    if (string.IsNullOrEmpty(DBPrms[0].Deger.ToString()))
                        return;
                    vt.SorguCalistir("UPDATE snlg_V1.TblPlaceHolders SET Title = @Title WHERE (ContainerId = @ContainerId) ", CommandType.Text, DBPrms);
                }
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
            }
            vt.Kapat();
        }
    }
    protected void ImgSenkron_Click(object sender, EventArgs e)
    {
        HttpWebRequest istek = (HttpWebRequest)WebRequest.Create(Request.Url.Scheme + System.Uri.SchemeDelimiter + Request.Url.Host + (Request.Url.IsDefaultPort ? "" : ":" + Request.Url.Port) + "/SnlgPages.aspx?sablonSenkr=1");
        istek.GetResponse();
        istek.Abort();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Senkronize işlemi tamamlandı.", false);
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
}