using System;
using System.Web.UI.WebControls;

public partial class modules_makale_arsiv_blok : Snlg_UserControlBaseClass
{
    protected void SDSMak_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows <1)
            this.Visible = false;
    }
    protected string LinkOlustur(object yil, object ay)
    {
        return "<a href=\"/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/" + yil.ToString() + "-" + ay.ToString() + Snlg_ConfigValues.urlExtension + "\">" + Ay_ismi(Convert.ToInt32(ay)) + " " + yil.ToString() + "</a>";
    }

    protected string Ay_ismi(int ay)
    {
        return new DateTime(2010, ay, 1).ToString("MMMM");
    }
}