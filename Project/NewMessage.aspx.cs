using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class NewMessage : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {

        ////GridView1.SelectedIndex = 0;
        //GridView1.SelectedRowStyle.CssClass = "bg-primary text-white";
        //mainViewContactSchool.InnerText = GridView1.SelectedRow.Cells[1].Text;
        //mainViewContactName.InnerText = "Speaking with: " + GridView1.SelectedRow.Cells[2].Text;

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
        LoadChatList(messageTo, messageFrom);


        

    }

    protected void LoadChatList(int messageTo, int messageFrom)
    {
        DataSet ds = new DataSet();
       

        // DataTable FromTable = new DataTable();
        string StrCmd = "select messageFromID, messageBody from messages1 where (messageFromID = @from and messageToID = @to) or (messageFromID = @ViseFrom and messageToID = @ViseTo) order by MessageId";
        SqlCommand sqlcmd = new SqlCommand(StrCmd, localDB);
        sqlcmd.Parameters.AddWithValue("@from", messageFrom);
        sqlcmd.Parameters.AddWithValue("@to", messageTo);
        sqlcmd.Parameters.AddWithValue("@ViseFrom", messageTo);
        sqlcmd.Parameters.AddWithValue("@ViseTo", messageFrom);
        

        SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcmd);
        sqlDA.Fill(ds);

        DataList2.DataSource = ds.Tables[0];
        /*
        foreach (DataRow row in ds.Tables[0].Rows)
        {
           if(string.Equals(row["MsgSender"].ToString() ,CurrentSender.Text,StringComparison.OrdinalIgnoreCase))
            {
                //row["MsgSender"] = "<span style='color:blue; float: right'>You</span>";
                //row["ChatMsg"] = "<span style='color:blue; float: right'>"+row["ChatMsg"].ToString()+"</span>";
                DataList2. = false;
            }
           else
            {
                // row["MsgSender"] = "<span style='color:orange; float:left'>"+ row["MsgSender"].ToString()+"</span>";
                DataList2.Visible = true;
            }
        }
        ds.AcceptChanges();
        */

        DataList2.DataBind();

        localDB.Close();
    }

    //protected string GetStyleForMsgList(int messageFrom)
    //{
    //    int messageID = 11;
    //    if (messageID == messageFrom)
    //    {
    //        return "SenderClass";
    //    }
    //    return "ReceiverClass";
    //}
    //protected string GetPerfactName(int messageFrom)
    //{
    //    int messageID = 11;
    //    if (messageID == messageFrom)
    //    { 
    //        return "<span style='color:#efdab5'>You :</sapn>";
    //    }
    //    return "<span style='color:#efdab5'>" + messageFrom + " : </span>";
    //}


    protected string GetStyleForMsgList(string str)
    {
        if (string.Equals(Server.HtmlEncode(str), "11", StringComparison.OrdinalIgnoreCase))
        {
            return "SenderClass";
        }
        return "ReceiverClass";
    }
    protected string GetPerfactName(string str)
    {
        if (string.Equals(Server.HtmlEncode(str), "11", StringComparison.OrdinalIgnoreCase))
        {
            return "<span style='color:#efdab5'>You :</sapn>";
        }
        return "<span style='color:#efdab5'>" + Server.HtmlEncode(str) + " : </span>";
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}