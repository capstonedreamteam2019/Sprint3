using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Post
{
    private int busID;
    private string type;
    private string title;
    private string postDate;
    private string description;
    private string lastUpdatedBy;
    private string lastUpdated;

    public Post(int busID, string type, string title, string description)
    {
        setBusID(busID);
        setType(type);
        setTitle(title);
        setPostDate();
        setDescription(description);
        setLastUpdatedBy();
        setLastUpdated();
    }

    public int getBusID()
    {
        return busID;
    }

    public void setBusID(int busID)
    {
        this.busID = busID;
    }

    public string getType()
    {
        return type;
    }

    public void setType(string type)
    {
        this.type = type;
    }

    public string getTitle()
    {
        return title;
    }

    public void setTitle(string title)
    {
        this.title = title;
    }


    public string getPostDate()
    {
        return postDate;
    }

    public void setPostDate()
    {
        this.postDate = DateTime.Today.ToString();
    }

    public string getDescription()
    {
        return description;
    }

    public void setDescription(string description)
    {
        this.description = description;
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
        this.lastUpdated = DateTime.Today.ToString().Substring(0, 10);
    }


}