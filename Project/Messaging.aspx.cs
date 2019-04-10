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
    protected void Page_Load(object sender, EventArgs e)
    {
        sendHide.Visible = false;
        responseHide.Visible = false;
        noMessagesAlert.Visible = false;
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

        //show response message
        time2.InnerText = converted;
        responseHide.Visible = true;

        //change side bar to match message
        sideMessage.InnerText = sendResponse.InnerText;

        //brilliature password: brilliantfuture!

        //send email about new message
        var from = new MailAddress("danielcamerontest@gmail.com", "From");
        var to = new MailAddress("brilliature@gmail.com", "To");
        string fromPassword = "danielc123!test";
        string subject = "New Message from: Daniel Cameron";
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
        sideMessage.InnerText = "";
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
        highlight.Attributes["class"] = "list-group-item list-group-item-action active";
        highlight1.Attributes["class"] = "list-group-item list-group-item-action";
        userName.InnerText = "Mercy Ketteridge";
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
        userName.InnerText = "Daniel Cameron";
        photoChange.Attributes["src"] = "pages/assets/img/avatar-male-4.jpg";
        highlight1.Attributes["class"] = "list-group-item list-group-item-action active";
        highlight.Attributes["class"] = "list-group-item list-group-item-action";

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

        highlight1.Visible = false;
        userName.InnerText = "Mercy Ketteridge";

        photoChange.Attributes["src"] = "pages/assets/img/avatar-female-3.jpg";
        highlight.Attributes["class"] = "list-group-item list-group-item-action active";

    }

}
























