using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Community2 : System.Web.UI.Page
{
    // Declare Connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);
    //create gridview datatables
    SqlDataAdapter da;
    DataTable dt;
    SqlDataAdapter da2;
    DataTable dt2;
    SqlDataAdapter da3;
    DataTable dt3;

    System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();

    //Declare static id variable
    static Label id;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //update all the gridviews
            showData();
        }
        if (Session["UserName"] == null || HttpContext.Current.Request.UrlReferrer == null)
        {
            Response.Redirect("Login.aspx");
        }
    }



    ////update gridview
    protected void showData()
    {
        try
        {


            localDB.Open();
            dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where(PostType like 'Event') and BusinessID = 1", localDB);
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }

            dt2 = new DataTable();
            SqlCommand cmd2 = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID > 1", localDB);
            da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            localDB.Close();
            if (dt2.Rows.Count > 0)
            {
                GridView2.DataSource = dt2;
                GridView2.DataBind();
            }

            localDB.Open();
            dt3 = new DataTable();
            SqlCommand cmd3 = new SqlCommand("SELECT * FROM DeleteEvent LEFT JOIN DeletePost ON DeleteEvent.PostID = DeletePost.PostID where BusinessID = 1", localDB);
            da3 = new SqlDataAdapter(cmd3);
            da3.Fill(dt3);
            if (dt3.Rows.Count > 0)
            {
                GridView3.DataSource = dt3;
                GridView3.DataBind();

            }
        }
        catch
        {

        }
    }

    //filter by date
    protected void filterByDate(object sender, EventArgs e)
    {
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID = 1 ORDER BY startdate", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID > 1 ORDER BY startdate", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt2.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM DeleteEvent LEFT JOIN DeletePost ON DeleteEvent.PostID = DeletePost.PostID where BusinessID = 1 ORDER BY startdate", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
        }
    }


    //filter alphabetically
    protected void filterAlphabetically(object sender, EventArgs e)
    {
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID = 1 ORDER BY title", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID > 1 ORDER BY title", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt2.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM DeleteEvent LEFT JOIN DeletePost ON DeleteEvent.PostID = DeletePost.PostID where BusinessID = 1 ORDER BY title", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
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
        if (e.CommandName == "Read")
        {
            localDB.Open();
            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Update Event set Opened = ' ' where PostID = @id";
            getTitle.Parameters.AddWithValue("id", id.Text);
            getTitle.ExecuteNonQuery();     
            localDB.Close();
            showData();
            Response.Redirect(Request.RawUrl);
        }


    }

    //Row commands for gridview 3
    protected void GridView3_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridView3.Rows[index];
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
            builder.Append("<script language=JavaScript> ShowRe(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowRe", builder.ToString());
        }
    }

        //open Create popup
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

    //Create New Event Post
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        
        
        //Convert Date Formats
        DateTime start = DateTime.Parse(startdate.Value);
        startdate.Value = start.ToString("MM/dd/yyyy");

        try
        {
            DateTime end = DateTime.Parse(enddate.Value);
            enddate.Value = start.ToString("MM/dd/yyyy");
        }
        catch
        {

        }

        DateTime timeStart = DateTime.Parse(starttime.Value);
        starttime.Value = timeStart.ToString("hh:mm tt");

        try
        {
            DateTime timeEnd = DateTime.Parse(endtime.Value);
        endtime.Value = timeEnd.ToString("hh:mm tt");
        }
        catch
        {

        }

        if ((title.Value == "") || (startdate.Value == "") || (starttime.Value == "") || (location.Value == ""))
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<script language=JavaScript> ShowCreate(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowCreate", builder.ToString());
            lblError.Text = "Please enter all required values.";

        }
        else
        {

            localDB.Open();

            //Creates a new sql insert command
            System.Data.SqlClient.SqlCommand insertPost = new System.Data.SqlClient.SqlCommand();
            insertPost.Connection = localDB;

            System.Data.SqlClient.SqlCommand selectPostID = new System.Data.SqlClient.SqlCommand();
            selectPostID.Connection = localDB;

            System.Data.SqlClient.SqlCommand insertEvent = new System.Data.SqlClient.SqlCommand();
            insertEvent.Connection = localDB;
          

            //Create Post object
            Post posting = new Post(1, "Event", HttpUtility.HtmlEncode(title.Value), HttpUtility.HtmlEncode(eventdescription.Value));

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

            //try
            //{

            //    DateTime start = DateTime.Parse(startdate.Value);
            //    startdate.Value = start.ToString("MM/DD/YYYY");

            //    DateTime end = DateTime.Parse(enddate.Value);
            //    enddate.Value = end.ToString("MM/DD/YYYY");
            //}
            //catch
            //{

            //}

            //Local Event object
            Event events = new Event(postID, HttpUtility.HtmlEncode(location.Value), HttpUtility.HtmlEncode(startdate.Value), HttpUtility.HtmlEncode(enddate.Value), HttpUtility.HtmlEncode(starttime.Value), HttpUtility.HtmlEncode(endtime.Value));

            insertEvent.CommandText = "Execute InsertEvent @PostID, @EventAddress, @StartDate, @EndDate, @StartTime, @EndTime, @LastUpdatedBy, @LastUpdated";

            insertEvent.Parameters.Add("@PostID", SqlDbType.Int).Value = HttpUtility.HtmlEncode(events.getPostingID());
            insertEvent.Parameters.Add("@EventAddress", SqlDbType.VarChar, 100).Value = HttpUtility.HtmlEncode(events.getLocation());
            insertEvent.Parameters.Add("@StartDate", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getStartDate());
            insertEvent.Parameters.Add("@EndDate", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getEndDate());
            insertEvent.Parameters.Add("@StartTime", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getStartTime());
            insertEvent.Parameters.Add("@EndTime", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getEndTime());
            insertEvent.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 50).Value = HttpUtility.HtmlEncode(events.getLastUpdatedBy());
            insertEvent.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getLastUpdated());
            insertEvent.ExecuteNonQuery();

            localDB.Close();

            showData();

            title.Value = "";
            eventdescription.Value = "";
            location.Value = "";
            starttime.Value = "";
            endtime.Value = "";
            startdate.Value = "";
            enddate.Value = "";          
        }
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
            Label11.InnerText = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select startdate From Event where PostID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id.Text);
            Label7.InnerText = getResponsibilities.ExecuteScalar().ToString();


            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select enddate From event where PostID = @id";
            getQualifications.Parameters.AddWithValue("id", id.Text);
            Label8.InnerText = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select starttime From Event where PostID = @id";
            getDepartment.Parameters.AddWithValue("id", id.Text);
            Label5.InnerText = getDepartment.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getLocation = new System.Data.SqlClient.SqlCommand();
            getLocation.Connection = localDB;
            getLocation.CommandText = "Select endtime From Event where PostID = @id";
            getLocation.Parameters.AddWithValue("id", id.Text);
            Label6.InnerText = getLocation.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getSalary = new System.Data.SqlClient.SqlCommand();
            getSalary.Connection = localDB;
            getSalary.CommandText = "Select eventaddress From Event where PostID = @id";
            getSalary.Parameters.AddWithValue("id", id.Text);
            Label9.InnerText = getSalary.ExecuteScalar().ToString();

            localDB.Close();
        }
        catch
        {

        }

    }

    //Load Edit Modal
    protected void LoadEdit()
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

        System.Data.SqlClient.SqlCommand getstartdate = new System.Data.SqlClient.SqlCommand();
        getstartdate.Connection = localDB;
        getstartdate.CommandText = "Select startdate From Event where PostID = @id";
        getstartdate.Parameters.AddWithValue("id", id.Text);
        string str = getstartdate.ExecuteScalar().ToString();
        DateTime dt = new DateTime();
        dt = Convert.ToDateTime(str);
        txtEditStartDate.Value = dt.ToString("yyyy-MM-dd");
       
        
        System.Data.SqlClient.SqlCommand getenddate = new System.Data.SqlClient.SqlCommand();
        getenddate.Connection = localDB;
        getenddate.CommandText = "Select enddate From Event where PostID = @id";
        getenddate.Parameters.AddWithValue("id", id.Text);
        string str2 = getenddate.ExecuteScalar().ToString();
        if (str2 != "")
        {
            DateTime dt2 = new DateTime();
            dt2 = Convert.ToDateTime(str2);
            txtEditEndDate.Value = dt2.ToString("yyyy-MM-dd");
        }


        System.Data.SqlClient.SqlCommand getstarttime = new System.Data.SqlClient.SqlCommand();
        getstarttime.Connection = localDB;
        getstarttime.CommandText = "Select starttime From Event where PostID = @id";
        getstarttime.Parameters.AddWithValue("id", id.Text);
        string str3 = getstarttime.ExecuteScalar().ToString();
        DateTime dt3 = new DateTime();
        dt3 = Convert.ToDateTime(str3);
        txtEditStartTime.Value = dt3.ToString("hh:mm");

        System.Data.SqlClient.SqlCommand getendtime = new System.Data.SqlClient.SqlCommand();
        getendtime.Connection = localDB;
        getendtime.CommandText = "Select endtime From Event where PostID = @id";
        getendtime.Parameters.AddWithValue("id", id.Text);
        string str4 = getendtime.ExecuteScalar().ToString();
        if (str2 != "")
        {
            DateTime dt4 = new DateTime();
            dt4 = Convert.ToDateTime(str4);
            txtEditEndTime.Value = dt4.ToString("hh:mm");
        }

        System.Data.SqlClient.SqlCommand getlocation = new System.Data.SqlClient.SqlCommand();
        getlocation.Connection = localDB;
        getlocation.CommandText = "Select eventaddress From Event where PostID = @id";
        getlocation.Parameters.AddWithValue("id", id.Text);
        txtEditLocation.Value = getlocation.ExecuteScalar().ToString();

        localDB.Close();

    }

    //save edits to post
    protected void SaveEdit_Click(object sender, EventArgs e)
    {


        //Convert Date Formats
        DateTime start = DateTime.Parse(txtEditStartDate.Value);
        txtEditStartDate.Value = start.ToString("MM/dd/yyyy");

        DateTime end = DateTime.Parse(txtEditEndDate.Value);
        txtEditEndDate.Value = start.ToString("MM/dd/yyyy");

        DateTime timeStart = DateTime.Parse(txtEditStartTime.Value);
        txtEditStartTime.Value = timeStart.ToString("hh:mm tt");

        DateTime timeEnd = DateTime.Parse(txtEditEndTime.Value);
        txtEditEndTime.Value = timeEnd.ToString("hh:mm tt");

        if ((txtEditTitle.Value == "") || (txtEditStartDate.Value == "") || (txtEditStartTime.Value == "") || (txtEditLocation.Value == ""))
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<script language=JavaScript> ShowEdit(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowEdit", builder.ToString());
            lblEditError.Text = "Please enter all required values.";

        }
        else
        {
            //create post object
            Post posting = new Post(1, "Event", HttpUtility.HtmlEncode(txtEditTitle.Value), HttpUtility.HtmlEncode(txtEditDescription.Value));

            //insert into database
            localDB.Open();
            System.Data.SqlClient.SqlCommand editPost = new System.Data.SqlClient.SqlCommand();
            editPost.Connection = localDB;
            editPost.CommandText = "Execute EditPost @id, @title, @postDate, @description, @LastUpdatedBy, @LastUpdated";
            editPost.Parameters.Add("@id", SqlDbType.Int).Value = id.Text;
            editPost.Parameters.Add("@title", SqlDbType.VarChar, 100).Value = posting.getTitle();
            editPost.Parameters.Add("@postDate", SqlDbType.VarChar, 30).Value = posting.getPostDate();
            editPost.Parameters.Add("@description", SqlDbType.VarChar, 100).Value = posting.getDescription();
            editPost.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = posting.getLastUpdatedBy();
            editPost.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = posting.getLastUpdated();
            editPost.ExecuteNonQuery();

            //try
            //{
            //    DateTime start = DateTime.Parse(txtEditStartDate.Value);
            //    startdate.Value = start.ToString("MM/DD/YYYY");

            //    DateTime end = DateTime.Parse(txtEditEndDate.Value);
            //    enddate.Value = end.ToString("MM/DD/YYYY");
            //}
            //catch
            //{

            //}

            Event events = new Event(id.Text, HttpUtility.HtmlEncode(txtEditLocation.Value), HttpUtility.HtmlEncode(txtEditStartDate.Value), HttpUtility.HtmlEncode(txtEditEndDate.Value), HttpUtility.HtmlEncode(txtEditStartTime.Value), HttpUtility.HtmlEncode(txtEditEndTime.Value));

            System.Data.SqlClient.SqlCommand editevent = new System.Data.SqlClient.SqlCommand();
            editevent.Connection = localDB;
            editevent.CommandText = "Execute EditEvent @PostID,@EventAddress, @StartDate, @EndDate, @StartTime, @EndTime,@LastUpdatedBy,@LastUpdated";
            editevent.Parameters.Add("@PostID", SqlDbType.Int).Value = events.getPostingID();
            editevent.Parameters.Add("@EventAddress", SqlDbType.VarChar, 100).Value = events.getLocation();
            editevent.Parameters.Add("@StartDate", SqlDbType.VarChar, 30).Value = events.getStartDate();
            editevent.Parameters.Add("@EndDate", SqlDbType.VarChar, 30).Value = events.getEndDate();
            editevent.Parameters.Add("@StartTime", SqlDbType.VarChar, 30).Value = events.getStartTime();
            editevent.Parameters.Add("@EndTime", SqlDbType.VarChar, 30).Value = events.getEndTime();
            editevent.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = events.getLastUpdatedBy();
            editevent.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = events.getLastUpdated();
            editevent.ExecuteNonQuery();

            localDB.Close();

            showData();

            lblEditError.Text = "";
        }
    }

    //delete post
    protected void DeletePost_Click(object sender, EventArgs e)
    {
        localDB.Open();

        try
        {
            System.Data.SqlClient.SqlCommand deleteEvents = new System.Data.SqlClient.SqlCommand();
            deleteEvents.Connection = localDB;
            deleteEvents.CommandText = "DELETE FROM Event where PostID = @id";
            deleteEvents.Parameters.AddWithValue("id", id.Text);
            deleteEvents.ExecuteNonQuery();

            System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
            deletePost.Connection = localDB;
            deletePost.CommandText = "DELETE FROM Post where PostID = @id";
            deletePost.Parameters.AddWithValue("id", id.Text);
            deletePost.ExecuteNonQuery();

            localDB.Close();

        }
        catch
        {

        }
        showData();

    }

    protected void Reactivate_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
        deletePost.Connection = localDB;
        deletePost.CommandText = "DELETE FROM DeleteEvent where PostID = @id";
        deletePost.Parameters.AddWithValue("id", id.Text);
        deletePost.ExecuteNonQuery();

        System.Data.SqlClient.SqlCommand deleteJob = new System.Data.SqlClient.SqlCommand();
        deleteJob.Connection = localDB;
        deleteJob.CommandText = "DELETE FROM DeleteEvent where PostID = @id";
        deleteJob.Parameters.AddWithValue("id", id.Text);
        deleteJob.ExecuteNonQuery();

        localDB.Close();
        showData();
    }

}
