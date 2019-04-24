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
        getApplicants.CommandText = "Select count(AppID) From App where(Opened like 'unread')";
        lblapps.Text = getApplicants.ExecuteScalar().ToString();
        lblApplicants.Text = getApplicants.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getSch = new System.Data.SqlClient.SqlCommand();
        getSch.Connection = localDB;
        getSch.CommandText = "Select count(PostID) From Scholarship where(DueDate between '04/27/2019' and '05/01/2019')";
        lblsch.Text = getSch.ExecuteScalar().ToString();
        lblScholarship.Text = getSch.ExecuteScalar().ToString();




        lblNotification.Text = getApplicants.ExecuteScalar().ToString();
        localDB.Close();
    }
}
