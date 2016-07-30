using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Data;

public partial class modules_anket_anketler_blok : Snlg_UserControlBaseClass
{
    protected void SDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
    }

    protected void SDS_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters["@IP"].Value = Request.UserHostAddress;
    }
}