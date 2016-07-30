using System.Web.UI.WebControls;
using System;
using System.Data;
using Snlg_DataBase;
using System.Configuration;
using System.Web.Configuration;
using System.Text;
using System.Web;
using System.Data.SqlClient;
using System.Globalization;

public partial class modules_makale_makale_detay : Snlg_UserControlBaseClass
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

    public string GorunurlukKontrol(object gorunurluk)
    {
        if (!string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()) && gorunurluk.ToString() == "3")
        {//login ise ve üye olmayanlar için ise
            this.Visible = false;
        }
        else if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()) && gorunurluk.ToString() == "2")
        {//login değilse ve üyeler için ise
            Snlg_Hata.ziyaretci.HataGosterUyari(GetGlobalResourceObject("default", "makale_detay_ascx_hata03").ToString(), true);
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
        else
        {
            base.pg.ScriptOrCssFileImportHead("/scripts/jquery.raty-2.4.5/js/jquery.raty.min.js");
        }
    }

    protected void Rt1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        Snlg_DBParameter[] prms = new Snlg_DBParameter[4];
        prms[0] = new Snlg_DBParameter("@MakId", SqlDbType.Int, Request.QueryString["makid"]);
        prms[1] = new Snlg_DBParameter("@Puan", SqlDbType.TinyInt, e.Value);

        prms[2] = new Snlg_DBParameter("@YazanId", SqlDbType.Int);
        prms[3] = new Snlg_DBParameter("@IP", SqlDbType.VarChar, 15);
        if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()))
        {//üye değilse
            prms[2].Deger = DBNull.Value;
            prms[3].Deger = Request.ServerVariables["REMOTE_ADDR"];
        }
        else
        {//üye ise
            prms[2].Deger = Snlg_MemberInfo.s_UserId;
            prms[3].Deger = DBNull.Value;
        }

        try
        {
            vt.SorguCalistir("snlg_V1.zsp_makale_PuanEkle", CommandType.StoredProcedure, prms);
            Snlg_Hata.ziyaretci.HataGosterBasarili(GetGlobalResourceObject("default", "makale_detay_ascx_hata04").ToString(), false);
        }
        catch (Exception exc) { Snlg_Hata.ziyaretci.ExceptionLogla(exc); }
    }

    protected string GeleriEmbed(object icerik)
    {
        StringBuilder SBicerik = new StringBuilder(icerik.ToString());
        pg.GeleriEmbed(SBicerik, vt);
        return SBicerik.ToString();
    }

    public string MakaleTaglar(string MakID)
    {
        string Taglar = string.Empty;
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
        DBPrms[0] = new Snlg_DBParameter("@MakId", SqlDbType.Int, int.Parse(MakID));
        DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

        using (SqlDataReader SDRMakaleTag = vt.DBReaderOlustur("snlg_V1.zsp_Makale_Icerik", CommandType.StoredProcedure, DBPrms))
        {
            if (SDRMakaleTag.Read())
            {
                string[] KeywordTang = SDRMakaleTag["Keyword"].ToString().Split(',');
                for (int i = 0; i < KeywordTang.Length; i++)
                {
                    KeywordTang[i] = KeywordTang[i].Trim();

                    Taglar += "<a class=\"btn btn-info btn-sm\" href=\"/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/" + Snlg_ConfigValues.GetUrlValueByKey("tag") + "/" + trReplace(KeywordTang[i]) + Snlg_ConfigValues.urlExtension + "\">" + KeywordTang[i] + "</a>&nbsp;";
                }
            }

        }

        return Taglar;
    }

    public string trReplace(string metin)
    {
        metin = metin.Replace("İ", "i");
        metin = metin.Replace("Ç", "c");
        metin = metin.Replace("Ğ", "g");
        metin = metin.Replace("Ö", "o");
        metin = metin.Replace("Ü", "u");
        metin = metin.Replace("Ş", "s");

        metin = metin.Replace("ı", "i");
        metin = metin.Replace("ç", "c");
        metin = metin.Replace("ğ", "g");
        metin = metin.Replace("ö", "o");
        metin = metin.Replace("ü", "u");
        metin = metin.Replace("ş", "s");

        CultureInfo culture = new CultureInfo("en-US");
        metin = metin.ToLower(culture);

        for (int i = 0; i < metin.Length; i++)
            if (!char.IsLetterOrDigit(metin[i]))
            {
                metin = metin.Remove(i, 1);
                metin.Insert(i, "-");
            }

        metin = metin.Replace(" ", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");

        return metin;
    }

}