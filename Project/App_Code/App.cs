using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for App
/// </summary>
public class App
{
    private int UserID;
    private int PostID;
    private bool Hired;
    private string lastUpdated;
    private string lastUpdatedBy;

    public App(int UserID, int PostID, bool Hired)
    {
        setUserID(UserID);
        setPostID(PostID);
        setHired(Hired);
        setLastUpdated();
        setLastUpdatedBy();

    }

    public int getUserID()
    {
        return this.UserID;
    }

    public void setUserID(int UserID)
    {
        this.UserID = UserID;
    }

    public int getPostID()
    {
        return this.PostID;
    }

    public void setPostID(int PostID)
    {
        this.PostID = PostID;
    }

    public bool getHired()
    {
        return this.Hired;
    }

    public void setHired(bool Hired)
    {
        this.Hired = Hired;
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