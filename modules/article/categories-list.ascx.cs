using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using Snlg_DataBase;
using System.Text;
using System;

public partial class modules_makale_kategoriler_resimsiz_blok : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        //yorumlar alınıyor
        DataTable DTKtg;

        DTKtg = vt.DataTableOlustur("snlg_V1.zsp_makale_Kategorileri", CommandType.StoredProcedure,
           new Snlg_DBParameter[1] { new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId) });

        DTKtg.PrimaryKey = new DataColumn[] { DTKtg.Columns["KtgId"] };

        //yorum yoksa gizle
        if (DTKtg.Rows.Count < 1)
            this.Visible = false;
        else
        {
            StringBuilder SBBlokHtml = new StringBuilder();
            //ilk başta üst ID si null olanlar gönderiliyor.
            MenuleriDoldur(DTKtg, SBBlokHtml, DTKtg.Select("UstId IS NULL", "Sira"));
            ltrKtg.Text = SBBlokHtml.ToString();
        }
    }

    protected void MenuleriDoldur(DataTable DTMenu, StringBuilder SBMenu, DataRow[] DRC)
    {
        if (DRC.Length < 1)
            return;

        if (DRC[0]["UstId"] == DBNull.Value)
            SBMenu.Append("<ul data-snlg='menu'>");
        else
            SBMenu.Append("<ul>");


        for (int i = 0; i < DRC.Length; i++)
        {
            DataRow[] drSubs = DTMenu.Select("UstId = " + DRC[i]["KtgID"].ToString(), "Sira");
            SBMenu.Append("<li>");
            if (drSubs.Length > 0)
            {
                if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                    SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());
                SBMenu.AppendFormat("<a href=\"javascript:;\">{0}</a><i class='fa fa-angle-right'></i>", DRC[i]["KtgAd"].ToString());

            }
            else
            {
                if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                    SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());
                SBMenu.AppendFormat("<a href=\"/{1}/{2}/{0}\">", DRC[i]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("blog"));
                SBMenu.AppendFormat("{0}</a>", DRC[i]["KtgAd"].ToString());
            }
            MenuleriDoldur(DTMenu, SBMenu, drSubs);
            SBMenu.Append("</li>");
        }
        SBMenu.Append("</ul>");

        return;
    }
}