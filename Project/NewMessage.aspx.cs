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
    static int index = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMessages();
        }

        GridView1.SelectedIndex = index;
        GridView1.SelectedRowStyle.CssClass = "bg-primary text-white";
        mainViewContactSchool.InnerText = GridView1.SelectedRow.Cells[1].Text;
        mainViewContactName.InnerText = GridView1.SelectedRow.Cells[3].Text;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView1.SelectedRow;
        mainViewContactSchool.InnerText = row.Cells[1].Text;
        mainViewContactName.InnerText = "Speaking with: " + row.Cells[3].Text;
        index = GridView1.SelectedRow.RowIndex;

        GridView1.SelectedRowStyle.CssClass = "bg-primary text-white";
        GridView1.DataBind();

        BindMessages();


    }

    //protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    GridViewRow row = GridView2.SelectedRow;
    //    mainViewContactSchool.InnerText = row.Cells[1].Text;
    //    mainViewContactName.InnerText = "Speaking with: " + row.Cells[2].Text;

    //}

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
        Message newMessage = new Message(messageTo, messageFrom, HttpUtility.HtmlEncode(messageBox.Value), ' ', DateTime.Now);

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
        
        GridView3.DataBind();
        BindMessages();
    }
    protected void BindMessages()
    {
        //1
        localDB.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("select s.schoolname as 'School:', u.userID, concat(substring(u.firstName, 1, 1), '. ', u.lastName) as 'Contact:', max(m.lastupdated) as 'Time' from school s inner join schoolEmployee se on s.schoolID = se.schoolID inner join users u on se.userID = u.userID inner join messages1 m on u.userID = m.messageToID group by messageToID, schoolname, u.userID, firstname, lastname order by max(m.lastupdated)", localDB);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        //Populate Gridview 3
        localDB.Open();
        DataTable dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("select messageToID, messageFromID, messagebody from messages1 where messagetoid=@to or messagefromid=@to order by messageid asc", localDB);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView3.DataSource = dt2;
            GridView3.DataBind();
        }
        

    }


    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;


        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[0].Text == GridView1.SelectedRow.Cells[2].Text)
            {
                e.Row.Cells[2].CssClass = "card-body overflow-auto card bg-primary text-white text-right";

            }
            else if (e.Row.Cells[1].Text == GridView1.SelectedRow.Cells[2].Text)
            {
                e.Row.Cells[2].CssClass = "card-body overflow-auto card bg-secondary";
            }
        }


    }

    protected void RecBTN_Click(object sender, EventArgs e)
    {
        messageBox.Value = "TEAM BRILLIATURE!!!! :)";

        int messageFrom = Int32.Parse(GridView1.SelectedRow.Cells[2].Text);
        int messageTo = 11;

        if (string.IsNullOrWhiteSpace(Server.HtmlEncode(messageBox.Value)))
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Enter Message'); ", true);
            return;
        }

        localDB.Open();
        Message newMessage = new Message(messageTo, messageFrom, HttpUtility.HtmlEncode(messageBox.Value), ' ', DateTime.Now);

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

        GridView3.DataBind();
        BindMessages();
    }

    protected void changeNotificiation_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand updateNotification = new System.Data.SqlClient.SqlCommand();
        updateNotification.Connection = localDB;
        updateNotification.CommandText = "Update Messages1 set hasSeen = ' '";

        updateNotification.ExecuteNonQuery();

        localDB.Close();

    }

}


