using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3
{
    public partial class customerhomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addphone.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("products_by_price.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("create_wishlist.aspx");
        }

        protected void manage(object sender, EventArgs e)
        {
            Response.Redirect("manage_WL.aspx");
        }

        protected void CreditCard(object sender, EventArgs e)
        {
            Response.Redirect("addCredit.aspx");
        }

        protected void manage_cart(object sender, EventArgs e)
        {
            Response.Redirect("manage_cart.aspx");
        }

        protected void make_order(object sender, EventArgs e)
        {
            Response.Redirect("makeOrder.aspx");
        }
    }
}