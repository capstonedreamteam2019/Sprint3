﻿using System;
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
    }



    ////update gridview
    protected void showData()
{
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where(PostType like 'Event') and BusinessID = 1", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
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
    }

//show your events gridview (first grid view)
protected void showFirstGridview()
{
    localDB.Open();
    dt = new DataTable();
    SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where(PostType like 'Event') and BusinessID = 1", localDB);
    da = new SqlDataAdapter(cmd);
    da.Fill(dt);
    localDB.Close();
    if (dt.Rows.Count > 0)
    {
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
}

//show local events grid view (second grid view)
protected void showSecondGridviewData()
{
    dt = new DataTable();
    SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID > 1", localDB);
    da = new SqlDataAdapter(cmd);
    da.Fill(dt);
    localDB.Close();
    if (dt.Rows.Count > 0)
    {
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

}

//filter by date local events
protected void filterByDateSecondGridview(object sender, EventArgs e)
{
    dt = new DataTable();
    SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID > 1 ORDER BY startdate", localDB);
    da = new SqlDataAdapter(cmd);
    da.Fill(dt);
    localDB.Close();
    if (dt.Rows.Count > 0)
    {
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    filterByDateFirstGridview();

}

//filter by date your events
protected void filterByDateFirstGridview()
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
}

//filter alphabetically local events
protected void filterAlphabeticallySecondGridview(object sender, EventArgs e)
{
    dt = new DataTable();
    SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where (PostType like 'Event') and BusinessID > 1 ORDER BY title", localDB);
    da = new SqlDataAdapter(cmd);
    da.Fill(dt);
    localDB.Close();
    if (dt.Rows.Count > 0)
    {
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    filterAlphabeticallyFirstGridview();

}

//filter alphabetically your events
protected void filterAlphabeticallyFirstGridview()
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
    }

    //open Create popup
    protected void openCreate(object sender, EventArgs e)
    {
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

    //Create New Event Post
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        //Insert
        localDB.Open();
        //Creates a new sql insert command
        System.Data.SqlClient.SqlCommand insertPost = new System.Data.SqlClient.SqlCommand();
        insertPost.Connection = localDB;

        System.Data.SqlClient.SqlCommand selectPostID = new System.Data.SqlClient.SqlCommand();
        selectPostID.Connection = localDB;

        System.Data.SqlClient.SqlCommand insertEvent = new System.Data.SqlClient.SqlCommand();
        insertEvent.Connection = localDB;

        //Local Event object
        Post posting = new Post(1, "Event", title.Value, HttpUtility.HtmlEncode(eventdescription.Value));

        insertPost.CommandText = "Execute InsertPost @BusinessID, @PostType, @Title,@PostDate,@PostDescription,@LastUpdatedBy,@LastUpdated";
        insertPost.Parameters.Add("@BusinessID", SqlDbType.Int).Value = posting.getBusID();
        insertPost.Parameters.Add("@PostType", SqlDbType.VarChar, 30).Value = "Event";
        insertPost.Parameters.Add("@Title", SqlDbType.VarChar, 100).Value = HttpUtility.HtmlEncode(posting.getTitle());
        insertPost.Parameters.Add("@PostDate", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(posting.getPostDate());
        insertPost.Parameters.Add("@PostDescription", SqlDbType.VarChar, 500).Value = HttpUtility.HtmlEncode(posting.getDescription());
        insertPost.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 50).Value = HttpUtility.HtmlEncode(posting.getLastUpdatedBy());
        insertPost.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(posting.getLastUpdated());
        insertPost.ExecuteNonQuery();

        selectPostID.CommandText = "select max(postID) from Post";
        string postID = selectPostID.ExecuteScalar().ToString();

        //Local Event object
        Event events = new Event(postID, HttpUtility.HtmlEncode(location.Value), HttpUtility.HtmlEncode(startdate.Value), HttpUtility.HtmlEncode(enddate.Value), HttpUtility.HtmlEncode(starttime.Value), HttpUtility.HtmlEncode(endtime.Value));

        insertEvent.CommandText = "Execute InsertEvent @PostID, @EventAddress, @StartDate,@EndDate,@StartTime,@EndTime,@LastUpdatedBy,@LastUpdated";

        insertEvent.Parameters.Add("@PostId", SqlDbType.Int).Value = HttpUtility.HtmlEncode(events.getPostingID());
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
    txtEditStartDate.Value = getstartdate.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getenddate = new System.Data.SqlClient.SqlCommand();
    getenddate.Connection = localDB;
    getenddate.CommandText = "Select enddate From Event where PostID = @id";
    getenddate.Parameters.AddWithValue("id", id.Text);
    txtEditEndDate.Value = getenddate.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getstarttime = new System.Data.SqlClient.SqlCommand();
    getstarttime.Connection = localDB;
    getstarttime.CommandText = "Select starttime From Event where PostID = @id";
    getstarttime.Parameters.AddWithValue("id", id.Text);
    txtEditStartTime.Value = getstarttime.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getendtime = new System.Data.SqlClient.SqlCommand();
    getendtime.Connection = localDB;
    getendtime.CommandText = "Select endtime From Event where PostID = @id";
    getendtime.Parameters.AddWithValue("id", id.Text);
    txtEditEndTime.Value = getendtime.ExecuteScalar().ToString();

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
    localDB.Open();
    System.Data.SqlClient.SqlCommand editPost = new System.Data.SqlClient.SqlCommand();
    editPost.Connection = localDB;

    editPost.CommandText = "Execute EditPost @PostID, @BusinessID, @PostType,@Title, @PostDate,@PostDescription,@LastUpdatedBy,@LastUpdated;";
    editPost.Parameters.Add("@PostID", SqlDbType.Int).Value = id.Text;
    editPost.Parameters.Add("@BusinessID", SqlDbType.Int).Value = 1;
    editPost.Parameters.Add("@PostType", SqlDbType.VarChar, 30).Value = "Event";
    editPost.Parameters.Add("@Title", SqlDbType.VarChar, 100).Value = (txtEditTitle.Value);
    editPost.Parameters.Add("@PostDate", SqlDbType.VarChar, 30).Value = "may2";
    editPost.Parameters.Add("@PostDescription", SqlDbType.VarChar, 500).Value = (txtEditDescription.Value);
    editPost.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = "LeaRios";
    editPost.Parameters.Add("@LastUpdated", SqlDbType.Date).Value = DateTime.Today;
    editPost.ExecuteNonQuery();


    System.Data.SqlClient.SqlCommand editevent = new System.Data.SqlClient.SqlCommand();
    editevent.Connection = localDB;
    editevent.CommandText = "Execute EditEvent @PostID,@EventAddress, @StartDate, @EndDate, @StartTime, @EndTime,@LastUpdatedBy,@LastUpdated";
    editevent.Parameters.Add("@PostID", SqlDbType.Int).Value = id.Text;
    editevent.Parameters.Add("@EventAddress", SqlDbType.VarChar, 100).Value = (txtEditLocation.Value);
    editevent.Parameters.Add("@StartDate", SqlDbType.VarChar, 30).Value = (txtEditStartDate.Value);
    editevent.Parameters.Add("@EndDate", SqlDbType.VarChar, 30).Value = (txtEditEndDate.Value);
    editevent.Parameters.Add("@StartTime", SqlDbType.VarChar, 30).Value = (txtEditStartTime.Value);
    editevent.Parameters.Add("@EndTime", SqlDbType.VarChar, 30).Value = (txtEditEndTime.Value);
    editevent.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = "LeaRios";
    editevent.Parameters.Add("@LastUpdated", SqlDbType.Date).Value = DateTime.Today;
    editevent.ExecuteNonQuery();

    localDB.Close();

        showData();
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

}
