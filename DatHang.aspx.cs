using lab04_sachdb.Controller;
using lab04_sachdb.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace lab04_sachdb
{
    public partial class DatHang : System.Web.UI.Page
    {

        private DonDatHang ddh = new DonDatHang();
        private CTDatHang ctdh = new CTDatHang();
        private DonDatHangDAO ddhDAO = new DonDatHangDAO();
        private CTDonDatHangDAO ctdhDAO = new CTDonDatHangDAO();
        List<Cart> cart
        {
            get
            {
                return Session["Cart"] as List<Cart>;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DocSession();

            }
        }
        private void DocSession()
        {
            rpCart.DataSource = cart;
            decimal total = 0;
            if (cart != null)
                foreach (Cart c in cart)
                    total += c.DonGia * c.SoLuong;
            lblTongTien.Text = total.ToString("N0") + " đ";
            rpCart.DataBind();
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            try
            {
                var kh = Session["khachhang"] as KhachHang;
                if (kh == null)
                {
                    return;
                }

                if (cart == null || cart.Count == 0)
                {
                    return;
                }
                ;
                ddh.MaKH = kh.MaKH;
                ddh.NgayDH = DateTime.Now;
                ddh.DaGiao = false;

                decimal triGia = 0;
                foreach (Cart c in cart)
                    triGia += c.SoLuong * c.DonGia;

                ddh.TriGia = triGia;
                int soDH = ddhDAO.ThemMoi(ddh);

                foreach (Cart c in cart)
                {
                    CTDatHang ct = new CTDatHang();
                    ct.SoDH = soDH;
                    ct.MaSach = c.MaSach;
                    ct.SoLuong = c.SoLuong;
                    ct.DonGia = c.DonGia;
                    ct.ThanhTien = c.SoLuong * c.DonGia;

                    ctdhDAO.ThemMoi(ct);
                }

                Session["Cart"] = null;

                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                                                  "Swal.fire({ " +
                                                  "icon: 'success', " +
                                                  "title: 'Thành công', " +
                                                  "text: 'Đặt hàng thành công!', " +
                                                  "confirmButtonText: 'Đóng', " +
                                                  "showCloseButton: true " +
                                                  "}).then(() => {\r\n  window.location = 'index.aspx';\r\n});",
                                                  true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                               "Swal.fire({ " +
                               "icon: 'error', " +
                               "title: 'Lỗi', " +
                               "text: 'Đặt hàng thất bại!', " +
                               "confirmButtonText: 'Đóng', " +
                               "showCloseButton: true " +
                               "});",
                               true);
            }
        }
    }
}