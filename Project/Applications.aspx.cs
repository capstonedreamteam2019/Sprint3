using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Applications: System.Web.UI.Page
{
    //Declare connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    //Create data tables for gridviews
    SqlDataAdapter da;
    DataTable dt;
    SqlDataAdapter da2;
    DataTable dt2;
    SqlDataAdapter da3;
    DataTable dt3;

    //Declare static id variable
    static string id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //get lowest App ID
            localDB.Open();
            System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();
            getLow.Connection = localDB;
            getLow.CommandText = "Select min(UserID) From App";
            id = getLow.ExecuteScalar().ToString();
            localDB.Close();

            //Updates the textboxes
            showData();
            LoadPreview();
        }
    }

    //update gridview
    protected void showData()
    {
        //Populates Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM App LEFT OUTER JOIN Users ON Users.UserID = App.UserID LEFT OUTER JOIN Post ON App.PostID = Post.PostID where Hired Like 'Open'", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populates Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteApp LEFT OUTER JOIN Users ON Users.UserID = DeleteApp.UserID LEFT OUTER JOIN Post ON DeleteApp.PostID = Post.PostID", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        //Populates Gridview 3 = Hired
        localDB.Open();
        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM App LEFT OUTER JOIN Users ON Users.UserID = App.UserID LEFT OUTER JOIN Post ON App.PostID = Post.PostID where Hired Like 'Hired'", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
        }
    }

    //Populates the preview textboxes
    protected void LoadPreview()
    {
        try
        {
            localDB.Open();

            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Select FirstName From Users where UserID = @id";
            getTitle.Parameters.AddWithValue("id", id);

            System.Data.SqlClient.SqlCommand getLast = new System.Data.SqlClient.SqlCommand();
            getLast.Connection = localDB;
            getLast.CommandText = "Select LastName From Users where UserID = @id";
            getLast.Parameters.AddWithValue("id", id);

            lblTitle1.Text = getTitle.ExecuteScalar().ToString() + " " + getLast.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select Email From Users where UserID = @id";
            getDescription.Parameters.AddWithValue("id", id);
            lblDescription.Text = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select PhoneNumber From Users where UserID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id);
            lblResponsibilities.Text = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select DateOfBirth From Users where UserID = @id";
            getQualifications.Parameters.AddWithValue("id", id);
            lblQualifications.Text = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select SchoolID From Student where UserID = @id";
            getDepartment.Parameters.AddWithValue("id", id);
            String SchoolID = getDepartment.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getSchool = new System.Data.SqlClient.SqlCommand();
            getSchool.Connection = localDB;
            getSchool.CommandText = "Select SchoolName From School where SchoolID = @id";
            getSchool.Parameters.AddWithValue("id", SchoolID);
            lblDepartment.Text = getSchool.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getLocation = new System.Data.SqlClient.SqlCommand();
            getLocation.Connection = localDB;
            getLocation.CommandText = "Select AcademicYear From Student where UserID = @id";
            getLocation.Parameters.AddWithValue("id", id);
            lblLocation.Text = getLocation.ExecuteScalar().ToString();

            localDB.Close();
        }
        catch
        {
            lblTitle1.Text = "";
            lblDescription.Text = "";
            lblResponsibilities.Text = "";
            lblQualifications.Text = "";
            lblDepartment.Text = "";
            lblLocation.Text = "";
        }
    }

    //delete post
    protected void DeletedApp_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand deletedApp = new System.Data.SqlClient.SqlCommand();
        deletedApp.Connection = localDB;
        deletedApp.CommandText = "DELETE FROM App where UserID = @id";
        deletedApp.Parameters.AddWithValue("id", id);
        deletedApp.ExecuteNonQuery();

        localDB.Close();
        showData();
    }

    protected void Hire_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand HireApp = new System.Data.SqlClient.SqlCommand();
        HireApp.Connection = localDB;
        HireApp.CommandText = "Update App set Hired = @hired where UserID = @id";
        HireApp.Parameters.AddWithValue("hired", "Hired");
        HireApp.Parameters.AddWithValue("id", id);
        HireApp.ExecuteNonQuery();

        localDB.Close();
        showData();
    }

    protected void Reactivate_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();
        getLow.Connection = localDB;
        getLow.CommandText = "Select min(AppID) From DeleteApp";
        String ReactivateID = getLow.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
        deletePost.Connection = localDB;
        deletePost.CommandText = "DELETE FROM DeleteApp where UserID = @id";
        deletePost.Parameters.AddWithValue("id", ReactivateID);
        deletePost.ExecuteNonQuery();       

        localDB.Close();
        showData();
    }


}