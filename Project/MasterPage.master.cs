using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);
    SqlDataAdapter da;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (localDB.State != ConnectionState.Open)
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

        //System.Data.SqlClient.SqlCommand getMess = new System.Data.SqlClient.SqlCommand();
        //getMess.Connection = localDB;
        //getMess.CommandText = "Select count(MessageID) From Messages1 where(HasSeen like '*')";
        //string messages = getMess.ExecuteScalar().ToString();
        //lblMessage.Text = messages;       
        //localDB.Close();

    }



    //Populates Gridview 1 
    //protected void showData()
    //{
    //    dt = new DataTable();
    //    SqlCommand cmd = new SqlCommand("SELECT * FROM Messages1 inner JOIN Users ON Users.UserID = Messages1.MessageFromID  inner JOIN SchoolEmployee ON SchoolEmployee.UserID = Users.UserID inner JOIN School ON SchoolEmployee.SchoolID = School.SchoolID where(HasSeen like '*')", localDB);
    //    da = new SqlDataAdapter(cmd);
    //    da.Fill(dt);
    //    localDB.Close();
    //    if (dt.Rows.Count > 0)
    //    {
    //        GridView1.DataSource = dt;
    //        GridView1.DataBind();
    //    }
    //}


}
