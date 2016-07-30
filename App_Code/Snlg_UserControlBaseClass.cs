using System.Collections.Generic;
using System.Web.UI;

public class Snlg_UserControlBaseClass : UserControl
{
    public string baslik;
    public string icerik;
    public string UserControlClientID;
    public string UserControlCssClass { get { return AppRelativeVirtualPath.Replace("~/", "").Replace("/", "-").Replace(".ascx", ""); } }
    public bool baslikGorunsun;
    private Snlg_InterfaceBaseClass _pg;
    protected Snlg_InterfaceBaseClass pg
    {
        get
        {
            if (_pg == null)
                _pg = (Snlg_InterfaceBaseClass)this.Page;
            return _pg;
        }
        set { _pg = value; }
    }

    public Snlg_DataBase.Snlg_DBConnect vt
    {
        get { return pg.vt; }
        set { pg.vt = value; }
    }

    public Dictionary<string, string> BlockAttributes = new Dictionary<string, string>();

    public string GetBlockAttribute(string AttributeName)
    {
        if (!BlockAttributes.ContainsKey(AttributeName))
            return "";
        else
            return BlockAttributes[AttributeName];
    }

}


