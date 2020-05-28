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

    public partial class products_by_price : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("ShowProductsByPrice", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            //IF the output is a table, then we can read the records one at a time
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int SerialNo = rdr.GetInt32(rdr.GetOrdinal("Serial_no"));
                string ProductName = rdr.GetString(rdr.GetOrdinal("Product_name"));
                string Category = rdr.GetString(rdr.GetOrdinal("Category"));
                string ProductDescription = rdr.GetString(rdr.GetOrdinal("Product_description"));
                decimal FinalPrice = rdr.GetDecimal(rdr.GetOrdinal("final_price"));
                string color = rdr.GetString(rdr.GetOrdinal("color"));


                //Create a new label and add it to the HTML form


                Label lbl_SerialNo = new Label();
                lbl_SerialNo.Text = "  Serial no: " + SerialNo + " <br />" ;
                form1.Controls.Add(lbl_SerialNo);


                Label lbl_ProductName = new Label();
                lbl_ProductName.Text = "Product Name: " + ProductName + " <br />";
                form1.Controls.Add(lbl_ProductName);

                Label lbl_Category = new Label();
                lbl_Category.Text = "Category: " + Category + " <br />";
                form1.Controls.Add(lbl_Category);

                Label lbl_ProductDescription = new Label();
                lbl_ProductDescription.Text = "Product Description: "  +  ProductDescription + " <br />";
                form1.Controls.Add(lbl_ProductDescription);

                Label lbl_FinalPrice = new Label();
                lbl_FinalPrice.Text =   "Final Price: "+ FinalPrice + " <br />";
                form1.Controls.Add(lbl_FinalPrice);


                Label lbl_color = new Label();
                lbl_color.Text =  "Color:  " + color + "<br /> <br /> <br />";
                form1.Controls.Add(lbl_color);

            }
            string field1 = (string)(Session["cname"]);
            Response.Write("These are all the Product(s) available for: " + field1 + "<br /> <br />" );

        }

        protected void Back_fromProd(object sender, EventArgs e)
        {
            Response.Redirect("customerhomepage.aspx");
        }
    }
}