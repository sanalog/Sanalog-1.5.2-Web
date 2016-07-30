using Snlg_DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_article_most_tags : Snlg_UserControlBaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Taglar = string.Empty;
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
        DBPrms[0] = new Snlg_DBParameter("@Adet", SqlDbType.TinyInt, 10);
        DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

        List<string> taglar = new List<string>();
        object tags = vt.ScalarSorguCalistir("snlg_V1.zsp_MakaleTaglari_EnCokPuanlanan", CommandType.StoredProcedure, DBPrms);
        {
            if (tags != null && tags != DBNull.Value)
            {
                string[] KeywordTang = tags.ToString().Split(',');
                for (int i = 0; i < KeywordTang.Length; i++)
                {
                    KeywordTang[i] = KeywordTang[i].Trim();
                    if (string.IsNullOrEmpty(KeywordTang[i]))
                        continue;

                    if (taglar.Contains(KeywordTang[i]))
                        continue;
                    else
                        taglar.Add(KeywordTang[i]);

                    Taglar += "<a class=\"btn btn-info btn-sm btn-tag\" href=\"/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/" + Snlg_ConfigValues.GetUrlValueByKey("tag") + "/" + trReplace(KeywordTang[i]) + Snlg_ConfigValues.urlExtension + "\">" + KeywordTang[i] + "</a>&nbsp;";
                }
            }
        }

        LtrTAgs.Text = Taglar;
    }

    public string trReplace(string metin)
    {
        metin = metin.Replace("İ", "i");
        metin = metin.Replace("Ç", "c");
        metin = metin.Replace("Ğ", "g");
        metin = metin.Replace("Ö", "o");
        metin = metin.Replace("Ü", "u");
        metin = metin.Replace("Ş", "s");

        metin = metin.Replace("ı", "i");
        metin = metin.Replace("ç", "c");
        metin = metin.Replace("ğ", "g");
        metin = metin.Replace("ö", "o");
        metin = metin.Replace("ü", "u");
        metin = metin.Replace("ş", "s");

        CultureInfo culture = new CultureInfo("en-US");
        metin = metin.ToLower(culture);

        for (int i = 0; i < metin.Length; i++)
            if (!char.IsLetterOrDigit(metin[i]))
            {
                metin = metin.Remove(i, 1);
                metin.Insert(i, "-");
            }

        metin = metin.Replace(" ", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");

        return metin;
    }

}