using System;
using System.Web;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using Snlg_DataBase;
using System.Data;

public class Snlg_AdminBaseClass : System.Web.UI.Page
{
    protected List<string> scriptsDosyasi = new List<string>();
    protected List<string> cssDosyasi = new List<string>();
    protected string pageName = Path.GetFileName(HttpContext.Current.Request.Url.AbsolutePath);

    protected override void InitializeCulture()
    {
        //Snlg_MemberInfo.LoginDogrula();

        System.Threading.Thread.CurrentThread.CurrentCulture = System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Snlg_ConfigValues.adminDefaultLangId);
        base.InitializeCulture();
    }
    protected override void OnPreInit(EventArgs e)
    {
        if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
        {//kullanıc login olmamışsa redirect
            Response.Redirect("/admin/login.aspx?url=" + Server.UrlEncode(Request.Url.AbsolutePath + "?" + Request.QueryString));
        }

        YetkiKontrol(pageName + "-View", true);

        base.OnPreInit(e);
    }
    protected override void OnLoad(EventArgs e)
    {
        if (!IsPostBack)
            Snlg_Hata.ziyaretci.hataRedirect = false;

        Literal LtrScriptFile = ((Literal)Master.FindControl("LtrScriptFile"));
        Literal LtrHead = ((Literal)Master.FindControl("LtrHead"));
        LtrHead.Text = LtrScriptFile.Text = "";

       
        ScriptOrCssFileImportHead(Snlg_ConfigValues.AdminThemePath + "css/bootstrap.min.css");
        ScriptOrCssFileImportHead("/admin/common/css/sanalog.css");
        ScriptOrCssFileImportHead(Snlg_ConfigValues.AdminThemePath + "css/font-awesome.min.css");
        ScriptOrCssFileImportHead(Snlg_ConfigValues.AdminThemePath + "css/style.css");
        ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.AdminThemePath + "js/bootstrap.min.js");
        ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.AdminThemePath + "js/twitter-bootstrap-hover-dropdown.min.js");
        ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.AdminThemePath + "js/jquery.smartmenus.js");
        ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.AdminThemePath + "js/jquery.smartmenus.bootstrap.js");
        ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.AdminThemePath + "js/bootbox.min.js");
        ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.AdminThemePath + "js/customConfirmJS.js");


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


        Literal LtrScriptFile = ((Literal)Master.FindControl("LtrScriptFile"));
        Literal LtrHead = ((Literal)Master.FindControl("LtrHead"));
        //scriptler ve css'ler import ediliyor
        foreach (string importPath in scriptsDosyasi)
            LtrScriptFile.Text += ("<script type=\"text/javascript\" src=\"" + importPath + "\"></script>");
        foreach (string importPath in cssDosyasi)
            LtrHead.Text += ("<link href=\"" + importPath + "\" rel=\"stylesheet\" type=\"text/css\" />");


        base.OnLoadComplete(e);
    }

    public void ScriptOrCssFileImportHead(string yol)
    {
        if (Path.GetExtension(yol) == ".js")
        {
            if (!scriptsDosyasi.Contains(yol))
                scriptsDosyasi.Add(yol);
        }
        else if (Path.GetExtension(yol) == ".css")
        {
            if (!cssDosyasi.Contains(yol))
                cssDosyasi.Add(yol);
        }
    }
    public void ScriptOrCssFileImportHead(string yol, string tip)
    {
        if (tip == "js")
        {
            if (!scriptsDosyasi.Contains(yol))
                scriptsDosyasi.Add(yol);
        }
        else if (tip == "css")
        {
            if (!cssDosyasi.Contains(yol))
                cssDosyasi.Add(yol);
        }
    }

    public void ScriptOrCssFileImportAfterBody(string yol)
    {
        if (!scriptsDosyasi.Contains(yol))
            ((Literal)Page.Master.FindControl("LtrScriptFile")).Text += "<script src='" + yol + "' type='text/javascript'></script>";
    }


    protected bool YetkiKontrol(string yetki)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        bool deger = true;
        vt.Ac();
        object sonuc = vt.ScalarSorguCalistir("snlg_V1.msp_AdminRolKontrol ", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@pageName", SqlDbType.NVarChar, yetki), new Snlg_DBParameter("@UyeID", SqlDbType.Int, Snlg_MemberInfo.s_UserId) });
        if (sonuc.ToString() == "0" && Snlg_MemberInfo.s_UserId != Snlg_ConfigValues.AdminId)
        {
            Snlg_Hata.ziyaretci.HataGosterHatali("Bu işlem için yetkili değilsiniz. \"" + yetki + "\" yetki anahtarı için yetki almalısınız.", true);
            deger = false;
        }
        vt.Kapat();
        return deger;
    }

    protected void YetkiKontrol(string yetki, bool redirect)
    {
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        {
            vt.Ac();
            object sonuc = vt.ScalarSorguCalistir("snlg_V1.msp_AdminRolKontrol ", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@pageName", SqlDbType.NVarChar, yetki), new Snlg_DBParameter("@UyeID", SqlDbType.Int, Snlg_MemberInfo.s_UserId) });
            if (sonuc.ToString() == "0" && Snlg_MemberInfo.s_UserId != Snlg_ConfigValues.AdminId)
            {
                Snlg_Hata.ziyaretci.HataGosterHatali("Bu işlem için yetkili değilsiniz. \"" + yetki + "\" yetki anahtarı için yetki almalısınız.", true);
                if (Request.UrlReferrer != null)
                    Response.Redirect(Request.UrlReferrer.AbsoluteUri, redirect);
                else
                    Response.Redirect("/admin/login.aspx", redirect);
            }
            vt.Kapat();
        }
    }

    protected void GridSayfala(GridView grid, string linkId)
    {
        for (int i = 1; i <= grid.PageCount; i++)
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            if (i == grid.PageIndex + 1)
                li.Attributes.Add("class", "active");

            LinkButton lnkPage = new LinkButton();
            lnkPage.Text = i.ToString();
            lnkPage.CommandName = "Page";
            lnkPage.CommandArgument = i.ToString();

            li.Controls.Add(lnkPage);
            grid.BottomPagerRow.FindControl(linkId).Controls.Add(li);
        }

    }

}