using System;
using System.Web.UI;
using System.Data.SqlClient;
using Snlg_DataBase;
using System.Data;
using System.IO;
using System.Globalization;

public partial class admin_dil_tanimla : Snlg_AdminBaseClass
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void ImgKaydet_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            if (!("," + Request.Form["CBDil"] + ",31,").Contains("," + Snlg_ConfigValues.defaultLangId + ","))
            {
                Snlg_Hata.ziyaretci.HataGosterHatali("Varsayılan olarak seçili dilin işaretini kaldıramazsın.", false);
                return;
            }

            string sorgu = "UPDATE snlg_V1.TblDiller SET Aktif = 0 WHERE DId <> " + Snlg_ConfigValues.defaultLangId + "; ";
            try
            {
                sorgu += "UPDATE snlg_V1.TblDiller SET Aktif = 1 WHERE DId = 31; ";
                if (!string.IsNullOrEmpty(Request.Form["CBDil"]))
                    sorgu += "UPDATE snlg_V1.TblDiller SET Aktif = 1 WHERE DId IN (" + Request.Form["CBDil"] + "); ";
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                vt.SorguCalistir(sorgu, CommandType.Text);
                Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", true);
                vt.Kapat();
            }
            catch { Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluşut.", true); }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}
