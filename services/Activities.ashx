<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Data;
using Snlg_DataBase;

public class Handler : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (string.IsNullOrEmpty(context.Request.QueryString["q"]))
        {
            JavaScriptSerializer jsSerialize = new JavaScriptSerializer();
            ClsActiviytListJson clsJson = new ClsActiviytListJson();

            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_Etkinlikler", System.Data.CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId), new Snlg_DBParameter("@Baslangic", SqlDbType.DateTime, DateTime.Now.AddDays(-60)) }))
            {
                while (sdr.Read())
                {
                    DateTime tarih1 = Convert.ToDateTime(sdr["Tarih1"]);
                    DateTime tarih2 = Convert.ToDateTime(sdr["Tarih2"]);

                    ClsActivityJson clsActivity = new ClsActivityJson();
                    clsActivity.id = sdr["EtkinlikId"].ToString();
                    clsActivity.title = sdr["Baslik"].ToString();
                    clsActivity.url = "/services/Activities.ashx?q=1&act=" + sdr["EtkinlikId"].ToString();
                    clsActivity.start = (jsSerialize.Serialize(tarih1).Replace("Date(", "").Replace("/", "").Replace(")", "").Replace("\\", "").Replace("\"", ""));
                    clsActivity.end = (jsSerialize.Serialize(tarih2).Replace("Date(", "").Replace("/", "").Replace(")", "").Replace("\\", "").Replace("\"", ""));

                    if (tarih2 < DateTime.Now)
                        clsActivity.className = "event-danger";
                    else
                        clsActivity.className = "event-info";

                    clsJson.result.Add(clsActivity);
                }
            }
            vt.Kapat();

            clsJson.success = "1";

            context.Response.ContentType = "text/html";
            JavaScriptSerializer jsonReturn = new JavaScriptSerializer();
            context.Response.Write(jsonReturn.Serialize(clsJson));
        }
        else if (context.Request.QueryString["q"] == "1")
        {
            string sonuc = "";
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            try
            {
                using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_EtkinlikDetay", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId), new Snlg_DBParameter("@EtkinlikId", SqlDbType.Int, context.Request.QueryString["act"]) }))
                {
                    if (sdr.Read())
                        sonuc = string.Format("Başlama Tarihi :{1}<br/>Bitiş Tarihi   :{2}<br/>{3}", "", sdr["Tarih1"].ToString(), sdr["Tarih2"].ToString(), sdr["Detay"].ToString());
                }
            }
            catch { }
            vt.Kapat();

            context.Response.ContentType = "text/plain";
            context.Response.Write(sonuc);
        }
    }

    public bool IsReusable { get { return false; } }

}

public class ClsActiviytListJson
{
    public string success;
    public List<ClsActivityJson> result = new List<ClsActivityJson>();
}
public class ClsActivityJson
{
    public string id, title, url, className, start, end;
}