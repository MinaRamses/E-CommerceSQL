using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace M3
{
    public partial class create_wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

   
        protected void backtocust(object sender, EventArgs e)
        { 
       //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
        SqlCommand cmd = new SqlCommand("createWishlist", conn);
        cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = (String)(Session["cname"]);
        string wishlist_name = TextBox1.Text;


        //pass parameters to the stored procedure
         cmd.Parameters.Add(new SqlParameter("@customername", username));
         cmd.Parameters.Add(new SqlParameter("@wishlistname", wishlist_name));



            //Executing the SQLCommand

            if (wishlist_name.ToString().Equals(""))
            {
                Response.Write("Enter a name for the wishlist, please");
            }
            else
            {
                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["cname"] = username;
                    Response.Write("WishList has been added!!");
                }
                catch (Exception)
                {
                    Response.Write("WishList name already exists for this user");
                }
                


            }
        }

        protected void back_WL(object sender, EventArgs e)
        {
            Response.Redirect("customerhomepage.aspx");
        }
    }
}