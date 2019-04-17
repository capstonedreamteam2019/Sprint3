using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Registration : System.Web.UI.Page
{
    string userType;
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //clear error label
        lblError.Text = "";

        //double check validation
        if (txtFirstName.Text != "" && txtLastName.Text != "" && txtCompanyName.Text != "" && txtEmail.Text != "" && txtPassword.Text != "" )
        {
            
                if (txtPassword.Text.Length < 7)
                {
                    lblError.Text = "Password needs to have at least 7 characters";
                }
                else
                {
                    localDB.Open();

                    string password = PasswordHash.HashPassword(HttpUtility.HtmlEncode(txtPassword.Text));

                    //Insert into user table
                    System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
                    insert.Connection = localDB;
                    insert.CommandText = "Execute InsertUser @UserType, @Email, @UserPassword, @FirstName, @LastName, NULL, NULL, NULL, NULL, @LastUpdatedBy, @LastUpdated";
                    insert.Parameters.Add("@UserType", SqlDbType.VarChar, 30).Value = "BusinessEmployee";
                    insert.Parameters.Add("@Email", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(txtEmail.Text);
                    insert.Parameters.Add("@UserPassword", SqlDbType.VarChar, 30).Value = password;
                    insert.Parameters.Add("@FirstName", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(txtFirstName.Text);
                    insert.Parameters.Add("@LastName", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(txtLastName.Text);
                    insert.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(txtFirstName.Text) + " " + HttpUtility.HtmlEncode(txtLastName.Text);
                    insert.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = DateTime.Today;
                    insert.ExecuteNonQuery();


                    localDB.Close();
                    Response.Redirect("LandingPage.aspx");
                }
            
        }
    }
 
}
