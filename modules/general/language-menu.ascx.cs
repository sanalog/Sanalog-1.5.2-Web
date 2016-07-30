using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
using System.Web.UI.WebControls;

public partial class modules_diger_dil_degistir : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }
    protected void SDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
    }

    protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        CultureInfo cuNew = new CultureInfo(e.CommandArgument.ToString());
        SqlDataReader sdr = vt.DBReaderOlustur("SELECT Id, UrlAnahtar, SablonAnahtar FROM snlg_V1.TblSiteLinkleri WHERE(SeoUrl = '" + Request.RawUrl.Substring(Request.RawUrl.LastIndexOf("/") + 1) + "') AND Dil = " + Thread.CurrentThread.CurrentCulture.LCID.ToString(), CommandType.Text);
        if (sdr.Read())
        {
            string linkId = sdr["Id"].ToString();
            string urlAnahtar = sdr["UrlAnahtar"].ToString();
            string sablonAnahtar = sdr["SablonAnahtar"].ToString();
            sdr.Close();

            object menuUrl = vt.ScalarSorguCalistir("SELECT SeoUrl FROM snlg_V1.TblSiteLinkleri WHERE(Id = " + linkId + ") AND UrlAnahtar = '" + urlAnahtar + "' AND SablonAnahtar = '" + sablonAnahtar + "' AND Dil = " + cuNew.LCID.ToString(), CommandType.Text);
            if (menuUrl == null || string.IsNullOrEmpty(menuUrl.ToString()))
                menuUrl = Request.RawUrl.Substring(Request.RawUrl.LastIndexOf("/") + 1);

            vt.Kapat();

            string[] splitUrl = Request.RawUrl.Split('/');

            if (splitUrl.Length > 3)
            {
                string urlKey = Snlg_ConfigValues.GetUrlKeyByValue(splitUrl[2]);
                DataRow dr = Snlg_ConfigValues.DTurlKeyList.Select("Dil = " + cuNew.LCID.ToString() + " AND UrlKeyName = '" + urlKey + "'")[0];
                Response.Redirect("/" + cuNew.Name + "/" + dr["UrlKeyValue"].ToString() + "/" + menuUrl + Snlg_ConfigValues.urlExtension);
            }
            else
                Response.Redirect("/" + cuNew.Name + "/" + menuUrl + Snlg_ConfigValues.urlExtension);
        }
    }

}