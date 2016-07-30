using Snlg_DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class admin_UrlKeys : Snlg_AdminBaseClass
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.QueryString["dil"]))
        {
            Response.Redirect(Request.Url.AbsolutePath + "?dil=" + Snlg_ConfigValues.defaultLangId);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                vt.Ac();
                SqlDataReader Sdr = vt.DBReaderOlustur("SELECT * FROM snlg_V1.TblDiller WHERE Aktif=1", CommandType.Text);
                vt.Ac();
                while (Sdr.Read())
                {
                    LtrDiller.Text += "<a href='?dil=" + Sdr["DId"].ToString() + "'><img src='/admin/common/images/flags/" + Sdr["DId"].ToString() + ".png' /></a>";
                }
                vt.Kapat();
            }
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }

    }
    protected void SdsUrlkeysGroup_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
            Snlg_Hata.ziyaretci.HataGosterBasarili("Url Keys tanımlandı.", true);
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        Snlg_ConfigValues.DTurlKeyList = vt.DataTableOlustur("SELECT UrlKeyValue,UrlKeyName, Dil FROM snlg_V1.TblUrlKeys ", CommandType.Text);
        vt.Kapat();
        Response.Redirect(Request.Url.AbsoluteUri, true);
    }
    protected void FVSyf_DataBound(object sender, EventArgs e)
    {
        Literal LtrDil = (Literal)FVSyf.FindControl("LtrDiller");
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        SqlDataReader Sdr = vt.DBReaderOlustur("SELECT * FROM snlg_V1.TblDiller WHERE Aktif=1", CommandType.Text);
        vt.Ac();
        while (Sdr.Read())
        {
            LtrDil.Text += "<a href='?dil=" + Sdr["DId"].ToString() + "'><img src='/admin/common/images/flags/" + Sdr["DId"].ToString() + ".png' /></a>";
        }
        vt.Kapat();
    }
    protected void SdsUrlkeysGroup_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Url Keys silindi.", true);
            Response.Redirect(Request.Url.AbsoluteUri, true);
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali(e.Exception.Message.Replace("'", "") + "Beklenmeyen bir hata oluştu.", false);
        }
    }
    protected void SdsUrlkeysGroup_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            e.Cancel = true;
           
        }
    }
    protected void SdsUrlkeysGroup_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
        }
    }

    protected void TxtUrlKeysDegeri_TextChanged(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            Snlg_Hata.ziyaretci.HataGosterHatali("Bu işlemi yapmak için yetkili değilsiniz.", false);
            return;
        }
        try
        {
            TextBox t = (TextBox)sender;
            t.Text = trReplace(t.Text);
            GridViewRow satir = (GridViewRow)t.NamingContainer;

            if (satir.RowType == DataControlRowType.DataRow)
                GVUrlKeys.UpdateRow(satir.RowIndex, true);

            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler güncellendi.", false);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        Snlg_ConfigValues.DTurlKeyList = vt.DataTableOlustur("SELECT UrlKeyValue,UrlKeyName, Dil FROM snlg_V1.TblUrlKeys ", CommandType.Text);
        vt.Kapat();

    }

    public string trReplace(string metin)
    {
        metin = metin.Replace("İ", "i");
        metin = metin.Replace("Ç", "c");
        metin = metin.Replace("Ğ", "g");
        metin = metin.Replace("Ö", "o");
        metin = metin.Replace("Ü", "u");
        metin = metin.Replace("Ş", "s");
        metin = metin.Replace(".", "-");
        metin = metin.Replace("/", "-");

        metin = metin.Replace("ı", "i");
        metin = metin.Replace("ç", "c");
        metin = metin.Replace("ğ", "g");
        metin = metin.Replace("ö", "o");
        metin = metin.Replace("ü", "u");
        metin = metin.Replace("ş", "s");

        metin = metin.Replace(" ", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");

        CultureInfo culture = new CultureInfo("en-US");
        metin = metin.ToLower(culture);

        return metin;
    }
}