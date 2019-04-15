using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Calendar : System.Web.UI.Page
{
    System.Data.SqlClient.SqlCommand selectEvent = new System.Data.SqlClient.SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }

    private void Calendar1_DayRender(object sender, EventArgs e)
    {
        DataRow[] rows = socialEvents.Select(
                   String.Format(
                      "Date >= #{0}# AND Date < #{1}#",
                      e.Day.Date.ToShortDateString(),
                      e.Day.Date.AddDays(1).ToShortDateString()
                   )
                );

        foreach (DataRow row in rows)
        {
            System.Web.UI.WebControls.Image image;
            image = new System.Web.UI.WebControls.Image();
            image.ToolTip = row["Description"].ToString();
            e.Cell.BackColor = Color.Wheat;
        }

    }

    protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
    {

    }
}