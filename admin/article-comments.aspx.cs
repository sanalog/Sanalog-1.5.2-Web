using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Data;

public partial class admin_makyorum : Snlg_AdminBaseClass
{
    protected void GVYorumlar_SelectedIndexChanged(object sender, EventArgs e)
    {
        FVYorum.DataBind();
        MPE1.Show();
    }

    protected void SDSYorum_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            MPE1.Hide();
            GVYorumlar.DataBind();
            if (((CheckBox)FVYorum.FindControl("CBMail")).Checked)
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    DataTable DtMail = vt.DataTableOlustur("snlg_V1.zsp_EPostaSablonGetir_Smtp", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Anahtar", SqlDbType.VarChar, "makaleYorumOnay"), new Snlg_DBParameter("@Ozelifadeler", SqlDbType.VarChar, "$#url_adresi#$") });

                    Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[1];
                    DBPrms[0] = new Snlg_DBParameter("@YId", SqlDbType.Int, e.Command.Parameters["@YId"].Value.ToString());
                    SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.msp_MakaleYorumCevapEposta", CommandType.StoredProcedure, DBPrms);

                    if (DtMail.Rows.Count > 0)
                    {//mail gönder
                        DataRow drMail = DtMail.Rows[0];
                        Snlg_Mail eposta = new Snlg_Mail();
                        while (sdr.Read())
                        {
                            if (!string.IsNullOrEmpty(drMail["Kimden"].ToString()) && !string.IsNullOrEmpty(drMail["SmtpHost"].ToString()))
                            {
                                eposta.smtp = new System.Net.Mail.SmtpClient(drMail["SmtpHost"].ToString(), Convert.ToInt32(drMail["SmtpPort"]));
                                eposta.smtp.EnableSsl = Convert.ToBoolean(drMail["SSL_"]);
                                eposta.smtp.Credentials = new System.Net.NetworkCredential(drMail["Kimden"].ToString(), drMail["SmtpPsw"].ToString());
                            }
                            try
                            {//ilgili yorumculra mesaj
                                eposta.Gonder(drMail["Kimden"].ToString(), drMail["KimdenIsim"].ToString(), sdr["Kime"].ToString(), drMail["Konu"].ToString(), drMail["Mesaj"].ToString().Replace("$#url_adresi#$", Request.Url.Host + sdr["SeoUrl"].ToString()));
                            }
                            catch { }
                        }
                        sdr.Close();
                    }
                }
                catch { }
                vt.Kapat();
            }
        }
        else
        {
            MPE1.Hide();
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            GridSayfala(GVYorumlar, "Sayfalama");

        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblMakaleYorum FROM snlg_V1.TblMakaleYorum AS TMY INNER JOIN snlg_V1.TblMakaleApp AS TMA ON TMY.MakId = TMA.MakId WHERE TMY.YId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz yorumlar silindi.", false);
                    GVYorumlar.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }
    }
    protected void GVYorumlar_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVYorumlar, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void SDSYorum_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }
    }
}