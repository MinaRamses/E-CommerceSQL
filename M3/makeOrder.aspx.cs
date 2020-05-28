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
    public partial class makeOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("makeOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();


            string username = (String)(Session["cname"]);

            cmd.Parameters.Add(new SqlParameter("@customername", username));


            //IF the output is a table, then we can read the records one at a time
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int orderNo = rdr.GetInt32(rdr.GetOrdinal("order_no"));
                decimal totalAmount = rdr.GetDecimal(rdr.GetOrdinal("total_amount"));

                Label lbl_orderNo = new Label();
                lbl_orderNo.Text = "  Order ID: " + orderNo + " <br />";
                form1.Controls.Add(lbl_orderNo);

                Label lbl_totalAmount = new Label();
                lbl_totalAmount.Text = "  Total amount: " + totalAmount + " <br />";
                form1.Controls.Add(lbl_totalAmount);


            }
            string field1 = (string)(Session["cname"]);
            Response.Write(field1);

            string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn1 = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd1 = new SqlCommand("emptyCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username1 = (String)(Session["cname"]);

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username1));
            
        }
    }
}