using System.Web;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;

public partial class modules_proje_kategorideki_projeler_sayfa_ici : Snlg_UserControlBaseClass
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

        //projeler db'den çekilyior.
        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];

        DBPrms[0] = new Snlg_DBParameter("@KayitSayisi", SqlDbType.SmallInt, -1, ParameterDirection.InputOutput);
        DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);
        DBPrms[2] = new Snlg_DBParameter("@KtgId", SqlDbType.Int, DBNull.Value);
        if (!string.IsNullOrEmpty(Request.QueryString["pktg"]))
            DBPrms[2].Deger = Request.QueryString["pktg"];
        DBPrms[3] = new Snlg_DBParameter("@CurrentPage", SqlDbType.TinyInt, currentPage);
        DBPrms[4] = new Snlg_DBParameter("@PageSize", SqlDbType.TinyInt, PageSize);
        #endregion


        using (SqlDataReader SDRMak = vt.DBReaderOlustur("snlg_V1.zsp_proje_KategoridekiProjeler", CommandType.StoredProcedure, DBPrms))
        {
            if (SDRMak.HasRows)//kayıt varsa işleme devam et
            {//kayıt varsa css dosyasını improt et ve datareader'ı repeater'a bağla
                Rpt.DataSource = SDRMak;
                Rpt.DataBind();
            }
            else//kayıt yoksa bu kontrolü gizle
                this.Visible = false;
        }

        //proje kategorisine ait meta verileri.
        if (this.Visible && !string.IsNullOrEmpty(Request.QueryString["pktg"]))
        {
            Snlg_DBParameter[] DBPrms2 = new Snlg_DBParameter[2];
            DBPrms2[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);
            DBPrms2[0] = new Snlg_DBParameter("@KtgId", SqlDbType.Int, Request.QueryString["pktg"]);

            using (SqlDataReader SDRMetalar = vt.DBReaderOlustur("snlg_V1.zsp_proje_KategoriDetay", CommandType.StoredProcedure, DBPrms2))
            {
                if (SDRMetalar.Read())
                {
                    base.pg = (Snlg_InterfaceBaseClass)this.Page;

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
                Int16 sayfaSay = Convert.ToInt16(Math.Ceiling(Convert.ToDouble(kayitSay) / PageSize));
                LtrSayfalama.Text = "<nav><ul class=\"pagination\">";
                for (Int16 i = 1; i <= sayfaSay; i++)
                    if (i != currentPage)
                        LtrSayfalama.Text += string.Format("<li><a class=\"current\" href=\"?page={0}\">{0}</a></li>", i.ToString());
                    else
                        LtrSayfalama.Text += string.Format("<li class='active'><a href=\"?page={0}\">{0}</a></li>", i.ToString());
                LtrSayfalama.Text += "</ul></nav>";
            }
            else//eğer sayfalanacak kadar kayuıt yoksa sayfalama kısmını gizle
                LtrSayfalama.Visible = false;
            #endregion
        }
    }
    protected string LinkAyarla(object link)
    {
        if (link.ToString().Contains("http") || link.ToString().Contains("//"))
            return link.ToString();
        else if (string.IsNullOrEmpty(link.ToString()))
            return "#";
        else
            return "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("project") + "/" + link.ToString() + Snlg_ConfigValues.urlExtension;
    }
}