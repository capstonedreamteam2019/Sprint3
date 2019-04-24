using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LandingPage : System.Web.UI.Page
{

    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null || HttpContext.Current.Request.UrlReferrer == null)
        {
            Response.Redirect("Login.aspx");
        }

        localDB.Open();
        System.Data.SqlClient.SqlCommand getApplicants = new System.Data.SqlClient.SqlCommand();
        getApplicants.Connection = localDB;
        getApplicants.CommandText = "Select count(AppID) From App";
        lblApplicants.Text = getApplicants.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getjobs = new System.Data.SqlClient.SqlCommand();
        getjobs.Connection = localDB;
        getjobs.CommandText = "Select count(PostID) From Job";
        lblJobs.Text = getjobs.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getscholarships = new System.Data.SqlClient.SqlCommand();
        getscholarships.Connection = localDB;
        getscholarships.CommandText = "Select count(PostID) From Scholarship";
        lblScholarships.InnerText = getscholarships.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getEvent = new System.Data.SqlClient.SqlCommand();
        getEvent.Connection = localDB;
        getEvent.CommandText = "Select count(PostID) From Event";
        lblEvent.InnerText = getEvent.ExecuteScalar().ToString();

        localDB.Close();
    }
}