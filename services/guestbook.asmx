<%@ WebService Language="C#" Class="web_services_ziyaretci_defteri" %>

using System;
using System.Web;
using System.Web.Services;
using Snlg_DataBase;
using System.Data;
using System.Text;
using System.Data.SqlClient;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class web_services_ziyaretci_defteri : System.Web.Services.WebService
{
    [WebMethod(EnableSession = true)]
    public string YorumYaz(string yazan, string yorum, string konu, string validText)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(yorum) || string.IsNullOrEmpty(konu) || string.IsNullOrEmpty(validText) || string.IsNullOrEmpty(yazan))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }
        if (!Session["validText"].ToString().Equals(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("zdefteri_asmx_hata04") + "\"}]}";
            return sonuc;
        }

        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[3];
        try
        {
            DBPrms[0] = new Snlg_DBParameter("@Yorum", SqlDbType.NVarChar, yorum, 1500);
            DBPrms[1] = new Snlg_DBParameter("@Yazan", SqlDbType.NVarChar, yazan, 30);
            DBPrms[2] = new Snlg_DBParameter("@Baslik", SqlDbType.NVarChar, konu, 75);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("zdefteri_asmx_hata02") + "\"}]}";
            return sonuc;
        }

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        try
        {
            vt.SorguCalistir("snlg_V1.zsp_ZDefteri_YorumEkle", CommandType.StoredProcedure, DBPrms);
            sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("zdefteri_asmx_hata01") + "\"},";

            try
            {
                SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_EPostaSablonGetir_Smtp", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Anahtar", SqlDbType.VarChar, "ZiyaretçiDefteriFormuAdmin"), new Snlg_DBParameter("@Ozelifadeler", SqlDbType.VarChar, "$#isim#$ : isim, $#mesaj#$ : mesaj, $#konu#$ : konu") });
                Snlg_Mail eposta = new Snlg_Mail();
                //admine mesaj
                if (sdr.Read())
                {
                    if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                    {
                        eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                        eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                        eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                    }
                    try { eposta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(), sdr["Kime"].ToString(), konu, sdr["Mesaj"].ToString().Replace("$#isim#$", yazan).Replace("$#mesaj#$", yorum).Replace("$#konu#$", konu)); }
                    catch { }
                }

                sdr.Close();
            }
            catch { }
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }
        vt.Kapat();

        sonuc = sonuc.TrimEnd(',');
        sonuc += "]}";
        return sonuc;
    }

    [WebMethod]
    public string Yorumlar(int currentPage, int PageSize)
    {
        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];

        DBPrms[1] = new Snlg_DBParameter("@CurrentPage", SqlDbType.Int, currentPage);
        DBPrms[0] = new Snlg_DBParameter("@PageSize", SqlDbType.Int, PageSize);
        #endregion

        //yorumlar alınıyor
        DataTable DTYorumlar;
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        DTYorumlar = vt.DataTableOlustur("snlg_V1.zsp_ZDefteri_Yorumlar", CommandType.StoredProcedure, DBPrms);
        vt.Kapat();
        DTYorumlar.PrimaryKey = new DataColumn[] { DTYorumlar.Columns["YId"] };

        //yorumlar listeleniyor
        StringBuilder SBYorum = new StringBuilder();
        YorumlariListele(SBYorum, DTYorumlar, DTYorumlar.Select("UstYId IS NULL", "YId DESC"), 1);

        return SBYorum.ToString();
    }

    protected void YorumlariListele(System.Text.StringBuilder SBYorum, DataTable DT, DataRow[] drc, int level)
    {//recujrsive metod
        //en fazla 10 kez recursive döngüye giriliyor
        if (level > 10)
            return;

        //kayıt yoksa metoddançık
        if (drc.Length < 1)
            return;





        foreach (DataRow dr in drc)
        {
            SBYorum.Append("<div class=\"comment clearfix\">");

            SBYorum.AppendFormat("<a class=\"comment-ava\"><img src=\"/themes/default/images/avatar.png\"/></a>");

            SBYorum.Append("<div class=\"comment-text\">");
            SBYorum.Append("<div class=\"comment-line\">");



            SBYorum.AppendFormat("<span class=\"comment-author\">{1}</span> 16 Ağustos 2015 </div> <p>{0}</p>", Server.HtmlEncode(dr["Yorum"].ToString()).Replace(Environment.NewLine, "<br/>"), dr["Yazan"].ToString());
            SBYorum.Append("</div>");


            YorumlariListele(SBYorum, DT, DT.Select("UstYId = " + dr["YId"].ToString(), "YId DESC"), level + 1);


            SBYorum.Append("</div>");
            SBYorum.Append("</div>");


            SBYorum.Append("</div>");
        }


        return;
    }
}
