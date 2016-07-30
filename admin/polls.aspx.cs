using System;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Web.Services;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web;
using System.Drawing;

public partial class admin_anketler : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblAnketApp WHERE AnketId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz anketler silindi.", false);
                    GVAnketler.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }

        if (IsPostBack)
            GridSayfala(GVAnketler, "Sayfalama");
    }

    protected void GVAnketler_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVAnketler, "Sayfalama");
    }

    [WebMethod]
    public static string AnketSonuc(int AnketId)
    {
        if (!string.IsNullOrEmpty(AnketId.ToString()))
        {
            StringBuilder sb = new StringBuilder();
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            try
            {
                Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[1];
                DBPrms[0] = new Snlg_DBParameter("@AnketId", SqlDbType.Int, AnketId);

                using (SqlDataReader SDR = vt.DBReaderOlustur("snlg_V1.msp_AnketSonuc", CommandType.StoredProcedure, DBPrms))
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

    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
}
