using lab04_sachdb.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace lab04_sachdb
{
    public partial class Detail : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static Cart GetSach(string maSach)
        {
            Cart c = null;

            using (SqlConnection cn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["BookStoreDBConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT TenSach, Dongia, AnhBia FROM Sach WHERE MaSach=@ma", cn);
                cmd.Parameters.AddWithValue("@ma", maSach);

                cn.Open();
                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                    c = new Cart
                    {
                        MaSach = maSach,
                        TenSach = r["TenSach"].ToString(),
                        DonGia = Convert.ToDecimal(r["Dongia"]),
                        AnhBia = r["AnhBia"].ToString(),
                        SoLuong = 1
                    };
            }
            return c;
        }


        [WebMethod(EnableSession = true)]
        public static object AddToCart(string maSach)
        {
            List<Cart> cart = HttpContext.Current.Session["Cart"] as List<Cart>
                      ?? new List<Cart>();
            
            foreach (Cart c in cart)
                if (c.MaSach == maSach)
                {
                    c.SoLuong++;
                    HttpContext.Current.Session["Cart"] = cart;
                    return new { success = true };
                }

            cart.Add(GetSach(maSach));
            HttpContext.Current.Session["Cart"] = cart;
            return new { success = true, message = "Đã thêm sản phẩm vào giỏ hàng!" };
        }
    }
}