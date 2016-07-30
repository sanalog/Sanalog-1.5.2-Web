using System.Data;
using System;
using Snlg_DataBase;

public partial class modules_modules_z_defteri_yorumlar : Snlg_UserControlBaseClass
{
    //bir sayfada kaç kayıt gösterilecek
    protected byte _PageSize = 15;
    public byte PageSize
    {
        get { return _PageSize; }
        set { _PageSize = value; }
    }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        #region sayfalama
        int kayitSay = Convert.ToInt32( vt.ScalarSorguCalistir("snlg_V1.zsp_ZDefteri_YorumSay", CommandType.StoredProcedure));
        

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
}