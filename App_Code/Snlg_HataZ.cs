using System.Web;
using System;
using System.IO;
using System.Web.Configuration;

namespace Snlg_Hata
{
    public static class ziyaretci
    {
        public static void HataGosterBasarili(string hata, bool redirect)
        {
            hataScript += string.Format("$(\"#global_errors .errors-in\").append(\"<div class='alert alert-success'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static void HataGosterHatali(string hata, bool redirect)
        {
            hataScript += string.Format("$(\"#global_errors .errors-in\").append(\"<div class='alert alert-danger'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static void HataGosterBilgi(string hata, bool redirect)
        {
            hataScript += string.Format("$(\"#global_errors .errors-in\").append(\"<div class='alert alert-info'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static void HataGosterUyari(string hata, bool redirect)
        {
            hataScript += string.Format("$(\"#global_errors .errors-in\").append(\"<div class='alert alert-warning'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static void HataGosterBasarili(string hata, bool redirect, string container)
        {
            hataScript += string.Format("$(\"" + container + " .errors-in\").append(\"<div class='alert alert-success'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static void HataGosterHatali(string hata, bool redirect, string container)
        {
            hataScript += string.Format("$(\"" + container + " .errors-in\").append(\"<div class='alert alert-danger'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static void HataGosterBilgi(string hata, bool redirect, string container)
        {
            hataScript += string.Format("$(\"" + container + " .errors-in\").append(\"<div class='alert alert-info'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static void HataGosterUyari(string hata, bool redirect, string container)
        {
            hataScript += string.Format("$(\"" + container + " .errors-in\").append(\"<div class='alert alert-warning'>{0}</div>\");", HttpContext.Current.Server.HtmlEncode(hata.Replace("\\", "\\\\")));
            hataScript += System.Environment.NewLine;

            if (redirect)
                hataRedirect = true;
        }

        public static string hataScript
        {
            get
            {
                if (HttpContext.Current.Session["ZHataScript"] == null)
                    HttpContext.Current.Session["ZHataScript"] = "";

                return HttpContext.Current.Session["ZHataScript"].ToString();
            }
            set { HttpContext.Current.Session["ZHataScript"] = value; }
        }

        public static bool hataRedirect
        {
            get
            {
                if (HttpContext.Current.Session["ZHataRedirect"] == null)
                    HttpContext.Current.Session["ZHataRedirect"] = false;

                return (bool)HttpContext.Current.Session["ZHataRedirect"];
            }
            set { HttpContext.Current.Session["ZHataRedirect"] = value; }
        }

        public static void ExceptionLogla(Exception ex)
        {
            //try
            {
                if (!string.IsNullOrEmpty(WebConfigurationManager.AppSettings["HataLogDosyasi"]))
                {
                    StreamWriter sw = File.AppendText(HttpContext.Current.Server.MapPath(WebConfigurationManager.AppSettings["HataLogDosyasi"]));
                    sw.Write("Domain          : " + HttpContext.Current.Request.Url.AbsoluteUri + Environment.NewLine);
                    sw.Write("V Domain        : " + HttpContext.Current.Request.RawUrl + Environment.NewLine);
                    sw.Write("Tarih           : " + DateTime.Now.ToString() + Environment.NewLine);
                    sw.Write("Message         : " + ex.Message + Environment.NewLine);
                    sw.Write("Source          : " + ex.Source + Environment.NewLine);
                    sw.Write("ex.StackTrace   : " + ex.StackTrace + Environment.NewLine);
                    sw.Write("ex.TargetSite   : " + ex.TargetSite.ToString() + Environment.NewLine);
                    sw.Write("***************************************" + Environment.NewLine);
                    sw.Write("***************************************" + Environment.NewLine);
                    sw.Write("***************************************" + Environment.NewLine);
                    sw.Close();
                    sw.Dispose();
                }
            }
            //catch { }
        }
    }
}