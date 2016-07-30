using Snlg_DataBase;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

public static class Snlg_MemberInfo
{
    //public static string c_UserId
    //{
    //    get
    //    {
    //        if (HttpContext.Current.Request.Cookies["UserId"] == null)
    //            return "";
    //        return HttpContext.Current.Request.Cookies["UserId"].Value;
    //    }
    //    set
    //    {
    //        if (value == null)
    //            HttpContext.Current.Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(-1);
    //        else if (string.IsNullOrEmpty(value.ToString()))
    //            HttpContext.Current.Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(-1);
    //        else
    //            HttpContext.Current.Response.Cookies["UserId"].Value = value;
    //    }
    //}

    public static string s_UserId
    {
        get
        {
            try { return HttpContext.Current.Session["UserId"].ToString(); }
            catch { }
            return "";
        }
        set { HttpContext.Current.Session["UserId"] = value; }
    }

    public static string s_UserName
    {
        get
        {
            try { return HttpContext.Current.Session["UserName"].ToString(); }
            catch { }
            return "";
        }
        set { HttpContext.Current.Session["UserName"] = value; }
    }

    //public static string c_UserName
    //{
    //    get
    //    {
    //        if (HttpContext.Current.Request.Cookies["UserName"] == null)
    //            return "";
    //        return HttpContext.Current.Request.Cookies["UserName"].Value;
    //    }
    //    set
    //    {
    //        if (value == null)
    //            HttpContext.Current.Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
    //        else if (string.IsNullOrEmpty(value.ToString()))
    //            HttpContext.Current.Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
    //        else
    //            HttpContext.Current.Response.Cookies["UserName"].Value = value;
    //    }
    //}

    //public static string c_YetkiSayfalar
    //{
    //    get
    //    {
    //        if (HttpContext.Current.Request.Cookies["Yetkiler"] == null)
    //            return "";
    //        return HttpContext.Current.Request.Cookies["Yetkiler"].Value;
    //    }
    //    set
    //    {
    //        if (value == null)
    //            HttpContext.Current.Response.Cookies["Yetkiler"].Expires = DateTime.Now.AddDays(-1);
    //        else if (string.IsNullOrEmpty(value.ToString()))
    //            HttpContext.Current.Response.Cookies["Yetkiler"].Expires = DateTime.Now.AddDays(-1);
    //        else
    //            HttpContext.Current.Response.Cookies["Yetkiler"].Value = value;
    //    }
    //}

    public static string s_YetkiSayfalar
    {
        get
        {
            try { return HttpContext.Current.Session["Yetkiler"].ToString(); }
            catch { }
            return "";
        }
        set { HttpContext.Current.Session["Yetkiler"] = value; }
    }


    public static string s_UserUrl
    {
        get
        {
            if (HttpContext.Current.Session["UserUrl"] == null)
                return "";
            return HttpContext.Current.Session["UserUrl"].ToString();
        }
        set { HttpContext.Current.Session["UserUrl"] = value; }
    }

    //public static string c_LoginGuid
    //{
    //    get
    //    {
    //        if (HttpContext.Current.Request.Cookies["LoginGuid"] == null)
    //            return "";
    //        return HttpContext.Current.Request.Cookies["LoginGuid"].Value;
    //    }
    //    set
    //    {
    //        if (value == null)
    //            HttpContext.Current.Response.Cookies["LoginGuid"].Expires = DateTime.Now.AddDays(-1);
    //        else if (string.IsNullOrEmpty(value.ToString()))
    //            HttpContext.Current.Response.Cookies["LoginGuid"].Expires = DateTime.Now.AddDays(-1);
    //        else
    //            HttpContext.Current.Response.Cookies["LoginGuid"].Value = value;
    //    }
    //}

    //public static void LoginDogrula()
    //{
    //    //login olunmuş ise (cokie nul değilse) ve session ile cookie değerleri birbiirnden farklı ise login doğrula
    //    if (!string.IsNullOrEmpty(c_UserId) && string.IsNullOrEmpty(s_UserId))
    //    {
    //        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
    //        DBPrms[1] = new Snlg_DBParameter("@LoginGuid", SqlDbType.VarChar, c_LoginGuid);
    //        DBPrms[0] = new Snlg_DBParameter("@AdminId", SqlDbType.Int, Snlg_ConfigValues.AdminId);

    //        Snlg_DBConnect vt = new Snlg_DBConnect(true);
    //        try
    //        {
    //            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeLoginGuidDogrula", CommandType.StoredProcedure, DBPrms);
    //            if (sdr.Read())
    //            {
    //                Snlg_MemberInfo.s_UserId = sdr["UyeId"].ToString();
    //                Snlg_MemberInfo.s_UserId = sdr["UyeId"].ToString();
    //                Snlg_MemberInfo.s_YetkiSayfalar = sdr[1].ToString().Trim() + ",";
    //                Snlg_MemberInfo.s_YetkiSayfalar = sdr[1].ToString().Trim() + ",";
    //            }
    //            else
    //            {
    //                Snlg_MemberInfo.s_UserId = null;
    //                Snlg_MemberInfo.s_UserId = null;
    //                Snlg_MemberInfo.s_YetkiSayfalar = null;
    //                Snlg_MemberInfo.s_YetkiSayfalar = null;
    //                vt.Kapat();
    //                HttpContext.Current.Response.Clear();
    //                HttpContext.Current.Response.End();
    //            }
    //            sdr.Close();
    //        }
    //        catch(Exception exc)
    //        {
    //            Snlg_MemberInfo.s_UserId = null;
    //            Snlg_MemberInfo.s_UserId = null;
    //            Snlg_MemberInfo.s_YetkiSayfalar = null;
    //            Snlg_MemberInfo.s_YetkiSayfalar = null;
    //            vt.Kapat();
    //            HttpContext.Current.Response.Clear();
    //            HttpContext.Current.Response.End();
    //        }
    //        vt.Kapat();
    //    }
    //    else if (!string.IsNullOrEmpty(c_UserId) && (c_UserId != s_UserId || c_YetkiSayfalar != s_YetkiSayfalar))
    //    {
    //        Snlg_MemberInfo.s_UserId = null;
    //        Snlg_MemberInfo.s_UserId = null;
    //        Snlg_MemberInfo.s_YetkiSayfalar = null;
    //        Snlg_MemberInfo.s_YetkiSayfalar = null;
    //        HttpContext.Current.Response.Clear();
    //        HttpContext.Current.Response.End();
    //    }
    //}
}
