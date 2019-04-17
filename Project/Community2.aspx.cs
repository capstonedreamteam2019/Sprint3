using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Community2 : System.Web.UI.Page
// Declare Connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);
SqlDataAdapter da;
DataTable dt;

System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();

static string id = "1";

protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        localDB.Open();
        System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();
        getLow.Connection = localDB;
        getLow.CommandText = "Select min(PostID) From Post where PostType Like 'Event'";
        id = getLow.ExecuteScalar().ToString();
        localDB.Close();

        showFirstGridview();
        showSecondGridviewData();
        LoadPreview();
    }
}



////update gridview
protected void showData()
{

    localDB.Open();
    dt = new DataTable();
    SqlCommand cmd = new SqlCommand("SELECT * FROM Event LEFT JOIN Post ON Event.PostID = Post.PostID where(PostType like 'Event')", localDB);
    da = new SqlDataAdapter(cmd);
    da.Fill(dt);
    localDB.Close();
    if (dt.Rows.Count > 0)
    {
        GridView1.DataSource = dt;
        GridView1.DataBind();
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

//Create New Event Post
protected void EventButton_Click(object sender, EventArgs e)
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

    selectPostID.CommandText = "select max(postID) from Post";
    string postID = selectPostID.ExecuteScalar().ToString();
    selectPostID.ExecuteNonQuery();

    //Local Event object
    Post posting = new Post("Event", title.Value, DateTime.Now, HttpUtility.HtmlEncode(eventdescription.Value), 1, "LeaRios", DateTime.Now);


    //Insert into database
    // insertPost.CommandText = "insert into [Post] ([PostType], [Title], [PostDate], [PostDescription], [BusinessID], [LastUpdatedBy], [LastUpdated])" +
    // "values (@type, @title, @postDate, @description, @busID, @lastUpdatedBy, @lastUpdated)";

    //insertPost.Parameters.Add(new SqlParameter("type", posting.getType()));
    //insertPost.Parameters.Add(new SqlParameter("title", posting.getTitle()));
    //insertPost.Parameters.Add(new SqlParameter("postDate", posting.getPostDate()));
    //insertPost.Parameters.Add(new SqlParameter("description", posting.getDescription()));
    //insertPost.Parameters.Add(new SqlParameter("busID", posting.getBusID()));
    //insertPost.Parameters.Add(new SqlParameter("lastUpdatedBy", posting.getLastUpdatedBy()));
    //insertPost.Parameters.Add(new SqlParameter("lastUpdated", posting.getLastUpdated()));

    //insertPost.ExecuteNonQuery();

    insertPost.CommandText = "Execute InsertPost @BusinessID, @PostType, @Title,@PostDate,@PostDescription,@LastUpdatedBy,@LastUpdated";
    insertPost.Parameters.Add("@BusinessID", SqlDbType.Int).Value = posting.getBusID();
    insertPost.Parameters.Add("@PostType", SqlDbType.VarChar, 30).Value = "Event";
    insertPost.Parameters.Add("@Title", SqlDbType.VarChar, 100).Value = HttpUtility.HtmlEncode(posting.getTitle());
    insertPost.Parameters.Add("@PostDate", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(posting.getPostDate());
    insertPost.Parameters.Add("@PostDescription", SqlDbType.VarChar, 500).Value = HttpUtility.HtmlEncode(posting.getDescription());
    insertPost.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 50).Value = HttpUtility.HtmlEncode(posting.getLastUpdatedBy());
    insertPost.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(posting.getLastUpdated());

    insertPost.ExecuteNonQuery();
    //Local Event object
    Event events = new Event(postID, HttpUtility.HtmlEncode(location.Value), HttpUtility.HtmlEncode(startdate.Value), HttpUtility.HtmlEncode(enddate.Value), HttpUtility.HtmlEncode(starttime.Value), HttpUtility.HtmlEncode(endtime.Value), "LeaRios", DateTime.Now);

    //  insertEvent.CommandText = "insert into [Event] values (@postID, @location, @startdate, @enddate, @starttime, @endtime, @lastUpdatedBy, @lastUpdated)";

    //insertEvent.Parameters.Add(new SqlParameter("postID", events.getPostingID()));
    //insertEvent.Parameters.Add(new SqlParameter("location", events.getLocation()));
    //insertEvent.Parameters.Add(new SqlParameter("startdate", events.getStartDate()));
    //insertEvent.Parameters.Add(new SqlParameter("enddate", events.getEndDate()));
    //insertEvent.Parameters.Add(new SqlParameter("starttime", events.getStartTime()));
    //insertEvent.Parameters.Add(new SqlParameter("endtime", events.getEndTime()));
    //insertEvent.Parameters.Add(new SqlParameter("lastUpdatedBy", events.getLastUpdatedBy()));
    //insertEvent.Parameters.Add(new SqlParameter("lastUpdated", events.getLastUpdated()));

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


}

//Load Preview Modal
protected void LoadPreview()
{
    localDB.Open();

    System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
    getTitle.Connection = localDB;
    getTitle.CommandText = "Select Title From Post where PostID = @id";
    getTitle.Parameters.AddWithValue("id", id);
    Label1.InnerText = getTitle.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
    getDescription.Connection = localDB;
    getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
    getDescription.Parameters.AddWithValue("id", id);
    Label11.InnerText = getDescription.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
    getResponsibilities.Connection = localDB;
    getResponsibilities.CommandText = "Select startdate From Event where PostID = @id";
    getResponsibilities.Parameters.AddWithValue("id", id);
    Label7.InnerText = getResponsibilities.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
    getQualifications.Connection = localDB;
    getQualifications.CommandText = "Select enddate From event where PostID = @id";
    getQualifications.Parameters.AddWithValue("id", id);
    Label8.InnerText = getQualifications.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
    getDepartment.Connection = localDB;
    getDepartment.CommandText = "Select starttime From Event where PostID = @id";
    getDepartment.Parameters.AddWithValue("id", id);
    Label5.InnerText = getDepartment.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getLocation = new System.Data.SqlClient.SqlCommand();
    getLocation.Connection = localDB;
    getLocation.CommandText = "Select endtime From Event where PostID = @id";
    getLocation.Parameters.AddWithValue("id", id);
    Label6.InnerText = getLocation.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getSalary = new System.Data.SqlClient.SqlCommand();
    getSalary.Connection = localDB;
    getSalary.CommandText = "Select eventaddress From Event where PostID = @id";
    getSalary.Parameters.AddWithValue("id", id);
    Label9.InnerText = getSalary.ExecuteScalar().ToString();

    localDB.Close();

}

//Load Edit Modal
protected void LoadEdit()
{
    localDB.Open();

    System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
    getTitle.Connection = localDB;
    getTitle.CommandText = "Select Title From Post where PostID = @id";
    getTitle.Parameters.AddWithValue("id", id);
    txtEditTitle.Value = getTitle.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
    getDescription.Connection = localDB;
    getDescription.CommandText = "Select PostDescription From Post where PostID = @id";
    getDescription.Parameters.AddWithValue("id", id);
    txtEditDescription.Value = getDescription.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getstartdate = new System.Data.SqlClient.SqlCommand();
    getstartdate.Connection = localDB;
    getstartdate.CommandText = "Select startdate From Event where PostID = @id";
    getstartdate.Parameters.AddWithValue("id", id);
    txtEditStartDate.Value = getstartdate.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getenddate = new System.Data.SqlClient.SqlCommand();
    getenddate.Connection = localDB;
    getenddate.CommandText = "Select enddate From Event where PostID = @id";
    getenddate.Parameters.AddWithValue("id", id);
    txtEditEndDate.Value = getenddate.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getstarttime = new System.Data.SqlClient.SqlCommand();
    getstarttime.Connection = localDB;
    getstarttime.CommandText = "Select starttime From Event where PostID = @id";
    getstarttime.Parameters.AddWithValue("id", id);
    txtEditStartTime.Value = getstarttime.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getendtime = new System.Data.SqlClient.SqlCommand();
    getendtime.Connection = localDB;
    getendtime.CommandText = "Select endtime From Event where PostID = @id";
    getendtime.Parameters.AddWithValue("id", id);
    txtEditEndTime.Value = getendtime.ExecuteScalar().ToString();

    System.Data.SqlClient.SqlCommand getlocation = new System.Data.SqlClient.SqlCommand();
    getlocation.Connection = localDB;
    getlocation.CommandText = "Select eventaddress From Event where PostID = @id";
    getlocation.Parameters.AddWithValue("id", id);
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
    editPost.Parameters.Add("@PostID", SqlDbType.Int).Value = id;
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
    editevent.Parameters.Add("@PostID", SqlDbType.Int).Value = id;
    editevent.Parameters.Add("@EventAddress", SqlDbType.VarChar, 100).Value = (txtEditLocation.Value);
    editevent.Parameters.Add("@StartDate", SqlDbType.VarChar, 30).Value = (txtEditStartDate.Value);
    editevent.Parameters.Add("@EndDate", SqlDbType.VarChar, 30).Value = (txtEditEndDate.Value);
    editevent.Parameters.Add("@StartTime", SqlDbType.VarChar, 30).Value = (txtEditStartTime.Value);
    editevent.Parameters.Add("@EndTime", SqlDbType.VarChar, 30).Value = (txtEditEndTime.Value);
    editevent.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 30).Value = "LeaRios";
    editevent.Parameters.Add("@LastUpdated", SqlDbType.Date).Value = DateTime.Today;
    editevent.ExecuteNonQuery();

    /*
    editPost.CommandText = "UPDATE Post SET Title = @title, PostDescription = @description where PostID = @id;";
    editPost.Parameters.AddWithValue("id", id);
    editPost.Parameters.AddWithValue("title", HttpUtility.HtmlEncode(txtEditTitle.Value));
    editPost.Parameters.AddWithValue("description", HttpUtility.HtmlEncode(txtEditDescription.Value));
    editPost.ExecuteNonQuery();

    System.Data.SqlClient.SqlCommand editevent = new System.Data.SqlClient.SqlCommand();
    editevent.Connection = localDB;
    editevent.CommandText = "Update Event set eventAddress = @eventaddress, startDate = @startdate, endDate = @enddate, startTime = @starttime, endTime = @endTime where PostID = @id";
    editevent.Parameters.AddWithValue("id", id);
    editevent.Parameters.AddWithValue("eventaddress", HttpUtility.HtmlEncode(txtEditLocation.Value));
    editevent.Parameters.AddWithValue("startdate", HttpUtility.HtmlEncode(txtEditStartDate.Value));
    editevent.Parameters.AddWithValue("enddate", HttpUtility.HtmlEncode(txtEditEndDate.Value));
    editevent.Parameters.AddWithValue("starttime", HttpUtility.HtmlEncode(txtEditStartTime.Value));
    editevent.Parameters.AddWithValue("endtime", HttpUtility.HtmlEncode(txtEditEndTime.Value));

    editevent.ExecuteNonQuery();
    */


    localDB.Close();

    showFirstGridview();
    showSecondGridviewData();
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
        deleteEvents.Parameters.AddWithValue("id", id);
        deleteEvents.ExecuteNonQuery();

    }
    catch
    {

    }

    System.Data.SqlClient.SqlCommand deleteEvent = new System.Data.SqlClient.SqlCommand();
    deleteEvent.Connection = localDB;
    deleteEvent.CommandText = "DELETE FROM Event where PostID = @id";
    deleteEvent.Parameters.AddWithValue("id", id);
    deleteEvent.ExecuteNonQuery();


    System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
    deletePost.Connection = localDB;
    deletePost.CommandText = "DELETE FROM Post where PostID = @id";
    deletePost.Parameters.AddWithValue("id", id);
    deletePost.ExecuteNonQuery();

    localDB.Close();
}

}