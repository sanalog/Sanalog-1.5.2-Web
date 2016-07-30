using System.Web.UI.WebControls;

public partial class modules_makale_en_son_yorumlanan_makaleler : Snlg_UserControlBaseClass
{
    protected void SDSMak_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
    }
}