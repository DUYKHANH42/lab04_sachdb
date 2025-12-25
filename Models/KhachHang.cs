using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lab04_sachdb.Models
{
    public class KhachHang
    {
        public int MaKH { get; set; }
        public string HoTenKH { get; set; }
        public string DiaChi { get; set; }
        public string SoDienThoai { get; set; }
        public string TenDN { get; set; }
        public string PassWord { get; set; }
        public DateTime NgaySinh { get; set; } 
        public string Email { get; set; }
    }
}