using System;
using Snlg_DataBase;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Xml;

public partial class admin_sablondaki_sayfalari_tasi : Snlg_AdminBaseClass
{
    protected void BtnTasi_Click(object sender, EventArgs e)
    {
        try
        {
            XmlDocument xDoc = new XmlDocument();
            xDoc.Load(Server.MapPath("~/appSettings.config"));
            xDoc.SelectSingleNode("/appSettings/add[@key='ThemeName']").Attributes["value"].Value = RBLTheme.SelectedValue;
            xDoc.SelectSingleNode("/appSettings/add[@key='AdminThemePath']").Attributes["value"].Value = DdlAdmin.SelectedValue;
            xDoc.Save(Server.MapPath("~/appSettings.config"));
            WebConfigurationManager.AppSettings["ThemeName"] = RBLTheme.SelectedValue;
            WebConfigurationManager.AppSettings["AdminThemePath"] = DdlAdmin.SelectedValue;
            Snlg_Hata.ziyaretci.HataGosterBasarili(Resources.admin_language.theme_error2, true);
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.theme_eror1 + exc.Message, true);
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string tema = "";
            //temaları listele
            foreach (string klasor in Directory.GetDirectories(Server.MapPath("~/themes/")))
            {
                try
                {
                    tema = new DirectoryInfo(klasor).Name;
                    ListItem item = new ListItem(tema);
                    if (WebConfigurationManager.AppSettings["ThemeName"] == tema)
                        item.Selected = true;
                    RBLTheme.Items.Add(item);
                }
                catch { }
            }

            tema = "";
            //temaları listele
            foreach (string klasor in Directory.GetDirectories(Server.MapPath("~/admin/themes/")))
            {
                try
                {
                    tema = new DirectoryInfo(klasor).Name;
                    ListItem item = new ListItem(tema);
                    if (WebConfigurationManager.AppSettings["AdminThemePath"] == tema)
                        item.Selected = true;
                    DdlAdmin.Items.Add(item);
                }
                catch { }
            }
        }
    }
}