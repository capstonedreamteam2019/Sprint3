using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Business
/// </summary>
public class Business
{
    string companyName;
    public Business(string companyName)
    {
        setCompanyName(companyName);
    }
    //Setters
        public void setCompanyName(string companyName)
    {
        this.companyName = companyName;
    }

    //Getters
    public string getCompanyName()
    {
        return companyName;
    }
}