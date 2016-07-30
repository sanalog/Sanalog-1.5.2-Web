using System;
using System.Data;
using Snlg_DataBase;

public partial class modules_makale_yorumlar : Snlg_UserControlBaseClass
{
    //bir sayfada kaç kayıt gösterilecek
    public object eposta = "";
    protected byte _PageSize = 10;
    public byte PageSize
    {
        get { return _PageSize; }
        set { _PageSize = value; }
    }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        
        if (!string.IsNullOrEmpty(Request.QueryString["makid"]))
        {
            #region sayfalama
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[1];
            DBPrms[0] = new Snlg_DBParameter("@MakId", SqlDbType.Int, Request.QueryString["makid"]);

            int kayitSay = Convert.ToInt32(vt.ScalarSorguCalistir("snlg_V1.zsp_makale_YorumSay", CommandType.StoredProcedure, DBPrms));

            LblYorumSayisi.Text = kayitSay.ToString();

            if (!string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId))
            {
                DBPrms = new Snlg_DBParameter[1];
                DBPrms[0] = new Snlg_DBParameter("@UyeId", SqlDbType.Int, Snlg_MemberInfo.s_UserId);
                eposta = vt.ScalarSorguCalistir("SELECT Eposta FROM snlg_V1.TblUyeApp WHERE (UyeId = @UyeId) ", CommandType.Text, DBPrms);
                if (eposta == null)
                    eposta = "";
            }

            if (kayitSay < 1)
                this.Visible = false;
            else if (kayitSay > PageSize)
            {//eğer kayıt sayısı sayfada gösterilecek olan kayıt sayısından büyükse sayfalama yap (demekki 1'den fazla sayfa var)
                //listelenecek sayfa sayısı hesaplanıyor.
                Int16 sayfaSay = Convert.ToInt16(Math.Ceiling(Convert.ToDouble(kayitSay) / PageSize));
                LtrSayfalama.Text = "<div class=\"pager\">";
                for (Int16 i = 1; i <= sayfaSay; i++)
                    LtrSayfalama.Text += string.Format("<li><a>{0}</a></li>", i.ToString());
                LtrSayfalama.Text += "</div>";
            }
            else//eğer sayfalanacak kadar kayuıt yoksa sayfalama kısmını gizle
                LtrSayfalama.Visible = false;
            #endregion
        }
        else//makale id yoksa gizle
            this.Visible = false;
    }
}