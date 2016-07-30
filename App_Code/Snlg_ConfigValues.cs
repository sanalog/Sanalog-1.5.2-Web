using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Web.Configuration;
using Snlg_DataBase;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Threading;
using System.Globalization;
using System;

public static class Snlg_ConfigValues
{
    static string _aramaMotoru = "";
    public static string aramaMotoru
    {
        get
        {
            if (string.IsNullOrEmpty(_aramaMotoru))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_AppDegerler", CommandType.StoredProcedure))
                {
                    if (sdr.Read())
                    {
                        _aramaMotoru = sdr["GglDogrula"].ToString();
                        _aramaMotoru += sdr["GglAnalytic"].ToString();
                    }
                }
                vt.Kapat();
            }
            return _aramaMotoru;
        }
        set { _aramaMotoru = value; }
    }

    public static int maxCharacterLimit = 1000000;

    public static int adminDefaultLangId = 31;

    public static string defaultLang = "tr";
    static string _defaultLangId = "31";
    public static string defaultLangId
    {
        get { return _defaultLangId; }
        set
        {
            _defaultLangId = value;
            HttpContext.Current.Application["defaultLangId"] = value;
            defaultLang = (new CultureInfo(Convert.ToInt32(value))).ToString();
        }
    }

    public static string s_Dil
    {
        get { return System.Threading.Thread.CurrentThread.CurrentUICulture.Name; }
        set { HttpContext.Current.Session["Dil"] = value; }
    }

    public static string s_ZDilId
    {
        get
        {
            if (HttpContext.Current.Session["ZDilId"] == null)
                HttpContext.Current.Session["ZDilId"] = defaultLangId;
            return HttpContext.Current.Session["ZDilId"].ToString();
        }
        set { HttpContext.Current.Session["ZDilId"] = value; }
    }

    public static string ThemePath
    {
        get { return "/themes/" + WebConfigurationManager.AppSettings["ThemeName"] + "/"; }
    }

    public static string AdminThemePath
    {
        get { return "/admin/themes/" + WebConfigurationManager.AppSettings["AdminThemePath"] + "/"; }
    }

    public static string AdminId
    {
        get { return WebConfigurationManager.AppSettings["AdminId"]; }
    }

    public static string urlExtension = ".aspx";
    public static string startPage = "anasayfa";
    public static DataTable DTurlKeyList = new DataTable();

    public static string GetUrlValueByKey(string key)
    {
        foreach (DataRow dr in DTurlKeyList.Select("Dil = " + Thread.CurrentThread.CurrentUICulture.LCID.ToString()))
            if (dr["UrlKeyName"].ToString().ToLower() == key.ToLower())
                return dr["UrlKeyValue"].ToString().ToLower();

        return key;
    }

    public static string GetUrlKeyByValue(string key)
    {
        foreach (DataRow dr in DTurlKeyList.Select("Dil = " + Thread.CurrentThread.CurrentUICulture.LCID.ToString()))
            if (dr["UrlKeyValue"].ToString().ToLower() == key.ToLower())
                return dr["UrlKeyName"].ToString().ToLower();

        return "";
    }

    public static string MD5Olustur(string metin)
    {
        byte[] ByteData = Encoding.ASCII.GetBytes(metin);
        //MD5 nesnesi oluşturalım.  
        MD5 oMd5 = MD5.Create();
        //Hash değerini hesaplayalım.  
        byte[] HashData = oMd5.ComputeHash(ByteData);

        //byte dizisini hex formatına çevirelim  
        StringBuilder oSb = new StringBuilder();
        for (int x = 0; x < HashData.Length; x++)
        {
            //hexadecimal string değeri  
            oSb.Append(HashData[x].ToString("x2"));
        }
        return oSb.ToString();
    }

    public static void ApplicationStartMetod()
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        Snlg_ConfigValues.DTurlKeyList = vt.DataTableOlustur("SELECT UrlKeyValue,UrlKeyName, Dil FROM snlg_V1.TblUrlKeys ", CommandType.Text);
        Snlg_ConfigValues.urlExtension = vt.ScalarSorguCalistir("SELECT Deger FROM snlg_V1.TblDegiskenler WHERE Degisken = 'urlExtension'", CommandType.Text).ToString();
        Snlg_ConfigValues.startPage = vt.ScalarSorguCalistir("SELECT Deger FROM snlg_V1.TblDegiskenler WHERE Degisken = 'AcilisSayfasi'", CommandType.Text).ToString();
        Snlg_ConfigValues.defaultLangId = vt.ScalarSorguCalistir("SELECT Deger FROM snlg_V1.TblDegiskenler WHERE Degisken = 'DefaultLang'", CommandType.Text).ToString();
        Snlg_ConfigValues.adminDefaultLangId = Convert.ToInt32(vt.ScalarSorguCalistir("SELECT Deger FROM snlg_V1.TblDegiskenler WHERE Degisken = 'adminDefaultLangID'", CommandType.Text).ToString());
        vt.Kapat();
    }

}
