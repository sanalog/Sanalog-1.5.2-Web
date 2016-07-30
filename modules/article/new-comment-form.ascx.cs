using Snlg_DataBase;
using System.Data;

public partial class modules_makale_yeni_yorum_yaz : Snlg_UserControlBaseClass
{
    public object eposta = "";
    protected void Page_Load(object sender, System.EventArgs e)
    {

        if (string.IsNullOrEmpty(Request.QueryString["makid"]))
            this.Visible = false;
        else
        {
            pg.ScriptOrCssFileImportHead("/scripts/jquery.raty-2.4.5/js/jquery.raty.min.js");
            if (!string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
            {
                Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[1];
                DBPrms[0] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Snlg_MemberInfo.s_UserId);
                eposta = vt.ScalarSorguCalistir("SELECT Eposta FROM snlg_V1.TblUyeApp WHERE (UyeId = @UyeId) ", CommandType.Text, DBPrms);
                if (eposta == null)
                    eposta = "";
            }
        }
    }
}