using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;
using System.Text.RegularExpressions;
using System.Drawing;

public partial class admin_ziyaretcidefteri : Snlg_AdminBaseClass
{
    protected void GVYorumlar_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        FVYorum.DataBind();
        MPE1.Show();
    }
    protected void SDSYorum_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", false);
            MPE1.Hide();
            GVYorumlar.DataBind();
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", true);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
            GridSayfala(GVYorumlar, "Sayfalama");
        
        if (Page.IsPostBack && !string.IsNullOrEmpty(Request.Form["HdnSil"]) && Regex.IsMatch(Request.Form["HdnSil"].Replace(",", ""), "^\\d+$"))
        {//seçilen değerler varsa siliniyor
            if (YetkiKontrol(pageName + "-Delete"))
            {
                Snlg_DBConnect vt = new Snlg_DBConnect(true);
                try
                {
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblZiyaretciDefteri WHERE UstYId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    vt.SorguCalistir("DELETE FROM snlg_V1.TblZiyaretciDefteri WHERE YId IN (" + Request.Form["HdnSil"] + ")", System.Data.CommandType.Text);
                    Snlg_Hata.ziyaretci.HataGosterBasarili("Seçtiğiniz yorumlar silindi.", false);
                    GVYorumlar.DataBind();
                }
                catch (Exception exc)
                {
                    Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                    Snlg_Hata.ziyaretci.HataGosterHatali("Beklenmeyen bir hata oluştu.", false);
                }
                vt.Kapat();
            }
        }
    }
    protected void GVYorumlar_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GVYorumlar, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void SDSYorum_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@CevapYazan"].Value = Snlg_MemberInfo.s_UserName;
        if (!YetkiKontrol(pageName + "-Update"))
        {
            e.Cancel = true;
            return;
        }

    }

}