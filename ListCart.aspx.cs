using lab04_sachdb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab04_sachdb
{
    public partial class ListCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Cart> cart = Session["Cart"] as List<Cart>;
                rpCart.DataSource = cart;
                decimal total = 0;
                if (cart != null)
                    foreach (Cart c in cart)
                        total += c.DonGia * c.SoLuong;
                rpCart.DataBind();
            }
        }
    }
}