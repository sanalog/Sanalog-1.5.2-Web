using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_article_authors_random : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        this.Visible = e.AffectedRows > 0;
    }
}