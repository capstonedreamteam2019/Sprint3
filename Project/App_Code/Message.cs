using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Message
/// </summary>
public class Message
{
    private int toID;
    private int fromID;
    private string body;
    private DateTime lastUpdated;

    public Message(int toID, int fromID, string body, DateTime lastUpdated)
    {
        setToID(toID);
        setFromID(fromID);
        setBody(body);
        setLastUpdated(lastUpdated);
    }


    public int getToID()
    {
        return toID;
    }

    public void setToID(int toID)
    {
        this.toID = toID;
    }

    public int getFromID()
    {
        return fromID;
    }

    public void setFromID(int fromID)
    {
        this.fromID = fromID;
    }

    public string getBody()
    {
        return body;
    }

    public void setBody(string body)
    {
        this.body = body;
    }

    public DateTime getLastUpdated()
    {
        return lastUpdated;
    }

    public void setLastUpdated(DateTime lastUpdated)
    {
        this.lastUpdated = lastUpdated;
    }
}