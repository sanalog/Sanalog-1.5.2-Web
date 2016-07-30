using System.Web.UI.WebControls;

public partial class modules_referans_en_son_eklenen_referanslar : Snlg_UserControlBaseClass
{
    protected void SDSMak_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
    }
}