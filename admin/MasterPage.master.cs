using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;
using System.Xml;

public partial class admin_MasterAdmin : System.Web.UI.MasterPage
{

    protected void LogOut_Click(object sender, EventArgs e)
    {
        //Snlg_MemberInfo.s_UserId = null;
        Snlg_MemberInfo.s_UserId = null;
        //Snlg_MemberInfo.c_LoginGuid = null;
        Snlg_MemberInfo.s_UserUrl = null;
        //Snlg_MemberInfo.s_YetkiSayfalar = null;
        Snlg_MemberInfo.s_YetkiSayfalar = null;
        //Snlg_MemberInfo.c_UserName = null;
        Response.Redirect("login.aspx");
    }

    public void Page_Load(object sender, EventArgs e)
    {
        LtrHead.Text = string.Format(@"
    <link rel='SHORTCUT ICON' href='{0}images/favicon.ico' />

    <!--[if lt IE 9]>
           <script type='text/javascript' src='{0}js/html5shiv.js'></script>
           <script type='text/javascript' src='{0}js/respond.min.js'></script>
        <![endif]-->
", Snlg_ConfigValues.AdminThemePath);

        if (!IsPostBack)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath("~/App_Data/MenuAdmin.xml"));
            LtrPluginMenu.Text = xdoc.SelectSingleNode("/menu").InnerXml;
        }
    }

    protected void BtnFavicon_Click(object sender, EventArgs e)
    {
        if (FU1.HasFile)
        {
            try
            {
                if (FU1.PostedFile.ContentType != "image/x-icon")
                {
                    Snlg_Hata.ziyaretci.HataGosterHatali("Yanlızca ico dosyası yükleyebilirsiniz.", false);
                    return;
                }
                if (Path.GetExtension(FU1.FileName).ToLower() != ".ico")
                {
                    Snlg_Hata.ziyaretci.HataGosterHatali("Yanlızca .ico uzantılı dosyalar yükleyebilirsiniz.", false);
                    return;
                }

                FU1.SaveAs(Server.MapPath("~/uploads/images/favicon.ico"));
            }
            catch (Exception exc)
            {
                Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu. Hata : " + exc.Message, false);
                return;
            }
        }
    }

}
