using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Snlg_DataBase
{
    public class Snlg_DBConnect
    {
        private SqlConnection mSqlCon;
        private string mSqlConName;

        public SqlConnection SqlCon
        {
            get
            {
                if (mSqlCon == null)
                    mSqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings[SqlConName].ConnectionString);

                return mSqlCon;
            }
            set
            { mSqlCon = value; }
        }
        public string SqlConName
        {
            get
            {
                if (string.IsNullOrEmpty(mSqlConName))
                    mSqlConName = WebConfigurationManager.ConnectionStrings[0].Name;

                return mSqlConName;
            }
            set { mSqlConName = value; }
        }

        public SqlTransaction SqlTransac;

        public Snlg_DBConnect(string ConnName, bool baglantiAcilsin)
        {
            SqlConName = ConnName;
            SqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings[SqlConName].ConnectionString);

            if (baglantiAcilsin)
                Ac();
        }

        public Snlg_DBConnect(bool baglantiAcilsin)
        {
            SqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings[SqlConName].ConnectionString);

            if (baglantiAcilsin)
                Ac();
        }

        public Snlg_DBConnect()
        {
            SqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings[SqlConName].ConnectionString);
        }

        //bağlantı açılıyor
        public void Ac()
        {
            if (SqlCon.State != ConnectionState.Open)
                SqlCon.Open();
        }

        //bağlantı kapanıyor.
        public void Kapat()
        {
            if (SqlCon.State != ConnectionState.Closed)
                SqlCon.Close();
        }

        //sorgu hazrılanıyor ve parametreler ekleniyor.
        private SqlCommand SorguOlustur(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms)
        {
            SqlCommand ComSorgu;
            if (SqlTransac == null)
                ComSorgu = new SqlCommand(sorgu, SqlCon);
            else
                ComSorgu = new SqlCommand(sorgu, SqlCon, SqlTransac);

            ComSorgu.CommandType = sorguTipi;

            foreach (Snlg_DBParameter DBPrm in DBPrms)
                ComSorgu.Parameters.Add(DBPrm.Prm);

            return ComSorgu;
        }

        //sorgu hazrılanıyor .
        private SqlCommand SorguOlustur(string sorgu, CommandType sorguTipi)
        {
            SqlCommand ComSorgu;
            if (SqlTransac == null)
                ComSorgu = new SqlCommand(sorgu, SqlCon);
            else
                ComSorgu = new SqlCommand(sorgu, SqlCon, SqlTransac);

            ComSorgu.CommandType = sorguTipi;

            return ComSorgu;
        }

        //silme ve güncelleme ve ekleme işlemleri yapılıp etkilenen kayıt sayısı söyleinyor.
        public int SorguCalistir(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms)
        {
            SqlCommand ComSorgu = SorguOlustur(sorgu, sorguTipi, DBPrms);
            return ComSorgu.ExecuteNonQuery();
        }

        //silme ve güncelleme ve ekleme işlemleri yapılıp etkilenen kayıt sayısı söyleinyor.
        public int SorguCalistir(string sorgu, CommandType sorguTipi)
        {
            SqlCommand ComSorgu = SorguOlustur(sorgu, sorguTipi);
            return ComSorgu.ExecuteNonQuery();
        }

        //veri çekip datareader döndür
        public SqlDataReader DBReaderOlustur(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms)
        {
            SqlCommand ComSorgu = SorguOlustur(sorgu, sorguTipi, DBPrms);
            return ComSorgu.ExecuteReader();
        }

        //veri çekip datareader döndür
        public SqlDataReader DBReaderOlustur(string sorgu, CommandType sorguTipi)
        {
            SqlCommand ComSorgu = SorguOlustur(sorgu, sorguTipi);
            return ComSorgu.ExecuteReader();
        }

        //tek kayıt alınıyor.
        public object ScalarSorguCalistir(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms)
        {
            SqlCommand ComSorgu = SorguOlustur(sorgu, sorguTipi, DBPrms);
            return ComSorgu.ExecuteScalar();
        }

        //tek kayıt alınıyor.
        public object ScalarSorguCalistir(string sorgu, CommandType sorguTipi)
        {
            SqlCommand ComSorgu = SorguOlustur(sorgu, sorguTipi);
            return ComSorgu.ExecuteScalar();
        }

        //veri çekip datatable döndür
        public DataTable DataTableOlustur(string sorgu, CommandType sorguTipi)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi));
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            return DT;
        }

        //veri çekip datatable döndür
        public DataTable DataTableOlustur(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi, DBPrms));
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            return DT;
        }

        //veri çekip datatable döndür (sayfala)
        public DataTable DataTableOlustur(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms, Int16 sayfaNo, Int16 sayfaSize)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi, DBPrms));
            DataTable DT = new DataTable();
            SDA.Fill((sayfaNo - 1) * sayfaSize, sayfaSize, DT);
            return DT;
        }

        //veri çekip datatable döndür (sayfala)
        public DataTable DataTableOlustur(string sorgu, CommandType sorguTipi, Int16 sayfaNo, Int16 sayfaSize)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi));
            DataTable DT = new DataTable();
            SDA.Fill((sayfaNo - 1) * sayfaSize, sayfaSize, DT);
            return DT;
        }



        //veri çekip DataSet döndür
        public DataSet DataSetOlustur(string sorgu, CommandType sorguTipi)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi));
            DataSet DS = new DataSet();
            SDA.Fill(DS);
            return DS;
        }

        //veri çekip DataSet döndür
        public DataSet DataSetOlustur(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi, DBPrms));
            DataSet DS = new DataSet();
            SDA.Fill(DS);
            return DS;
        }

        //veri çekip DataSet döndür (sayfala)
        public DataSet DataSetOlustur(string sorgu, CommandType sorguTipi, Snlg_DBParameter[] DBPrms, Int16 sayfaNo, Int16 sayfaSize)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi, DBPrms));
            DataSet DS = new DataSet();
            SDA.Fill(DS);
            return DS;
        }

        //veri çekip DataSet döndür (sayfala)
        public DataSet DataSetOlustur(string sorgu, CommandType sorguTipi, Int16 sayfaNo, Int16 sayfaSize)
        {
            SqlDataAdapter SDA = new SqlDataAdapter(SorguOlustur(sorgu, sorguTipi));
            DataSet DS = new DataSet();
            SDA.Fill(DS);
            return DS;
        }


    }
}