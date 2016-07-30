using System.Web.UI.WebControls;
using System.Web.Configuration;
using System;
using Snlg_DataBase;
using System.Text;

public partial class modules_haber_haber_detay : Snlg_UserControlBaseClass
{
    protected void SDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //eğer kayıt var ise css dosyasını import et
        if (e.AffectedRows < 1)
            this.Visible = false;
    }

    protected string GeleriEmbed(object icerik)
    {
        StringBuilder SBicerik = new StringBuilder(icerik.ToString());
        pg.GeleriEmbed(SBicerik, vt);
        
        return SBicerik.ToString();
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

}