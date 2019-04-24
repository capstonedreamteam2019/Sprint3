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
        string app = getApplicants.ExecuteScalar().ToString();
        lblapps.Text = app;
        lblApplicants.Text = app;

        System.Data.SqlClient.SqlCommand getSch = new System.Data.SqlClient.SqlCommand();
        getSch.Connection = localDB;
        getSch.CommandText = "Select count(PostID) From Scholarship where(Opened like '*')";
        lblsch.Text = getSch.ExecuteScalar().ToString();
        string sch = getSch.ExecuteScalar().ToString();
        lblScholarship.Text = sch;

        System.Data.SqlClient.SqlCommand getEvents = new System.Data.SqlClient.SqlCommand();
        getEvents.Connection = localDB;
        getEvents.CommandText = "Select count(PostID) From Event where(Opened like '*')";
        string even = getEvents.ExecuteScalar().ToString();
        lblEvents.Text = even;
        lblEv.Text = even;

        int not = Convert.ToInt32(app) + Convert.ToInt32(sch) + Convert.ToInt32(even);
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
