using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Registration3 : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSelect1_Click(object sender, EventArgs e)
    {

        string subscription = "One Month Trial";

        localDB.Open();
        System.Data.SqlClient.SqlCommand getUserID = new System.Data.SqlClient.SqlCommand();
        getUserID.Connection = localDB;

        //Find UserID for most recently entered User
        getUserID.CommandText = "select MAX(UserID) from USERS";
        string returnID = getUserID.ExecuteScalar().ToString();
        int idUser = Int32.Parse(returnID);
        getUserID.ExecuteNonQuery();

        //Update user table
        SqlCommand update = new SqlCommand("Update Users SET Subscription=@Subscription WHERE UserId=@MaxID;", localDB);
        update.Parameters.Add(new SqlParameter("@Subscription", subscription));
        update.Parameters.Add(new SqlParameter("@MaxID", idUser));
        update.ExecuteNonQuery();


        localDB.Close();

        Response.Redirect("Registration4.aspx");



    }

    protected void btnSelect2_Click(object sender, EventArgs e)
    {

        string subscription = "Pay Per Post";

        localDB.Open();
        System.Data.SqlClient.SqlCommand getUserID = new System.Data.SqlClient.SqlCommand();
        getUserID.Connection = localDB;

        //Find UserID for most recently entered User
        getUserID.CommandText = "select MAX(UserID) from USERS";
        string returnID = getUserID.ExecuteScalar().ToString();
        int idUser = Int32.Parse(returnID);
        getUserID.ExecuteNonQuery();

        //Update user table
        SqlCommand update = new SqlCommand("Update Users SET Subscription=@Subscription WHERE UserId=@MaxID;", localDB);
        update.Parameters.Add(new SqlParameter("@Subscription", subscription));
        update.Parameters.Add(new SqlParameter("@MaxID", idUser));
        update.ExecuteNonQuery();


        localDB.Close();

        Response.Redirect("Registration4.aspx");


    }

    protected void btnSelect3_Click(object sender, EventArgs e)
    {

        string subscription = "Monthly Subscription";

        localDB.Open();
        System.Data.SqlClient.SqlCommand getUserID = new System.Data.SqlClient.SqlCommand();
        getUserID.Connection = localDB;

        //Find UserID for most recently entered User
        getUserID.CommandText = "select MAX(UserID) from USERS";
        string returnID = getUserID.ExecuteScalar().ToString();
        int idUser = Int32.Parse(returnID);
        getUserID.ExecuteNonQuery();

        //Update user table
        SqlCommand update = new SqlCommand("Update Users SET Subscription=@Subscription WHERE UserId=@MaxID;", localDB);
        update.Parameters.Add(new SqlParameter("@Subscription", subscription));
        update.Parameters.Add(new SqlParameter("@MaxID", idUser));
        update.ExecuteNonQuery();


        localDB.Close();

        Response.Redirect("Registration4.aspx");

    }
}