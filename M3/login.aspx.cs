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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("userLogin", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = txt_username.Text;
            string password = txt_password.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));

            //Save the output from the procedure
            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            if (success.Value.ToString().Equals("1"))
            {
                //To send response data to the client side (HTML)
                Response.Write("Passed");
                Session["cname"] = username;
               

                if (type.Value.ToString().Equals("0"))
                    {
                        Response.Write("Passed");
                        Session["cname"] = username;
                        Response.Redirect("Customerhomepage.aspx", true);
                    }
                else if (type.Value.ToString().Equals("1"))
                {
                    Response.Write("Passed");
                    Session["vname"] = username;
                    Response.Redirect("vendorhomepage.aspx", true);
                }
                else if (type.Value.ToString().Equals("2"))

                {
                    Response.Write("Passed");
                    Session["aname"] = username;
                    Response.Redirect("adminhomepage.aspx", true);
                }
            }

            else
            {
                Response.Write("Failed to login!!");
            }

        }
        protected void registercust(object sender, EventArgs e)
        {
            Response.Redirect("registercust.aspx", true);
        }

        protected void registerven(object sender, EventArgs e)
        {
            Response.Redirect("registerven.aspx", true);
        }

    }
}