using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Threading;

public partial class NewMessage : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView1.SelectedRow;
        mainViewContactSchool.InnerText = row.Cells[1].Text;
        mainViewContactName.InnerText = "Speaking with: " + row.Cells[2].Text;


        GridView1.SelectedRowStyle.CssClass = "bg-primary text-white";
        GridView1.DataBind();


    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView2.SelectedRow;
        mainViewContactSchool.InnerText = row.Cells[1].Text;
        mainViewContactName.InnerText = "Speaking with: " + row.Cells[2].Text;
    }

    protected void sendBTN_Click(object sender, EventArgs e)
    {

        //Select the user to send message to
        int messageTo = Int32.Parse(GridView1.SelectedRow.Cells[2].Text);
        int messageFrom = 11;

        if (string.IsNullOrWhiteSpace(Server.HtmlEncode(messageBox.Value)))
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Enter Message'); ", true);
            return;
        }

        localDB.Open();
        Message newMessage = new Message(messageTo, messageFrom, HttpUtility.HtmlEncode(messageBox.Value), 0, DateTime.Now);

        //Insert data into database
        System.Data.SqlClient.SqlCommand insertMessage = new System.Data.SqlClient.SqlCommand();
        insertMessage.Connection = localDB;
        insertMessage.CommandText = "Execute InsertMessage @to, @from, @body, @hasSeen, @lastUpdated";

        insertMessage.Parameters.Add("@to", SqlDbType.Int).Value = newMessage.getToID();
        insertMessage.Parameters.Add("@from", SqlDbType.Int).Value = newMessage.getFromID();
        insertMessage.Parameters.Add("@body", SqlDbType.VarChar, 100).Value = newMessage.getBody();
        insertMessage.Parameters.Add("@hasSeen", SqlDbType.Int).Value = newMessage.getHasSeen();
        insertMessage.Parameters.Add("@lastUpdated", SqlDbType.Date).Value = newMessage.getLastUpdated();


        insertMessage.ExecuteNonQuery();

        messageBox.Value = "";


    }

    protected void Message_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[1].Text.Equals(16))
            {
                e.Row.Cells[1].CssClass = "bg-primary text-white";

            }
            else 
            {
                e.Row.Cells[1].CssClass = "bg-secondary";
            }
        }

    }

}