using System;
using System.Web.UI;
using System.Data.SqlClient;
using Snlg_DataBase;
using System.Data;
using System.Xml;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public partial class admin_start_page : Snlg_AdminBaseClass
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void ImgKaydet_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
            return;

        Snlg_ConfigValues.startPage = DDLLinks.SelectedValue.Remove(0, 1);
        Snlg_ConfigValues.defaultLangId = DDLDefLang.SelectedValue;
        Snlg_ConfigValues.adminDefaultLangId = Convert.ToInt32(DDLAdminLang.SelectedValue);
        Snlg_ConfigValues.urlExtension = (CBExtension.Checked ? ".aspx" : "");

        Snlg_DBConnect vt = new Snlg_DBConnect(true);

        vt.SorguCalistir("UPDATE snlg_V1.TblDegiskenler SET Deger = @Deger WHERE Degisken = N'AcilisSayfasi'", CommandType.Text, new Snlg_DBParameter[1] { new Snlg_DBParameter("@Deger", SqlDbType.NVarChar, DDLLinks.SelectedValue.Remove(0, 1)) });
        vt.SorguCalistir("UPDATE snlg_V1.TblDegiskenler SET Deger = @Deger WHERE Degisken = N'urlExtension'", CommandType.Text, new Snlg_DBParameter[1] { new Snlg_DBParameter("@Deger", SqlDbType.NVarChar, Snlg_ConfigValues.urlExtension) });
        vt.SorguCalistir("UPDATE snlg_V1.TblDegiskenler SET Deger = @Deger WHERE Degisken = N'DefaultLang'", CommandType.Text, new Snlg_DBParameter[1] { new Snlg_DBParameter("@Deger", SqlDbType.NVarChar, Snlg_ConfigValues.defaultLangId) });
        vt.SorguCalistir("UPDATE snlg_V1.TblDegiskenler SET Deger = @Deger WHERE Degisken = N'adminDefaultLangID'", CommandType.Text, new Snlg_DBParameter[1] { new Snlg_DBParameter("@Deger", SqlDbType.NVarChar, Snlg_ConfigValues.adminDefaultLangId) });

        vt.Kapat();

        Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //site içi sayfa linkleri listeleniyor
            Snlg_DBConnect vt = new Snlg_DBConnect(true);

            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[1];
            DBPrms[0] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, DBNull.Value);
            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.msp_LinkListele", CommandType.StoredProcedure, DBPrms))
            {
                while (sdr.Read())
                {
                    ListItem item = new ListItem(sdr["LinkText"].ToString(), sdr["Link"].ToString());
                    item.Selected = sdr["Link"].ToString() == "/" + Snlg_ConfigValues.startPage;
                    DDLLinks.Items.Add(item);
                }
            }

            DataTable dtLang= vt.DataTableOlustur("SELECT DId, Name FROM snlg_V1.TblDiller WHERE Aktif = 1 ORDER BY Name", CommandType.Text);
            DDLDefLang.DataSource = dtLang;
            DDLDefLang.DataBind();
            DDLAdminLang.DataSource = dtLang;
            DDLAdminLang.DataBind();

            vt.Kapat();
            CBExtension.Checked = !string.IsNullOrEmpty(Snlg_ConfigValues.urlExtension);
            try { DDLDefLang.SelectedValue = Snlg_ConfigValues.defaultLangId; }
            catch { }
            try { DDLAdminLang.SelectedValue = Snlg_ConfigValues.adminDefaultLangId.ToString(); }
            catch { }
        }
    }

}
