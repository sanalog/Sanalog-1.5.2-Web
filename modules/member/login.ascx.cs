using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using Snlg_DataBase;

public partial class modules_uyelik_login : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {

        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[3];
        DBPrms[0] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, Snlg_ConfigValues.MD5Olustur(Request.Form["TLogSifre"]), 128);
        DBPrms[1] = new Snlg_DBParameter("@AdminId", SqlDbType.Int, Snlg_ConfigValues.AdminId);
        DBPrms[2] = new Snlg_DBParameter("@UserName", SqlDbType.NVarChar, Request.Form["TLogUser"], 25);

        try
        {
            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeLogin", CommandType.StoredProcedure, DBPrms);
            if (sdr.Read())
            {
                //Snlg_MemberInfo.s_UserId = sdr["UyeId"].ToString();
                Snlg_MemberInfo.s_UserId = sdr["UyeId"].ToString();
                //Snlg_MemberInfo.c_LoginGuid = sdr["LoginGuid"].ToString();
                Snlg_MemberInfo.s_UserUrl = sdr["SeoUrl"].ToString();
                if (!string.IsNullOrEmpty(sdr[1].ToString().Trim()))
                {
                    //Snlg_MemberInfo.s_YetkiSayfalar = sdr[1].ToString().Trim() + ",";
                    Snlg_MemberInfo.s_YetkiSayfalar = sdr[1].ToString().Trim() + ",";
                }

                Thread.Sleep(3000);
                Snlg_MemberInfo.s_UserName = Request.Form["TLogUser"];
                //Snlg_Hata.ziyaretci.HataGosterBasarili("Giriş başarılı.", true, "[rel=" + this.ClientID + "]");
                Response.Redirect(Request.RawUrl, false);
            }
            else
            {


                //Snlg_MemberInfo.s_UserId = null;
                Snlg_MemberInfo.s_UserId = null;
                //Snlg_MemberInfo.c_LoginGuid = null;
                Snlg_MemberInfo.s_UserUrl = null;
                //Snlg_MemberInfo.s_YetkiSayfalar = null;
                Snlg_MemberInfo.s_YetkiSayfalar = null;
                //Snlg_MemberInfo.c_UserName = null;
            }
            sdr.Close();
        }
        catch (Exception exc)
        {
            //Snlg_MemberInfo.s_UserId = null;
            Snlg_MemberInfo.s_UserId = null;
            //Snlg_MemberInfo.c_LoginGuid = null;
            Snlg_MemberInfo.s_UserUrl = null;
            //Snlg_MemberInfo.s_YetkiSayfalar = null;
            Snlg_MemberInfo.s_YetkiSayfalar = null;
            //Snlg_MemberInfo.c_UserName = null;

            if (exc.Message.Contains("$#sqlhata1#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.login_ascx_hata14, false, "#" + UserControlClientID);
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.hataBeklenmeyen, false, "#" + UserControlClientID);
            }
        }

    }


}