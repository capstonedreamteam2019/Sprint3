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

public partial class CommunityEngagement : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);
    DataTable socialEvents = new DataTable();

    System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();

    static string id = "1";

    protected void Page_Load(object sender, EventArgs e)
    {

        Calendar1.SelectedDate = DateTime.Now;
        BuildSocialEventTable();

        if (!IsPostBack)
        {
            localDB.Open();
            System.Data.SqlClient.SqlCommand getLow = new System.Data.SqlClient.SqlCommand();
            getLow.Connection = localDB;
            getLow.CommandText = "Select min(PostID) From Post where PostType Like 'Event'";
            id = getLow.ExecuteScalar().ToString();
            localDB.Close();

        }

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


        //Local Event object
        DateTime start = DateTime.Parse(startdate.Value);
        DateTime end = DateTime.Parse(enddate.Value);
        Event events = new Event(postID, HttpUtility.HtmlEncode(location.Value), start, end, HttpUtility.HtmlEncode(starttime.Value), HttpUtility.HtmlEncode(endtime.Value), "LeaRios", DateTime.Now);


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

