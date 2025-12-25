using lab04_sachdb.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace lab04_sachdb.Controller
{
    public class CTDonDatHangDAO
    {
        string connStr = ConfigurationManager
                       .ConnectionStrings["BookStoreDBConnectionString"]
                       .ConnectionString;
        public bool ThemMoi(CTDatHang ctdh)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO CTDatHang ([MaSach],[SoDH],[Soluong],[Dongia],[Thanhtien]) VALUES" +
                    " (@MaSach,@SoDH,@Soluong,@Dongia,@Thanhtien)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@MaSach", ctdh.MaSach);
                cmd.Parameters.AddWithValue("@SoDH", ctdh.SoDH);
                cmd.Parameters.AddWithValue("@Soluong", ctdh.SoLuong);
                cmd.Parameters.AddWithValue("@Dongia", ctdh.DonGia);
                cmd.Parameters.AddWithValue("@Thanhtien", ctdh.ThanhTien);
                conn.Open();
                int rows = cmd.ExecuteNonQuery();
                return rows > 0;
            }
        }
    }
}