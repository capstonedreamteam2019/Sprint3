using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        localDB.Open();
        System.Data.SqlClient.SqlCommand getApplicants = new System.Data.SqlClient.SqlCommand();
        getApplicants.Connection = localDB;
        getApplicants.CommandText = "Select count(AppID) From App where(Opened like '*')";
        lblapps.Text = getApplicants.ExecuteScalar().ToString();
        lblApplicants.Text = getApplicants.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getSch = new System.Data.SqlClient.SqlCommand();
        getSch.Connection = localDB;
        getSch.CommandText = "Select count(PostID) From Scholarship where(Opened like '*')";
        lblsch.Text = getSch.ExecuteScalar().ToString();
        lblScholarship.Text = getSch.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getEvents = new System.Data.SqlClient.SqlCommand();
        getEvents.Connection = localDB;
        getEvents.CommandText = "Select count(PostID) From Events where(Opened like '*')";
        lblEvents.Text = getEvents.ExecuteScalar().ToString();
        lblEv.Text = getEvents.ExecuteScalar().ToString();


        int not = Convert.ToInt32(getApplicants.ExecuteScalar().ToString()) + Convert.ToInt32(getSch.ExecuteScalar().ToString()) + Convert.ToInt32(getEvents.ExecuteScalar().ToString());
        if (not == 0)
        {
            lblNotification.Text = "";
        }
        else
        {
            lblNotification.Text = not.ToString();
        }
        localDB.Close();
    }
}
