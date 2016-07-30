using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Data;
using System.IO;

public partial class admin_blok_web_control_ekle : Snlg_AdminBaseClass
{
    protected void BtnUC_Click(object sender, EventArgs e)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        foreach (GridViewRow satir in GVUC.Rows)
            if (((CheckBox)satir.FindControl("CBSec")).Checked)
            {
                if (string.IsNullOrEmpty(((TextBox)satir.FindControl("TB3")).Text))
                    break;

                //kontroller aktarılıyor
                Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[6];
                DBPrms[0] = new Snlg_DBParameter("@Title", System.Data.SqlDbType.NVarChar, ((TextBox)satir.FindControl("TB3")).Text, 100);
                DBPrms[1] = new Snlg_DBParameter("@Baslik", System.Data.SqlDbType.NVarChar, ((TextBox)satir.FindControl("TB1")).Text, 250);
                DBPrms[2] = new Snlg_DBParameter("@Gorunurluk", System.Data.SqlDbType.TinyInt, ((DropDownList)satir.FindControl("DDL1")).SelectedValue);
                DBPrms[3] = new Snlg_DBParameter("@BaslikGorunsun", System.Data.SqlDbType.Bit, ((CheckBox)satir.FindControl("CB1")).Checked);
                DBPrms[4] = new Snlg_DBParameter("@Aciklama", System.Data.SqlDbType.VarChar, ((TextBox)satir.FindControl("TB2")).Text, 500);
                DBPrms[5] = new Snlg_DBParameter("@UCPath", System.Data.SqlDbType.NVarChar, satir.Cells[1].Text.Replace(".ascx", ""), 250);

                if (string.IsNullOrEmpty(((TextBox)satir.FindControl("TB2")).Text))
                    DBPrms[4].Deger = DBNull.Value;
                if (string.IsNullOrEmpty(((TextBox)satir.FindControl("TB1")).Text))
                    DBPrms[1].Deger = DBNull.Value;

                vt.SorguCalistir("snlg_V1.msp_UCKontrolEkle", CommandType.StoredProcedure, DBPrms);
            }
        vt.Kapat();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Kontroller tanımlandı.", false);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Dictionary<string, string> ascxler = new Dictionary<string, string>();
            UserControListele(Server.MapPath("~/modules/"), ascxler);
            GVUC.DataSource = ascxler;
            GVUC.DataBind();
        }
    }
    private void UserControListele(string yol, Dictionary<string, string> liste)
    {
        //dosyalar listeleniyor
        foreach (string dosya in Directory.GetFiles(yol, "*.ascx"))
        {
            if (Path.GetFileName(dosya)[0] != '_')
            {
                int konum = dosya.IndexOf("modules\\") + "modules\\".Length;
                liste.Add(dosya.Substring(konum), "");
            }
        }
        //sonra alt klasörlere geçiliyor
        foreach (string altKlasor in Directory.GetDirectories(yol))
            UserControListele(altKlasor, liste);
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
       
    }
}