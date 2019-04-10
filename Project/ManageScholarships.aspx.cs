using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ManageScholarships : System.Web.UI.Page
{
    //Declare connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    //Create data tables for gridviews
    SqlDataAdapter da;
    DataTable dt;
    SqlDataAdapter da2;
    DataTable dt2;

    static string id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            localDB.Open();
            System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();
            getLow.Connection = localDB;
            getLow.CommandText = "Select min(PostID) From Post where PostType Like 'Scholarship'";
            id = getLow.ExecuteScalar().ToString();
            localDB.Close();



            showData();
            LoadPreview();
            LoadEdit();
        }
    }

    //update gridview
    protected void showData()
    {
        //Populate Gridview 1 = active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Scholarship LEFT JOIN Post ON Scholarship.PostID = Post.PostID where(PostType like 'Scholarship')", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populate gridview 2 = deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteScholarship LEFT JOIN DeletePost ON DeleteScholarship.PostID = DeletePost.PostID where(PostType like 'Scholarship')", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }
    }

    //create scholarship
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        localDB.Open();

        //create post object

        Post post = new Post(1, "Scholarship", HttpUtility.HtmlEncode(txtTitle.Text), HttpUtility.HtmlEncode(txtDescription.Text));

        System.Data.SqlClient.SqlCommand insertPost = new System.Data.SqlClient.SqlCommand();
        insertPost.Connection = localDB;
        insertPost.CommandText = "insert into [Post] ([BusinessID], [PostType], [Title], [PostDate], [PostDescription], [LastUpdatedBy], [LastUpdated])" +
            "values (@busId, @type, @title, @postDate, @description, @lastUpdatedBy, @lastUpdated)";

        insertPost.Parameters.Add(new SqlParameter("type", post.getType()));
        insertPost.Parameters.Add(new SqlParameter("title", post.getTitle()));
        insertPost.Parameters.Add(new SqlParameter("postDate", post.getPostDate()));
        insertPost.Parameters.Add(new SqlParameter("description", post.getDescription()));
        insertPost.Parameters.Add(new SqlParameter("busID", post.getBusID()));
        insertPost.Parameters.Add(new SqlParameter("lastUpdatedBy", post.getLastUpdatedBy()));
        insertPost.Parameters.Add(new SqlParameter("lastUpdated", post.getLastUpdated()));

        insertPost.ExecuteNonQuery();

        System.Data.SqlClient.SqlCommand selectPostID = new System.Data.SqlClient.SqlCommand();
        selectPostID.Connection = localDB;

        selectPostID.CommandText = "select max(postID) from Post";
        string postID = selectPostID.ExecuteScalar().ToString();
        selectPostID.ExecuteNonQuery();

        //create scholarship object 
        Scholarship sch = new Scholarship(postID, HttpUtility.HtmlEncode(txtRequirements.Text), HttpUtility.HtmlEncode(txtAmount.Text), HttpUtility.HtmlEncode(txtDeadline.Text));

        System.Data.SqlClient.SqlCommand insertScholarship = new System.Data.SqlClient.SqlCommand();
        insertScholarship.Connection = localDB;

        insertScholarship.CommandText = "insert into [Scholarship] values (@postID, @requirements, @reward, @dueDate, @lastUpdatedBy, @lastUpdated)";

        insertScholarship.Parameters.Add(new SqlParameter("postID", sch.getpostID()));
        insertScholarship.Parameters.Add(new SqlParameter("requirements", sch.getReqs()));
        insertScholarship.Parameters.Add(new SqlParameter("reward", sch.getReward()));
        insertScholarship.Parameters.Add(new SqlParameter("dueDate", sch.getDueDate()));
        insertScholarship.Parameters.Add(new SqlParameter("lastUpdatedBy", sch.getLastUpdatedBy()));
        insertScholarship.Parameters.Add(new SqlParameter("lastUpdated", sch.getLastUpdated()));

        insertScholarship.ExecuteNonQuery();

        localDB.Close();


        showData();
    }

    protected void LoadPreview()
    {
        try
        {

            localDB.Open();

            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Select Title From Post where PostID = @id";
            getTitle.Parameters.AddWithValue("id", id);
            lblTitle1.Text = getTitle.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
            getDescription.Parameters.AddWithValue("id", id);
            lblDescription.Text = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select Requirements From Scholarship where PostID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id);
            lblRequirements.Text = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select Reward From Scholarship where PostID = @id";
            getQualifications.Parameters.AddWithValue("id", id);
            lblReward.Text = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select DueDate From Scholarship where PostID = @id";
            getDepartment.Parameters.AddWithValue("id", id);
            lblScholarshipDueDate.Text = getDepartment.ExecuteScalar().ToString();

            localDB.Close();
        }
        catch
        {

        }
    }

    protected void LoadEdit()
    {
        try
        {

            localDB.Open();

            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Select Title From Post where PostID = @id";
            getTitle.Parameters.AddWithValue("id", id);
            txtEditTitle.Text = getTitle.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
            getDescription.Parameters.AddWithValue("id", id);
            txtEditDescription.Text = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select Requirements From Scholarship where PostID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id);
            txtEditRequirements.Text = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select Reward From Scholarship where PostID = @id";
            getQualifications.Parameters.AddWithValue("id", id);
            txtEditREward.Text = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select DueDate From Scholarship where PostID = @id";
            getDepartment.Parameters.AddWithValue("id", id);
            txtEditDueDate.Text = getDepartment.ExecuteScalar().ToString();

            localDB.Close();
        }
        catch
        {

        }

    }


    ////edit post
    protected void SaveEdit_Click(object sender, EventArgs e)
    {
        Post post = new Post(1, "Scholarship", HttpUtility.HtmlEncode(txtEditTitle.Text), HttpUtility.HtmlEncode(txtEditDescription.Text));

        localDB.Open();
        System.Data.SqlClient.SqlCommand editPost = new System.Data.SqlClient.SqlCommand();
        editPost.Connection = localDB;
        editPost.CommandText = "Update Post set Title = @title, PostDescription = @description where PostID = @id";
        editPost.Parameters.AddWithValue("id", id);
        editPost.Parameters.AddWithValue("title", post.getTitle());
        editPost.Parameters.AddWithValue("description", post.getDescription());
        editPost.ExecuteNonQuery();

        Scholarship sch = new Scholarship(id, HttpUtility.HtmlEncode(txtEditRequirements.Text), HttpUtility.HtmlEncode(txtEditREward.Text), HttpUtility.HtmlEncode(txtEditDueDate.Text));

        System.Data.SqlClient.SqlCommand editjob = new System.Data.SqlClient.SqlCommand();
        editjob.Connection = localDB;
        editjob.CommandText = "Update Scholarship set Requirements = @requirements, Reward = @reward, DueDate = @duedate, LastUpdatedBy = @lastUpdated, LastUpdated = @lastUpdated where PostID = @id";
        editjob.Parameters.AddWithValue("id", sch.getpostID());
        editjob.Parameters.AddWithValue("requirements", sch.getReqs());
        editjob.Parameters.AddWithValue("reward", sch.getReward());
        editjob.Parameters.AddWithValue("duedate", sch.getDueDate());
        editjob.Parameters.AddWithValue("lastUpdatedBy", sch.getLastUpdatedBy());
        editjob.Parameters.AddWithValue("lastUpdated", sch.getLastUpdated());
        editjob.ExecuteNonQuery();

        localDB.Close();

        showData();
    }

    ////delete post
    protected void DeletePost_Click(object sender, EventArgs e)
    {
        localDB.Open();

        try
        {
            System.Data.SqlClient.SqlCommand deleteApps = new System.Data.SqlClient.SqlCommand();
            deleteApps.Connection = localDB;
            deleteApps.CommandText = "DELETE FROM App where PostID = @id";
            deleteApps.Parameters.AddWithValue("id", id);
            deleteApps.ExecuteNonQuery();

        }
        catch
        {

        }

        System.Data.SqlClient.SqlCommand deleteJob = new System.Data.SqlClient.SqlCommand();
        deleteJob.Connection = localDB;
        deleteJob.CommandText = "DELETE FROM Scholarship where PostID = @id";
        deleteJob.Parameters.AddWithValue("id", id);
        deleteJob.ExecuteNonQuery();


        System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
        deletePost.Connection = localDB;
        deletePost.CommandText = "DELETE FROM Post where PostID = @id";
        deletePost.Parameters.AddWithValue("id", id);
        deletePost.ExecuteNonQuery();

        localDB.Close();
        showData();
    }

    protected void Reactivate_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();
        getLow.Connection = localDB;
        getLow.CommandText = "Select min(PostID) From DeletePost where PostType Like 'Scholarship'";
        String ReactivateID = getLow.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
        deletePost.Connection = localDB;
        deletePost.CommandText = "DELETE FROM DeletePost where PostID = @id";
        deletePost.Parameters.AddWithValue("id", ReactivateID);
        deletePost.ExecuteNonQuery();

        System.Data.SqlClient.SqlCommand deleteJob = new System.Data.SqlClient.SqlCommand();
        deleteJob.Connection = localDB;
        deleteJob.CommandText = "DELETE FROM DeleteScholarship where PostID = @id";
        deleteJob.Parameters.AddWithValue("id", ReactivateID);
        deleteJob.ExecuteNonQuery();

        localDB.Close();
        showData();
    }


}
    
    

