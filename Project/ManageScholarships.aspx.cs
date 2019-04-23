using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class ManageScholarships : System.Web.UI.Page
{
    //Declare connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    //Create data tables for gridviews
    SqlDataAdapter da;
    DataTable dt;
    SqlDataAdapter da2;
    DataTable dt2;

    static Label id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showData();
        }
        if (Session["UserName"] == null || HttpContext.Current.Request.UrlReferrer == null)
        {
            Response.Redirect("Login.aspx");
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

    //Due Date filter
    protected void DueDateFilter(object sender, EventArgs e)
    {
        //Populate Gridview 1 = active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Scholarship LEFT JOIN Post ON Scholarship.PostID = Post.PostID where(PostType like 'Scholarship') Order By DueDate", localDB);
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
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteScholarship LEFT JOIN DeletePost ON DeleteScholarship.PostID = DeletePost.PostID where(PostType like 'Scholarship') Order By DueDate", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }
    }
    //Alphabetical filter
    protected void AlphabeticalFilter(object sender, EventArgs e)
    {
        //Populate Gridview 1 = active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Scholarship LEFT JOIN Post ON Scholarship.PostID = Post.PostID where(PostType like 'Scholarship')  ORDER BY title ASC", localDB);
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
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteScholarship LEFT JOIN DeletePost ON DeleteScholarship.PostID = DeletePost.PostID where(PostType like 'Scholarship') ORDER BY title ASC", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }
    }
    //Reward filter
    protected void RewardFilter(object sender, EventArgs e)
    {
        //Populate Gridview 1 = active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Scholarship LEFT JOIN Post ON Scholarship.PostID = Post.PostID where(PostType like 'Scholarship') order by reward ASC", localDB);
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
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteScholarship LEFT JOIN DeletePost ON DeleteScholarship.PostID = DeletePost.PostID where(PostType like 'Scholarship') order by reward ASC", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }
    }

    //Row commands for gridview 1
    protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridView1.Rows[index];
        id = selectedRow.FindControl("lblID") as Label;

        StringBuilder builder = new StringBuilder();

        if (e.CommandName == "Preview")
        {
            LoadPreview();
            builder.Append("<script language=JavaScript> ShowPreview(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPreview", builder.ToString());

        }
        if (e.CommandName == "Change")
        {
            LoadEdit();
            builder.Append("<script language=JavaScript> ShowEdit(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowEdit", builder.ToString());
        }
        if (e.CommandName == "Remove")
        {
            builder.Append("<script language=JavaScript> ShowDelete(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowDelete", builder.ToString());
        }

    }

    //Row commands for gridview 2
    protected void GridView2_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridView2.Rows[index];
        id = selectedRow.FindControl("lblID") as Label;

        StringBuilder builder = new StringBuilder();
        if (e.CommandName == "Preview")
        {
            LoadPreview();
            builder.Append("<script language=JavaScript> ShowPreview(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPreview", builder.ToString());

        }
        if (e.CommandName == "Re")
        {
            id = selectedRow.FindControl("lblID") as Label;
            builder.Append("<script language=JavaScript> ShowRe(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowRe", builder.ToString());
        }
    }

    //Close Create popup
    protected void openCreate(object sender, EventArgs e)
    {
        lblError.Text = "";

        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> ShowCreate(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowCreate", builder.ToString());
    }

    //Close Create popup
    protected void CloseCreate(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideCreate(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideCreate", builder.ToString());
    }

    //Close preview popup
    protected void ClosePreview(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HidePreview(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HidePreview", builder.ToString());
    }

    //close edit popup
    protected void CloseEdit(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideEdit(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideEdit", builder.ToString());
    }

    //close delete popup
    protected void CloseDelete(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideDelete(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideDelete", builder.ToString());
    }

    //close Rectivate popup
    protected void CloseRe(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideRe(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideRe", builder.ToString());
    }

    //create scholarship
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if ((txtTitle.Text == "") || (txtAmount.Value == ""))
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<script language=JavaScript> ShowCreate(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowCreate", builder.ToString());
            lblError.Text = "Please enter all required values.";

        }
        else
        {

            localDB.Open();

            //create post object

            Post post = new Post(1, "Scholarship", HttpUtility.HtmlEncode(txtTitle.Text), HttpUtility.HtmlEncode(txtDescription.Text));

            System.Data.SqlClient.SqlCommand insertPost = new System.Data.SqlClient.SqlCommand();
            insertPost.Connection = localDB;
            insertPost.CommandText = "Execute InsertPost @busId, @type, @title, @postDate, @description, @lastUpdatedBy, @lastUpdated";

            insertPost.Parameters.Add("@type", SqlDbType.VarChar, 30).Value = post.getType();
            insertPost.Parameters.Add("@title", SqlDbType.VarChar, 100).Value = post.getTitle();
            insertPost.Parameters.Add("@postDate", SqlDbType.VarChar, 30).Value = post.getPostDate();
            insertPost.Parameters.Add("@description", SqlDbType.VarChar, 500).Value = post.getDescription();
            insertPost.Parameters.Add("@busID", SqlDbType.Int).Value = post.getBusID();
            insertPost.Parameters.Add("@lastUpdatedBy", SqlDbType.VarChar, 30).Value = post.getLastUpdatedBy();
            insertPost.Parameters.Add("@lastUpdated", SqlDbType.VarChar, 30).Value = post.getLastUpdated();

            insertPost.ExecuteNonQuery();

            System.Data.SqlClient.SqlCommand selectPostID = new System.Data.SqlClient.SqlCommand();
            selectPostID.Connection = localDB;

            selectPostID.CommandText = "select max(postID) from Post";
            string postID = selectPostID.ExecuteScalar().ToString();
            selectPostID.ExecuteNonQuery();

            //create scholarship object 
            Scholarship sch = new Scholarship(postID, HttpUtility.HtmlEncode(txtRequirements.Text), HttpUtility.HtmlEncode(txtAmount.Value), HttpUtility.HtmlEncode(txtDeadline.Value));

            System.Data.SqlClient.SqlCommand insertScholarship = new System.Data.SqlClient.SqlCommand();
            insertScholarship.Connection = localDB;

            insertScholarship.CommandText = "Execute InsertScholarship @postID, @requirements, @reward, @dueDate, @lastUpdatedBy, @lastUpdated";

            insertScholarship.Parameters.Add("@postID", SqlDbType.Int).Value = sch.getpostID();
            insertScholarship.Parameters.Add("@requirements", SqlDbType.VarChar, 100).Value = sch.getReqs();
            insertScholarship.Parameters.Add("@reward", SqlDbType.VarChar, 30).Value = sch.getReward();
            insertScholarship.Parameters.Add("@dueDate", SqlDbType.VarChar, 30).Value = sch.getDueDate();
            insertScholarship.Parameters.Add("@lastUpdatedBy", SqlDbType.VarChar, 30).Value = sch.getLastUpdatedBy();
            insertScholarship.Parameters.Add("@lastUpdated", SqlDbType.VarChar, 30).Value = sch.getLastUpdated();

            insertScholarship.ExecuteNonQuery();

            localDB.Close();


            showData();
        }
    }

    protected void LoadPreview()
    {
        try
        {

            localDB.Open();

            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Select Title From Post where PostID = @id";
            getTitle.Parameters.AddWithValue("id", id.Text);
            lblTitle1.Text = getTitle.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
            getDescription.Parameters.AddWithValue("id", id.Text);
            lblDescription.Text = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select Requirements From Scholarship where PostID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id.Text);
            lblRequirements.Text = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select Reward From Scholarship where PostID = @id";
            getQualifications.Parameters.AddWithValue("id", id.Text);
            lblReward.Text = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select DueDate From Scholarship where PostID = @id";
            getDepartment.Parameters.AddWithValue("id", id.Text);
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
            lblEditError.Text = "";

            localDB.Open();

            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Select Title From Post where PostID = @id";
            getTitle.Parameters.AddWithValue("id", id.Text);
            txtEditTitle.Text = getTitle.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
            getDescription.Parameters.AddWithValue("id", id.Text);
            txtEditDescription.Text = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select Requirements From Scholarship where PostID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id.Text);
            txtEditRequirements.Text = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select Reward From Scholarship where PostID = @id";
            getQualifications.Parameters.AddWithValue("id", id.Text);
            txtEditREward.Value = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select DueDate From Scholarship where PostID = @id";
            getDepartment.Parameters.AddWithValue("id", id.Text);
            string str2 = getDepartment.ExecuteScalar().ToString();
            if (str2 != "")
            {
                DateTime dt2 = new DateTime();
                dt2 = Convert.ToDateTime(str2);
                txtEditDueDate.Value = dt2.ToString("yyyy-MM-dd");
            }
            

            localDB.Close();
        }
        catch
        {

        }

    }


    ////edit post
    protected void SaveEdit_Click(object sender, EventArgs e)
    {
        if ((txtEditTitle.Text == "") || (txtEditREward.Value == ""))
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<script language=JavaScript> ShowEdit(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowEdit", builder.ToString());
            lblEditError.Text = "Please enter all required values.";

        }
        else
        {

            Post post = new Post(1, "Scholarship", HttpUtility.HtmlEncode(txtEditTitle.Text), HttpUtility.HtmlEncode(txtEditDescription.Text));

            localDB.Open();
            System.Data.SqlClient.SqlCommand editPost = new System.Data.SqlClient.SqlCommand();
            editPost.Connection = localDB;
            editPost.CommandText = "Execute EditPost @id, @title, @PostDate, @description, @lastUpdatedBy, @LastUpdated";
            editPost.Parameters.Add("@id", SqlDbType.Int).Value = id.Text;
            editPost.Parameters.Add("@title", SqlDbType.VarChar, 100).Value = post.getTitle();
            editPost.Parameters.Add("@PostDate", SqlDbType.VarChar, 30).Value = post.getPostDate();
            editPost.Parameters.Add("@description", SqlDbType.VarChar, 500).Value = post.getDescription();
            editPost.Parameters.Add("@lastUpdatedBy", SqlDbType.VarChar, 30).Value = post.getLastUpdatedBy();
            editPost.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = post.getLastUpdated();
            editPost.ExecuteNonQuery();

            Scholarship sch = new Scholarship(id.Text, HttpUtility.HtmlEncode(txtEditRequirements.Text), HttpUtility.HtmlEncode(txtEditREward.Value), HttpUtility.HtmlEncode(txtEditDueDate.Value));

            System.Data.SqlClient.SqlCommand editjob = new System.Data.SqlClient.SqlCommand();
            editjob.Connection = localDB;
            editjob.CommandText = "Execute EditScholarship @id, @requirements, @reward, @duedate, @lastUpdatedBy, @lastUpdated";
            editjob.Parameters.Add("@id", SqlDbType.Int).Value = sch.getpostID();
            editjob.Parameters.Add("@requirements", SqlDbType.VarChar, 100).Value = sch.getReqs();
            editjob.Parameters.Add("@reward", SqlDbType.VarChar, 30).Value = sch.getReward();
            editjob.Parameters.Add("@duedate", SqlDbType.VarChar, 30).Value = sch.getDueDate();
            editjob.Parameters.Add("@lastUpdatedBy", SqlDbType.VarChar, 30).Value = sch.getLastUpdatedBy();
            editjob.Parameters.Add("@lastUpdated", SqlDbType.VarChar, 30).Value = sch.getLastUpdated();
            editjob.ExecuteNonQuery();

            localDB.Close();

            showData();
        }
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
            deleteApps.Parameters.AddWithValue("id", id.Text);
            deleteApps.ExecuteNonQuery();

        }
        catch
        {

        }

        System.Data.SqlClient.SqlCommand deleteJob = new System.Data.SqlClient.SqlCommand();
        deleteJob.Connection = localDB;
        deleteJob.CommandText = "DELETE FROM Scholarship where PostID = @id";
        deleteJob.Parameters.AddWithValue("id", id.Text);
        deleteJob.ExecuteNonQuery();


        System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
        deletePost.Connection = localDB;
        deletePost.CommandText = "DELETE FROM Post where PostID = @id";
        deletePost.Parameters.AddWithValue("id", id.Text);
        deletePost.ExecuteNonQuery();

        localDB.Close();
        showData();
    }

    protected void Reactivate_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
        deletePost.Connection = localDB;
        deletePost.CommandText = "DELETE FROM DeletePost where PostID = @id";
        deletePost.Parameters.AddWithValue("id", id.Text);
        deletePost.ExecuteNonQuery();

        System.Data.SqlClient.SqlCommand deleteJob = new System.Data.SqlClient.SqlCommand();
        deleteJob.Connection = localDB;
        deleteJob.CommandText = "DELETE FROM DeleteScholarship where PostID = @id";
        deleteJob.Parameters.AddWithValue("id", id.Text);
        deleteJob.ExecuteNonQuery();

        localDB.Close();
        showData();
    }


}

