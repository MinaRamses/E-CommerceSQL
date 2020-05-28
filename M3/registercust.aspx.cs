﻿using System;
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
    public partial class registercust : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Register(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("customerRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = TextBox1.Text;
            string first_name = TextBox2.Text;
            string last_name = TextBox3.Text;
            string password = TextBox4.Text;
            string email = TextBox5.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@first_name", first_name));
            cmd.Parameters.Add(new SqlParameter("@last_name", last_name));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@email", email));


            //Executing the SQLCommand

            if (username.ToString().Equals("") || first_name.ToString().Equals("") || last_name.ToString().Equals("") || password.ToString().Equals("") || email.ToString().Equals(""))
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
                    Session["cname"] = username;
                    Response.Write("Customer Account has been added");
                }
                catch (Exception)
                {
                    Response.Write("Username is already used!!");
                }
              
                
              
            }
        }

        protected void Back_custreg(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}