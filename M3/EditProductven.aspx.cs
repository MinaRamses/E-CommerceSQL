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
    public partial class EditProductven : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Editpven(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("EditProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = (String)(Session["vname"]);
            string serialno = TextBox1.Text;
            string productname = TextBox2.Text;
            string category = TextBox3.Text;
            string product_description = TextBox4.Text;
            string price = TextBox5.Text;
            string color = TextBox6.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@vendorname", username));
            cmd.Parameters.Add(new SqlParameter("@serialnumber", serialno));
            cmd.Parameters.Add(new SqlParameter("@product_name", productname));
            cmd.Parameters.Add(new SqlParameter("@category", category));
            cmd.Parameters.Add(new SqlParameter("@product_description", product_description));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            cmd.Parameters.Add(new SqlParameter("@color", color));



            //Executing the SQLCommand

                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["vname"] = username;
                    Response.Write("Product is successfully edited");
                }
                catch (Exception)
                {
                    Response.Write("You must update all the fields");
                }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("vendorhomepage.aspx");
        }
    }
}