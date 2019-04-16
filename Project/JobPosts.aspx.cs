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
            //update all modals with data from database
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
        Post posting = new Post(1, "Job", HttpUtility.HtmlEncode(title.Value), HttpUtility.HtmlEncode(description.Value));

        //Insert data into database
        insertPost.CommandText = "insert into [Post] ([BusinessID],[PostType], [Title], [PostDate], [PostDescription], [LastUpdatedBy], [LastUpdated])" +
            "values (@busID, @type, @title, @postDate, @description, @lastUpdatedBy, @lastUpdated)";

        insertPost.Parameters.Add(new SqlParameter("busID", posting.getBusID()));
        insertPost.Parameters.Add(new SqlParameter("type", posting.getType()));
        insertPost.Parameters.Add(new SqlParameter("title", posting.getTitle()));
        insertPost.Parameters.Add(new SqlParameter("postDate", posting.getPostDate()));
        insertPost.Parameters.Add(new SqlParameter("description", posting.getDescription()));        
        insertPost.Parameters.Add(new SqlParameter("lastUpdatedBy", posting.getLastUpdatedBy()));
        insertPost.Parameters.Add(new SqlParameter("lastUpdated", posting.getLastUpdated()));

        insertPost.ExecuteNonQuery();

        //Find post ID just created
        selectPostID.CommandText = "select max(postID) from Post";
        string postID = selectPostID.ExecuteScalar().ToString();

        //Find basis value
        string selected;
        if (yearly.Checked == true)
        {
            selected = yearly.Value;
        }

        else
        {
            selected = hourly.Value;
        }


        //Create Job object
        Job job = new Job(postID, HttpUtility.HtmlEncode(department.Value), HttpUtility.HtmlEncode(reqs.Value), HttpUtility.HtmlEncode(deadline.Value), HttpUtility.HtmlEncode(salary.Value), HttpUtility.HtmlEncode(respons.Value), HttpUtility.HtmlEncode(selected), HttpUtility.HtmlEncode(location.Value), HttpUtility.HtmlEncode(ADayInTheLife.Value));

        insertJob.CommandText = "insert into [Job] values (@postID, @department, @requirements, @dueDate, @salary, @resp, @payType, @location, @ADayInTheLife, @lastUpdatedBy, @lastUpdated)";

        insertJob.Parameters.Add(new SqlParameter("postID", job.getpostID()));
        insertJob.Parameters.Add(new SqlParameter("department", job.getDepartment()));
        insertJob.Parameters.Add(new SqlParameter("requirements", job.getReqs()));
        insertJob.Parameters.Add(new SqlParameter("dueDate", job.getDueDate()));
        insertJob.Parameters.Add(new SqlParameter("salary", job.getSalary()));
        insertJob.Parameters.Add(new SqlParameter("resp", job.getResponsibilities()));
        insertJob.Parameters.Add(new SqlParameter("payType", job.getPayType()));
        insertJob.Parameters.Add(new SqlParameter("location", job.getLocation()));
        insertJob.Parameters.Add(new SqlParameter("ADayInTheLife", job.getADay()));
        insertJob.Parameters.Add(new SqlParameter("lastUpdatedBy", job.getLastUpdatedBy()));
        insertJob.Parameters.Add(new SqlParameter("lastUpdated", job.getLastUpdated()));

        insertJob.ExecuteNonQuery();

        localDB.Close();

        showData();

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
            txtEditTitle.Value = getTitle.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
            getDescription.Parameters.AddWithValue("id", id.Text);
            txtEditDescription.Value = getDescription.ExecuteScalar().ToString();

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
            txtEditTitle.Value = "";
            txtEditDescription.Value = "";
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
            selected = yearly.Value;
        }

        else
        {
            selected = hourly.Value;
        }

        //create post object
        Post posting = new Post(1, "Job", HttpUtility.HtmlEncode(txtEditTitle.Value), HttpUtility.HtmlEncode(txtEditDescription.Value));

        //insert into database
        localDB.Open();
        System.Data.SqlClient.SqlCommand editPost = new System.Data.SqlClient.SqlCommand();
        editPost.Connection = localDB;
        editPost.CommandText = "Update Post set Title = @title, PostDescription = @description where PostID = @id";
        editPost.Parameters.AddWithValue("id", id.Text);
        editPost.Parameters.AddWithValue("title", posting.getTitle());
        editPost.Parameters.AddWithValue("description", posting.getDescription());
        editPost.ExecuteNonQuery();

        Job job = new Job(id.Text, HttpUtility.HtmlEncode(txtEditDepartment.Value), HttpUtility.HtmlEncode(txtEditRequirements.Value), HttpUtility.HtmlEncode(txtEditDeadline.Value), HttpUtility.HtmlEncode(txtEditSalary.Value), HttpUtility.HtmlEncode(txtEditResponsibilities.Value), HttpUtility.HtmlEncode(selected), HttpUtility.HtmlEncode(txtEditLocation.Value), HttpUtility.HtmlEncode(txtADay.Value));


        System.Data.SqlClient.SqlCommand editjob = new System.Data.SqlClient.SqlCommand();
        editjob.Connection = localDB;
        editjob.CommandText = "Update Job set Department = @department, Requirements = @requirements, responsibilities = @responsibilities, DueDate = @duedate, Salary = @Salary, PayType = @paytype, JobAddress = @location, ADayInTheLife = @ADay where PostID = @id";
        editjob.Parameters.AddWithValue("id", id.Text);
        editjob.Parameters.AddWithValue("department", job.getDepartment());
        editjob.Parameters.AddWithValue("requirements", job.getReqs());
        editjob.Parameters.AddWithValue("responsibilities", job.getResponsibilities());
        editjob.Parameters.AddWithValue("duedate", job.getDueDate());
        editjob.Parameters.AddWithValue("salary", job.getSalary());
        editjob.Parameters.AddWithValue("paytype", job.getPayType());
        editjob.Parameters.AddWithValue("location", job.getLocation());
        editjob.Parameters.AddWithValue("ADay", job.getADay());

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