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
    public partial class manage_WL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("AddtoWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;


         
            //To read the input from the user
            string username = (String)(Session["cname"]);
            string serial = TextBox1.Text;
            string wishlistname = TextBox2.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@wishlistname", wishlistname));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));




            //Executing the SQLCommand

            if (wishlistname.ToString().Equals("") || serial.ToString().Equals(""))
            {
                Response.Write("Fill all the fields");
            }
            else
            {
                conn.Open();
                try {
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Session["cname"] = username;
                    Session["serial"] = serial;
                    Response.Write("Product have been added");
                }
                catch (Exception)
                {
                    Response.Write("Wishlist Name or Product serial is Wrong");
                }

               
                

            }
        }

        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("customerhomepage.aspx");
        }

        protected void remove(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("removefromWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = (String)(Session["cname"]);
            string serial = TextBox1.Text;
            string wishlistname = TextBox2.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@wishlistname", wishlistname));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));




            //Executing the SQLCommand

            if (wishlistname.ToString().Equals("") || serial.ToString().Equals(""))
            {
                Response.Write("Fill all the fields");
            }
            else
            {
                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["cname"] = username;
                    Session["serial"] = serial;
                    Response.Write("Product have been Removed");
                }
                catch (Exception)
                {
                    Response.Write("Wishlist Name or Product serial is Wrong");
                }


            }
        }

    }
}