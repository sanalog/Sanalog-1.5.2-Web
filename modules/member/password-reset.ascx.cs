using Snlg_DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_member_password_reset : Snlg_UserControlBaseClass
{
    public string UyeAdi;
    public string guid;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Uri realURL = new Uri(HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl);
                guid = HttpUtility.ParseQueryString(realURL.Query).Get("guid");
                if (!string.IsNullOrEmpty(guid))
                {
                    Snlg_DBConnect vt = new Snlg_DBConnect(true);
                    vt.Ac();
                    string SqlSorgu = string.Format(@"SELECT * FROM  snlg_V1.TblUyeApp AS TBUA INNER  JOIN snlg_V1.TblUyeDetay AS TBUD ON  TBUA.UyeId=TBUD.UyeId 
                                             WHERE TBUA.SifreUnuttumGuid='{0}'", guid);

                    DataTable DtKayitVari = vt.DataTableOlustur(SqlSorgu, CommandType.Text);
                    if (DtKayitVari.Rows.Count > 0)
                    {
                        UyeAdi = DtKayitVari.Rows[0]["UyeAd"].ToString();
                    }
                    vt.Kapat();
                }
            }
        }
        catch (Exception)
        {

        }

    }

    protected void BtnSifreSifirlama_Click(object sender, EventArgs e)
    {
        Uri realURL = new Uri(HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl);
        guid = HttpUtility.ParseQueryString(realURL.Query).Get("guid");
        if (!string.IsNullOrEmpty(guid))
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            vt.Ac();
            if (!string.IsNullOrEmpty(TxtPassword.Text) && TxtPassword.Text == TxtPassword2.Text)
            {
                string SqlSorgu = string.Format(@"SELECT * FROM  snlg_V1.TblUyeApp AS TBUA INNER  JOIN snlg_V1.TblUyeDetay AS TBUD ON  TBUA.UyeId=TBUD.UyeId  WHERE TBUA.SifreUnuttumGuid='{0}'", guid);

                DataTable DtKayitVari = vt.DataTableOlustur(SqlSorgu, CommandType.Text);
                if (DtKayitVari.Rows.Count > 0)
                {
                    #region parametreler
                    string Sifre = TxtPassword.Text;
                    Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[4];
                    try
                    {
                        string Eposta = DtKayitVari.Rows[0]["Eposta"].ToString();

                        DBPrms[0] = new Snlg_DBParameter("@IslemTipi", SqlDbType.Int, 1);
                        DBPrms[1] = new Snlg_DBParameter("@Eposta", SqlDbType.VarChar, Eposta, 150);
                        DBPrms[2] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, Snlg_ConfigValues.MD5Olustur(Sifre), 128);
                        DBPrms[3] = new Snlg_DBParameter("@guidDegeri", SqlDbType.VarChar, DBNull.Value);

                        using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeSifreSifirla", CommandType.StoredProcedure, DBPrms))
                        {
                            try
                            {
                                if (sdr.Read())
                                {
                                    Snlg_Hata.ziyaretci.HataGosterBasarili(Resources._default.login_ascx_hata13, false, "#" + UserControlClientID);
                                    TxtPassword2.Text = TxtPassword.Text = "";
                                }
                            }
                            catch (Exception exc)
                            {
                                Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.hataBeklenmeyen, false, "#" + UserControlClientID);
                            }
                        }
                    }
                    catch
                    {
                        Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.hataBeklenmeyen, false, "#" + UserControlClientID);
                    }
                    #endregion
                }
            }
            else
            {
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.login_ascx_hata12, false, "#" + UserControlClientID);
            }
        }


    }
}