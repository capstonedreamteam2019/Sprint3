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

public partial class Messaging : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        sendHide.Visible = false;
        responseHide.Visible = false;
        noMessagesAlert.Visible = false;

        localDB.Open();

        //Select User's school name for main text area
        System.Data.SqlClient.SqlCommand selectSchoolName = new System.Data.SqlClient.SqlCommand();
        selectSchoolName.Connection = localDB;
        selectSchoolName.CommandText = "select schoolName from school s inner join schoolemployee se on s.schoolID = se.schoolID";
        string schoolName = selectSchoolName.ExecuteScalar().ToString();
        mainViewUserName.InnerHtml = schoolName;

        //Select User's First and Last Name for main text area
        System.Data.SqlClient.SqlCommand selectUserName = new System.Data.SqlClient.SqlCommand();
        selectUserName.Connection = localDB;
        selectUserName.CommandText = "select concat(firstname, ' ', lastname) as userName from users inner join messages on userID = messagetoid AND messageid = (SELECT MAX(messageID) FROM messages)";
        string userName = selectUserName.ExecuteScalar().ToString();
        mainViewSpeakingWith.InnerHtml = "Speaking with: " + userName;

        sidebarContactName1.InnerHtml = schoolName;

        //Select 5 users to be shown on the side in order of messages sent
        System.Data.SqlClient.SqlCommand selectSidebar2 = new System.Data.SqlClient.SqlCommand();
        selectSidebar2.Connection = localDB;
        selectSidebar2.CommandText = "select schoolName from school s inner join schoolEmployee se on s.schoolID = se.schoolID inner join users u on se.userID = u.userID inner join messages m on u.userID = m.messageToID and messageid = (select max(messageID - 1) from messages)";
        string sidebar2 = selectSidebar2.ExecuteScalar().ToString();
        sidebarContactName2.InnerHtml = sidebar2;

        //Select 5 users to be shown on the side in order of messages sent
        System.Data.SqlClient.SqlCommand selectSidebar3 = new System.Data.SqlClient.SqlCommand();
        selectSidebar3.Connection = localDB;
        selectSidebar3.CommandText = "select schoolName from school s inner join schoolEmployee se on s.schoolID = se.schoolID inner join users u on se.userID = u.userID inner join messages m on u.userID = m.messageToID and messageid = (select max(messageID - 2) from messages)";
        string sidebar3 = selectSidebar3.ExecuteScalar().ToString();
        sidebarContactName3.InnerHtml = sidebar3;

        //Select 5 users to be shown on the side in order of messages sent
        System.Data.SqlClient.SqlCommand selectSidebar4 = new System.Data.SqlClient.SqlCommand();
        selectSidebar4.Connection = localDB;
        selectSidebar4.CommandText = "select schoolName from school s inner join schoolEmployee se on s.schoolID = se.schoolID inner join users u on se.userID = u.userID inner join messages m on u.userID = m.messageToID and messageid = (select max(messageID - 3) from messages)";
        string sidebar4 = selectSidebar4.ExecuteScalar().ToString();
        sidebarContactName4.InnerHtml = sidebar4;

        //Select 5 users to be shown on the side in order of messages sent
        System.Data.SqlClient.SqlCommand selectSidebar5 = new System.Data.SqlClient.SqlCommand();
        selectSidebar5.Connection = localDB;
        selectSidebar5.CommandText = "select schoolName from school s inner join schoolEmployee se on s.schoolID = se.schoolID inner join users u on se.userID = u.userID inner join messages m on u.userID = m.messageToID and messageid = (select max(messageID - 4) from messages)";
        string sidebar5 = selectSidebar5.ExecuteScalar().ToString();
        sidebarContactName5.InnerHtml = sidebar5;


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

        localDB.Open();

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
        selectUserName.CommandText = "select concat(firstname, ' ', lastname) as userName from users inner join message1 on userID = messagetoid AND messageid = (SELECT MAX(messageID) FROM message1)";
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
        mainViewUserName.InnerText = "Mercy Ketteridge";
        photoChange.Attributes["src"] = "pages/assets/img/avatar-female-3.jpg";

        //Insert

        //selectPostID.CommandText = "select max(postID) from Post";
        //string postID = selectPostID.ExecuteScalar().ToString();
        //selectPostID.ExecuteNonQuery();
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
        mainViewUserName.InnerText = "Daniel Cameron";
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
        mainViewUserName.InnerText = "Mercy Ketteridge";

        photoChange.Attributes["src"] = "pages/assets/img/avatar-female-3.jpg";
        sidebarHighlight1.Attributes["class"] = "list-group-item list-group-item-action active";

    }

}