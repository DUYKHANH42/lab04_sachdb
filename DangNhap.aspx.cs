using lab04_sachdb.Controller;
using lab04_sachdb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab04_sachdb
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string username = txtTenDN.Text;
            string password = txtPassword.Text;
            KhachHangDAO dao = new KhachHangDAO();
            KhachHang kh = dao.DangNhap(username,password);
            if (kh == null)
            {
                cvLogin.IsValid = false;
                return;
            }

            Session["MaKH"] = kh.MaKH;
            Session["KhachHang"] = kh;

            Response.Redirect("index.aspx");


        }
    }
}