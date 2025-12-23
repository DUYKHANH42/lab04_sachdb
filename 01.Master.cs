using lab04_sachdb.Models;
using System;
using System.Collections.Generic;

namespace lab04_sachdb
{
    public partial class _01 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public int CartCount
        {
            get
            {
                int total = 0;
                if (Session["Cart"] != null)
                {
                    List<Cart> cart = (List<Cart>)Session["Cart"];
                    foreach (Cart c in cart)
                    {
                        total += c.SoLuong;
                    }
                }
                return total;
            }
        }
    }
}