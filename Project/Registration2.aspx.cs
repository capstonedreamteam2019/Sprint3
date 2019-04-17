using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Registration2 : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

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

            if (cpwcheckbox.Checked == true)
            {
                txtPassword2.Attributes.Add("Type", "text");
            }

            else
            {
                txtPassword2.Attributes.Add("Type", "password");
            }
        }

    }

    protected void Step2_Click(object sender, EventArgs e)
    {
        localDB.Open();
        System.Data.SqlClient.SqlCommand getUserID = new System.Data.SqlClient.SqlCommand();
        getUserID.Connection = localDB;

        //Find UserID for most recently entered User
        getUserID.CommandText = "select MAX(UserID) from USERS";
        string returnID = getUserID.ExecuteScalar().ToString();
        int idUser = Int32.Parse(returnID);
        getUserID.ExecuteNonQuery();

        //double check validation
        if (txtFirstName.Text != "" && txtLastName.Text != "" && txtCompanyName.Text != "" && txtEmail.Text != "" && txtPassword.Text != "")
        {

            if (txtPassword.Text.Length < 7)
            {
                lblError.Text = "Password needs to have at least 7 characters";
            }
            else
            {
                string password = PasswordHash.HashPassword(HttpUtility.HtmlEncode(txtPassword.Text));

                //Update user table
                SqlCommand update = new SqlCommand("Update Users SET Email=@Email, UserPassword=@UserPassword, FirstName=@FirstName, LastName=@LastName, LastUpdatedBy=@LastUpdatedBy, LastUpdated=@LastUpdated WHERE UserId=@MaxID;", localDB);
                update.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(txtEmail.Text)));
                update.Parameters.Add(new SqlParameter("@UserPassword", password));
                update.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                update.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(txtLastName.Text)));
                update.Parameters.Add(new SqlParameter("@LastUpdatedBy", HttpUtility.HtmlEncode(txtFirstName.Text) + " " + HttpUtility.HtmlEncode(txtLastName.Text)));
                update.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Today));
                update.Parameters.Add(new SqlParameter("@MaxID", idUser));
                update.ExecuteNonQuery();


                localDB.Close();

                Response.Redirect("Registration3.aspx");

            }

        }
    }
}