using System;
using System.Collections.Generic;
using System.Linq;
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

    protected void Page_Load(object sender, EventArgs e)
    {

        Calendar1.SelectedDate = DateTime.Now;
        BuildSocialEventTable();

    }

    private void BuildSocialEventTable()
    {
        
        localDB.Open();
        SqlDataAdapter sda = new SqlDataAdapter("select StartDate, Title FROM Event e inner join post p on e.postid = p.postid", localDB);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        socialEvents = ds.Tables[0];

        localDB.Close();
    }

    protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
    {
        System.Data.DataView view = socialEvents.DefaultView;
        view.RowFilter = String.Format(
                        "StartDate >= #{0}# AND StartDate < #{1}#",
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
        //localDB.Open();

        ////Select the event
        //System.Data.SqlClient.SqlCommand selectEvent = new System.Data.SqlClient.SqlCommand();
        //selectEvent.Connection = localDB;
        //selectEvent.CommandText = "select startdate from event e inner join post p on e.postid = p.postid";
        //string eventStart = selectEvent.ExecuteScalar().ToString();

        
        DataRow[] rows = socialEvents.Select(
                  String.Format(
                   "StartDate >= #{0}# AND StartDate < #{1}#",
                     e.Day.Date.ToShortDateString(),
                     e.Day.Date.AddDays(1).ToShortDateString()
                  )
               );

        foreach (DataRow row in rows)
        {
            System.Web.UI.WebControls.Image image;
            image = new System.Web.UI.WebControls.Image();
            image.ToolTip = row["Title"].ToString();
            e.Cell.BackColor = Color.Wheat;
        }

        ////Select the date of the event
        //System.Data.SqlClient.SqlCommand selectDate = new System.Data.SqlClient.SqlCommand();
        //selectDate.Connection = localDB;
        //selectDate.CommandText = "select day(max(startdate)) as dayofmonth from event";
        //string eventDate = selectDate.ExecuteScalar().ToString();

        //if (e.Day.DayNumberText == eventDate)

        //    e.Cell.Controls.Add(new LiteralControl("<p>" + eventDate + "</p>"));

        //using (SqlDataReader reader = selectDate.ExecuteReader())
        //{
        //    while (reader.Read())
        //    {

        //        for (int i = 0; i < reader.FieldCount; i++)
        //        {
        //            string date = reader.GetValue(i).ToString();
        //            if (e.Day.Date.ToString() == eventDate)
        //            {
        //                e.Cell.Controls.Add(new LiteralControl("<p>" + date + "</p>"));
        //            }

        //        }

        //    }
        //}

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
}