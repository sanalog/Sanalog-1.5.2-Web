using System.Web.UI.WebControls;

public partial class modules_haber_son_haberler : Snlg_UserControlBaseClass
{
    protected void SDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //eğer kayıt var ise css dosyasını import et
        if (e.AffectedRows < 1)
            this.Visible = false;
        else
        {
            pg.ScriptOrCssFileImportHead("//cdn.jsdelivr.net/jquery.marquee/1.3.1/jquery.marquee.min.js");
        }
    }
}