using System.Data;
using System.Data.SqlClient;
using Snlg_DataBase;
using System.Text;
using System;

public partial class modules_proje_kategori_menu_resimsiz : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        //kategorilar alınıyor
        DataTable DTKtg;

        DTKtg = vt.DataTableOlustur("snlg_V1.zsp_proje_KategorileriBlok", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId) });

        //kategori yoksa gizle
        if (DTKtg.Rows.Count < 1)
            this.Visible = false;
        else
        {
            StringBuilder SBBlokHtml = new StringBuilder();
            //ilk başta üst ID si null olanlar gönderiliyor.
            MenuleriDoldur(DTKtg, SBBlokHtml, DTKtg.Select("UstId IS NULL AND SorguNo = 1", "Sira"));
            ltrKtg.Text = SBBlokHtml.ToString();
        }
    }

    protected void MenuleriDoldur(DataTable DTMenu, StringBuilder SBMenu, DataRow[] DRC)
    {
        if (DRC.Length < 1)
            return;

        int sorguNo = Convert.ToInt32(DRC[0]["SorguNo"]);

        if (DRC[0]["UstId"] == DBNull.Value)
            SBMenu.Append("<ul data-snlg='menu'>");
        else
            SBMenu.Append("<ul>");

        for (int i = 0; i < DRC.Length; i++)
        {
            DataRow[] drSubs = DTMenu.Select("UstId = " + DRC[i]["ID"].ToString() + " AND SorguNo = " + sorguNo.ToString(), "Sira");
            if (drSubs.Length < 1)
            {//eğer sorguNoya ait kayıt kalmadıysa bi sornakine geçebilmek için
                sorguNo++;
                drSubs = DTMenu.Select("UstId = " + DRC[i]["ID"].ToString() + " AND SorguNo = " + sorguNo.ToString(), "Sira");
            }


            SBMenu.Append("<li>");
            if (drSubs.Length > 0)
            {
                if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                    SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());
                SBMenu.AppendFormat("<a href=\"javascript:;\">{0}</a><i class='fa fa-angle-right'></i>", DRC[i]["KtgAd"].ToString());

            }
            else
            {
                string link = "javascript:;";
                if (DRC[i]["SeoUrl"].ToString().Contains("http") || DRC[i]["SeoUrl"].ToString().Contains("//"))
                    link = DRC[i]["SeoUrl"].ToString();
                else if (string.IsNullOrEmpty(DRC[i]["SeoUrl"].ToString().Replace("#", "")))
                    link = "javascript:;";
                else
                    link = string.Format("/{0}/{1}/{2}", Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("project"), DRC[i]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension);

                if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                    SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());
                SBMenu.AppendFormat("<a href=\"{0}\">", link);
                SBMenu.AppendFormat("{0}</a>", DRC[i]["KtgAd"].ToString());
            }
            MenuleriDoldur(DTMenu, SBMenu, drSubs);
            SBMenu.Append("</li>");

        }
        SBMenu.Append("</ul>");

        return;
    }
}

