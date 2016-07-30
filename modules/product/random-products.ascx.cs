using System.Web.UI.WebControls;

public partial class modules_urun_rasgele_urunler : Snlg_UserControlBaseClass
{
    protected void SDSUrun_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
    }
}