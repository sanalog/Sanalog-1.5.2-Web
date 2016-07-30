<%@ WebService Language="C#" Class="web_services_anket" %>

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
public class web_services_anket : System.Web.Services.WebService
{
    [WebMethod]
    public string OylamaGonder(int AnketId, string Cevap)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(AnketId.ToString()) || string.IsNullOrEmpty(Cevap))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        Snlg_DBParameter[] prms = new Snlg_DBParameter[4];
        try
        {
            prms[0] = new Snlg_DBParameter("@UserId", SqlDbType.Int, DBNull.Value);
            prms[1] = new Snlg_DBParameter("@AnketId", SqlDbType.Int, AnketId);
            prms[2] = new Snlg_DBParameter("@Cevap", SqlDbType.Char, Cevap, 1);
            prms[3] = new Snlg_DBParameter("@IP", SqlDbType.VarChar, DBNull.Value);
            //eğer oy kullanan kişi üye değilse IP ile kayıt yap
            if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()))
                prms[3].Deger = HttpContext.Current.Request.UserHostAddress;
            else//eğer kişi üye ise UserID ile kayıt yap
                prms[0].Deger = Snlg_MemberInfo.s_UserId;
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("anket_asmx_hata02") + "\"}]}";
            return sonuc;
        }
        try
        {
            vt.SorguCalistir("snlg_V1.zsp_AnketCevapla", CommandType.StoredProcedure, prms);
            sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("anket_asmx_hata01") + "\"},";
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

    [WebMethod(EnableSession=true)]
    public string AnketSonucuGetir(int AnketId)
    {
        if (!string.IsNullOrEmpty(AnketId.ToString()))
        {
            StringBuilder sb = new StringBuilder();
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            try
            {
                Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
                DBPrms[1] = new Snlg_DBParameter("@AnketId", SqlDbType.Int, AnketId);
                DBPrms[0] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

                using (SqlDataReader SDR = vt.DBReaderOlustur("snlg_V1.zsp_AnketSonuc", CommandType.StoredProcedure, DBPrms))
                {
                    if (SDR.Read())
                    {
                        sb.AppendFormat("{{\"{0}\":[{{\"{1}\":{2}}},{{\"{3}\":{4}}}", SDR["Soru"].ToString(), SDR["A"].ToString(), SDR["ASay"].ToString(), SDR["B"].ToString(), SDR["BSay"].ToString());
                        if (!string.IsNullOrEmpty(SDR["C"].ToString()))
                            sb.AppendFormat(",{{\"{0}\":{1}}}", SDR["C"].ToString(), SDR["CSay"].ToString());
                        if (!string.IsNullOrEmpty(SDR["D"].ToString()))
                            sb.AppendFormat(",{{\"{0}\":{1}}}", SDR["D"].ToString(), SDR["DSay"].ToString());
                        if (!string.IsNullOrEmpty(SDR["E"].ToString()))
                            sb.AppendFormat(",{{\"{0}\":{1}}}", SDR["E"].ToString(), SDR["ESay"].ToString());
                        if (!string.IsNullOrEmpty(SDR["F"].ToString()))
                            sb.AppendFormat(",{{\"{0}\":{1}}}", SDR["F"].ToString(), SDR["FSay"].ToString());
                        if (!string.IsNullOrEmpty(SDR["G"].ToString()))
                            sb.AppendFormat(",{{\"{0}\":{1}}}", SDR["G"].ToString(), SDR["GSay"].ToString());
                        if (!string.IsNullOrEmpty(SDR["H"].ToString()))
                            sb.AppendFormat(",{{\"{0}\":{1}}}", SDR["H"].ToString(), SDR["HSay"].ToString());
                        sb.Append("]}");
                    }
                }
            }
            catch (Exception exc)
            {
                vt.Kapat();
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                return "0";
            }
            vt.Kapat();

            return sb.ToString();
        }

        return "0";
    }
}
