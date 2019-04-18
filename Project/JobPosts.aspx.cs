using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class JobPosts : System.Web.UI.Page
{
    //Declare connection 
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    //create gridview datatables
    SqlDataAdapter da;
    DataTable dt;
    SqlDataAdapter da2;
    DataTable dt2;

    //Declare static id variable
    static Label id;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {              
            //update all the gridviews
            showData();
        }
    }

    //update gridview
    protected void showData()
    {
        //Populate Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Job LEFT JOIN Post ON Job.PostID = Post.PostID where(PostType like 'Job')", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populate Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteJob LEFT JOIN DeletePost ON DeleteJob.PostID = DeletePost.PostID where(PostType like 'Job')", localDB);
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
        //Populate Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Job LEFT JOIN Post ON Job.PostID = Post.PostID where(PostType like 'Job') ORDER BY title ASC", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populate Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteJob LEFT JOIN DeletePost ON DeleteJob.PostID = DeletePost.PostID where(PostType like 'Job') ORDER BY title ASC", localDB);
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
        //Populate Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Job LEFT JOIN Post ON Job.PostID = Post.PostID where(PostType like 'Job') ORDER By DueDate", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populate Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteJob LEFT JOIN DeletePost ON DeleteJob.PostID = DeletePost.PostID where(PostType like 'Job') ORDER BY DueDate", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }
    }

    //last updated
    protected void LastUpdatedFilter(object sender, EventArgs e)
    {
        //Populate Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Job LEFT JOIN Post ON Job.PostID = Post.PostID where(PostType like 'Job') ORDER By Job.LastUpdated", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populate Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteJob LEFT JOIN DeletePost ON DeleteJob.PostID = DeletePost.PostID where(PostType like 'Job') ORDER BY DeleteJob.LastUpdated", localDB);
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

        if (e.CommandName == "Re")
        {
            builder.Append("<script language=JavaScript> ShowRe(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowRe", builder.ToString());
        }
    }

    //open Create popup
    protected void openCreate(object sender, EventArgs e)
    {
        positionTitle.Text = "";
        description.Text = "";
        department.Text = "";
        reqs.Value = "";
        deadline.Text = "";
        salary.Text = "";
        respons.Value = "";
        location.Text = "";
        ADayInTheLife.Value = "";

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

    //Create New Job Post
    protected void SubmitButton_Click(object sender, EventArgs e)
    {

        localDB.Open();

        //Creates a new sql insert command
        System.Data.SqlClient.SqlCommand insertPost = new System.Data.SqlClient.SqlCommand();
        insertPost.Connection = localDB;

        System.Data.SqlClient.SqlCommand selectPostID = new System.Data.SqlClient.SqlCommand();
        selectPostID.Connection = localDB;

        System.Data.SqlClient.SqlCommand insertJob = new System.Data.SqlClient.SqlCommand();
        insertJob.Connection = localDB;

        //Create Post object
        Post posting = new Post(1, "Job", HttpUtility.HtmlEncode(positionTitle.Text), HttpUtility.HtmlEncode(description.Text));

        //Insert data into database
        insertPost.CommandText = "Execute InsertPost @busID, @type, @title, @postDate, @description, @lastUpdatedBy, @lastUpdated";

        insertPost.Parameters.Add("@busID", SqlDbType.Int).Value = posting.getBusID();
        insertPost.Parameters.Add("@type", SqlDbType.VarChar, 30).Value = posting.getType();
        insertPost.Parameters.Add("@title", SqlDbType.VarChar, 100).Value = posting.getTitle();
        insertPost.Parameters.Add("@postDate", SqlDbType.VarChar, 30).Value = posting.getPostDate();
        insertPost.Parameters.Add("@description", SqlDbType.VarChar, 500).Value = posting.getDescription();        
        insertPost.Parameters.Add("@lastUpdatedBy", SqlDbType.VarChar, 30).Value = posting.getLastUpdatedBy();
        insertPost.Parameters.Add("@lastUpdated", SqlDbType.VarChar, 30).Value = posting.getLastUpdated();

        insertPost.ExecuteNonQuery();

        //Find post ID just created
        selectPostID.CommandText = "select max(postID) from Post";
        string postID = selectPostID.ExecuteScalar().ToString();

        //Find basis value
        string selected;
        if (yearly.Checked == true)
        {
            selected = "yearly";
        }

        else
        {
            selected = "hourly";
        }


        //Create Job object
        Job job = new Job(postID, HttpUtility.HtmlEncode(department.Text), HttpUtility.HtmlEncode(reqs.Value), HttpUtility.HtmlEncode(deadline.Text), HttpUtility.HtmlEncode(salary.Text), HttpUtility.HtmlEncode(respons.Value), HttpUtility.HtmlEncode(selected), HttpUtility.HtmlEncode(location.Text), HttpUtility.HtmlEncode(ADayInTheLife.Value));

        insertJob.CommandText = "Execute InsertJob @postID, @department, @requirements, @dueDate, @salary, @resp, @payType, @location, @ADayInTheLife, @lastUpdatedBy, @lastUpdated";

        insertJob.Parameters.Add("@postID", SqlDbType.Int).Value = job.getpostID();
        insertJob.Parameters.Add("@department", SqlDbType.VarChar, 30).Value = job.getDepartment();
        insertJob.Parameters.Add("@requirements", SqlDbType.VarChar, 100).Value = job.getReqs();
        insertJob.Parameters.Add("@dueDate", SqlDbType.VarChar, 30).Value = job.getDueDate();
        insertJob.Parameters.Add("@salary", SqlDbType.VarChar, 30).Value = job.getSalary();
        insertJob.Parameters.Add("@resp", SqlDbType.VarChar, 50).Value = job.getResponsibilities();
        insertJob.Parameters.Add("@payType", SqlDbType.VarChar, 6).Value = job.getPayType();
        insertJob.Parameters.Add("@location", SqlDbType.VarChar, 50).Value = job.getLocation();
        insertJob.Parameters.Add("@aDayInTheLife", SqlDbType.VarChar, 150).Value = job.getADay();
        insertJob.Parameters.Add("@lastUpdatedBy", SqlDbType.VarChar, 30).Value = job.getLastUpdatedBy();
        insertJob.Parameters.Add("@lastUpdated", SqlDbType.VarChar, 30).Value = job.getLastUpdated();

        insertJob.ExecuteNonQuery();

        localDB.Close();

        showData();

        positionTitle.Text = "";
        description.Text = "";
        department.Text = "";
        reqs.Value = "";
        deadline.Text = "";
        salary.Text = "";
        respons.Value = "";
        location.Text = "";
        ADayInTheLife.Value = "";


    }

    //Populate create popup
    protected void Populate_Click(object sender, EventArgs e)
    {
        positionTitle.Text = "Marketing Associate";
        description.Text = "Works in a team to create a marketing plan for a client";
        department.Text = "Marketing";
        reqs.Value = "3.0 GPA";
        deadline.Text = "04/20/2019";
        salary.Text = "50,000";
        respons.Value = "Responsible for maintaining a good relationship with the client";
        yearly.Checked = true;
        location.Text = "Arlington, Va";
        ADayInTheLife.Value = "9 to 5 job";

        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> ShowCreate(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowCreate", builder.ToString());

    }


    //Load Preview Modal
    protected void LoadPreview()
    {
        try
        {

            localDB.Open();

            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Select Title From Post where PostID = @id";
            getTitle.Parameters.AddWithValue("id", id.Text);
            Label1.InnerText = getTitle.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
            getDescription.Parameters.AddWithValue("id", id.Text);
            Label2.InnerText = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select Responsibilities From Job where PostID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id.Text);
            Label3.InnerText = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select Requirements From Job where PostID = @id";
            getQualifications.Parameters.AddWithValue("id", id.Text);
            Label4.InnerText = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getday = new System.Data.SqlClient.SqlCommand();
            getday.Connection = localDB;
            getday.CommandText = "Select ADayInTheLife From Job where PostID = @id";
            getday.Parameters.AddWithValue("id", id.Text);
            Label5.InnerText = getday.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select Department From Job where PostID = @id";
            getDepartment.Parameters.AddWithValue("id", id.Text);
            Label6.InnerText = getDepartment.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getLocation = new System.Data.SqlClient.SqlCommand();
            getLocation.Connection = localDB;
            getLocation.CommandText = "Select JobAddress From Job where PostID = @id";
            getLocation.Parameters.AddWithValue("id", id.Text);
            Label7.InnerText = getLocation.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getSalary = new System.Data.SqlClient.SqlCommand();
            getSalary.Connection = localDB;
            getSalary.CommandText = "Select Salary From Job where PostID = @id";
            getSalary.Parameters.AddWithValue("id", id.Text);
            Label8.InnerText = getSalary.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getPayType = new System.Data.SqlClient.SqlCommand();
            getPayType.Connection = localDB;
            getPayType.CommandText = "Select PayType From Job where PostID = @id";
            getPayType.Parameters.AddWithValue("id", id.Text);
            Label9.InnerText = getPayType.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDueDate = new System.Data.SqlClient.SqlCommand();
            getDueDate.Connection = localDB;
            getDueDate.CommandText = "Select DueDate From Job where PostID = @id";
            getDueDate.Parameters.AddWithValue("id", id.Text);
            Label10.InnerText = getDueDate.ExecuteScalar().ToString();

            localDB.Close();
        }
        catch
        {
            Label1.InnerText = "";
            Label2.InnerText = "";
            Label3.InnerText = "";
            Label4.InnerText = "";
            Label5.InnerText = "";
            Label6.InnerText = "";
            Label7.InnerText = "";
            Label8.InnerText = "";
            Label9.InnerText = "";
            Label10.InnerText = "";
        }

    }

    //Load Edit Modal
    protected void LoadEdit()
    {
        try
        {

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
            getResponsibilities.CommandText = "Select Responsibilities From Job where PostID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id.Text);
            txtEditResponsibilities.Value = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select Requirements From Job where PostID = @id";
            getQualifications.Parameters.AddWithValue("id", id.Text);
            txtEditRequirements.Value = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select Department From Job where PostID = @id";
            getDepartment.Parameters.AddWithValue("id", id.Text);
            txtEditDepartment.Value = getDepartment.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getLocation = new System.Data.SqlClient.SqlCommand();
            getLocation.Connection = localDB;
            getLocation.CommandText = "Select JobAddress From Job where PostID = @id";
            getLocation.Parameters.AddWithValue("id", id.Text);
            txtEditLocation.Value = getLocation.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getSalary = new System.Data.SqlClient.SqlCommand();
            getSalary.Connection = localDB;
            getSalary.CommandText = "Select Salary From Job where PostID = @id";
            getSalary.Parameters.AddWithValue("id", id.Text);

            txtEditSalary.Value = getSalary.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDueDate = new System.Data.SqlClient.SqlCommand();
            getDueDate.Connection = localDB;
            getDueDate.CommandText = "Select DueDate From Job where PostID = @id";
            getDueDate.Parameters.AddWithValue("id", id.Text);
            txtEditDeadline.Value = getDueDate.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getday = new System.Data.SqlClient.SqlCommand();
            getday.Connection = localDB;
            getday.CommandText = "Select ADayInTheLife From Job where PostID = @id";
            getday.Parameters.AddWithValue("id", id.Text);
            txtADay.Value = getday.ExecuteScalar().ToString();


            localDB.Close();
        }
        catch
        {
            txtEditTitle.Text = "";
            txtEditDescription.Text = "";
            txtEditDepartment.Value = "";
            txtEditDeadline.Value = "";
            txtEditLocation.Value = "";
            txtEditResponsibilities.Value = "";
            txtEditRequirements.Value = "";
            txtEditSalary.Value = "";
            txtADay.Value = "";
        }

    }

    //save edits to post
    protected void SaveEdit_Click(object sender, EventArgs e)
    {
        string selected;
        if (yearly.Checked == true)
        {
            selected = "yearly";
        }

        else
        {
            selected = "hourly";
        }

        //create post object
        Post posting = new Post(1, "Job", HttpUtility.HtmlEncode(txtEditTitle.Text), HttpUtility.HtmlEncode(txtEditDescription.Text));

        //insert into database
        localDB.Open();
        System.Data.SqlClient.SqlCommand editPost = new System.Data.SqlClient.SqlCommand();
        editPost.Connection = localDB;
        editPost.CommandText = "Execute EditPost @id, @title, @postDate, @description, @LastUpdatedBy, @LastUpdated";
        editPost.Parameters.Add("@id", SqlDbType.Int).Value =  id.Text;
        editPost.Parameters.Add("@title", SqlDbType.VarChar, 100).Value = posting.getTitle();
        editPost.Parameters.Add("@postDate", SqlDbType.VarChar, 30).Value = posting.getPostDate();
        editPost.Parameters.Add("@description", SqlDbType.VarChar, 100).Value = posting.getDescription();
        editPost.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = posting.getLastUpdatedBy();
        editPost.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = posting.getLastUpdated();
        editPost.ExecuteNonQuery();

        Job job = new Job(id.Text, HttpUtility.HtmlEncode(txtEditDepartment.Value), HttpUtility.HtmlEncode(txtEditRequirements.Value), HttpUtility.HtmlEncode(txtEditDeadline.Value), HttpUtility.HtmlEncode(txtEditSalary.Value), HttpUtility.HtmlEncode(txtEditResponsibilities.Value), HttpUtility.HtmlEncode(selected), HttpUtility.HtmlEncode(txtEditLocation.Value), HttpUtility.HtmlEncode(txtADay.Value));


        System.Data.SqlClient.SqlCommand editjob = new System.Data.SqlClient.SqlCommand();
        editjob.Connection = localDB;
        editjob.CommandText = "Execute EditJob @id, @department, @requirements, @duedate, @salary, @responsibilities, @paytype, @location, @ADay, @LastUpdatedBy, @LastUpdated";
        editjob.Parameters.Add("@id", SqlDbType.Int).Value = id.Text;
        editjob.Parameters.Add("@department", SqlDbType.VarChar, 30).Value = job.getDepartment();
        editjob.Parameters.Add("@requirements", SqlDbType.VarChar, 100).Value = job.getReqs();
        editjob.Parameters.Add("@responsibilities", SqlDbType.VarChar, 50).Value = job.getResponsibilities();
        editjob.Parameters.Add("@duedate", SqlDbType.VarChar, 30).Value = job.getDueDate();
        editjob.Parameters.Add("@salary", SqlDbType.VarChar, 40).Value = job.getSalary();
        editjob.Parameters.Add("@paytype", SqlDbType.VarChar, 6).Value = job.getPayType();
        editjob.Parameters.Add("@location", SqlDbType.VarChar, 50).Value = job.getLocation();
        editjob.Parameters.Add("@ADay", SqlDbType.VarChar, 150).Value = job.getADay();
        editjob.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = job.getLastUpdatedBy();
        editjob.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = job.getLastUpdated();

        editjob.ExecuteNonQuery();

        localDB.Close();

        showData();
    }

    //delete post
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
        deleteJob.CommandText = "DELETE FROM Job where PostID = @id";
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
        deleteJob.CommandText = "DELETE FROM DeleteJob where PostID = @id";
        deleteJob.Parameters.AddWithValue("id", id.Text);
        deleteJob.ExecuteNonQuery();

        localDB.Close();
        showData();
    }


}