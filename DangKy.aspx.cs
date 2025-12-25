using lab04_sachdb.Controller;
using lab04_sachdb.Models;
using System;
using System.Web.UI;

namespace lab04_sachdb
{
    public partial class DangKy : System.Web.UI.Page
    {
        KhachHang kh = new KhachHang();
        KhachHangDAO khDAO = new KhachHangDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            try
            {
                kh.HoTenKH = txtHoten.Text;
                kh.TenDN = txtTenDN.Text;
                kh.PassWord = txtPassword.Text;
                DateTime ngaySinh;
                if (DateTime.TryParse(txtNgaySinh.Text, out ngaySinh))
                    kh.NgaySinh = ngaySinh;
                kh.Email = txtEmail.Text;
                kh.DiaChi = txtDiaChi.Text;
                kh.SoDienThoai = txtSDT.Text;
                bool i = khDAO.ThemMoi(kh);
                if (i)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "success",
                                                      "Swal.fire({ " +
                                                      "icon: 'success', " +
                                                      "title: 'Thành công', " +
                                                      "text: 'Tài khoản đã được đăng ký!', " +
                                                      "confirmButtonText: 'Đóng', " +
                                                      "showCloseButton: true " +
                                                      "}).then(() => {\r\n  window.location = 'DangNhap.aspx';\r\n});",
                                                      true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                                                  "Swal.fire({ " +
                                                  "icon: 'error', " +
                                                  "title: 'Lỗi', " +
                                                  "text: 'Đăng ký thất bại!', " +
                                                  "confirmButtonText: 'Đóng', " +
                                                  "showCloseButton: true " +
                                                  "});",
                                                  true);

            }
        }
    }
}