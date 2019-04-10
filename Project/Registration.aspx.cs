using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

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
                    SqlCommand insert = new SqlCommand("Insert INTO Users Values (@UserType, @Email, @UserPassword, @FirstName, @LastName, NULL, NULL, NULL, NULL, @LastUpdatedBy, @LastUpdated)", localDB);
                    insert.Parameters.Add(new SqlParameter("@UserType", "BusinessEmployee"));
                    insert.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(txtEmail.Text)));
                    insert.Parameters.Add(new SqlParameter("@UserPassword",password));
                    insert.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                    insert.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(txtLastName.Text)));
                    insert.Parameters.Add(new SqlParameter("@LastUpdatedBy", HttpUtility.HtmlEncode(txtFirstName.Text) + " " + HttpUtility.HtmlEncode(txtLastName.Text)));
                    insert.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Today));
                    insert.ExecuteNonQuery();


                    localDB.Close();
                    Response.Redirect("LandingPage.aspx");
                }
            
        }
    }
 
}
