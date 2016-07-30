using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text;
using System;

public partial class modules_proje_proje_detay : Snlg_UserControlBaseClass
{
    public string MetalariOlustur(object title, object keyword, object descr, object aramaIndex, object proje)
    {
        //arama motorlarında gösterilsin mi
        if (!Convert.ToBoolean(aramaIndex))
            base.pg.arama_indexle = false;

        pg.title += proje.ToString() + " - " + title.ToString();
        pg.keyword += keyword;
        pg.description += descr;

        return "";
    }

    protected void SDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
    }

    protected string GeleriEmbed(object icerik)
    {
        StringBuilder SBicerik = new StringBuilder(icerik.ToString());
        pg.GeleriEmbed(SBicerik, base.pg.vt);

        return SBicerik.ToString();
    }
}