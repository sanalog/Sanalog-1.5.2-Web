using System;
using System.Web.UI;
using System.Data.SqlClient;
using Snlg_DataBase;
using System.Data;

public partial class admin_arama_motoru : Snlg_AdminBaseClass
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void ImgKaydet_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Insert"))
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];
            DBPrms[0] = new Snlg_DBParameter("@GglProfId", SqlDbType.NVarChar, "");
            DBPrms[1] = new Snlg_DBParameter("@GglDogrula", SqlDbType.NVarChar, TBValid.Text);
            DBPrms[2] = new Snlg_DBParameter("@GglAnalytic", SqlDbType.NVarChar, TBAnly.Text);
            DBPrms[3] = new Snlg_DBParameter("@GglUser", SqlDbType.NVarChar, "");
            DBPrms[4] = new Snlg_DBParameter("@GglPsw", SqlDbType.NVarChar, "");
            vt.SorguCalistir("snlg_V1.msp_AramaMotoruDuzenle", CommandType.StoredProcedure, DBPrms);
            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            vt.Kapat();
            Snlg_ConfigValues.aramaMotoru = TBValid.Text + TBAnly.Text;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            using (SqlDataReader sdr = vt.DBReaderOlustur("SELECT GglDogrula, GglAnalytic, GglUser, GglPsw, GglProfId FROM snlg_V1.TblAramaMotoru", CommandType.Text))
            {
                if (sdr.Read())
                {
                    TBAnly.Text = sdr["GglAnalytic"].ToString();
                    TBValid.Text = sdr["GglDogrula"].ToString();
                }
            }
            vt.Kapat();
        }
    }
}
