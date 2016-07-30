using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_general_page_title : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region default olarak sayfaları bu ascxe attribute olarak at (bunu  title gösterirken aşağıda kullanacağız.
        string ascxName = this.AppRelativeVirtualPath.Replace("/", "\\").Replace("\\modules\\", "").Replace(".ascx", "").Replace("~", "");
        object ascxID = vt.ScalarSorguCalistir("SELECT UCID FROM snlg_V1.TblUCApp WHERE UCPath = '" + ascxName + "'", CommandType.Text);
        if (ascxID == null || ascxID == DBNull.Value)
            return;

        DataTable dt = vt.DataTableOlustur("SELECT DISTINCT SAd FROM snlg_V1.TblSayfaApp ORDER BY SAd", CommandType.Text);

        string key = "page-title";
        string defaultValue = dt.Rows[0]["SAd"].ToString().Replace("'", "'");
        string values = "";
        foreach (DataRow dr in dt.Rows)
            values += "," + dr["SAd"].ToString();

        values = values.Substring(1).Replace("'", "''");

        object attrID = vt.ScalarSorguCalistir("SELECT * FROM snlg_V1.TblBlockAttributeKeys WHERE BlockID = " + ascxID + " AND AttributeKey = '" + key + "'", CommandType.Text);
        if (attrID == null)
        {
            if (dt.Rows.Count > 0)
                vt.SorguCalistir("INSERT INTO snlg_V1.TblBlockAttributeKeys (BlockID, AttributeKey, DefaultValue, ValueList) VALUES(" + ascxID.ToString() + ", '" + key + "', '" + defaultValue + "', '" + values + "');", CommandType.Text);
        }
        else
        {
            if (dt.Rows.Count > 0)
                vt.SorguCalistir("UPDATE snlg_V1.TblBlockAttributeKeys SET ValueList='" + values + "' WHERE BlockID = " + ascxID + " AND AttributeKey = '" + key + "'", CommandType.Text);
        }
        #endregion


        //page title yaz
        try
        {
            if (!string.IsNullOrEmpty(Request.QueryString["syf"]))
                LtrTitle.Text = vt.ScalarSorguCalistir("select PageContentTitle from snlg_v1.TblSayfaDetay WHERE SayfaID = " + Request.QueryString["syf"] + " AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();
            else
                LtrTitle.Text = vt.ScalarSorguCalistir("select PageContentTitle from snlg_v1.TblSayfaDetay D JOIN snlg_v1.TblSayfaApp A ON A.SayfaID = D.SayfaID WHERE SAd = '" + GetBlockAttribute(key) + "' AND DId = " + Snlg_ConfigValues.s_ZDilId, CommandType.Text).ToString();

        }
        catch { }

    }
}