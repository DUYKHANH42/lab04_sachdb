using lab04_sachdb.Models;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace lab04_sachdb
{
    public partial class ListCart : System.Web.UI.Page
    {
        List<Cart> cart
        {
            get
            {
                return Session["Cart"] as List<Cart>;
            }
        }
        private KhachHang kh
        {
            get
            {
                return Session["KhachHang"] as KhachHang;
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

        protected void rpCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (cart == null) return;

            string maSach = e.CommandArgument.ToString();

            if (e.CommandName == "update")
            {
                TextBox txtSoLuong = (TextBox)e.Item.FindControl("txtSoLuong");
                int soluong = int.Parse(txtSoLuong.Text);
                if(soluong >= 0)
                {
                    for (int i = 0; i < cart.Count; i++)
                    {
                        if (cart[i].MaSach == maSach)
                        {
                            cart.RemoveAt(i);
                            break;
                        }
                    }
                }
                int soLuongMoi = int.Parse(txtSoLuong.Text);

                foreach (Cart c in cart)
                {
                    if (c.MaSach == maSach)
                    {
                        c.SoLuong = soLuongMoi;
                        break;
                    }
                }
            }
            if (e.CommandName == "delete")
            {
                for (int i = 0; i < cart.Count; i++)
                {
                    if (cart[i].MaSach == maSach)
                    {
                        cart.RemoveAt(i);
                        break;
                    }
                }
            }
            Session["Cart"] = cart;
            DocSession();
        }

        protected void btnXoaAll_Click(object sender, EventArgs e)
        {
            if (cart != null) 
            cart.Clear();
            
            DocSession();
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            if (kh == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }
            Response.Redirect("DatHang.aspx");
        }
    }
}