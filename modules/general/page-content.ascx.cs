using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text;
using System;

public partial class modules__diger_sayfa_detay : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, System.EventArgs e)
    {

    }
    public string MetalariOlustur(object title, object keyword, object descr, object aramaIndex)
    {
        //arama motorlarında gösterilsin mi
        if (!Convert.ToBoolean(aramaIndex))
            base.pg.arama_indexle = false;

        pg.title += title;
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
        pg.GeleriEmbed(SBicerik, vt);

        return SBicerik.ToString();
    }
}