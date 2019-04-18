using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {


    }



    protected void Step1_Click(object sender, EventArgs e)
    {
        string userType = "";

        if (RDStudent.Checked == false)
        {
            if (RDParent.Checked == false)
            {
                if (RDTeacher.Checked == false)
                {
                    if (RDEmployee.Checked == false)
                    {
                        if (RDEmployer.Checked == false)
                        {
                            lblError.Text = "Must select identification.";
                        }
                        else
                        {
                            userType = "BusinessEmployee";
                        }
                    }
                    else
                    {
                        userType = "SchoolEmployee";
                    }
                }
                else
                {
                    userType = "Teacher";
                }
            }
            else
            {
                userType = "Parent";
            }
        }
        else
        {
            userType = "Student";
        }

        if (userType != "")
        {
            localDB.Open();


            System.Data.SqlClient.SqlCommand getUserID = new System.Data.SqlClient.SqlCommand();
            getUserID.Connection = localDB;

            //Find UserID for most recently entered User
            getUserID.CommandText = "select MAX(UserID) from USERS";
            string returnID = getUserID.ExecuteScalar().ToString();
            int idUser = Int32.Parse(returnID);
            getUserID.ExecuteNonQuery();

            System.Data.SqlClient.SqlCommand getLastUpdatedBy = new System.Data.SqlClient.SqlCommand();
            getLastUpdatedBy.Connection = localDB;
            getLastUpdatedBy.Parameters.Add(new SqlParameter("@MaxID", idUser));


            //Find LastUpdatedBy for most recently entered User
            getLastUpdatedBy.CommandText = "select LastUpdatedBy from USERS WHERE UserID=@MaxID";
            string LastUpdatedBy = getLastUpdatedBy.ExecuteScalar().ToString();
            getLastUpdatedBy.ExecuteNonQuery();


            if (LastUpdatedBy == "Incomplete")
            {
                //Update user table
                SqlCommand update = new SqlCommand("Update Users SET UserType=@UserType WHERE UserId=@MaxID;", localDB);
                update.Parameters.Add(new SqlParameter("@UserType", userType));
                update.Parameters.Add(new SqlParameter("@MaxID", idUser));
                update.ExecuteNonQuery();
            }

            else
            {
                System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand("InsertUser", localDB);
                insert.Connection = localDB;

                //Define command type as stored procedure 
                insert.CommandType = CommandType.StoredProcedure;

                //Pass values to command parameters 
                insert.Parameters.Add(new SqlParameter("@UserType", userType));
                insert.Parameters.Add(new SqlParameter("@Email", "EdwardSmith@gmail.com"));
                insert.Parameters.Add(new SqlParameter("@UserPassword", "password"));
                insert.Parameters.Add(new SqlParameter("@FirstName", "Edward"));
                insert.Parameters.Add(new SqlParameter("@LastName", "Smith"));
                insert.Parameters.Add(new SqlParameter("@LastUpdatedBy", "Incomplete"));
                insert.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Today));
                insert.ExecuteNonQuery();
            }

            localDB.Close();
            Response.Redirect("Registration2.aspx");
             }

        else
        {
            lblError.Text = "Must select identification.";
        }
            }

}
