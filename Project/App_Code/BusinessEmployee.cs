using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BusinessEmployee
/// </summary>
public class BusinessEmployee: Users 
{
    private int UserID;
    private int BusinessID;
    private string EmployeeType;
    private string Testimonial;
    private string CardInfo;
    private string LastUpdatedBy;
    private string LastUpdated;

    public BusinessEmployee(int UserID, int BusinessID, string EmployeeType, string Testimonial, string CardInfo)
    {
        setUserID(UserID);
        setBusID(BusinessID);
        setEmployeeType(EmployeeType);
        setTestimonial(Testimonial);
        setCardInfo(CardInfo);
        setLastUpdatedBy();
        setLastUpdated();

    }

    public int getUserID()
    {
        return UserID;
    }

    public void setUserID(int UserID)
    {
        this.UserID = UserID;
    }

    public string getEmployeeType()
    {
        return EmployeeType;
    }

    public void setEmployeeType(string EmployeeType)
    {
        this.EmployeeType = EmployeeType;
    }

    public string getTestimonial()
    {
        return Testimonial;
    }

    public void setTestimonial(string Testimonial)
    {
        this.Testimonial = Testimonial;
    }

    public string getCardInfo()
    {
        return CardInfo;
    }

    public void setCardInfo(string CardInfo)
    {
        this.CardInfo = CardInfo;
    }

    public int getBusID()
    {
        return BusinessID;
    }

    public void setBusID(int busID)
    {
        this.BusinessID = busID;
    }

    public string getLastUpdatedBy()
    {
        return LastUpdatedBy;
    }

    public void setLastUpdatedBy()
    {
        this.LastUpdatedBy = Environment.UserName;
    }

    public string getLastUpdated()
    {
        return LastUpdated;
    }

    public void setLastUpdated()
    {
        this.LastUpdated = DateTime.Today.ToString();
    }
}