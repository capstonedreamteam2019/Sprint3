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

public partial class CommunityEngagement : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        Calendar1.SelectedDate = DateTime.Now;


    }


    protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
    {
        
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        localDB.Open();

        //Select the event
        System.Data.SqlClient.SqlCommand selectEvent = new System.Data.SqlClient.SqlCommand();
        selectEvent.Connection = localDB;
        selectEvent.CommandText = "select startdate, title from event e inner join post p on e.postid = p.postid";
        string eventName = selectEvent.ExecuteScalar().ToString();

        //Select the date of the event
        System.Data.SqlClient.SqlCommand selectDate = new System.Data.SqlClient.SqlCommand();
        selectDate.Connection = localDB;
        selectDate.CommandText = "select day(max(startdate)) as dayofmonth from event";
        string eventDate = selectDate.ExecuteScalar().ToString();

        if (e.Day.DayNumberText == eventDate)

            e.Cell.Controls.Add(new LiteralControl("<p>" + eventDate + "</p>"));

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

        if (e.Day.DayNumberText == "22")
            {
                e.Cell.Controls.Add(new LiteralControl("<p><font style='background : teal;'>Your event</font></p>"));
                e.Cell.Controls.Add(new LiteralControl("<p><font style='background : orange;'>Community event</font></p>"));



            }
        localDB.Close();
    }
}