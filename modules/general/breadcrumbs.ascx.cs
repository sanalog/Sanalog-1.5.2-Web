using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_general_breadcrumbs : Snlg_UserControlBaseClass
{
    protected string Url;
    protected void Page_Load(object sender, EventArgs e)
    {
        #region default olarak sayfaları bu ascxe attribute olarak at (bunu  title gösterirken aşağıda kullanacağız.
        string ascxName = this.AppRelativeVirtualPath.Replace("/", "\\").Replace("\\modules\\", "").Replace(".ascx", "").Replace("~", "");
        object ascxID = vt.ScalarSorguCalistir("SELECT UCID FROM snlg_V1.TblUCApp WHERE UCPath = '" + ascxName + "'", CommandType.Text);
        if (ascxID == null || ascxID == DBNull.Value)
            return;

        DataTable dt = vt.DataTableOlustur("SELECT DISTINCT SAd FROM snlg_V1.TblSayfaApp ORDER BY SAd", CommandType.Text);

        string key = "breadcrumbs";
        string defaultValue = dt.Rows[0]["SAd"].ToString().Replace("'", "'");
        string values = "";
        foreach (DataRow dr in dt.Rows)
            values += "," + dr["SAd"].ToString();

        values = values.Substring(1).Replace("'", "''");

        object attrID = vt.ScalarSorguCalistir("SELECT * FROM snlg_V1.TblBlockAttributeKeys WHERE BlockID = " + ascxID + " AND AttributeKey = '" + key + "'", CommandType.Text);
        if (attrID == null)
        {
            if (dt.Rows.Count > 0)
                vt.SorguCalistir("INSERT INTO snlg_V1.TblBlockAttributeKeys (BlockID, AttributeKey, DefaultValue, ValueList) VALUES(" + ascxID.ToString() + ", '" + key + "', '" + defaultValue + "', '" + values + "');", CommandType.Text);
        }
        else
        {
            if (dt.Rows.Count > 0)
                vt.SorguCalistir("UPDATE snlg_V1.TblBlockAttributeKeys SET ValueList='" + values + "' WHERE BlockID = " + ascxID + " AND AttributeKey = '" + key + "'", CommandType.Text);
        }
        #endregion


        StringBuilder SBMenu = new StringBuilder();

        #region önce ana sayfanın linkini oluştur
        object sayfa = vt.ScalarSorguCalistir("SELECT SeoUrl FROM snlg_V1.TblSayfaDetay WHERE (SayfaId = (SELECT SayfaId FROM snlg_V1.TblSayfaDetay WHERE (SeoUrl = N'" + Snlg_ConfigValues.startPage + "') AND (DId = " + Snlg_ConfigValues.defaultLangId + "))) AND (DId = " + Snlg_ConfigValues.s_ZDilId + ")", CommandType.Text);
        if (sayfa != null && sayfa != DBNull.Value)
        {
            string sayfaText = "";
            foreach (string item in sayfa.ToString().Split("-".ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
                sayfaText += item[0].ToString().ToUpper() + item.Substring(1) + " ";

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, sayfa.ToString(), sayfaText);
        }
        #endregion


        #region  breadcump çek
        if (!string.IsNullOrEmpty(Request.QueryString["syf"]))
        {
            #region sayfa ise
            string[] urlDizi = HttpContext.Current.Request.RawUrl.Split('/');

            DataTable dtMenu = vt.DataTableOlustur(@"
                WITH RekursifSorgu(MenuId)
                AS
                (
	                SELECT MenuId FROM snlg_V1.TblMenuApp
	                WHERE UstId IS NULL
		                UNION ALL
	                SELECT TMA.MenuId FROM snlg_V1.TblMenuApp TMA JOIN RekursifSorgu 
	                ON TMA.UstId = RekursifSorgu.MenuId
                )
                SELECT TMA.Sira, TMA.UstId, TMA.Hedef, RekursifSorgu.MenuId,TMA.Resim,
		                ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem,
		                ISNULL(TMD.MenuLink, (SELECT TOP 1 MenuLink FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuLink
                FROM RekursifSorgu INNER JOIN 
		                snlg_V1.TblMenuApp AS TMA ON TMA.MenuId = RekursifSorgu.MenuId LEFT OUTER JOIN
		                snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text);

            Dictionary<string, List<string>> menuHiyerarsi = new Dictionary<string, List<string>>();
            BreadCumpDoldur(dtMenu, dtMenu.Select("MenuLink = '/" + urlDizi[2] + "'"), menuHiyerarsi, "");
            if (menuHiyerarsi.Count > 0)
            {//bu sayfa menüde var ise 
                int enUzunMenu = 0;
                string enUzunMenuKey = "";
                foreach (KeyValuePair<string, List<string>> item in menuHiyerarsi)
                {
                    if (item.Value.Count > enUzunMenu)
                    {
                        enUzunMenu = item.Value.Count;
                        enUzunMenuKey = item.Key;
                    }
                }

                for (int i = enUzunMenu - 1; i >= 0; i--)
                {
                    DataRow dr = dtMenu.Select("MenuID = " + menuHiyerarsi[enUzunMenuKey][i])[0];

                    string link = "";
                    if (dr["MenuLink"].ToString().Contains("http") || dr["MenuLink"].ToString().Contains("//"))
                        link = dr["MenuLink"].ToString();
                    else if (string.IsNullOrEmpty(dr["MenuLink"].ToString().Replace("#", "")))
                        link = "#";
                    else
                        link = "/" + Snlg_ConfigValues.s_Dil + dr["MenuLink"].ToString();

                    SBMenu.AppendFormat(@"<li><a href='{0}'>{1}</a></li>", link, dr["MenuItem"].ToString());
                }
            }
            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["urunid"]))
        {
            #region ürün ise
            //ürünlerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //şimdi kategorileri listeliyoruz
            object mKtg = vt.ScalarSorguCalistir(@"SELECT TOP(1) MK.KtgId FROM snlg_V1.TblUrunApp AS M INNER JOIN snlg_V1.TblUrun_Kategori AS MK ON M.UrunID = MK.UrunID WHERE M.UrunID = " + Request.QueryString["urunid"], CommandType.Text);

            DataTable dt2 = vt.DataTableOlustur(@"
                WITH RekursifSorgu(KtgId,UstId)
                AS
                (
	                SELECT KtgId,UstId FROM snlg_V1.TblUrunKtgApp WHERE KtgID= " + mKtg + @"
		                UNION ALL
	                SELECT TMKA.KtgId,TMKA.UstId FROM snlg_V1.TblUrunKtgApp TMKA JOIN RekursifSorgu ON RekursifSorgu.UstId = TMKA.KtgId
                )
                SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM snlg_V1.TblUrunKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS KtgAd,
		                TMKD.SeoUrl
                FROM RekursifSorgu INNER JOIN 
		                snlg_V1.TblUrunKtgApp AS TMKA ON TMKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		                snlg_V1.TblUrunKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text);

            for (int i = dt2.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dt2.Rows[i];
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("shop"), dr["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dr["KtgAd"].ToString());
            }

            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	ISNULL(TMD.UrunAd, (SELECT TOP 1 UrunAd FROM snlg_V1.TblUrunDetay WHERE (UrunID = TMA.UrunID) AND (Dil = " + Snlg_ConfigValues.defaultLangId + @"))) AS UrunAd,
			                TMD.SeoUrl
                FROM	snlg_V1.TblUrunApp AS TMA LEFT OUTER JOIN
			                snlg_V1.TblUrunDetay AS TMD ON TMA.UrunID = TMD.UrunID AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + @"
                WHERE     (TMA.UrunID= " + Request.QueryString["urunid"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("shop"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["UrunAd"].ToString());

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["uktg"]))
        {
            #region ürün kategori ise
            //ürünlerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //şimdi kategorileri listeliyoruz
            object mKtg = Request.QueryString["uktg"];

            DataTable dt2 = vt.DataTableOlustur(@"
                WITH RekursifSorgu(KtgId,UstId)
                AS
                (
	                SELECT KtgId,UstId FROM snlg_V1.TblUrunKtgApp WHERE KtgID= " + mKtg + @"
		                UNION ALL
	                SELECT TMKA.KtgId,TMKA.UstId FROM snlg_V1.TblUrunKtgApp TMKA JOIN RekursifSorgu ON RekursifSorgu.UstId = TMKA.KtgId
                )
                SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM snlg_V1.TblUrunKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS KtgAd,
		                TMKD.SeoUrl
                FROM RekursifSorgu INNER JOIN 
		                snlg_V1.TblUrunKtgApp AS TMKA ON TMKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		                snlg_V1.TblUrunKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text);

            for (int i = dt2.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dt2.Rows[i];
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("shop"), dr["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dr["KtgAd"].ToString());
            }

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["makid"]))
        {
            #region makale ise
            //makalelerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //şimdi kategorileri listeliyoruz
            object mKtg = vt.ScalarSorguCalistir(@"SELECT TOP(1) MK.KtgId FROM snlg_V1.TblMakaleApp AS M INNER JOIN snlg_V1.TblMakale_Kategori AS MK ON M.MakId = MK.MakId WHERE M.MakId = " + Request.QueryString["makid"], CommandType.Text);

            DataTable dt2 = vt.DataTableOlustur(@"
                WITH RekursifSorgu(KtgId,UstId)
                AS
                (
	                SELECT KtgId,UstId FROM snlg_V1.TblMakaleKtgApp WHERE KtgID= " + mKtg + @"
		                UNION ALL
	                SELECT TMKA.KtgId,TMKA.UstId FROM snlg_V1.TblMakaleKtgApp TMKA JOIN RekursifSorgu ON RekursifSorgu.UstId = TMKA.KtgId
                )
                SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM snlg_V1.TblMakaleKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS KtgAd,
		                TMKD.SeoUrl
                FROM RekursifSorgu INNER JOIN 
		                snlg_V1.TblMakaleKtgApp AS TMKA ON TMKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		                snlg_V1.TblMakaleKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text);

            for (int i = dt2.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dt2.Rows[i];
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("blog"), dr["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dr["KtgAd"].ToString());
            }

            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM snlg_V1.TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = " + Snlg_ConfigValues.defaultLangId + @"))) AS Baslik,
			                TMD.SeoUrl
                FROM	snlg_V1.TblMakaleApp AS TMA LEFT OUTER JOIN
			                snlg_V1.TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + @"
                WHERE     (TMA.MakId= " + Request.QueryString["makid"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("blog"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["Baslik"].ToString());

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["tagvalue"]))
        {
            #region makale tag ise
            //makalelerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            string tagText = "";
            foreach (string item in Request.QueryString["tagvalue"].Split("-".ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
                tagText += item[0].ToString().ToUpper() + item.Substring(1) + " ";

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{4}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("blog"), Request.QueryString["tagvalue"] + Snlg_ConfigValues.urlExtension, tagText, Snlg_ConfigValues.GetUrlValueByKey("tag"));

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["mktg"]))
        {
            #region makale kategori ise
            //makalelerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //şimdi kategorileri listeliyoruz
            object mKtg = Request.QueryString["mktg"];

            DataTable dt2 = vt.DataTableOlustur(@"
                WITH RekursifSorgu(KtgId,UstId)
                AS
                (
	                SELECT KtgId,UstId FROM snlg_V1.TblMakaleKtgApp WHERE KtgID= " + mKtg + @"
		                UNION ALL
	                SELECT TMKA.KtgId,TMKA.UstId FROM snlg_V1.TblMakaleKtgApp TMKA JOIN RekursifSorgu ON RekursifSorgu.UstId = TMKA.KtgId
                )
                SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM snlg_V1.TblMakaleKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS KtgAd,
		                TMKD.SeoUrl
                FROM RekursifSorgu INNER JOIN 
		                snlg_V1.TblMakaleKtgApp AS TMKA ON TMKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		                snlg_V1.TblMakaleKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text);

            for (int i = dt2.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dt2.Rows[i];
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("blog"), dr["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dr["KtgAd"].ToString());
            }

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["mak_arsiv_yil"]))
        {
            #region makale ARŞİVİ ise
            //makalelerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            SBMenu.AppendFormat(@"<li>{0}</li>", LinkOlustur(Request.QueryString["mak_arsiv_yil"], Request.QueryString["mak_arsiv_ay"]));

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["paltid"]))
        {
            #region PROJE ise
            //proje listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //şimdi kategorileri listeliyoruz
            object mKtg = vt.ScalarSorguCalistir(@"SELECT TOP(1) MK.KtgId FROM snlg_V1.TblProjeAltBilgiApp AS M INNER JOIN snlg_V1.TblProje_Kategori AS MK ON M.ProjeID = MK.ProjeID WHERE M.ProjeAltId = " + Request.QueryString["paltid"], CommandType.Text);

            DataTable dt2 = vt.DataTableOlustur(@"
                WITH RekursifSorgu(KtgId,UstId)
                AS
                (
	                SELECT KtgId,UstId FROM snlg_V1.TblProjeKtgApp WHERE KtgID= " + mKtg + @"
		                UNION ALL
	                SELECT TMKA.KtgId,TMKA.UstId FROM snlg_V1.TblProjeKtgApp TMKA JOIN RekursifSorgu ON RekursifSorgu.UstId = TMKA.KtgId
                )
                SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM snlg_V1.TblProjeKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS KtgAd,
		                TMKD.SeoUrl
                FROM RekursifSorgu INNER JOIN 
		                snlg_V1.TblProjeKtgApp AS TMKA ON TMKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		                snlg_V1.TblProjeKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text);

            for (int i = dt2.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dt2.Rows[i];
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("project"), dr["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dr["KtgAd"].ToString());
            }


            //proje başlığı
            DataTable dt4 = vt.DataTableOlustur(@"
SELECT TOP (1) M.ProjeUrl,
	ISNULL(PD.Baslik, (SELECT TOP 1 Baslik FROM snlg_V1.TblProjeDetay WHERE (ProjeId = PD.ProjeId) AND (Dil = " + Snlg_ConfigValues.defaultLangId + @"))) AS Baslik
FROM  snlg_V1.TblProjeApp AS M INNER JOIN
        snlg_V1.TblProjeDetay AS PD ON M.ProjeId = PD.ProjeId INNER JOIN
        snlg_V1.TblProjeAltBilgiApp AS PD2 ON M.ProjeId = PD2.ProjeId
WHERE     (PD2.ProjeAltId= " + Request.QueryString["paltid"] + ")", CommandType.Text);

            if (dt4.Rows[0]["ProjeUrl"].ToString().ToLower().StartsWith("http"))
                SBMenu.AppendFormat(@"<li><a href='{0}'>{1}</a></li>", dt4.Rows[0]["ProjeUrl"].ToString(), dt4.Rows[0]["Baslik"].ToString());
            else
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("project"), dt4.Rows[0]["ProjeUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt4.Rows[0]["Baslik"].ToString());


            //proje alt bilgi
            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM snlg_V1.TblProjeAltBilgiDetay WHERE (ProjeAltId = TMA.ProjeAltId) AND (Dil = " + Snlg_ConfigValues.defaultLangId + @"))) AS Baslik,
			                TMD.SeoUrl
                FROM	snlg_V1.TblProjeAltBilgiApp AS TMA LEFT OUTER JOIN
			                snlg_V1.TblProjeAltBilgiDetay AS TMD ON TMA.ProjeAltId = TMD.ProjeAltId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + @"
                WHERE     (TMA.ProjeAltId= " + Request.QueryString["paltid"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("project"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["Baslik"].ToString());

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["pktg"]))
        {
            #region PROJE kategori, ise
            //projelerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //şimdi kategorileri listeliyoruz
            object mKtg = Request.QueryString["pktg"];

            DataTable dt2 = vt.DataTableOlustur(@"
                WITH RekursifSorgu(KtgId,UstId)
                AS
                (
	                SELECT KtgId,UstId FROM snlg_V1.TblProjeKtgApp WHERE KtgID= " + mKtg + @"
		                UNION ALL
	                SELECT TMKA.KtgId,TMKA.UstId FROM snlg_V1.TblProjeKtgApp TMKA JOIN RekursifSorgu ON RekursifSorgu.UstId = TMKA.KtgId
                )
                SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM snlg_V1.TblProjeKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS KtgAd,
		                TMKD.SeoUrl
                FROM RekursifSorgu INNER JOIN 
		                snlg_V1.TblProjeKtgApp AS TMKA ON TMKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		                snlg_V1.TblProjeKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text);

            for (int i = dt2.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dt2.Rows[i];
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("project"), dr["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dr["KtgAd"].ToString());
            }

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["hbrid"]))
        {
            #region haber ise
            //haberlerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //haberin bredcumps'u
            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM snlg_V1.TblHaberDetay WHERE (HaberID = TMA.HaberID) AND (Dil = " + Snlg_ConfigValues.defaultLangId + @"))) AS Baslik,
			                TMD.SeoUrl
                FROM	snlg_V1.TblHaberApp AS TMA LEFT OUTER JOIN
			                snlg_V1.TblHaberDetay AS TMD ON TMA.HaberID = TMD.HaberID AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + @"
                WHERE     (TMA.HaberID= " + Request.QueryString["hbrid"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("news"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["Baslik"].ToString());

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["dyrid"]))
        {
            #region duyuru ise
            //duyuruların listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //duyuru bredcumps'u
            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM snlg_V1.TblDuyuruDetay WHERE (DuyuruID = TMA.DuyuruID) AND (Dil = " + Snlg_ConfigValues.defaultLangId + @"))) AS Baslik,
			                TMD.SeoUrl
                FROM	snlg_V1.TblDuyuruApp AS TMA LEFT OUTER JOIN
			                snlg_V1.TblDuyuruDetay AS TMD ON TMA.DuyuruID = TMD.DuyuruID AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + @"
                WHERE     (TMA.DuyuruID= " + Request.QueryString["dyrid"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("announce"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["Baslik"].ToString());

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["rktg"]))
        {
            #region referans ise
            //kategorilerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //kategori bredcumps'u
            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	ISNULL(TMD.KtgAd, (SELECT TOP 1 KtgAd FROM snlg_V1.TblReferansKtgDetay WHERE (KtgID = TMA.KtgID) AND (Dil = " + Snlg_ConfigValues.defaultLangId + @"))) AS KtgAd,
			                SeoUrl
                FROM	snlg_V1.TblReferansKtgApp AS TMA LEFT OUTER JOIN
			                snlg_V1.TblReferansKtgDetay AS TMD ON TMA.KtgID = TMD.KtgID AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + @"
                WHERE     (TMA.KtgID= " + Request.QueryString["rktg"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("portfolio"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["KtgAd"].ToString());

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["yazar"]))
        {
            #region duyuru ise
            //editörlerin listelendiği sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //editör bredcumps'u
            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	UyeAd,SeoUrl
                FROM	snlg_V1.TblUyeApp INNER JOIN snlg_V1.TblUyeDetay ON snlg_V1.TblUyeDetay.UyeID = snlg_V1.TblUyeApp.UyeID 
                WHERE     (snlg_V1.TblUyeApp.UyeID= " + Request.QueryString["yazar"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("editor"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["UyeAd"].ToString());

            #endregion
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["uye"]))
        {
            #region üye ise
            //üyelerin sayfa menüsünü alıyoruz
            object SayfaUrl = vt.ScalarSorguCalistir("select SeoUrl from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

            object sayfaMenuText = vt.ScalarSorguCalistir(@"
SELECT ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM snlg_V1.TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = " + Snlg_ConfigValues.defaultLangId + @")) AS MenuItem
FROM snlg_V1.TblMenuApp AS TMA LEFT OUTER JOIN
		snlg_V1.TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = " + Snlg_ConfigValues.s_ZDilId + " WHERE        (TMD.MenuLink = N'/" + SayfaUrl.ToString() + "')", CommandType.Text);

            if (sayfaMenuText != null && sayfaMenuText != DBNull.Value)
                SBMenu.AppendFormat(@"<li><a href='/{0}/{1}'>{2}</a></li>", Snlg_ConfigValues.s_Dil, SayfaUrl, sayfaMenuText);

            //üye bredcumps'u
            DataTable dt3 = vt.DataTableOlustur(@"
                SELECT	UyeAd,SeoUrl
                FROM	snlg_V1.TblUyeApp INNER JOIN snlg_V1.TblUyeDetay ON snlg_V1.TblUyeDetay.UyeID = snlg_V1.TblUyeApp.UyeID 
                WHERE     (snlg_V1.TblUyeApp.UyeID= " + Request.QueryString["uye"] + ")", CommandType.Text);

            SBMenu.AppendFormat(@"<li><a href='/{0}/{1}/{2}'>{3}</a></li>", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("user"), dt3.Rows[0]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, dt3.Rows[0]["UyeAd"].ToString());

            #endregion
        }

        LtrBread.Text = SBMenu.ToString();
        #endregion


    }

    protected void BreadCumpDoldur(DataTable DTMenu, DataRow[] DRC, Dictionary<string, List<string>> listMenu, string key)
    {
        foreach (DataRow dr in DRC)
        {
            if (string.IsNullOrEmpty(key))
            {
                listMenu.Add(dr["MenuID"].ToString(), new List<string>());
                listMenu[dr["MenuID"].ToString()].Add(dr["MenuID"].ToString());
            }
            else
                listMenu[key].Add(dr["MenuID"].ToString());

            if (dr["UstId"] != DBNull.Value)
                BreadCumpDoldur(DTMenu, DTMenu.Select("MenuId = " + dr["UstId"].ToString()), listMenu, dr["MenuID"].ToString());
        }
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