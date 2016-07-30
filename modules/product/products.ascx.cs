using System.Web;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;

public partial class modules_urun_kategorideki_urunler : Snlg_UserControlBaseClass
{
    //bir sayfada kaç kayıt gösterilecek
    protected byte _PageSize = 12;
    public byte PageSize
    {
        get { return _PageSize; }
        set { _PageSize = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["uktg"]))
        {
            Int16 currentPage = 1;
            try { currentPage = Convert.ToInt16(Request.RawUrl.Substring(Request.RawUrl.IndexOf("page=") + 5).Trim()); }
            catch { }

            //urunler db'den çekilyior.
            #region parametreler
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];

            DBPrms[0] = new Snlg_DBParameter("@KayitSayisi", SqlDbType.Int, -1, ParameterDirection.InputOutput);
            DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);
            DBPrms[2] = new Snlg_DBParameter("@KtgId", SqlDbType.Int, Request.QueryString["uktg"]);
            DBPrms[3] = new Snlg_DBParameter("@CurrentPage", SqlDbType.Int, currentPage);
            DBPrms[4] = new Snlg_DBParameter("@PageSize", SqlDbType.Int, PageSize);
            #endregion

            
            using (SqlDataReader SDRUrun =  vt.DBReaderOlustur("snlg_V1.zsp_urun_KategoridekiUrunler", CommandType.StoredProcedure, DBPrms))
            {
                if (SDRUrun.HasRows)//kayıt varsa işleme devam et
                {//kayıt varsa css dosyasını improt et ve datareader'ı repeater'a bağla
                    Rpt.DataSource = SDRUrun;
                    Rpt.DataBind();
                }
                else//kayıt yoksa bu kontrolü gizle
                    this.Visible = false;
            }

            //urun kategorisine ait meta verileri.
            if (this.Visible)
            {
                Snlg_DBParameter[] DBPrms2 = new Snlg_DBParameter[2];
                DBPrms2[0] = new Snlg_DBParameter("@KtgId", SqlDbType.Int, Request.QueryString["uktg"]);
                DBPrms2[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

                using (SqlDataReader SDRMetalar =  vt.DBReaderOlustur("snlg_V1.zsp_Urun_KategoriDetay", CommandType.StoredProcedure, DBPrms2))
                {
                    if (SDRMetalar.Read())
                    {
                        LtrKtgAd.Text = SDRMetalar["KtgAd"].ToString();
                        pg.title += SDRMetalar["KtgAd"].ToString();
                        pg.keyword += SDRMetalar["Keyword"].ToString();
                        pg.description += SDRMetalar["Descr"].ToString();
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
                else//eğer sayfalanacak kadar kayuıt yoksa sayfalama kısmını gizle
                    LtrSayfalama.Visible = false;
                #endregion
            }
        }
    }
}