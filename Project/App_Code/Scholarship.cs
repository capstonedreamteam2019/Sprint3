using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Scholarship
/// </summary>
public class Scholarship: Post
{
    private string postID;
    private string reqs;
    private string reward;
    private string dueDate;
    private string lastUpdatedBy;
    private string lastUpdated;

    public Scholarship(string postID, string reqs, string reward, string dueDate)
    {
        setpostID(postID);
        setReqs(reqs);
        setReward(reward);
        setDueDate(dueDate);
        setLastUpdatedBy();
        setLastUpdated();
    }

    public string getpostID()
    {
        return postID;
    }

    public void setpostID(string postID)
    {
        this.postID = postID;
    }

    public string getReqs()
    {
        return reqs;
    }

    public void setReqs(string reqs)
    {
        this.reqs = reqs;
    }

    public string getReward()
    {
        return reward;
    }

    public void setReward(string reward)
    {
        this.reward = reward;
    }

    public string getDueDate()
    {
        return dueDate;
    }

    public void setDueDate(string dueDate)
    {
        this.dueDate = dueDate;
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
