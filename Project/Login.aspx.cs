using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);
    SqlDataAdapter da;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == true)
        {
            if (pwcheckbox.Checked == true)
            {
                txtPassword.Attributes.Add("Type", "text");
            }

            else
            {
                txtPassword.Attributes.Add("Type", "password");
            }
        }
        Session["UserName"] = txtEmail.Text;

        

        }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        //connect to database to retrieve stored password string
        try
        {

            if (txtPassword.Text == "")
            {
                lblStatus.Text = "Must enter password.";
            }

            else
            {
                localDB.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = localDB;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "select UserPassword from Users where Email = @Username";
                findPass.Parameters.Add(new SqlParameter("@Username", txtEmail.Text));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["UserPassword"].ToString(); // store the database password into this variable

                        if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            Response.Redirect("LandingPage.aspx");
                        }

                        else
                        {
                            lblStatus.Text = "Incorrect password.";
                        }

                    }
                }
                else //if the username doesn't exist, it will show failure

                    lblStatus.Text = "Login failed. Username does not exist.";

                localDB.Close();
            }
        }
        catch
        {
            lblStatus.Text = "Database Error.";
        }


    }



}



