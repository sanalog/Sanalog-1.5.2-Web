using System.Web.UI.WebControls;
using System;
using System.Data;
using Snlg_DataBase;
using System.Configuration;
using System.Web.Configuration;
using System.Text;

public partial class modules_urun_urun_detay : Snlg_UserControlBaseClass
{
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
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GorunurlukKontrol(object gorunurluk)
    {
        if (!string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()) && gorunurluk.ToString() == "3")
        {//login ise ve üye olmayanlar için ise
            Snlg_Hata.ziyaretci.HataGosterUyari(GetGlobalResourceObject("default", "urun_detay_ascx_hata02").ToString(), true);
            if (Request.UrlReferrer == null)
                Response.Redirect("~/" + Request.RawUrl.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries)[0] + "/" + WebConfigurationManager.AppSettings["defaultPage"], true);
            else
                Response.Redirect(Request.UrlReferrer.AbsoluteUri, true);
        }
        else if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()) && gorunurluk.ToString() == "2")
        {//login değilse ve üyeler için ise
            Snlg_Hata.ziyaretci.HataGosterUyari(GetGlobalResourceObject("default", "urun_detay_ascx_hata03").ToString(), true);
            if (Request.UrlReferrer == null)
                Response.Redirect("~/" + Request.RawUrl.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries)[0] + "/" + WebConfigurationManager.AppSettings["defaultPage"], true);
            else
                Response.Redirect(Request.UrlReferrer.AbsoluteUri, true);
        }
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


    protected void FV_DataBound(object sender, EventArgs e)
    {
        Literal ltr=(Literal)FV.FindControl("LtrUrunAdi");
        txtUrunAdi.Text = ltr.Text;
    }
}