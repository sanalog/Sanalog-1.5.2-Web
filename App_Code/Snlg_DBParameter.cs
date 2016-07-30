using System.Data.SqlClient;
using System.Data;

namespace Snlg_DataBase
{
    public class Snlg_DBParameter
    {
        public SqlParameter Prm;
        public object Deger
        {
            get { return this.Prm.Value; }
            set { this.Prm.Value = value; }
        }
        public Snlg_DBParameter(string PrmName, SqlDbType VeriTipi)
        {
            this.Prm = new SqlParameter(PrmName, VeriTipi);
        }
        public Snlg_DBParameter(string PrmName, SqlDbType VeriTipi, object deger)
        {
            this.Prm = new SqlParameter(PrmName, VeriTipi);
            this.Prm.Value = deger;
        }
        public Snlg_DBParameter(string PrmName, SqlDbType VeriTipi, object deger, ParameterDirection direction)
        {
            this.Prm = new SqlParameter(PrmName, VeriTipi);
            this.Prm.Value = deger;
            this.Prm.Direction = direction;
        }
        public Snlg_DBParameter(string PrmName, SqlDbType VeriTipi, object deger, int length)
        {
            this.Prm = new SqlParameter(PrmName, VeriTipi);
            this.Prm.Value = deger;
            this.Prm.Size = length;
        }
        public Snlg_DBParameter(string PrmName, SqlDbType VeriTipi, object deger, int length, ParameterDirection direction)
        {
            this.Prm = new SqlParameter(PrmName, VeriTipi);
            this.Prm.Value = deger;
            this.Prm.Size = length;
            this.Prm.Direction = direction;
        }
    }
}