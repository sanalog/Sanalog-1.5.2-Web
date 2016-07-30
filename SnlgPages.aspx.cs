using System;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class SnlgPage_aspx : Snlg_InterfaceBaseClass
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        //dizayn modunda değilse
        if (string.IsNullOrEmpty(Request.QueryString["sablonDesignId"]))
        {
            form1.Action = Request.RawUrl;
            ScriptOrCssFileImportHead(Snlg_ConfigValues.ThemePath + "css/bootstrap.min.css");
            ScriptOrCssFileImportHead(Snlg_ConfigValues.ThemePath + "css/font-awesome.min.css");
            ScriptOrCssFileImportHead(Snlg_ConfigValues.ThemePath + "css/style.css");
            ScriptOrCssFileImportHead(Snlg_ConfigValues.ThemePath + "css/modules.css");
            ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.ThemePath + "js/bootstrap.min.js");
            ScriptOrCssFileImportAfterBody(Snlg_ConfigValues.ThemePath + "js/bootbox.min.js");
        }   
    }


}
