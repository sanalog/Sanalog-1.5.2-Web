using System.Web.UI.WebControls;
using System;
using System.Web.UI;
using Snlg_DataBase;
using System.Data;

public partial class admin_varsayilan_resimler : Snlg_AdminBaseClass
{
    protected void SDS_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            HdnHataTur.Value = "alert alert-danger";
            HdnHata.Value = "Beklenmeyen bir hata oluştu.";
        }
    }
    protected void SDS_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            HdnHataTur.Value = "alert alert-danger";
            HdnHata.Value = "Beklenmeyen bir hata oluştu.";
        }
        else
        {
            HdnHataTur.Value = "alert alert-success";
            HdnHata.Value = "Değişiklik kaydedildi.";
        }
    }
    protected void SDS_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            HdnHataTur.Value = "alert alert-success";
            HdnHata.Value = "Resim tanımlandı.";
            GV.DataBind();
        }
        else
        {
            Snlg_Hata.ziyaretci.ExceptionLogla(e.Exception);
            e.ExceptionHandled = true;
            HdnHataTur.Value = "alert alert-danger";
            HdnHata.Value = "Beklenmeyen bir hata oluştu. (Resim yüklememiş olabilirsin)";
        }
    }
    protected void TBAd_TextChanged(object sender, System.EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
            GV.UpdateRow(satir.RowIndex, true);
        }
        else
            Snlg_Hata.ziyaretci.HataGosterHatali("Bu işlemi yapmak için yetkili değilsiniz.", false);
        return;
    }
    protected void T1_TextChanged(object sender, System.EventArgs e)
    {
        if (YetkiKontrol(pageName + "-Update"))
        {
            GridViewRow satir = (GridViewRow)((Control)sender).NamingContainer;
            GV.UpdateRow(satir.RowIndex, true);
        }
        else
            Snlg_Hata.ziyaretci.HataGosterHatali("Bu işlemi yapmak için yetkili değilsiniz.", false);
        return;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            GridSayfala(GV, "Sayfalama");
    }
    protected void GV_DataBound(object sender, EventArgs e)
    {
        GridSayfala(GV, "Sayfalama");
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {

    }
    protected void SDS_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            e.Cancel = true;
            return;
        }
    }
    protected void SDS_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Insert"))
        {
            e.Cancel = true;
            return;
        }

    }

    protected void LinkRSil_Command(object sender, CommandEventArgs e)
    {//resim silniyor.
        if (!YetkiKontrol(pageName + "-Delete"))
        {
            return;
        }
        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        int silinen = vt.SorguCalistir("UPDATE snlg_V1.TblVarsayilanResimler SET ResimYol = NULL WHERE AnahtarId = @AnahtarId ", CommandType.Text, new Snlg_DBParameter[] { new Snlg_DBParameter("@AnahtarId", SqlDbType.Int, e.CommandArgument.ToString()) });
        vt.Kapat();
        Snlg_Hata.ziyaretci.HataGosterBasarili("Resim silindi.", false);
        GV.DataBind();
    }

    protected void BtnSaveImage_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow satir in GV.Rows)
            if (satir.RowType == DataControlRowType.DataRow)
                GV.UpdateRow(satir.RowIndex, true);
        Response.Redirect(Request.Url.AbsolutePath);
    }
}
