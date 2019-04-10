using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Event
/// </summary>
public class Event
{
    private string postingID;
    private string location;
    private DateTime startDate;
    private DateTime endDate;
    private string startTime;
    private string endTime;
    private string lastUpdatedBy;
    private DateTime lastUpdated;

    public Event(string postingID, string location, DateTime startDate, DateTime endDate, string startTime, string endTime, string lastUpdatedBy, DateTime lastUpdated)
    {
        setPostingID(postingID);
        setLocation(location);
        setStartDate(startDate);
        setEndDate(endDate);
        setStartTime(startTime);
        setEndTime(endTime);
        setLastUpdatedBy(lastUpdatedBy);
        setLastUpdated(lastUpdated);
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

    public DateTime getStartDate()
    {
        return startDate;
    }

    public void setStartDate(DateTime startDate)
    {
        this.startDate = startDate;
    }


    public DateTime getEndDate()
    {
        return endDate;
    }

    public void setEndDate(DateTime endDate)
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

    public void setLastUpdatedBy(string lastUpdatedBy)
    {
        this.lastUpdatedBy = lastUpdatedBy;
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