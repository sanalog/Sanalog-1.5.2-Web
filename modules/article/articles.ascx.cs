using System.Web.UI.WebControls;
using System.Data;
using Snlg_DataBase;
using System.Data.SqlClient;
using System;

public partial class modules_makale_en_son_eklenen_makaleler_sayfa : Snlg_UserControlBaseClass
{
    //bir sayfada kaç kayıt gösterilecek
    protected byte _PageSize = 5;
    public byte PageSize
    {
        get { return _PageSize; }
        set { _PageSize = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Int16 currentPage = 1;
        try { currentPage = Convert.ToInt16(Request.RawUrl.Substring(Request.RawUrl.IndexOf("page=") + 5).Trim()); }
        catch { }

        //makaleler db'den çekiliyior.
        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[4];
        DBPrms[0] = new Snlg_DBParameter("@KayitSayisi", SqlDbType.Int, -1, ParameterDirection.InputOutput);
        DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.defaultLangId);
        DBPrms[2] = new Snlg_DBParameter("@CurrentPage", SqlDbType.Int, currentPage);
        DBPrms[3] = new Snlg_DBParameter("@PageSize", SqlDbType.Int, PageSize);
        #endregion


        DataTable Dt = vt.DataTableOlustur("snlg_V1.zsp_Makale_MakaleListesi", CommandType.StoredProcedure, DBPrms);
        if (Dt.Rows.Count > 0)
        {
            Rpt.DataSource = Dt;
            Rpt.DataBind();

        }
        else//kayıt yoksa bu kontrolü gizle
            this.Visible = false;

        if (this.Visible)
        {//eğer bu kontrol visible ise sayfalamayı hazırla
         //kayıtlı duyuru sayısı alınıyor
            Int16 kayitSay = Convert.ToInt16(DBPrms[0].Deger);
            #region sayfalama
            if (kayitSay > PageSize)
            {//eğer kayıt sayısı sayfada gösterilecek olan kayıt sayısından büyükse sayfalama yap (demekki 1'den fazla sayfa var)
             //listelenecek sayfa sayısı hesaplanıyor.


                int rakam = 0;
                Int16 sayfaSay = Convert.ToInt16(Math.Ceiling(Convert.ToDouble(kayitSay) / PageSize));
                LtrSayfalama.Text = "<ul class='pagination'>";
                LtrSayfalama.Text += string.Format("<li><a  class='next' href=\"?page={0}\">←</a></li>", ((currentPage - 1) > 0 ? (currentPage - 1) : 1).ToString());

                for (Int16 i = 1; i <= sayfaSay; i++)
                {
                    if (i == currentPage)//page null ise ilk sayfayı curent yap
                        LtrSayfalama.Text += string.Format("<li class='active'><a  href=\"?page={0}\">{0}</a></li>", i.ToString());
                    else//diğer sayfaları normal link yap (current yapma)
                        LtrSayfalama.Text += string.Format("<li><a href=\"?page={0}\">{0}</a></li>", i.ToString());

                    rakam = i;
                }
                LtrSayfalama.Text += string.Format("<li><a  class='next' href=\"?page={0}\">→</a></li>", (((currentPage + 1) <= sayfaSay) ? currentPage + 1 : currentPage).ToString());
                LtrSayfalama.Text += "</ul>";
            }
            else//eğer sayfalanacak kadar kayıt yoksa sayfalama kısmını gizle
                LtrSayfalama.Visible = false;
            #endregion
        }


    }
    protected void SDSMak_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows < 1)
            this.Visible = false;
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