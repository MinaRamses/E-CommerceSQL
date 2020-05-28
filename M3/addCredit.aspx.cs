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
    public partial class addCredit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Done(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("AddCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = (String)(Session["cname"]);
            string ccnumber = TextBox1.Text; 
            string expirydate = (String)TextBox3.Text;
            string cvv = TextBox2.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@creditcardnumber", ccnumber));
            cmd.Parameters.Add(new SqlParameter("@expirydate", expirydate));
            cmd.Parameters.Add(new SqlParameter("@cvv", cvv));



            //Executing the SQLCommand

            if (username.ToString().Equals("")|| ccnumber.ToString().Equals("")|| expirydate.ToString().Equals("")|| cvv.ToString().Equals(""))
            {
                Response.Write("Fill all the fields: ");
            }
            else
            {
                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["cname"] = username;
                    Response.Write("Credit Card have been added");
                }
                catch (Exception)
                {
                    Response.Write("Check the correct Expiry Date Format or This credit card number is already used by the user");
                }





            }
        }

        protected void back_from_CC(object sender, EventArgs e)
        {
            Response.Redirect("customerhomepage.aspx");
        }
    }
    
}