using System;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using Snlg_DataBase;
using System.Xml;
using System.Web.UI;
using System.Web.Services;
using System.Web;
using System.Reflection;

public partial class install_kurulum : Page
{
    [WebMethod]
    public static string izinKontrol()
    {
        //return "1";


        if (!isWritableDir(HttpContext.Current.Server.MapPath("~/uploads")) && !isWritableDir(HttpContext.Current.Server.MapPath("~/App_GlobalResources")) && !WebConfigWritable())
            return "2";
        else
        {
            if (!isWritableDir(HttpContext.Current.Server.MapPath("~/uploads")))
                return "3";
            else if (!isWritableDir(HttpContext.Current.Server.MapPath("~/App_GlobalResources")))
                return "4";
            else if (!WebConfigWritable())
                return "5";
            else
                return "1";
        }
    }

    [WebMethod]
    public static string Step1Izinler()
    {
        //return "1";




        if (!isWritableDir(HttpContext.Current.Server.MapPath("~/uploads")) && !isWritableDir(HttpContext.Current.Server.MapPath("~/App_GlobalResources")) && !WebConfigWritable())
            return "2";
        else
        {
            if (!isWritableDir(HttpContext.Current.Server.MapPath("~/uploads")))
                return "3";
            else if (!isWritableDir(HttpContext.Current.Server.MapPath("~/App_GlobalResources")))
                return "4";
            else if (!WebConfigWritable())
                return "5";
            else
                return "1";
        }
    }

    [WebMethod]
    public static string DBCreate_Click(string TBDBServer, string TBDBName, string TBDBUser, string TBDBSifre)
    {
        //return "1";


        try
        {
            string connString = "Data Source=" + TBDBServer + "; Initial Catalog=" + TBDBName + "; User ID=" + TBDBUser + ";Password=" + TBDBSifre;
            SqlConnection baglanti = new SqlConnection(connString);

            try { baglanti.Open(); }
            catch (Exception exc) { return "<div class=\"alert alert-danger\">Veritabanı bilgilerinizde hatalar var, lütfen kontrol ediniz. Hata : " + exc.Message + "</div>"; }

            string script = "USE [" + TBDBName + "] " + Environment.NewLine + "GO" + Environment.NewLine;
            try
            {
                using (StreamReader dosya = new StreamReader(HttpContext.Current.Server.MapPath("sql/create_ilk_1.sql"), System.Text.Encoding.UTF8))
                {
                    script += dosya.ReadToEnd();
                    dosya.Close();
                }
            }
            catch (Exception exc)
            {
                baglanti.Close();
                return "<div class=\"alert alert-danger\">Veritabanı oluşturma kodları okunurken hata oluştu. create sql dosyalarının var olduğundan emin olunuz. Hata : " + exc.Message + "</div>";
            }

            SqlTransaction sqlTrans = baglanti.BeginTransaction();

            try
            {
                SqlCommand com = new SqlCommand("", baglanti, sqlTrans);
                foreach (string s in script.Split(new string[] { "GO" + Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries))
                {
                    com.CommandText = s;
                    com.ExecuteNonQuery();
                }
                sqlTrans.Commit();
            }
            catch (Exception exc)
            {
                sqlTrans.Rollback();
                baglanti.Close();
                return "<div class=\"alert alert-danger\">Girdiğiniz bilgiler doğru fakat veritabanı oluşturulurken beklenmeyen bir hata oluştu. (sql kodları hatalı olabilir) Hata : " + exc.Message + "</div>";
            }
            baglanti.Close();

            WebConfigYaz(connString, "", false);
            return "1";
        }
        catch (Exception exc) { return "<div class=\"alert alert-danger\">Beklenmeyen bir hata oluştu. Hata : " + exc.Message + "</div>"; }
    }

    [WebMethod]
    public static string DomainTanimla(string tadmin, string tsifre, string tposta, string tackl, string diller, string VarsContent, string TBDBServer, string TBDBName, string TBDBUser, string TBDBSifre, string adminLang, string defaultLang)
    {
        //return "1";


        SqlConnection baglanti = new SqlConnection("Data Source=" + TBDBServer + "; Initial Catalog=" + TBDBName + ";User ID=" + TBDBUser + ";Password=" + TBDBSifre);
        try
        {
            string script = "USE [" + TBDBName + "] " + Environment.NewLine + "GO" + Environment.NewLine;
            using (StreamReader dosya = new StreamReader(HttpContext.Current.Server.MapPath("sql/" + (VarsContent == "1" ? "create_content_1.sql" : "create_content_lite.sql")), System.Text.Encoding.UTF8))
            {
                script += dosya.ReadToEnd();
                dosya.Close();
                if (baglanti.State != ConnectionState.Open)
                    baglanti.Open();
                SqlCommand com2 = new SqlCommand("", baglanti);
                foreach (string s in script.Split(new string[] { "GO" + Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries))
                {
                    com2.CommandText = s;
                    com2.ExecuteNonQuery();
                }
            }


            /**************************************************************************/
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[7];
            DBPrms[0] = new Snlg_DBParameter("@Eposta", SqlDbType.VarChar, tposta, 75);
            DBPrms[1] = new Snlg_DBParameter("@Sifre", SqlDbType.VarChar, Snlg_ConfigValues.MD5Olustur(tsifre), 75);
            DBPrms[2] = new Snlg_DBParameter("@UserName", SqlDbType.NVarChar, tadmin, 25);
            DBPrms[3] = new Snlg_DBParameter("@DefaultLang", SqlDbType.VarChar, defaultLang);
            DBPrms[4] = new Snlg_DBParameter("@AdminId", SqlDbType.Int, 0, ParameterDirection.Output);
            DBPrms[5] = new Snlg_DBParameter("@Aciklama", SqlDbType.VarChar, tackl, 2500);
            DBPrms[6] = new Snlg_DBParameter("@AdminLang", SqlDbType.VarChar, adminLang);


            string sorgu = @"
    UPDATE snlg_V1.TblDiller SET Aktif = 0;
    UPDATE snlg_V1.TblDiller SET Aktif = 1 WHERE DId IN(" + diller + @");

   --admin oluşturuluyor
	UPDATE snlg_V1.TblUyeApp SET Eposta=@Eposta, Sifre=@Sifre, Aktif=1, UserName=@UserName, HataSay=0, UyelikTarihi=GETDATE() WHERE UyeID = 1;

	SET @AdminId = 1

	UPDATE snlg_V1.TblDegiskenler SET Deger = @AdminId WHERE Degisken = N'AdminId';
	UPDATE snlg_V1.TblDegiskenler SET Deger = GETDATE() WHERE Degisken = N'Kurulum Tarihi';
	UPDATE snlg_V1.TblDegiskenler SET Deger = @Aciklama WHERE Degisken = N'Kurulum Açıklama';
	UPDATE snlg_V1.TblDegiskenler SET Deger = @AdminLang WHERE Degisken = N'adminDefaultLangID';
	UPDATE snlg_V1.TblDegiskenler SET Deger = @DefaultLang WHERE Degisken = N'DefaultLang';
";

            //DOMAİN OLUŞTURULUYOR, admin tanımlanıyor
            SqlCommand com = new SqlCommand(sorgu, baglanti);
            com.Parameters.Add(DBPrms[0].Prm);
            com.Parameters.Add(DBPrms[1].Prm);
            com.Parameters.Add(DBPrms[2].Prm);
            com.Parameters.Add(DBPrms[3].Prm);
            com.Parameters.Add(DBPrms[4].Prm);
            com.Parameters.Add(DBPrms[5].Prm);
            com.Parameters.Add(DBPrms[6].Prm);
            com.ExecuteNonQuery();

            WebConfigYaz("", DBPrms[4].Deger.ToString(), true);

            baglanti.Close();

            try { Snlg_ConfigValues.ApplicationStartMetod(); }
            catch { }

            return "1";
        }
        catch (Exception exc)
        {
            baglanti.Close();
            if (exc.Message.Contains("$#sql_hata#$"))
                return "<div class=\"alert alert-danger\">Bu alan adı veya kullanıcı adı başkası tarafından kullanılıyor.</div>";
            else
                return "<div class=\"alert alert-danger\">Beklenmeyen bir hata oluştu. Hata : " + exc.Message + "</div>";
        }
    }

    public static bool WebConfigYaz(string connection, string adminId, bool created)
    {
        try
        {
            XmlDocument xDoc = new XmlDocument();
            xDoc.Load(HttpContext.Current.Server.MapPath("~/appSettings.config"));

            if (!string.IsNullOrEmpty(adminId))
                xDoc.SelectSingleNode("/appSettings/add[@key='AdminId']").Attributes["value"].Value = adminId;

            xDoc.Save(HttpContext.Current.Server.MapPath("~/appSettings.config"));

            xDoc.Load(HttpContext.Current.Server.MapPath("~/web.config"));
            if (!string.IsNullOrEmpty(connection))
                xDoc.SelectSingleNode("/configuration/connectionStrings/add[@name='e_cobiConn']").Attributes["connectionString"].Value = connection;

            if (created)
                try { xDoc.SelectSingleNode("/configuration/system.webServer/defaultDocument/files/add[@value='install/default.aspx']").Attributes["value"].Value = "index.html"; }
                catch { }
            xDoc.Save(HttpContext.Current.Server.MapPath("~/web.config"));
        }
        catch { return false; }
        return true;
    }

    protected static bool isWritableDir(string path)
    {
        try
        {
            using (FileStream fs = File.Create(Path.Combine(path, "writable.txt"), 1, FileOptions.DeleteOnClose))
            {
            }
            return true;
        }
        catch { return false; }
    }

    public static bool WebConfigWritable()
    {
        try
        {
            XmlDocument xDoc = new XmlDocument();
            xDoc.Load(HttpContext.Current.Server.MapPath("~/appSettings.config"));
            xDoc.SelectSingleNode("/appSettings/add[@key='AdminId']").Attributes["value"].Value = "";
            xDoc.Save(HttpContext.Current.Server.MapPath("~/appSettings.config")); // saves the web.config file

            xDoc.Load(HttpContext.Current.Server.MapPath("~/web.config"));
            xDoc.SelectSingleNode("/configuration/connectionStrings/add[@name='e_cobiConn']").Attributes["connectionString"].Value = "";
            xDoc.Save(HttpContext.Current.Server.MapPath("~/web.config")); // saves the web.config file
        }
        catch { return false; }
        return true;
    }
}


