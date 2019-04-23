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

public partial class Messaging : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null || HttpContext.Current.Request.UrlReferrer == null)
        {
            Response.Redirect("Login.aspx");
        }

        sendHide.Visible = false;
        responseHide.Visible = false;
        noMessagesAlert.Visible = false;

        localDB.Open();

        //Select User's school name
        System.Data.SqlClient.SqlCommand selectSchoolName = new System.Data.SqlClient.SqlCommand();
        selectSchoolName.Connection = localDB;
        selectSchoolName.CommandText = "select schoolName from school s inner join schoolemployee se on s.schoolID = se.schoolID";
        string schoolName = selectSchoolName.ExecuteScalar().ToString();
        mainViewUserName.InnerHtml = schoolName;

        sidebarContactName1.InnerText = schoolName;

        //Select User's First and Last Name
        System.Data.SqlClient.SqlCommand selectUserName = new System.Data.SqlClient.SqlCommand();
        selectUserName.Connection = localDB;
        selectUserName.CommandText = "select concat(firstname, ' ', lastname) as userName from users inner join messages on userID = messagetoid AND messageid = (SELECT MAX(messageID) FROM messages)";
        string userName = selectUserName.ExecuteScalar().ToString();
        mainViewSpeakingWith.InnerHtml = "Speaking with: " + userName;

        //Display sidebar users



    }

    protected void SendButton_OnClick(object sender, EventArgs e)
    {
        //send a new message and display it with time
        string message = messageBox.Value;
        sendPhrase.InnerText = message;
        DateTime now = DateTime.Now;
        string converted = now.ToString("hh:mm tt");
        time.InnerText = converted;

        sendHide.Visible = true;
        messageBox.Value = "";


        //Creates a new sql insert command
        System.Data.SqlClient.SqlCommand insertMessage = new System.Data.SqlClient.SqlCommand();
        insertMessage.Connection = localDB;

        //Local Message object
        Message newMessage = new Message(6, 1, message, DateTime.Now);

        //Insert data into database
        insertMessage.CommandText = "insert into [Messages] ([MessageToID], [MessageFromID], [MessageBody], [LastUpdated])" +
            "values (@to, @from, @body, @lastUpdated)";

        insertMessage.Parameters.Add(new SqlParameter("to", newMessage.getToID()));
        insertMessage.Parameters.Add(new SqlParameter("from", newMessage.getFromID()));
        insertMessage.Parameters.Add(new SqlParameter("body", newMessage.getBody()));
        insertMessage.Parameters.Add(new SqlParameter("lastUpdated", newMessage.getLastUpdated()));

        insertMessage.ExecuteNonQuery();

        //show response message
        responseMessageTime.InnerText = converted;
        responseHide.Visible = true;

        //change side bar to match message
        sidebarContactMessage1.InnerText = sendResponse.InnerText;
        sidebarContactTime1.InnerText = converted;

        System.Data.SqlClient.SqlCommand selectUserName = new System.Data.SqlClient.SqlCommand();
        selectUserName.Connection = localDB;

        //Select User's First and Last Name
        selectUserName.CommandText = "select concat(firstname, ' ', lastname) as userName from users inner join messages on userID = messagetoid AND messageid = (SELECT MAX(messageID) FROM messages)";
        string userName = selectUserName.ExecuteScalar().ToString();


        //send email about new message
        //brilliature password: brilliantfuture!
        var from = new MailAddress("danielcamerontest@gmail.com", "From");
        var to = new MailAddress("brilliature@gmail.com", "To");
        string fromPassword = "danielc123!test";
        string subject = "New Message from: " + userName;
        string body = sendResponse.InnerText;



        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            DeliveryMethod = SmtpDeliveryMethod.Network,
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential(from.Address, fromPassword)
        };

        using (var emailAlert = new MailMessage(from, to)
        {
            Subject = subject,
            Body = body,
        })
        {
            smtp.Send(emailAlert);
        }



        System.Threading.Thread thread = new System.Threading.Thread(new System.Threading.ThreadStart(show));

        thread.IsBackground = true;

        thread.Start();

    }

    void show()

    {

        System.Threading.Thread.Sleep(3000);

        responseHide.Visible = true;

    }


    protected void ClearMessages_OnClick(object sender, EventArgs e)
    {
        messageClear.Visible = false;
        noMessagesAlert.Visible = true;
        sidebarContactMessage1.InnerText = "";
    }

    protected void ChangeMessage_OnClick(object sender, EventArgs e)
    {
        firstMess.InnerText = "one";
        secondMess.InnerText = "two";
        thirdMess.InnerText = "three";
        fourthMess.InnerText = "four";
        fifthMess.InnerText = "five";
        sixthMess.InnerText = "six";
        seventhMess.InnerText = "seven";
        sidebarHighlight2.Attributes["class"] = "list-group-item list-group-item-action active";
        sidebarHighlight1.Attributes["class"] = "list-group-item list-group-item-action";
        mainViewUserName.InnerText = "Harrisonburg High School";
        mainViewSpeakingWith.InnerText = "Alex Cole";
        photoChange.Attributes["src"] = "pages/assets/img/avatar-female-3.jpg";
    }

    protected void ChangeBack_OnClick(object sender, EventArgs e)
    {
        firstMess.InnerText = "Agreed, their after-sales support is second - to - none.";
        secondMess.InnerText = "Same! The guys at Medium Rare are also top blokes";
        thirdMess.InnerText = "Yeah talk about speedy, it saves me so much time and effort &#x1F44C;";
        fourthMess.InnerText = "I know, right? We've been using Wingman for all our internal projects for a while now";
        fifthMess.InnerText = "Of course, I'm not a fool!";
        sixthMess.InnerText = "Awesome, did you make it with Wingman?";
        seventhMess.InnerText = "Yes, all synced to the drive for you guys &#x1F44D;";
        mainViewUserName.InnerText = "Great Bridge High School";
        mainViewSpeakingWith.InnerText = "Mary Daily";
        photoChange.Attributes["src"] = "pages/assets/img/avatar-male-4.jpg";
        sidebarHighlight1.Attributes["class"] = "list-group-item list-group-item-action active";
        sidebarHighlight2.Attributes["class"] = "list-group-item list-group-item-action";

    }


    protected void DeleteMessages_OnClick(object sender, EventArgs e)
    {
        firstMess.InnerText = "one";
        secondMess.InnerText = "two";
        thirdMess.InnerText = "three";
        fourthMess.InnerText = "four";
        fifthMess.InnerText = "five";
        sixthMess.InnerText = "six";
        seventhMess.InnerText = "seven";

        sidebarHighlight2.Visible = false;
        mainViewUserName.InnerText = "Harrisonburg High School";

        photoChange.Attributes["src"] = "pages/assets/img/avatar-female-3.jpg";
        sidebarHighlight1.Attributes["class"] = "list-group-item list-group-item-action active";

    }


    protected void ListView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    //private void myListBox_Click(object sender, EventArgs e)
    //{
    //    ListBox lb = sender as ListBox;
    //    if (lb != null)
    //    {
    //        sidebarContactMessage1.InnerText = ListView1.SelectedValue.ToString();
    //    }
    //}

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
