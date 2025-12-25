using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lab04_sachdb.Models
{
    public class DonDatHang
    {
        public int SoDH { get; set; }
        public int MaKH { get; set; }
        public DateTime NgayDH { get; set; }

        public Decimal TriGia { get; set; }
        public bool DaGiao { get; set; }
        public DateTime? NgayGiao { get; set; }
    }
}