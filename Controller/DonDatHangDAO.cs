using lab04_sachdb.Models;
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace lab04_sachdb.Controller
{
    public class DonDatHangDAO
    {
        string connStr = ConfigurationManager
                       .ConnectionStrings["BookStoreDBConnectionString"]
                       .ConnectionString;
        public int ThemMoi(DonDatHang ddh)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"
            INSERT INTO DonDatHang (MaKH, NgayDH, Trigia, Dagiao, Ngaygiao)
            VALUES (@MaKH, @NgayDH, @Trigia, @Dagiao, @Ngaygiao);
            SELECT SCOPE_IDENTITY();
        ";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@MaKH", ddh.MaKH);
                cmd.Parameters.AddWithValue("@NgayDH", ddh.NgayDH);
                cmd.Parameters.AddWithValue("@Trigia", ddh.TriGia);
                cmd.Parameters.AddWithValue("@Dagiao", ddh.DaGiao);
                cmd.Parameters.AddWithValue("@Ngaygiao",
                    (object)ddh.NgayGiao ?? DBNull.Value);

                conn.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

    }
}