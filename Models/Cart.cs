using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lab04_sachdb.Models
{
    public class Cart
    {
        public string MaSach { get; set; }
        public string TenSach { get; set; }
        public decimal DonGia { get; set; }
        public int SoLuong { get; set; }
        public string AnhBia { get; set; }
    }
}