using System;
using Snlg_DataBase;
using System.Data;

public partial class admin_sablondaki_sayfalari_tasi : Snlg_AdminBaseClass
{
    protected void BtnTasi_Click(object sender, EventArgs e)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        try
        {
            vt.SorguCalistir("snlg_V1.msp_SablonTasi", System.Data.CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@SablonIdFrom", SqlDbType.SmallInt, DDLFrom.SelectedValue), new Snlg_DBParameter("@SablonIdTo", SqlDbType.SmallInt, DDLTo.SelectedValue) });
            Snlg_Hata.ziyaretci.HataGosterBasarili("İşleminiz gerçekleştirildi.", false);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
        }
        vt.Kapat();
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
    }
}