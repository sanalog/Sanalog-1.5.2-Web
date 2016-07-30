using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.Configuration;
using System;
using Snlg_DataBase;
using System.Data;
using System.Text.RegularExpressions;

public partial class admin_uye_rol : Snlg_AdminBaseClass
{
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        string[] sonuclar = new string[10];
        int i = 0;

        using (SqlDataReader Sdr = vt.DBReaderOlustur("SELECT TOP(10) UserName FROM snlg_V1.TblUyeApp WHERE UyeId <> " + Snlg_ConfigValues.AdminId + " AND (UserName LIKE '%" + prefixText.Replace("'", "").Replace("%", "") + "%')", System.Data.CommandType.Text))
        {
            while (Sdr.Read())
            {
                sonuclar[i] = Sdr[0].ToString();
                i++;
            }

            while (i < 10)
            {
                sonuclar[i] = "";
                i++;
            }
        }
        vt.Kapat();
        return sonuclar;
    }

    protected void BtnEkle_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Insert"))
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            try
            {
                vt.SorguCalistir("snlg_V1.msp_RoleUyeEkle", System.Data.CommandType.StoredProcedure, new Snlg_DBParameter[3] { new Snlg_DBParameter("@UserName", SqlDbType.NVarChar, TBUser.Text.Trim()), new Snlg_DBParameter("@RolId", SqlDbType.SmallInt, Request.QueryString["rid"]), new Snlg_DBParameter("@AdminId", SqlDbType.Int, WebConfigurationManager.AppSettings["AdminId"]) });
                HdnHataTur.Value = "alert alert-success";
                HdnHata.Value = "Üye gruba eklendi.";
                GVUye.DataBind();
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                HdnHataTur.Value = "alert alert-danger";
                HdnHata.Value = "Beklenmeyen bir hata oluştu.";
            }
            vt.Kapat();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rid"] == null && !Page.IsPostBack)
            Response.Redirect("roles.aspx", true);

        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblRol_Uye WHERE RolId = " + Convert.ToInt32(Request.QueryString["rid"]).ToString() + " AND UyeId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Seçtiğiniz üyeler gurupdan silindi.", false);
                    GVUye.DataBind();
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
}