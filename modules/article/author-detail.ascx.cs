using Snlg_DataBase;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_makale_yazar_detay : Snlg_UserControlBaseClass
{
    public string resim = "";
    public string isim = "";
    public string bilgi = "";
    //bir sayfada kaç kayıt gösterilecek
    protected byte _PageSize = 15;
    public byte PageSize
    {
        get { return _PageSize; }
        set { _PageSize = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["yazar"]))
        {
            Int16 currentPage = 1;
            try { currentPage = Convert.ToInt16(Request.RawUrl.Substring(Request.RawUrl.IndexOf("page=") + 5).Trim()); }
            catch { }

            //makaleler db'den çekiliyor.
            #region parametreler
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];
            DBPrms[0] = new Snlg_DBParameter("@KayitSayisi", SqlDbType.Int, -1, ParameterDirection.InputOutput);
            DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);
            DBPrms[2] = new Snlg_DBParameter("@YazarId", SqlDbType.Int, Request.QueryString["yazar"]);
            DBPrms[3] = new Snlg_DBParameter("@CurrentPage", SqlDbType.Int, currentPage);
            DBPrms[4] = new Snlg_DBParameter("@PageSize", SqlDbType.Int, PageSize);
            #endregion


            DataTable Dt = vt.DataTableOlustur("snlg_V1.zsp_makale_YazarMakaleler", CommandType.StoredProcedure, DBPrms);
            {
                if (Dt.Rows.Count > 0)//kayıt varsa işleme devam et
                {//kayıt varsa css dosyasını improt et ve datareader'ı repeater'a bağla
                    //base.pg.ScriptOrCssFileImportHead(Snlg_ConfigValues.ThemePath + "scripts/jquery.raty-2.4.5/js/jquery.raty.min.js");

                    Rpt.DataSource = Dt;
                    Rpt.DataBind();
                }
                else//kayıt yoksa bu kontrolü gizle
                    this.Visible = false;
            }

            //yazara ait meta verileri.
            if (this.Visible)
            {
                Snlg_DBParameter[] DBPrms2 = new Snlg_DBParameter[2];
                DBPrms2[0] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Request.QueryString["yazar"]);
                DBPrms2[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

                DataTable Dt2 = vt.DataTableOlustur("snlg_V1.zsp_Makale_YazarDetay", CommandType.StoredProcedure, DBPrms2);
                {
                    if (Dt2.Rows.Count > 0)
                    {
                        isim = Dt2.Rows[0]["UyeAd"].ToString();
                        bilgi = Dt2.Rows[0]["UyeBilgi"].ToString();
                        resim = Dt2.Rows[0]["Resim"].ToString();
                        pg.title += Dt2.Rows[0]["UyeAd"].ToString();
                        pg.keyword += Dt2.Rows[0]["UyeAd"].ToString();
                        pg.description += Dt2.Rows[0]["UyeBilgi"].ToString();
                    }
                }
            }


            if (this.Visible)
            {//eğer bu kontrol visible ise sayfalamayı hazırla
                //kayıtlı duyuru sayısı alınıyor
                Int16 kayitSay = Convert.ToInt16(DBPrms[0].Deger);
                #region sayfalama
                if (kayitSay > PageSize)
                {//eğer kayıt sayısı sayfada gösterilecek olan kayıt sayısından büyükse sayfalama yap (demekki 1'den fazla sayfa var)
                    //listelenecek sayfa sayısı hesaplanıyor.
                    Int16 sayfaSay = Convert.ToInt16(Math.Ceiling(Convert.ToDouble(kayitSay) / PageSize));
                    LtrSayfalama.Text = "<div class=\"pager\">";
                    for (Int16 i = 1; i <= sayfaSay; i++)
                        if (i != currentPage)
                            LtrSayfalama.Text += string.Format("<li><a href=\"?page={0}\">{0}</a></li>", i.ToString());
                        else
                            LtrSayfalama.Text += string.Format("<li><a class=\"current\" href=\"?page={0}\">{0}</a></li>", i.ToString());
                    LtrSayfalama.Text += "</div>";
                }
                else//eğer sayfalanacak kadar kayuıt yoksa sayfalama kısmını gizle
                    LtrSayfalama.Visible = false;
                #endregion
            }
        }
    }
    public string MakaleKategoriListesi(string MakaleID)
    {
        string Kategoriler = string.Empty;
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
        DBPrms[0] = new Snlg_DBParameter("@MakId", SqlDbType.Int, int.Parse(Eval("MakId").ToString()));
        DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

        DataTable Dt = vt.DataTableOlustur("snlg_V1.zsp_Makale_KategoriListesi", CommandType.StoredProcedure, DBPrms);

        if (Dt.Rows.Count > 0)
        {
            for (int i = 0; i < Dt.Rows.Count; i++)
            {
                Kategoriler = " <a href=\"/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/" + Dt.Rows[i]["SeoUrl"].ToString() + Snlg_ConfigValues.urlExtension + "\">" + Dt.Rows[i]["KtgAd"].ToString() + "</a>";
            }
        }
        return Kategoriler;

    }
}
