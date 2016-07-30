using System;
using Snlg_DataBase;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;

public partial class modules_uyelik_uye_bilgileri : Snlg_UserControlBaseClass
{
    protected string ePosta;
    protected string UserName;
    protected string isim;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
                this.Visible = false;
            else
            {
                if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
                    this.Visible = false;
                else
                {
                    Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
                    DBPrms[0] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Snlg_MemberInfo.s_UserId);
                    DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

                    Byte[] password = new Byte[16];

                    using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeDetaySec", CommandType.StoredProcedure, DBPrms))
                    {
                        if (sdr.Read())
                        {

                            ePosta = sdr["Eposta"].ToString();
                            UserName = sdr["UserName"].ToString();
                            isim = sdr["UyeAd"].ToString();

                            if (!string.IsNullOrEmpty(sdr["Resim"].ToString()))
                            {
                                ImgRes.ImageUrl = ImgRes.ImageUrl = sdr["Resim"].ToString();
                                Image1.Visible = ImgRes.Visible = true;
                            }
                        }
                    }
                }

            }
        }
    }

    protected void Lnk_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divEdit.Visible = true;

        //edit formunu doldur
        if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
            this.Visible = false;
        else
        {

            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
            DBPrms[0] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Snlg_MemberInfo.s_UserId);
            DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

            Byte[] password = new Byte[16];

            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_UyeDetaySec", CommandType.StoredProcedure, DBPrms))
            {
                if (sdr.Read())
                {
                    TxtEPost.Text = ePosta = sdr["Eposta"].ToString();
                    UserName = sdr["UserName"].ToString();
                    TAd.Text = isim = sdr["UyeAd"].ToString();

                    if (!string.IsNullOrEmpty(sdr["Resim"].ToString()))
                    {
                        Image1.ImageUrl = ImgRes.ImageUrl = sdr["Resim"].ToString();
                        Image1.Visible = ImgRes.Visible = true;
                    }
                }
            }
        }
    }

    protected string Resim_ismi_olustur(string uzanti, string yol)
    {
        Random rnd = new Random();
        string rakam = "";
        do
        {
            rakam = rnd.Next().ToString();
        } while (File.Exists(Server.MapPath(yol + rakam + uzanti)));

        return rakam + uzanti;
    }

    protected void LinkKaydet_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()) || string.IsNullOrEmpty(TxtEPost.Text.Trim()) || string.IsNullOrEmpty(TAd.Text.Trim()))
        {
            Snlg_Hata.ziyaretci.HataGosterHatali("Eposta ve isim girmelisiniz.", false, "#" + UserControlClientID);
            return;
        }

        if (!TSifre.Text.Equals(TSifre2.Text))
        {
            Snlg_Hata.ziyaretci.HataGosterHatali("İki şifre birbirinden farklı olamaz.", false, "#" + UserControlClientID);
            return;
        }

        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];
        try
        {
            DBPrms[0] = new Snlg_DBParameter("@UyeAd", SqlDbType.VarChar, TAd.Text);
            DBPrms[1] = new Snlg_DBParameter("@Eposta", SqlDbType.VarChar, TxtEPost.Text);
            if (TSifre.Text.ToString() != "")
                DBPrms[2] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, Snlg_ConfigValues.MD5Olustur(TSifre.Text));
            else
                DBPrms[2] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, "");
            DBPrms[3] = new Snlg_DBParameter("@Dil", SqlDbType.Int, Snlg_ConfigValues.s_ZDilId);
            DBPrms[4] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Snlg_MemberInfo.s_UserId);

        }
        catch
        {
            Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.ResourceManager.GetString("uyelik_asmx_hata10"), false, "#" + UserControlClientID);

            if (FU1.HasFile)
            {
                if (FU1.PostedFile.ContentType != "image/jpeg" && FU1.PostedFile.ContentType != "image/png" && FU1.PostedFile.ContentType != "image/x-png" && FU1.PostedFile.ContentType != "image/pjpeg" && FU1.PostedFile.ContentType != "image/gif")
                    Snlg_Hata.ziyaretci.HataGosterHatali("Resim kaydedilmedi. Dosya türü uygun olmadığı için kabul edilmedi. Yanlızca JPG, JPEG, PNG ve GIF resimleri yükleyebilirsiniz.", false, "#" + UserControlClientID);
                else if (FU1.PostedFile.ContentLength > 10485760)
                    Snlg_Hata.ziyaretci.HataGosterHatali("Resim kaydedilmedi. Resmin boyutu 10 MB'dan büyük olduğu için resim kabuledilmedi.", true, "#" + UserControlClientID);
                else
                {
                    string resimAdi = Resim_ismi_olustur(Path.GetExtension(FU1.FileName), "~/uploads/user/");
                    resimAdi = "/uploads/user/" + resimAdi;
                    FU1.SaveAs(Server.MapPath(resimAdi));
                    try { File.Delete(Server.MapPath(ImgRes.ImageUrl)); }
                    catch { }

                    DBPrms = new Snlg_DBParameter[2];
                    DBPrms[0] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Snlg_MemberInfo.s_UserId);
                    DBPrms[1] = new Snlg_DBParameter("@Resim", SqlDbType.VarChar, resimAdi);
                    vt.SorguCalistir("UPDATE snlg_V1.TblUyeDetay SET Resim = @Resim FROM snlg_V1.TblUyeDetay AS TUD INNER JOIN snlg_V1.TblUyeApp AS TUA ON TUA.UyeId = TUD.UyeId  WHERE TUD.UyeId = @UyeId ", CommandType.Text, DBPrms);
                    ImgRes.ImageUrl = resimAdi;
                }
            }

            return;
        }


        #endregion

        try
        {
            vt.SorguCalistir("snlg_V1.zsp_UyeGuncelle", CommandType.StoredProcedure, DBPrms);
            Snlg_Hata.ziyaretci.HataGosterBasarili(Resources._default.ResourceManager.GetString("uyelik_asmx_hata05"), true, "#" + UserControlClientID);
            Response.Redirect(Request.RawUrl,false);
        }
        catch (Exception exc)
        {
            if (exc.Message.Contains("$#sqlhata1#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.ResourceManager.GetString("uyelik_asmx_hata04"), false, "#" + UserControlClientID);
            else if (exc.Message.Contains("$#sqlhata2#$"))
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.ResourceManager.GetString("uyelik_asmx_hata03"), false, "#" + UserControlClientID);
            else
            {
                Snlg_Hata.ziyaretci.ExceptionLogla(exc);
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources._default.ResourceManager.GetString("hataBeklenmeyen") + exc.Message, false, "#" + UserControlClientID);
            }
        }
    }
}