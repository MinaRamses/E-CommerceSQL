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
    public partial class postProd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_product(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("postProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = (String)(Session["vname"]);
            string productname = TextBox1.Text;
            string category = TextBox2.Text;
            string product_desc = TextBox3.Text;
            string price = TextBox4.Text;
            string color = TextBox5.Text;
           

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@vendorUsername", username));
            cmd.Parameters.Add(new SqlParameter("@product_name", productname));
            cmd.Parameters.Add(new SqlParameter("@category", category));
            cmd.Parameters.Add(new SqlParameter("@product_description", product_desc));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            cmd.Parameters.Add(new SqlParameter("@color", color));


            //Executing the SQLCommand

            if (username.ToString().Equals("")||productname.ToString().Equals("") || category.ToString().Equals("") || price.ToString().Equals("") || color.ToString().Equals(""))
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
                    Session["vname"] = username;
                    Response.Write("Product have been added");
                }
                catch (Exception)
                {
                    Response.Write("Product already added");
                }
            }
        }

        protected void back_postProd(object sender, EventArgs e)
        {
            Response.Redirect("vendorhomepage.aspx");
        }
    }
}