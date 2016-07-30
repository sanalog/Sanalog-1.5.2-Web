using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using Snlg_DataBase;

public partial class modules_uyelik_uye_paneli : Snlg_UserControlBaseClass
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
            this.Visible = false;
        else
        {
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
            DBPrms[0] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Snlg_MemberInfo.s_UserId);
            DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeDetaySec", CommandType.StoredProcedure, DBPrms))
            {
                if (sdr.Read())
                {
                    if (!string.IsNullOrEmpty(sdr["Resim"].ToString()))
                    {
                        ImgRes.ImageUrl = sdr["Resim"].ToString();
                        ImgRes.Visible = true;
                    }
                    LtrUyeAdi.Text = sdr["UyeAd"].ToString();
                }
            }

        }
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        //Snlg_MemberInfo.s_UserId = null;
        Snlg_MemberInfo.s_UserId = null;
        //Snlg_MemberInfo.c_LoginGuid = null;
        Snlg_MemberInfo.s_UserUrl = null;
        //Snlg_MemberInfo.s_YetkiSayfalar = null;
        Snlg_MemberInfo.s_YetkiSayfalar = null;
        //Snlg_MemberInfo.c_UserName = null;
        Response.Redirect(Request.Url.AbsoluteUri, false);
    }
}