using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Users
{
    private string UserType;
    private string Email;
    private string UserPassword;
    private string FirstName;
    private string LastName;
    private string MiddleName;
    private string DateOfBirth;
    private string Address;
    private string PhoneNumber;
    private string LastUpdatedBy;
    private string LastUpdated;

    public Users(string UserType, string Email, string UserPassword, string FirstName, string LastName, string MiddleName, string DateOfBirth, string Address, string PhoneNumber)
    {
        setUserType(UserType);
        setEmail(Email);
        setUserPassword(UserPassword);
        setFirstName(FirstName);
        setLastName(LastName);
        setMiddleName(MiddleName);
        setDateOfBirth(DateOfBirth);
        setAddress(Address);
        setPhoneNumber(PhoneNumber);
        setLastUpdatedBy();
        setLastUpdated();

    }

    public void setUserType(string UserType)
    {
        this.UserType = UserType;
    }

    public string getUserType()
    {
        return this.UserType;
    }

    public void setEmail(string Email)
    {
        this.Email = Email;
    }

    public string getEmail()
    {
        return this.Email;
    }

    public void setUserPassword(string UserPassword)
    {
        this.UserPassword = UserPassword;
    }

    public string getUserPassword()
    {
        return this.UserPassword;
    }

    public void setFirstName(string FirstName)
    {
        this.FirstName = FirstName;
    }

    public string getFirstName()
    {
        return this.FirstName;
    }

    public void setLastName(string LastName)
    {
        this.LastName = LastName;
    }

    public string getLastName()
    {
        return this.LastName;
    }

    public void setMiddleName(string MiddleName)
    {
        this.MiddleName = MiddleName;
    }

    public string getMiddleName()
    {
        return this.MiddleName;
    }

    public void setDateOfBirth(string DateOfBirth)
    {
        this.DateOfBirth = DateOfBirth;
    }

    public string getDateOfBirth()
    {
        return this.DateOfBirth;
    }

    public void setAddress(string Address)
    {
        this.Address = Address;
    }

    public string getAddress()
    {
        return this.Address;
    }

    public void setPhoneNumber(string PhoneNumber)
    {
        this.PhoneNumber = PhoneNumber;
    }

    public string getPhoneNumber()
    {
        return this.PhoneNumber;
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
        this.LastUpdated = DateTime.Today.ToString().Substring(0, 10);
    }



}