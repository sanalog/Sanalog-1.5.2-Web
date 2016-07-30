using System;
using System.Web;
using Snlg_DataBase;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Threading;
using System.Globalization;

public class Snlg_UrlRewrite : IHttpModule
{

    public void Dispose() { }

    public void Init(HttpApplication app)
    {
        context_ApplicationStart();
        app.BeginRequest += new EventHandler(context_BeginRequest);
        app.Error += new EventHandler(HataOlusunca);
    }

    void context_BeginRequest(object sender, EventArgs e)
    {
        UrlRewrite(sender);
    }

    void context_ApplicationStart()
    {
        try { Snlg_ConfigValues.ApplicationStartMetod(); }
        catch { }
    }


    bool IsMobileBrowser(HttpContext context)
    {
        if (context.Request.Browser.IsMobileDevice)
            return true;

        if (context.Request.ServerVariables["HTTP_X_WAP_PROFILE"] != null)
            return true;

        if (context.Request.ServerVariables["HTTP_ACCEPT"] != null && context.Request.ServerVariables["HTTP_ACCEPT"].ToLower().Contains("wap"))
            return true;

        if (context.Request.ServerVariables["HTTP_USER_AGENT"] != null)
        {
            string[] mobiles = new[]
              {
                  "midp", "j2me", "avant", "docomo",
                  "novarra", "palmos", "palmsource",
                  "240x320", "opwv", "chtml",
                  "pda", "windows ce", "mmp/",
                  "blackberry", "mib/", "symbian",
                  "wireless", "nokia", "hand", "mobi",
                  "phone", "cdm", "up.b", "audio",
                  "SIE-", "SEC-", "samsung", "HTC",
                  "mot-", "mitsu", "sagem", "sony"
                  , "alcatel", "lg", "eric", "vx",
                  "NEC", "philips", "mmm", "xx",
                  "panasonic", "sharp", "wap", "sch",
                  "rover", "pocket", "benq", "java",
                  "pt", "pg", "vox", "amoi",
                  "bird", "compal", "kg", "voda",
                  "sany", "kdd", "dbt", "sendo",
                  "sgh", "gradi", "jb", "dddi",
                  "moto", "iphone"
              };

            foreach (string s in mobiles)
                if (context.Request.ServerVariables["HTTP_USER_AGENT"].ToLower().Contains(s.ToLower()))
                    return true;
        }

        return false;
    }

    private void UrlRewrite(object sender)
    {
        #region url Rewrite
        if (File.Exists(HttpContext.Current.Server.MapPath(HttpContext.Current.Request.Url.AbsolutePath)))
            return;
        if (Directory.Exists(HttpContext.Current.Server.MapPath(HttpContext.Current.Request.Url.AbsolutePath)))
            return;
        if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Equals("/"))
            return;
        if (HttpContext.Current.Request.RawUrl == "/")
            HttpContext.Current.Response.RedirectPermanent("/" + Snlg_ConfigValues.defaultLang + "/" + Snlg_ConfigValues.startPage);

        string[] urlDizi = HttpContext.Current.Request.RawUrl.Split('/');
        CultureInfo cu = new CultureInfo("tr");
        try { cu = new CultureInfo(urlDizi[1]); }
        catch { return; }

        if (Directory.Exists(HttpContext.Current.Server.MapPath(urlDizi[1])))
            return;

        {
            HttpApplication app = (HttpApplication)sender;

            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[1];

            try { DBPrms[0] = new Snlg_DBParameter("@Url", SqlDbType.VarChar, Path.GetFileNameWithoutExtension(HttpContext.Current.Request.RawUrl.Substring(0, HttpContext.Current.Request.RawUrl.IndexOf('?')))); }
            catch
            {//eğer querystring yoksa hata fırlatacak o yüzden direk dosya adı alınıyor
                DBPrms[0] = new Snlg_DBParameter("@Url", SqlDbType.VarChar, Path.GetFileNameWithoutExtension(HttpContext.Current.Request.RawUrl));
            }
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            string sp = "snlg_V1.zsp_QueryStringPages";
            if (urlDizi.Length == 4)
            {
                DataRow[] drs = Snlg_ConfigValues.DTurlKeyList.Select("Dil = " + cu.LCID.ToString() + " AND UrlKeyValue='" + urlDizi[2] + "'");
                sp = "snlg_V1.zsp_QueryString" + drs[0]["UrlKeyName"].ToString().Replace("-", "_");
            }
            if (urlDizi.Length == 5)
            {
                //blog url tagı
                DataRow[] drs = Snlg_ConfigValues.DTurlKeyList.Select("Dil = " + cu.LCID.ToString() + " AND UrlKeyValue='" + urlDizi[2] + "'");
                sp = "snlg_V1.zsp_QueryString" + drs[0]["UrlKeyName"].ToString().Replace("-", "_");
                //blog tagı için url tagı
                drs = Snlg_ConfigValues.DTurlKeyList.Select("Dil = " + cu.LCID.ToString() + " AND UrlKeyValue='" + urlDizi[3] + "'");
                sp += drs[0]["UrlKeyName"].ToString().Replace("-", "_");
            }

            using (SqlDataReader SDR = vt.DBReaderOlustur(sp, CommandType.StoredProcedure, DBPrms))
            {
                if (SDR.Read())
                {
                    if (Snlg_ConfigValues.urlExtension != Path.GetExtension(HttpContext.Current.Request.RawUrl))
                    {
                        vt.Kapat();
                        throw new HttpException(404, "Not Found");
                    }

                    HttpContext.Current.RewritePath("~/SnlgPages.aspx?" + SDR[0].ToString());
                    vt.Kapat();
                    return;
                }
                else
                {
                    vt.Kapat();
                    throw new HttpException(404, "Not Found");
                }
            }
        }
        #endregion
    }

    void HataOlusunca(object sender, EventArgs e)

    {
        Exception exc = HttpContext.Current.Server.GetLastError();
        if (exc.GetType() == typeof(HttpException))
            return;

        Snlg_Hata.ziyaretci.ExceptionLogla(exc);
        //HttpContext.Current.Server.ClearError();
    }
}