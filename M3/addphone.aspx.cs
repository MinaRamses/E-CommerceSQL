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
    public partial class addphone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addphone1(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("addMobile", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = (String)(Session["cname"]);
            string phone_number = TextBox1.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@mobile_number", phone_number));



            //Executing the SQLCommand

            if (username.ToString().Equals("") || phone_number.ToString().Equals(""))
            {
                Response.Write("Enter mobile number");
            }
            else
            {
                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["cname"] = username;
                    Response.Write("Phone number added!!");
                }
                catch (Exception)
                {
                    Response.Write("Phone number already exists for this user");
                }
               
                
            }
        }

        protected void back_phone(object sender, EventArgs e)
        {
            Response.Redirect("customerhomepage.aspx");
        }
    }
}