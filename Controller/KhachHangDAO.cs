using lab04_sachdb.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace lab04_sachdb.Controller
{
    public class KhachHangDAO
    {
        string connStr = ConfigurationManager
                       .ConnectionStrings["BookStoreDBConnectionString"]
                       .ConnectionString;

        public KhachHang DangNhap(string tenDN, string matKhau)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"
                SELECT *
                FROM KhachHang
                WHERE TenDN = @TenDN AND MatKhau = @MatKhau";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@TenDN", tenDN);
                cmd.Parameters.AddWithValue("@MatKhau", matKhau);

                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.Read())
                {
                    return new KhachHang
                    {
                        MaKH = (int)rd["MaKH"],
                        HoTenKH = rd["HoTenKH"].ToString(),
                        DiaChi = rd["DiaChi"].ToString(),
                        SoDienThoai = rd["DienThoai"].ToString(),
                        TenDN = rd["TenDN"].ToString(),
                        PassWord = rd["MatKhau"].ToString(),
                        NgaySinh = (DateTime)rd["NgaySinh"],
                        Email = rd["Email"].ToString()
                    };
                }
            }
            return null;
        }
        public bool ThemMoi(KhachHang khach)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO KhachHang (HoTenKH,TenDN,MatKhau,NgaySinh,Email,DiaChi,DienThoai) VALUES" +
                    " (@HotenKH,@TenDN,@MatKhau,@NgaySinh,@Email,@DiaChi,@DienThoai)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@HotenKH", khach.HoTenKH);
                cmd.Parameters.AddWithValue("@TenDN", khach.TenDN);
                cmd.Parameters.AddWithValue("@MatKhau", khach.PassWord);
                cmd.Parameters.AddWithValue("@NgaySinh", khach.NgaySinh);
                cmd.Parameters.AddWithValue("@Email", khach.Email);
                cmd.Parameters.AddWithValue("@DiaChi", khach.DiaChi);
                cmd.Parameters.AddWithValue("@DienThoai", khach.SoDienThoai);
                conn.Open();
                int rows = cmd.ExecuteNonQuery();
                return rows > 0;
            }
        }
    }
}