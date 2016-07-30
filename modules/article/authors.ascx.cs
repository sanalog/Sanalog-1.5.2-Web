using System.Web.UI.WebControls;

public partial class modules_makale_yazarlar : Snlg_UserControlBaseClass
{
    protected void SDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        this.Visible = e.AffectedRows > 0;
    }

    protected void Page_Load(object sender, System.EventArgs e)
    {

    }
}
