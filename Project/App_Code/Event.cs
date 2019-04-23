using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Event
/// </summary>
public class Event: Post
{
    private string postingID;
    private string location;
    private string startDate;
    private string endDate;
    private string startTime;
    private string endTime;
    private string lastUpdatedBy;
    private string lastUpdated;

    public Event(string postingID, string location, string startDate, string endDate, string startTime, string endTime)
    {
        setPostingID(postingID);
        setLocation(location);
        setStartDate(startDate);
        setEndDate(endDate);
        setStartTime(startTime);
        setEndTime(endTime);
        setLastUpdatedBy();
        setLastUpdated();
    }

    public string getPostingID()
    {
        return postingID;
    }

    public void setPostingID(string postingID)
    {
        this.postingID = postingID;
    }

    public string getLocation()
    {
        return location;
    }

    public void setLocation(string location)
    {
        this.location = location;
    }

    public string getStartDate()
    {
        return startDate;
    }

    public void setStartDate(string startDate)
    {
        this.startDate = startDate;
    }


    public string getEndDate()
    {
        return endDate;
    }

    public void setEndDate(string endDate)
    {
        this.endDate = endDate;
    }

    public string getStartTime()
    {
        return startTime;
    }

    public void setStartTime(string startTime)
    {
        this.startTime = startTime;
    }


    public string getEndTime()
    {
        return endTime;
    }

    public void setEndTime(string endTime)
    {
        this.endTime = endTime;
    }

    public string getLastUpdatedBy()
    {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy()
    {
        this.lastUpdatedBy = Environment.UserName;
    }

    public string getLastUpdated()
    {
        return lastUpdated;
    }

    public void setLastUpdated()
    {
        this.lastUpdated = DateTime.Today.ToString();
    }


}