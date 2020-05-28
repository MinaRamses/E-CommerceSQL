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
    public partial class activateven : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminhomepage.aspx");
        }

        protected void activate_ven(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("activateVendors", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = (String)(Session["aname"]);
            string vendername = TextBox1.Text;
           


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@admin_username", username));
            cmd.Parameters.Add(new SqlParameter("@vendor_username", vendername));
           

            //Executing the SQLCommand

            if (username.ToString().Equals(""))
            {
                Response.Write("Enter all the empty fields");
            }
            else
            {
                conn.Open();

                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["aname"] = username;
                    Response.Write("Vendor has been activated");
                }
                catch (Exception)
                {
                    Response.Write("Vendor username already exsist");
                }

            }
        }
    }
}