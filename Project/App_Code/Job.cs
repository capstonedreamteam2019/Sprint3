using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Job
/// </summary>
public class Job
{
    private string postID;
    private string department;
    private string reqs;
    private string dueDate;
    private string salary;
    private string reponsibilities;
    private string payType;
    private string location;
    private string ADayInTheLife;
    private string lastUpdatedBy;
    private string lastUpdated;

    public Job(string postID, string department, string reqs, string dueDate, string salary, string responsibilities, string payType, string location, string ADayInTheLife)
    {
        setpostID(postID);
        setDepartment(department);
        setReqs(reqs);
        setDueDate(dueDate);
        setSalary(salary);
        setResponsibilities(responsibilities);
        setPayType(payType);
        setLocation(location);
        setADay(ADayInTheLife);
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

    public string getDepartment()
    {
        return department;
    }

    public void setDepartment(string department)
    {
        this.department = department;
    }

    public string getReqs()
    {
        return reqs;
    }

    public void setReqs(string reqs)
    {
        this.reqs = reqs;
    }


    public string getDueDate()
    {
        return dueDate;
    }

    public void setDueDate(string dueDate)
    {
        this.dueDate = dueDate;
    }

    public string getSalary()
    {
        return salary;
    }

    public void setSalary(string salary)
    {
        this.salary = salary;
    }

    public string getPayType()
    {
        return this.payType;
    }

    public void setPayType(string PayType)
    {
        this.payType = PayType;
    }

    public string getResponsibilities()
    {
        return this.reponsibilities;
    }

    public void setResponsibilities(string Responsibilities)
    {
        this.reponsibilities = Responsibilities;
    }

    public string getLocation()
    {
        return this.location;
    }

    public void setLocation(string location)
    {
        this.location = location;
    }

    public string getADay()
    {
        return this.ADayInTheLife;
    }

    public void setADay(string ADayInTheLife)
    {
        this.ADayInTheLife = ADayInTheLife;
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