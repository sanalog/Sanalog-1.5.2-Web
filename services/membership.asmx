<%@ WebService Language="C#" Class="web_services_uyelik" %>

using System;
using System.Web;
using System.Web.Services;
using Snlg_DataBase;
using System.Data;
using System.Data.SqlClient;

[WebService(Namespace = "http//tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class web_services_uyelik : System.Web.Services.WebService
{

    [WebMethod(EnableSession = true)]
    public string UyeOl(string UserName, string Eposta, string Sifre, string UyeAd, string validText)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(Eposta) || string.IsNullOrEmpty(UserName) || string.IsNullOrEmpty(Sifre) || string.IsNullOrEmpty(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }
        if (!Session["validText"].ToString().Equals(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("uyelik_asmx_hata01") + "\"}]}";
            return sonuc;
        }

        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];
        try
        {
            DBPrms[0] = new Snlg_DBParameter("@UyeAd", SqlDbType.VarChar, UyeAd);
            DBPrms[1] = new Snlg_DBParameter("@Eposta", SqlDbType.VarChar, Eposta);
            DBPrms[2] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, Snlg_ConfigValues.MD5Olustur(Sifre));
            DBPrms[3] = new Snlg_DBParameter("@UserName", SqlDbType.NVarChar, UserName);
            DBPrms[4] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, DBNull.Value);

        }
        catch
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("uyelik_asmx_hata10") + "\"}]}";
            return sonuc;
        }
        #endregion
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        vt.Ac();
        try
        {
            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeOlustur", CommandType.StoredProcedure, DBPrms))
            {
                if (sdr.Read())
                {
                    try
                    {
                        Snlg_Mail eposta = new Snlg_Mail();
                        if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                        {
                            eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                            eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                            eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                        }

                        eposta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(), Eposta, sdr["Konu"].ToString(), sdr["Mesaj"].ToString().Replace("$#kullanıcı_adı#$", UserName).Replace("$#şifre#$", Sifre));
                    }
                    catch { }
                }
            }
            sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("uyelik_asmx_hata06") + "\"},";
        }
        catch (Exception exc)
        {
            if (exc.Message.Contains("$#sqlhata1#$"))
                sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("uyelik_asmx_hata07") + "\"},";
            else if (exc.Message.Contains("$#sqlhata2#$"))
                sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("uyelik_asmx_hata08") + "\"},";
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
            }
        }
        vt.Kapat();

        sonuc = sonuc.TrimEnd(',');
        sonuc += "]}";
        return sonuc;
    }

    [WebMethod(EnableSession = true)]
    public string SifreSifirlama(string Eposta, string validText)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(Eposta) || string.IsNullOrEmpty(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.login_ascx_hata11 + "\"}]}";
            return sonuc;
        }
        if (!Session["validText"].ToString().Equals(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("uyelik_asmx_hata01") + "\"}]}";
            return sonuc;
        }

        #region parametreler

        string guidDegeri = Guid.NewGuid().ToString();

        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[4];
        try
        {
            DBPrms[0] = new Snlg_DBParameter("@IslemTipi", SqlDbType.Int, 2);
            DBPrms[1] = new Snlg_DBParameter("@Eposta", SqlDbType.VarChar, Eposta, 150);
            DBPrms[2] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, "", 128);
            DBPrms[3] = new Snlg_DBParameter("@guidDegeri", SqlDbType.VarChar, guidDegeri);
        }
        catch
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("uyelik_asmx_hata10") + "\"}]}";
            return sonuc;
        }
        #endregion

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        try
        {
            vt.Ac();
            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeSifreSifirla", CommandType.StoredProcedure, DBPrms))
            {
                try
                {
                    if (sdr.Read())
                    {
                        Snlg_Mail eposta = new Snlg_Mail();
                        if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                        {
                            eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                            eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                            eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                        }
                        eposta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(),
                                      Eposta, sdr["Konu"].ToString(),
                                      sdr["Mesaj"].ToString().Replace("$#kullanıcı_adı#$", sdr["UserName"].ToString()).Replace("$#guid#$", sdr["GuidDegeri"].ToString()));


                        sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.uyelik_asmx_hata09 + "\"},";
                    }
                }
                catch (Exception exc) { sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.hataBeklenmeyen + "\"},"; }
            }
        }
        catch (SqlException exc)
        {

            if (exc.Message.Contains("$#sqlhata1#$"))
                sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("login_ascx_hata15") + "\"},";
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("login_ascx_hata16") + exc.Message + "\"},";
            }

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



}
