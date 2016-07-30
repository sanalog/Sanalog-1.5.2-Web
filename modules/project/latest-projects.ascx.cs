using System.Web.UI.WebControls;

public partial class modules_proje_en_son_eklenen_projeler : Snlg_UserControlBaseClass
{
    protected void SDSMak_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
    }

    protected string LinkAyarla(object link)
    {
        if (link.ToString().Contains("http") || link.ToString().Contains("//"))
            return link.ToString();
        else if (string.IsNullOrEmpty(link.ToString()))
            return "#";
        else
            return "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("project") + "/" + link.ToString() + Snlg_ConfigValues.urlExtension;
    }
}