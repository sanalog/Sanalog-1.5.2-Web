<%@ WebService Language="C#" Class="web_services_makale" %>

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
public class web_services_makale : System.Web.Services.WebService
{
    [WebMethod(EnableSession = true)]
    public string YorumYaz(string yazan, string eposta, string yorum, byte puan, string ustYId, int makid, string validText)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(yorum) || string.IsNullOrEmpty(makid.ToString()) || string.IsNullOrEmpty(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }
        if (!Session["validText"].ToString().Equals(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("makale_asmx_hata04") + "\"}]}";
            return sonuc;
        }
        if (yorum.Length > 10000)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("makale_asmx_hata05") + "\"}]}";
            return sonuc;
        }

        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[9];
        try
        {
            DBPrms[0] = new Snlg_DBParameter("@MakId", SqlDbType.Int, makid);
            DBPrms[1] = new Snlg_DBParameter("@UstYId", SqlDbType.Int, DBNull.Value);
            DBPrms[2] = new Snlg_DBParameter("@EPosta", SqlDbType.VarChar, eposta, 150);
            DBPrms[3] = new Snlg_DBParameter("@Yazan", SqlDbType.NVarChar, yazan, 30);
            DBPrms[4] = new Snlg_DBParameter("@Yorum", SqlDbType.NVarChar, yorum);
            DBPrms[5] = new Snlg_DBParameter("@IP", SqlDbType.VarChar, HttpContext.Current.Request.UserHostAddress, 15);
            DBPrms[6] = new Snlg_DBParameter("@Puan", SqlDbType.TinyInt, puan);
            DBPrms[7] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, DBNull.Value);
            DBPrms[8] = new Snlg_DBParameter("@Onay", SqlDbType.Bit, false);

            if (puan == 0)
                DBPrms[6].Deger = DBNull.Value;

            if (!string.IsNullOrEmpty(ustYId.ToString()))
                DBPrms[1].Deger = Convert.ToInt32(ustYId);

            if (!string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
                DBPrms[7].Deger = Snlg_MemberInfo.s_UserId;

            if (string.Equals(Snlg_MemberInfo.s_UserId, Snlg_ConfigValues.AdminId) || Snlg_MemberInfo.s_YetkiSayfalar.Contains("makaleEkle,"))
                DBPrms[8].Deger = true;
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("makale_asmx_hata02") + "\"}]}";
            return sonuc;
        }
        #endregion

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        Snlg_Mail e_posta = new Snlg_Mail();
        vt.Ac();
        try
        {

            int Sonuc = vt.SorguCalistir("snlg_V1.zsp_makale_YorumEkle", CommandType.StoredProcedure, DBPrms);
            string YorumYapilanMakaleBaslik = string.Empty;
            string Mesaj = string.Empty;

            string SqlSorgu = string.Format("SELECT * FROM snlg_V1.TblMakaleDetay WHERE MakId={0} AND Dil = {1}", makid.ToString(), Snlg_ConfigValues.defaultLangId);
            DataTable dt = vt.DataTableOlustur(SqlSorgu, CommandType.Text);
            YorumYapilanMakaleBaslik = dt.Rows[0]["Baslik"].ToString();

            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_EPostaSablonGetir_Smtp", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Anahtar", SqlDbType.VarChar, "makaleYorum_Admine"), new Snlg_DBParameter("@Ozelifadeler", SqlDbType.VarChar, "$#mesaj#$ : mesaj, $#başlık#$ : başlık") });
            sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("makale_asmx_hata01") + "\"},";
            if (sdr.Read())
            {
                if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                {
                    e_posta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"].ToString()));
                    e_posta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                    e_posta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                }
                try
                {
                    //admine mesaj
                    Mesaj = sdr["Mesaj"].ToString().Replace("$#mesaj#$", yorum).Replace("$#başlık#$", YorumYapilanMakaleBaslik);
                    e_posta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(), sdr["Kime"].ToString(), sdr["Konu"].ToString(), Mesaj);

                }
                catch { }
            }
            sdr.Close();


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
    public string Yorumlar(int currentPage, int makid, int PageSize)
    {
        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[3];

        DBPrms[0] = new Snlg_DBParameter("@MakId", SqlDbType.Int, makid);
        DBPrms[1] = new Snlg_DBParameter("@CurrentPage", SqlDbType.Int, currentPage);
        DBPrms[2] = new Snlg_DBParameter("@PageSize", SqlDbType.Int, PageSize);
        #endregion

        //yorumlar alınıyor
        DataTable DTYorumlar;
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        DTYorumlar = vt.DataTableOlustur("snlg_V1.zsp_makale_Yorumlar", CommandType.StoredProcedure, DBPrms);
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
            SBYorum.Append("<a class=\"comment-ava\">");
            SBYorum.AppendFormat("<img src=\"{0}\"/>", dr["Resim"].ToString());
            SBYorum.Append("</a>");

            SBYorum.Append("<div class=\"comment-text\">");
            SBYorum.Append("<div class=\"comment-line\">");

            SBYorum.AppendFormat("<span class=\"comment-author\">{1}</span>, ", Server.HtmlEncode(dr["Yorum"].ToString()).Replace(Environment.NewLine, "<br/>"), dr["Yazan"].ToString());
            SBYorum.AppendFormat(Convert.ToDateTime(dr["Tarih"].ToString()).ToString("dd MMMM yyyy") + "<a data-comment-id=\"{0}\" href=\"javascript:;\">{1}</a>", dr["YId"].ToString(), Resources._default.ResourceManager.GetString("yorumlar_ascx_cevapyaz"));
            SBYorum.AppendFormat("<p>{0}</p>", Server.HtmlEncode(dr["Yorum"].ToString()).Replace(Environment.NewLine, "<br/>"), dr["Yazan"].ToString());

            SBYorum.Append("</div>");
            SBYorum.Append("</div>");

            YorumlariListele(SBYorum, DT, DT.Select("UstYId = " + dr["YId"].ToString(), "YId"), level + 1);

            SBYorum.Append("</div>");
        }


        return;
    }
}
