using System;
using Snlg_DataBase;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Web;
using System.IO;

public partial class loginAdmn : System.Web.UI.Page
{
    protected override void InitializeCulture()
    {
        //Snlg_MemberInfo.LoginDogrula();

        System.Threading.Thread.CurrentThread.CurrentCulture = System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Snlg_ConfigValues.adminDefaultLangId);
        base.InitializeCulture();
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {

        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[3];

        DBPrms[0] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, Snlg_ConfigValues.MD5Olustur(TBSifre.Text), 75);
        DBPrms[1] = new Snlg_DBParameter("@AdminId", SqlDbType.Int, WebConfigurationManager.AppSettings["AdminId"]);
        DBPrms[2] = new Snlg_DBParameter("@UserName", SqlDbType.NVarChar, TBUser.Text, 25);

        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        try
        {
            //if (Request.Url.Host.Contains("demo.sanalog."))
            //    dbReset(vt);

            SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.msp_AdminLogin", CommandType.StoredProcedure, DBPrms);
            if (sdr.Read())
            {
                //Snlg_MemberInfo.s_UserId = sdr["UyeId"].ToString();
                Snlg_MemberInfo.s_UserId = sdr["UyeId"].ToString();
                //Snlg_MemberInfo.c_LoginGuid = sdr["LoginGuid"].ToString();
                Snlg_MemberInfo.s_UserUrl = sdr["SeoUrl"].ToString();

                if (!string.IsNullOrEmpty(sdr[1].ToString().Trim()))
                {
                    //Snlg_MemberInfo.s_YetkiSayfalar = sdr[1].ToString().Trim() + ",";
                    Snlg_MemberInfo.s_YetkiSayfalar = sdr[1].ToString().Trim() + ",";
                }

                Snlg_MemberInfo.s_UserName = TBUser.Text;
            }
            else
            {

                //Snlg_MemberInfo.s_UserId = null;
                Snlg_MemberInfo.s_UserId = null;
                //Snlg_MemberInfo.c_LoginGuid = null;
                Snlg_MemberInfo.s_UserUrl = null;
                //Snlg_MemberInfo.s_YetkiSayfalar = null;
                Snlg_MemberInfo.s_YetkiSayfalar = null;
                //Snlg_MemberInfo.c_UserName = null;

            }


            sdr.Close();
        }
        catch (Exception exc)
        {
            //Snlg_MemberInfo.s_UserId = null;
            Snlg_MemberInfo.s_UserId = null;
            //Snlg_MemberInfo.c_LoginGuid = null;
            Snlg_MemberInfo.s_UserUrl = null;
            //Snlg_MemberInfo.s_YetkiSayfalar = null;
            Snlg_MemberInfo.s_YetkiSayfalar = null;
            //Snlg_MemberInfo.c_UserName = null;

            if (exc.Message.Contains("$#sqlhata1#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.login_user_psw_wrong, false, "#divLogin");
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.eror_unexcepted, false, "#divLogin");
            }
        }
        vt.Kapat();

        if (!string.IsNullOrEmpty((Snlg_MemberInfo.s_UserId)))
        {//login olduysa
            if (string.IsNullOrEmpty(Request.QueryString["url"]))
                Response.Redirect("default.aspx");
            else
                Response.Redirect(Server.UrlDecode(Request.QueryString["url"]));
        }
    }

    protected override void OnLoad(EventArgs e)
    {
        if (!IsPostBack)
            Snlg_Hata.ziyaretci.hataRedirect = false;

        LtrHead.Text = string.Format(@"
    <link rel='stylesheet' media='screen' href='{0}css/bootstrap.min.css' />
    <link rel='stylesheet' media='screen' href='{0}css/font-awesome.min.css' />
    <link rel='stylesheet' media='screen' href='{0}css/style.css' />
    <link rel='stylesheet' media='screen' href='/admin/common/css/sanalog.css' />
", Snlg_ConfigValues.AdminThemePath);
        base.OnLoad(e);
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        if (!string.IsNullOrEmpty(Snlg_Hata.ziyaretci.hataScript))
        {
            if (!Snlg_Hata.ziyaretci.hataRedirect)
            {//hata göster
                HtmlGenericControl hataJs = new HtmlGenericControl("script");
                hataJs.Attributes.Add("type", "text/javascript");
                hataJs.InnerHtml += "$(document).ready(function () {";
                hataJs.InnerHtml += "$('.errors-out').css('display', 'block');";
                hataJs.InnerHtml += Snlg_Hata.ziyaretci.hataScript;
                hataJs.InnerHtml += "});";
                this.Page.Header.Controls.Add(hataJs);

                Snlg_Hata.ziyaretci.hataScript = "";
            }
        }

        base.OnLoadComplete(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Snlg_MemberInfo.s_UserId = null;
            Snlg_MemberInfo.s_UserId = null;
            Snlg_MemberInfo.s_UserId = null;
            //Snlg_MemberInfo.c_LoginGuid = null;
            Snlg_MemberInfo.s_UserUrl = null;
            //Snlg_MemberInfo.s_YetkiSayfalar = null;
            Snlg_MemberInfo.s_YetkiSayfalar = null;
            //Snlg_MemberInfo.c_UserName = null;
            Snlg_DBConnect vt = new Snlg_DBConnect(true);
            object versiyon = vt.ScalarSorguCalistir("SELECT Deger FROM [snlg_V1].[TblDegiskenler] WHERE Degisken = 'SanalogVersiyon'", CommandType.Text);
            vt.Kapat();
            if (versiyon != null)
                LtrVers.Text = "<meta name=\"generator\" content=\"Sanalog - Bu Sitede GELECEK Var. " + versiyon.ToString() + "\" />";
        }
    }

    protected void dbReset(Snlg_DBConnect vt)
    {
        try
        {
            string script = "";
            using (StreamReader dosya = new StreamReader(Server.MapPath("/sql/create_content_1.sql"), System.Text.Encoding.UTF8))
            {
                script = dosya.ReadToEnd();
            }

            foreach (string s in script.Split(new string[] { "GO" + Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries))
                vt.SorguCalistir(s, CommandType.Text);
        }
        catch { }
    }
}