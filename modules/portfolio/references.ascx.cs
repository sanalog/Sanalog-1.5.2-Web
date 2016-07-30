using System.Web;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Web.UI.WebControls;
using Snlg_DataBase;

public partial class modules_referans_kategorideki_referanslar_sayfa : Snlg_UserControlBaseClass
{
    //bir sayfada kaç kayıt gösterilecek
    protected byte _PageSize = 16;
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

        //makaleler db'den çekilyior.
        #region parametreler
        Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[5];
        DBPrms[0] = new Snlg_DBParameter("@KayitSayisi", SqlDbType.Int, -1, ParameterDirection.InputOutput);
        DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);
        DBPrms[2] = new Snlg_DBParameter("@KtgId", SqlDbType.Int, DBNull.Value);
        if (!string.IsNullOrEmpty(Request.QueryString["rktg"]))
            DBPrms[2].Deger = Request.QueryString["rktg"];
        DBPrms[3] = new Snlg_DBParameter("@CurrentPage", SqlDbType.Int, currentPage);
        DBPrms[4] = new Snlg_DBParameter("@PageSize", SqlDbType.Int, PageSize);
        #endregion

        
        using (SqlDataReader SDR =  vt.DBReaderOlustur("snlg_V1.zsp_Referans_KategoridekiReferanslar", CommandType.StoredProcedure, DBPrms))
        {
            if (SDR.HasRows)//kayıt varsa işleme devam et
            {//kayıt varsa css dosyasını improt et ve datareader'ı repeater'a bağla
                Rpt.DataSource = SDR;
                Rpt.DataBind();
            }
            else//kayıt yoksa bu kontrolü gizle
                this.Visible = false;
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
                LtrSayfalama.Text = "<div class=\"DivSayfalama\">";
                for (Int16 i = 1; i <= sayfaSay; i++)
                {
                    if (i == currentPage)//page null ise ilk sayfayı curent yap
                        LtrSayfalama.Text += string.Format("<a class=\"page selected\"href=\"?page={0}\">{0}</a>", i.ToString());
                    else//diğer sayfaları normal link yap (current yapma)
                        LtrSayfalama.Text += string.Format("<a class=\"page\"href=\"?page={0}\">{0}</a>", i.ToString());
                }
                LtrSayfalama.Text += "</div>";
            }
            else//eğer sayfalanacak kadar kayuıt yoksa sayfalama kısmını gizle
                LtrSayfalama.Visible = false;
            #endregion
        }
    }
}