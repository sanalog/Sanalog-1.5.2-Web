using ICSharpCode.SharpZipLib.Zip;
using Snlg_DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;

public partial class admin_theme_install : Snlg_AdminBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LinkZip_Click(object sender, EventArgs e)
    {
        if (!YetkiKontrol(pageName + "-Update"))
            return;


        try
        {
            string temaPath = Server.MapPath("~/uploads/temp/temp-uploaded");

            try { Directory.Delete(temaPath, true); }
            catch { }

            if (FU1.PostedFile.ContentType != "application/x-zip-compressed" && FU1.PostedFile.ContentType != "application/octet-stream" && FU1.PostedFile.ContentType != "application/zip" && FU1.PostedFile.ContentType != "application/x-rar-compressed")
            {
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.theme_01, false);
                return;
            }
            if (Path.GetExtension(FU1.FileName).ToLower() != ".zip")
            {
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.theme_02, false);
                return;
            }

            FU1.SaveAs(Server.MapPath("~/uploads/temp/temp-tema.zip"));
            FastZip fz = new FastZip();
            fz.ExtractZip(Server.MapPath("~/uploads/temp/temp-tema.zip"), temaPath, null);
            File.Delete(Server.MapPath("~/uploads/temp/temp-tema.zip"));

            bool exist = false;
            StringBuilder sbHtml = new StringBuilder();
            ListExistsFile(temaPath, sbHtml, 0, ref exist, temaPath);

            if (exist)
            {
                LtrList.Text = sbHtml.ToString();
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.theme_03, false);
            }
            else
                Snlg_Hata.ziyaretci.HataGosterBasarili(Resources.admin_language.theme_04, false);

            if (Directory.Exists(Path.Combine(temaPath, "sql-scripts")))
            {
                string[] sqlFiles = Directory.GetFiles(Path.Combine(temaPath, "sql-scripts"), "*.sql");
                if (sqlFiles.Length > 0)
                    Snlg_Hata.ziyaretci.HataGosterUyari(Resources.admin_language.theme_05.Replace("{0}", sqlFiles.Length.ToString()), false);
                else
                    Snlg_Hata.ziyaretci.HataGosterBasarili(Resources.admin_language.theme_06, false);
            }
            else
                Snlg_Hata.ziyaretci.HataGosterBasarili(Resources.admin_language.theme_07, false);

            divButon.Visible = true;
        }
        catch (Exception exc)
        {
            Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.theme_08 + exc.Message, false);
            return;
        }
    }

    protected void LinkOnay_Click(object sender, EventArgs e)
    {
        string temaPath = Server.MapPath("~/uploads/temp/temp-uploaded");
        string[] subFiles = Directory.GetFiles(temaPath);
        string[] subDir = Directory.GetDirectories(temaPath);

        foreach (string dir in subDir)//yazma izni varmı diye tüm dizinleri kontrol et.
        {
            if (!dir.EndsWith("sql-scripts") && Directory.Exists(dir.Replace("\\uploads\\temp\\temp-uploaded", "")))
            {
                if (!isWritableDir(dir.Replace("\\uploads\\temp\\temp-uploaded", "")))
                {
                    Snlg_Hata.ziyaretci.HataGosterHatali(Path.GetFileName(dir) + " dizinine yazma izni verilmeli.", false);
                    return;
                }
            }
        }

        if (subFiles.Length > 0)
        {//dosya var ise roota yazma izni kontrol et.
            if (!isWritableDir(Server.MapPath("/")))
            {
                Snlg_Hata.ziyaretci.HataGosterHatali(Resources.admin_language.theme_09, false);
                return;
            }
        }


        Snlg_DBConnect vt = new Snlg_DBConnect(true);
        vt.SqlTransac = vt.SqlCon.BeginTransaction();
        string sqlFile = "";
        try
        {
            #region sql'leri çalıştır
            string sqlPath = Path.Combine(temaPath + "/sql-scripts");
            if (Directory.Exists(sqlPath))
            {
                string[] sqlFiles = Directory.GetFiles(sqlPath, "*.sql");
                if (sqlFiles.Length > 0)
                {
                    foreach (string _sqlFile in sqlFiles)
                    {
                        sqlFile = _sqlFile;
                        string script = "";
                        using (StreamReader dosya = new StreamReader(sqlFile, System.Text.Encoding.UTF8))
                        {
                            script = dosya.ReadToEnd();
                        }

                        foreach (string s in script.Split(new string[] { "GO" + Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries))
                            vt.SorguCalistir(s, CommandType.Text);
                    }
                }
            }
            #endregion

            foreach (string file in subFiles)//önce tüm roottaki dosyaları kopyala
            {
                try { File.Delete(file.Replace("\\uploads\\temp\\temp-uploaded", "")); }
                catch { }
                File.Move(file, file.Replace("\\uploads\\temp\\temp-uploaded", ""));
            }

            foreach (string dir in subDir)//sonra dizinleri kopyala (sql dizini hariç)
                if (!dir.EndsWith("sql-scripts"))
                    MoveDirectory(dir, dir.Replace("\\uploads\\temp\\temp-uploaded", ""));

        }
        catch (SqlException exc)
        {
            vt.SqlTransac.Rollback();
            vt.Kapat();
            Snlg_Hata.ziyaretci.HataGosterHatali(sqlFile + " dosyasındaki sql script çalıştırılırken hata oluştu. Hata : " + exc.Message, false);
            return;
        }
        catch (Exception exc)
        {
            vt.SqlTransac.Rollback();
            vt.Kapat();
            Snlg_Hata.ziyaretci.HataGosterHatali("Hata oluştu. Hata : " + exc.Message, false);
            return;
        }

        vt.SqlTransac.Commit();
        vt.Kapat();
        try { Directory.Delete(temaPath, true); }
        catch { }
        Snlg_Hata.ziyaretci.HataGosterBasarili("Paket yüklendi.", true, "#global_errors2");
        Response.Redirect(Request.Url.AbsolutePath);
    }

    protected void ListExistsFile(string path, StringBuilder sbHtml, int i, ref bool exist, string temaPath)
    {
        string[] subFiles = Directory.GetFiles(path);
        string[] subDir = Directory.GetDirectories(path);

        if (path.EndsWith("sql-scripts"))
            return;

        if (path != temaPath)
            sbHtml.AppendFormat("<li class='zip-list-dir'><i class='fa fa-folder-open-o'></i> {0}", path.Replace(Directory.GetParent(path).FullName + "\\", "") + "\\");

        if (path == temaPath)
            sbHtml.Append("<ul>");
        else
            sbHtml.Append("<ul class='zip-list'>");

        foreach (string file in subFiles)
        {
            if (File.Exists(file.Replace("\\uploads\\temp\\temp-uploaded", "")))
            {
                exist = true;
                sbHtml.AppendFormat("<li class='has-file'><i class='fa fa-file-o'></i> {0}</li>", file.Replace(path + "\\", ""));
            }
            else
                sbHtml.AppendFormat("<li><i class='fa fa-file-o'></i> {0}</li>", file.Replace(path + "\\", ""));
        }


        sbHtml.Append("</li>");

        i++;
        foreach (string dir in subDir)
        {
            ListExistsFile(dir, sbHtml, i, ref exist, temaPath);
        }

        sbHtml.Append("</ul>");
    }

    protected bool isWritableDir(string path)
    {
        try
        {
            using (FileStream fs = File.Create(Path.Combine(path, "writable.txt"), 1, FileOptions.DeleteOnClose))
            {
            }
            return true;
        }
        catch (Exception EXC) { return false; }
    }

    public void MoveDirectory(string source, string target)
    {
        var stack = new Stack<Folders>();
        stack.Push(new Folders(source, target));

        while (stack.Count > 0)
        {
            var folders = stack.Pop();
            Directory.CreateDirectory(folders.Target);
            foreach (var file in Directory.GetFiles(folders.Source, "*.*"))
            {
                string targetFile = Path.Combine(folders.Target, Path.GetFileName(file));
                if (File.Exists(targetFile)) File.Delete(targetFile);
                File.Move(file, targetFile);
            }

            foreach (var folder in Directory.GetDirectories(folders.Source))
            {
                stack.Push(new Folders(folder, Path.Combine(folders.Target, Path.GetFileName(folder))));
            }
        }
        Directory.Delete(source, true);
    }

}

public class Folders
{
    public string Source { get; private set; }
    public string Target { get; private set; }

    public Folders(string source, string target)
    {
        Source = source;
        Target = target;
    }
}
