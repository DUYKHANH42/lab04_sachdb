using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab04_sachdb
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["item"] = 3;
            }

        }

        protected void lstSach_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnLoadMore_Click(object sender, EventArgs e)
        {
            int item = (int)ViewState["item"];
            item += 3;
            ViewState["item"] = item;

            dsSach.SelectCommand =
                $"SELECT TOP {item} * FROM Sach WHERE MaCD = ? ORDER BY MaSach";

            lstSach.DataBind();
        }
    }
}