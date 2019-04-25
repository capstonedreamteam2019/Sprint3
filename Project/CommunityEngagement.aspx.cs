using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Drawing;
using System.Text;

public partial class CommunityEngagement : System.Web.UI.Page
{

    //New connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);
    DataTable socialEvents = new DataTable();

    System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();

    static string id = "1";

    protected void Page_Load(object sender, EventArgs e)
    {

        Calendar1.SelectedDate = DateTime.Now;
        OnInit(e);
        BuildSocialEventTable();

        if (!IsPostBack)
        {
            localDB.Open();
            System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();
            getLow.Connection = localDB;
            getLow.CommandText = "Select min(PostID) From Post where PostType Like 'Event'";
            id = getLow.ExecuteScalar().ToString();
            localDB.Close();
            BuildSocialEventTable();

        }
        if (Session["UserName"] == null || HttpContext.Current.Request.UrlReferrer == null)
        {
            Response.Redirect("Login.aspx");
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


    private void BuildSocialEventTable()
    {

        localDB.Open();
        SqlDataAdapter sda = new SqlDataAdapter("SELECT startdate, enddate, concat(ltrim(right(convert(varchar(25), starttime, 100), 7)), ' - ', ltrim(right(convert(varchar(25), endtime, 100), 7))) as 'Event Time:', Eventaddress as 'Address:', Title as 'Event Title:', postDescription as 'Event Description:' from event e inner join post p on e.postid=p.postid", localDB);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        socialEvents = ds.Tables[0];

        localDB.Close();
    }

    protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
    {
        System.Data.DataView view = socialEvents.DefaultView;
        view.RowFilter = String.Format(
                        "startdate >= #{0}# AND startdate< #{1}#",
                         Calendar1.SelectedDate.ToShortDateString(),
                          Calendar1.SelectedDate.AddDays(1).ToShortDateString()
                       );

        if (view.Count > 0)
        {
            GridView1.Visible = true;
            GridView1.DataSource = view;
            GridView1.DataBind();
        }
        else
        {
            GridView1.Visible = false;
        }
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

        DataRow[] rows = socialEvents.Select(
                  String.Format(
                   "startdate >= #{0}# AND startdate < #{1}#",
                     e.Day.Date.ToShortDateString(),
                     e.Day.Date.AddDays(1).ToShortDateString()
                  )
               );

        foreach (DataRow row in rows)
        {

            System.Web.UI.WebControls.Image image;
            image = new System.Web.UI.WebControls.Image();
            image.ToolTip = row["Event Title:"].ToString();
            e.Cell.BackColor = Color.Wheat;
            break;
            
        }
        

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e);
    }

    private void InitializeComponent()
    {
        this.Calendar1.DayRender += new System.Web.UI.WebControls.DayRenderEventHandler(this.Calendar1_DayRender);
        this.Calendar1.SelectionChanged += new System.EventHandler(this.Calendar1_SelectionChanged1);
        this.Load += new System.EventHandler(this.Page_Load);

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

            //Local Event object
            Event events = new Event(postID, HttpUtility.HtmlEncode(location.Value), HttpUtility.HtmlEncode(startdate.Value), HttpUtility.HtmlEncode(enddate.Value), HttpUtility.HtmlEncode(starttime.Value), HttpUtility.HtmlEncode(endtime.Value));

            insertEvent.CommandText = "Execute InsertEvent @PostID, @EventAddress, @StartDate, @EndDate, @StartTime, @EndTime, @Opened, @LastUpdatedBy, @LastUpdated";

            insertEvent.Parameters.Add("@PostID", SqlDbType.Int).Value = HttpUtility.HtmlEncode(events.getPostingID());
            insertEvent.Parameters.Add("@EventAddress", SqlDbType.VarChar, 100).Value = HttpUtility.HtmlEncode(events.getLocation());
            insertEvent.Parameters.Add("@StartDate", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getStartDate());
            insertEvent.Parameters.Add("@EndDate", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getEndDate());
            insertEvent.Parameters.Add("@StartTime", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getStartTime());
            insertEvent.Parameters.Add("@EndTime", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getEndTime());
            insertEvent.Parameters.Add("@Opened", SqlDbType.VarChar, 30).Value = " ";
            insertEvent.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 50).Value = HttpUtility.HtmlEncode(events.getLastUpdatedBy());
            insertEvent.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(events.getLastUpdated());
            insertEvent.ExecuteNonQuery();

            localDB.Close();

            title.Value = "";
            eventdescription.Value = "";
            location.Value = "";
            starttime.Value = "";
            endtime.Value = "";
            startdate.Value = "";
            enddate.Value = "";
        }
    }

    protected void EventButton_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand insertPost = new System.Data.SqlClient.SqlCommand();
        insertPost.Connection = localDB;
        insertPost.CommandText = "Execute InsertPost @BusinessID, @PostType, @Title,@PostDate,@PostDescription,@LastUpdatedBy,@LastUpdated";

        //Local Event object
        Post posting = new Post(1, "Event", title.Value, HttpUtility.HtmlEncode(eventdescription.Value));

        insertPost.Parameters.Add("@BusinessID", SqlDbType.Int).Value = posting.getBusID();
        insertPost.Parameters.Add("@PostType", SqlDbType.VarChar, 30).Value = "Event";
        insertPost.Parameters.Add("@Title", SqlDbType.VarChar, 100).Value = HttpUtility.HtmlEncode(posting.getTitle());
        insertPost.Parameters.Add("@PostDate", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(posting.getPostDate());
        insertPost.Parameters.Add("@PostDescription", SqlDbType.VarChar, 500).Value = HttpUtility.HtmlEncode(posting.getDescription());
        insertPost.Parameters.Add("@LastUpdatedBy", SqlDbType.VarChar, 50).Value = HttpUtility.HtmlEncode(posting.getLastUpdatedBy());
        insertPost.Parameters.Add("@LastUpdated", SqlDbType.VarChar, 30).Value = HttpUtility.HtmlEncode(posting.getLastUpdated());

        insertPost.ExecuteNonQuery();


        System.Data.SqlClient.SqlCommand selectPostID = new System.Data.SqlClient.SqlCommand();
        selectPostID.Connection = localDB;
        selectPostID.CommandText = "Execute InsertEvent @PostID, @EventAddress, @StartDate,@EndDate,@StartTime,@EndTime,@LastUpdatedBy,@LastUpdated";


        selectPostID.CommandText = "select max(postID) from Post";
        string postID = selectPostID.ExecuteScalar().ToString();
        selectPostID.ExecuteNonQuery();

        //Convert Date Formats
        DateTime start = DateTime.Parse(startdate.Value);
        startdate.Value = start.ToString("MM/dd/yyyy");

        try
        {
            DateTime end = DateTime.Parse(enddate.Value);
            enddate.Value = start.ToString("MM/dd/yyyy");
        }
        catch
        { }
        

        DateTime timeStart = DateTime.Parse(starttime.Value);
        starttime.Value = timeStart.ToString("hh:mm tt");

        try
        {
            DateTime timeEnd = DateTime.Parse(endtime.Value);
            endtime.Value = timeEnd.ToString("hh:mm tt");
        }
        catch
        { }

        //Local Event object
        Event events = new Event(postID, HttpUtility.HtmlEncode(location.Value), startdate.Value, enddate.Value, HttpUtility.HtmlEncode(starttime.Value), HttpUtility.HtmlEncode(endtime.Value));


        System.Data.SqlClient.SqlCommand insertEvent = new System.Data.SqlClient.SqlCommand();
        insertEvent.Connection = localDB;
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

}
