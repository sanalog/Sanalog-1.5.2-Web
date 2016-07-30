<%@ WebService Language="C#" Class="web_services_genel" %>

using System;
using System.Web;
using System.Web.Services;
using Snlg_DataBase;
using System.Data;
using System.Data.SqlClient;

[WebService(Namespace = "http//tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class web_services_genel : System.Web.Services.WebService
{
    //public string iletisimFormuGonder()
    [WebMethod(EnableSession = true)]
    public string iletisimFormuGonder(string Eposta, string Mesaj, string UyeAd, string Konu, string Tel, string validText)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(Eposta) || string.IsNullOrEmpty(Mesaj) || string.IsNullOrEmpty(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }
        if (!Session["validText"].ToString().Equals(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata11") + "\"}]}";
            return sonuc;
        }

        try
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_EpostaIletisim", CommandType.StoredProcedure);
            Snlg_Mail eposta = new Snlg_Mail();
            if (sdr.Read())
            {
                if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                {
                    eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                    eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                    eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                }
                try
                {
                    //admine mesaj
                    eposta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(), sdr["Kime"].ToString(), sdr["Konu"].ToString(), sdr["Mesaj"].ToString().Replace("$#email#$", Eposta).Replace("$#isim#$", UyeAd).Replace("$#konu#$", Konu).Replace("$#mesaj#$", Mesaj.Replace(Environment.NewLine, "<br/>")).Replace("$#telefon#$", Tel));
                    sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata13") + "\"},";
                }
                catch (Exception exc) { sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + exc.Message.Replace("'", "") + Resources._default.ResourceManager.GetString("iletisim_asmx_hata14") + "\"},"; }
            }

            //ziyaretçiye mesaj
            if (sdr.Read())
            {
                if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                {
                    eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                    eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                    eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                }
                try { eposta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(), Eposta, Konu, sdr["Mesaj"].ToString().Replace("$#mesaj#$", Mesaj.Replace(Environment.NewLine, "<br/>")).Replace("$#telefon#$", Tel)); }
                catch { }
            }

            sdr.Close();
            vt.Kapat();
        }
        catch (System.Net.Mail.SmtpException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata14") + "\"},";
        }
        catch (SqlException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }

        sonuc = sonuc.TrimEnd(',');
        sonuc += "]}";
        return sonuc;
    }


    [WebMethod(EnableSession = true)]
    public string siparisGonder(string UrunAdi, string Adet, string AdiSoyadi, string Eposta, string Tel, string AcikAdres, string Mesaj, string validText)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(UrunAdi) || string.IsNullOrEmpty(AdiSoyadi) || string.IsNullOrEmpty(Eposta) || string.IsNullOrEmpty(Tel) || string.IsNullOrEmpty(AcikAdres) || string.IsNullOrEmpty(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }

        if (!Session["validText"].ToString().Equals(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("siparis_ascx_hata03") + "\"}]}";
            return sonuc;
        }

        try
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_EPostaSablonGetir_Smtp", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Anahtar", SqlDbType.VarChar, "ÜrünSiparişFormuAdmin"), new Snlg_DBParameter("@Ozelifadeler", SqlDbType.VarChar, "$#ürün#$, $#telefon#$, $#adet#$, $#isim#$, $#eposta#$, $#adres#$, $#mesaj#$") });
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
                try
                {
                    eposta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(), sdr["Kime"].ToString(), sdr["Konu"].ToString(), sdr["Mesaj"].ToString().Replace("$#ürün#$", UrunAdi).Replace("$#telefon#$", Tel).Replace("$#adet#$", Adet).Replace("$#isim#$", AdiSoyadi).Replace("$#eposta#$", Eposta).Replace("$#adres#$", AcikAdres).Replace("$#mesaj#$", Mesaj));
                    sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.siparis_ascx_hata01 + "\"},";
                }
                catch (Exception exc) { sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.siparis_ascx_hata02 + exc.Message.Replace("'", "") + "\"},"; }
            }

            sdr.Close();


            sdr = vt.DBReaderOlustur("snlg_V1.zsp_EPostaSablonGetir_Smtp", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Anahtar", SqlDbType.VarChar, "ÜrünSiparişFormuZiyaretci"), new Snlg_DBParameter("@Ozelifadeler", SqlDbType.VarChar, "$#ürün#$, $#telefon#$, $#adet#$, $#isim#$, $#eposta#$, $#adres#$, $#mesaj#$") });
            eposta = new Snlg_Mail();
            //ziyaretçiye mesaj
            if (sdr.Read())
            {
                if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                {
                    eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                    eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                    eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                }
                try
                {
                    eposta.Gonder(sdr["Kimden"].ToString(), sdr["KimdenIsim"].ToString(), Eposta, sdr["Konu"].ToString(), sdr["Mesaj"].ToString().Replace("$#ürün#$", UrunAdi).Replace("$#telefon#$", Tel).Replace("$#adet#$", Adet).Replace("$#isim#$", AdiSoyadi).Replace("$#eposta#$", Eposta).Replace("$#adres#$", AcikAdres).Replace("$#mesaj#$", Mesaj));
                }
                catch { }
            }

            sdr.Close();
            vt.Kapat();
        }
        catch (System.Net.Mail.SmtpException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("siparis_ascx_hata02") + "\"},";
        }
        catch (SqlException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }

        sonuc = sonuc.TrimEnd(',');
        sonuc += "]}";
        return sonuc;
    }

    [WebMethod(EnableSession = true)]
    public string hataBidirimFormuGonder(string Eposta, string Mesaj, string UyeAd, string Konu, string Tel, string validText)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(Eposta) || string.IsNullOrEmpty(Mesaj) || string.IsNullOrEmpty(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }
        if (!Session["validText"].ToString().Equals(validText))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata11") + "\"}]}";
            return sonuc;
        }

        try
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_EpostaIletisim", CommandType.StoredProcedure);
            Snlg_Mail eposta = new Snlg_Mail();
            if (sdr.Read())
            {
                if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                {
                    eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                    eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                    eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                }
                try
                {
                    string Mesajicerik = string.Format(" Ad Soyad : {0} <hr> E-Posta Adresi : {1} <hr> Telefon {2} <hr>  Konu : {3}  <hr> Mesaj : {4}"
                        , UyeAd, Eposta, Tel, Konu, Mesaj);

                    eposta.Gonder(sdr["Kimden"].ToString(), "Sanalog Hata Bildirimi", sdr["Kime"].ToString(),
                        Konu, Mesajicerik);
                    sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata13") + "\"},";


                }
                catch (Exception exc) { sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + exc.Message.Replace("'", "") + Resources._default.ResourceManager.GetString("iletisim_asmx_hata14") + "\"},"; }
            }



            sdr.Close();
            vt.Kapat();
        }
        catch (System.Net.Mail.SmtpException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata14") + "\"},";
        }
        catch (SqlException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }

        sonuc = sonuc.TrimEnd(',');
        sonuc += "]}";
        return sonuc;
    }

    #region Sponsor Başvuru

    [WebMethod(EnableSession = true)]
    public string sponsorBasvuruFormuGonder(string Eposta, string Mesaj, string UyeAd, string SirketAdi, string SirketWeb, string Tel, string SponsorPaket)
    {
        string sonuc = "{\"mesajlar\":[";
        if (string.IsNullOrEmpty(Eposta) || string.IsNullOrEmpty(Mesaj))
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"}]}";
            return sonuc;
        }

        try
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_EpostaIletisim", CommandType.StoredProcedure);
            Snlg_Mail eposta = new Snlg_Mail();
            if (sdr.Read())
            {
                if (!string.IsNullOrEmpty(sdr["Kimden"].ToString()) && !string.IsNullOrEmpty(sdr["SmtpHost"].ToString()))
                {
                    eposta.smtp = new System.Net.Mail.SmtpClient(sdr["SmtpHost"].ToString(), Convert.ToInt32(sdr["SmtpPort"]));
                    eposta.smtp.EnableSsl = Convert.ToBoolean(sdr["SSL_"]);
                    eposta.smtp.Credentials = new System.Net.NetworkCredential(sdr["Kimden"].ToString(), sdr["SmtpPsw"].ToString());
                }
                try
                {
                    string Mesajicerik = string.Format(" Ad Soyad : {0} <hr> E-Posta Adresi : {1} <hr> Telefon {2} <hr>  Şirket Adı : {3}  <hr> Şirket Web : {4} <hr> Sponsor Paket : {5} <hr> Mesaj : {6}"
                        , UyeAd, Eposta, Tel, SirketAdi, SirketWeb, SponsorPaket, Mesaj);

                    eposta.Gonder(sdr["Kimden"].ToString(), "Sanalog Sponsor Başvuru", sdr["Kime"].ToString(),
                        SirketAdi, Mesajicerik);
                    sonuc += "{\"type\":\"alert alert-success\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata13") + "\"},";


                }
                catch (Exception exc) { sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + exc.Message.Replace("'", "") + Resources._default.ResourceManager.GetString("iletisim_asmx_hata14") + "\"},"; }
            }

            sdr.Close();
            vt.Kapat();
        }
        catch (System.Net.Mail.SmtpException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("iletisim_asmx_hata14") + "\"},";
        }
        catch (SqlException)
        {
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            sonuc += "{\"type\":\"alert alert-danger\",\"mesaj\":\"" + Resources._default.ResourceManager.GetString("hataBeklenmeyen") + "\"},";
        }

        sonuc = sonuc.TrimEnd(',');
        sonuc += "]}";
        return sonuc;
    }

    #endregion
}
