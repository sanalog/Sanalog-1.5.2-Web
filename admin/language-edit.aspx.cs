using System;
using System.Web.UI;
using System.Data;
using System.Xml;
using System.Web.UI.WebControls;
using System.Globalization;
using System.IO;

public partial class admin_dil_duzenle : Snlg_AdminBaseClass
{
    string dil = "";
    string dosyaYolu = "";

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.QueryString["dil"]))
            Response.Redirect(Request.Url.AbsolutePath + "?dil=" + Snlg_ConfigValues.defaultLangId);

        
    }
    protected void ImgKaydet_Click(object sender, EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            dil = (new CultureInfo(Convert.ToInt32(Request.QueryString["dil"]))).Name;
            if (Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId )
                dosyaYolu = Server.MapPath("~/App_GlobalResources/default." + dil + ".resx");
            else
                dosyaYolu = Server.MapPath("~/App_GlobalResources/default.resx");

            if (Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId )
                try { File.Copy(Server.MapPath("~/App_GlobalResources/default.resx"), dosyaYolu, true); }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu. App_GlobalResources klasörünüzün  yazma izni olmayabilir.", false);
                    return;
                }

            XmlDocument doc = new XmlDocument();
            doc.Load(dosyaYolu);

            foreach (GridViewRow satir in Grid.Rows)
            {
                if (string.IsNullOrEmpty(Request.Form["v_" + satir.Cells[0].Text]))
                    continue;

                XmlNode rootnode = doc.SelectSingleNode("//root");
                XmlNode xnode = rootnode.SelectSingleNode("//data[@name='" + satir.Cells[0].Text + "']/value");
                xnode.InnerText = Request.Form["v_" + satir.Cells[0].Text];
            }

            doc.Save(dosyaYolu);
            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", true);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["dil"]) && !IsPostBack)
        {
            ImgKaydet.Visible = true;
            dil = (new CultureInfo(Convert.ToInt32(Request.QueryString["dil"]))).Name;
            if (Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId )
                dosyaYolu = Server.MapPath("~/App_GlobalResources/default." + dil + ".resx");
            else
                dosyaYolu = Server.MapPath("~/App_GlobalResources/default.resx");

            DataSet ds = new DataSet();
            DataTable dtOrj = new DataTable();
            DataTable dtLang = new DataTable();
            try
            {
                ds.ReadXml(Server.MapPath("~/App_GlobalResources/default.resx"));
                dtOrj.Merge(ds.Tables["data"]);
                dtOrj.PrimaryKey = new DataColumn[1] { dtOrj.Columns["name"] };
                dtOrj.Columns.Add(new DataColumn("yeniDeger", System.Type.GetType("System.String")));
                if (Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId )
                {
                    if (File.Exists(dosyaYolu))
                    {
                        ds.Tables.Clear();
                        ds.ReadXml(dosyaYolu);
                        dtLang.Merge(ds.Tables["data"]);
                        foreach (DataRow dr in dtLang.Rows)
                        {
                            try { dtOrj.Rows.Find(dr["name"])["yeniDeger"] = dr["value"]; }
                            catch { }
                        }
                    }
                }
                else
                    foreach (DataRow dr in dtOrj.Rows)
                        dr["yeniDeger"] = dr["value"];

                dtLang = null;
                DataView dv = dtOrj.DefaultView;
                dv.Sort = "name";
                Grid.DataSource = dv;
                Grid.DataBind();
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            }
        }
    }
}
