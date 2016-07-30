using Snlg_DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_portfolio_reference_categories : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        //yorumlar alınıyor
        DataTable DTKtg;

        DTKtg = vt.DataTableOlustur("snlg_V1.zsp_Referans_Kategorileri", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId) });

        DTKtg.PrimaryKey = new DataColumn[] { DTKtg.Columns["KtgId"] };

        //yorum yoksa gizle
        if (DTKtg.Rows.Count < 1)
            this.Visible = false;
        else
        {
            StringBuilder SBBlokHtml = new StringBuilder();
            //ilk başta üst ID si null olanlar gönderiliyor.
            for (int i = 0; i < DTKtg.Rows.Count; i++)
                SBBlokHtml.AppendFormat("<li><a href=\"/{1}/{2}/{0}\">{3}</a></li>", DTKtg.Rows[i]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension, Snlg_ConfigValues.s_Dil, Snlg_ConfigValues.GetUrlValueByKey("portfolio"), DTKtg.Rows[i]["KtgAd"].ToString());

            ltrKtg.Text = SBBlokHtml.ToString();
        }
    }

}