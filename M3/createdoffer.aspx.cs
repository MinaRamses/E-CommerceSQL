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
    public partial class createdoffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("addOﬀer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string offer_amount = TextBox1.Text;
            string offer_expdate = TextBox2.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@offeramount", offer_amount));
            cmd.Parameters.Add(new SqlParameter("@expiry_date", offer_expdate));


            //Executing the SQLCommand

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("Offer is successfully created");
            }
            catch (Exception)
            {
                Response.Write("Error");
            }
        }

        protected void createofferv(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("vendorhomepage.aspx");
        }
    }
    
}