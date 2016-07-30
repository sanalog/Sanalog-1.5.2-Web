using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text;
using System.Data;

public partial class admin_rol_yetki : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rid"] == null && !Page.IsPostBack)
            Response.Redirect("roles.aspx", true);
    }

    protected void ImgKaydet_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Insert"))
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            StringBuilder sbSorgu = new StringBuilder();
            foreach (GridViewRow satir in GVYetki.Rows)
                if (((CheckBox)satir.FindControl("CB")).Checked)
                    sbSorgu.Append("INSERT INTO snlg_V1.TblRol_Yetki (RolId, YetkiId) VALUES(@RolId, " + GVYetki.DataKeys[satir.RowIndex].Value.ToString() + "); ");

            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
            DBPrms[1] = new Snlg_DBParameter("@RolId", SqlDbType.Int, Request.QueryString["rid"]);
            DBPrms[0] = new Snlg_DBParameter("@YetkiSql", SqlDbType.NVarChar, sbSorgu.ToString());

            vt.SorguCalistir("snlg_V1.msp_Rol_YetkiTanimla", System.Data.CommandType.StoredProcedure, DBPrms);
            vt.Kapat();
            Snlg_Hata.ziyaretci.HataGosterBasarili("Yetkiler tanımlandı.", false);
        }
    }
}
