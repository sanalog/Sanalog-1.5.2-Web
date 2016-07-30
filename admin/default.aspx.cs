using System;
using Snlg_DataBase;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web;

public partial class admin_Default : Snlg_AdminBaseClass
{
    //AnalyticsService service = new AnalyticsService(HttpContext.Current.Request.Url.Host);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            string GglUser = "";
            string GglPsw = "";
            string GglProfId = "";

            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.msp_DashBoardVerileri", CommandType.StoredProcedure))
            {
                if (sdr.Read())
                {
                    HL1.Text = "<span class=\"sayi\">" + sdr[0].ToString() + "</span><br /><a href=\"polls.aspx\">" + Resources.admin_language.default_poll_rate + "</a>";
                    HL2.Text = "<span class=\"sayi\">" + sdr[1].ToString() + " </span><br /><a href=\"article-comments.aspx\">" + Resources.admin_language.default_comment + "</a>";
                    HL3.Text = "<span class=\"sayi\">" + sdr[2].ToString() + " </span><br /><a href=\"members.aspx\">" + Resources.admin_language.default_members + "</a>";
                    HL4.Text = "<span class=\"sayi\">" + sdr[3].ToString() + " </span><br /><a href=\"guestbook.aspx\">" + Resources.admin_language.default_guestbok + "</a>";
                    GglUser = sdr[4].ToString();
                    GglPsw = sdr[5].ToString();
                    GglProfId = sdr[6].ToString();
                }
            }
            vt.Kapat();

            //google verileri çekilyor
            //if (!string.IsNullOrEmpty(GglUser) && !string.IsNullOrEmpty(GglPsw) && !string.IsNullOrEmpty(GglProfId))
            //{
            //    try
            //    {
            //        service.setUserCredentials(GglUser, GglPsw);
            //        GVHits.DataSource = SayfaHitleri(GglProfId);
            //        GVHits.DataBind();
            //        GeoChart(GglProfId);
            //    }
            //    catch (Exception exc) { }
            //}
        }
    }

    //private void GeoChart(string profId)
    //{
    //    DataQuery feedQuery = new DataQuery("https://www.google.com/analytics/feeds/data");
    //    feedQuery.Ids = profId;
    //    feedQuery.Dimensions = "ga:country";
    //    feedQuery.Metrics = "ga:visitors";
    //    feedQuery.GAStartDate = "2012-10-10";
    //    feedQuery.GAEndDate = DateTime.Now.ToString("yyyy-MM-dd");

    //    StringBuilder SBJs = new StringBuilder();
    //    SBJs.Append("google.load('visualization', '1', { 'packages': ['geochart'] });");
    //    SBJs.Append("$(document).ready(function(){");
    //    SBJs.Append("var data = google.visualization.arrayToDataTable([");
    //    SBJs.Append("['City',   'Hit'],");
    //    foreach (DataEntry entry in service.Query(feedQuery).Entries)
    //        SBJs.Append("['" + entry.Dimensions[0].Value + "'," + entry.Metrics[0].Value + "],");
    //    SBJs.Remove(SBJs.Length - 1, 1);
    //    SBJs.Append("]);");
    //    SBJs.Append("var options = {};");
    //    SBJs.Append("var geomap = new google.visualization.GeoChart(document.getElementById('GeoChart'));");
    //    SBJs.Append("geomap.draw(data, options);");
    //    SBJs.Append("});");

    //    HtmlGenericControl js = new HtmlGenericControl("script");
    //    js.Attributes.Add("type", "text/javascript");
    //    js.InnerHtml = SBJs.ToString();
    //    this.Header.Controls.Add(js);
    //}

    //private DataTable SayfaHitleri(string profId)
    //{
    //    DataQuery feedQuery = new DataQuery("https://www.google.com/analytics/feeds/data");
    //    feedQuery.Ids = profId;
    //    feedQuery.Dimensions = "ga:pagePath";
    //    feedQuery.Metrics = "ga:pageviews,ga:visitors,ga:visits";
    //    feedQuery.Sort = "-ga:pageviews";
    //    feedQuery.GAStartDate = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
    //    feedQuery.GAEndDate = DateTime.Now.ToString("yyyy-MM-dd");

    //    DataTable dt = new DataTable();
    //    dt.Columns.Add("pagePath", Type.GetType("System.String"));
    //    dt.Columns.Add("pageviews", Type.GetType("System.Int32"));
    //    dt.Columns.Add("visitors", Type.GetType("System.Int32"));
    //    dt.Columns.Add("visits", Type.GetType("System.Int32"));

    //    foreach (DataEntry entry in service.Query(feedQuery).Entries)
    //    {
    //        if (dt.Rows.Count >= 20)
    //            return dt;

    //        DataRow dr = dt.NewRow();
    //        dr["pagePath"] = entry.Dimensions[0].Value;
    //        dr["pageviews"] = entry.Metrics[0].Value;
    //        dr["visitors"] = entry.Metrics[1].Value;
    //        dr["visits"] = entry.Metrics[2].Value;
    //        dt.Rows.Add(dr);
    //    }
    //    return dt;
    //}

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.QueryString["tm"] == "1")
        {
            try { Response.End(); }
            catch { }
        }
    }

}
