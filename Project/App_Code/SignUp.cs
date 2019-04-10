using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SignUp
/// </summary>
public class SignUp
{
    private string firstName;
    private string lastName;
    private string companyName;
    private string email;
    private string employeeType;
    private string password;
    private string passwordConfirm;

    public SignUp(string fn, string ln, string company, string email, string type, string pass)
    {
        setFirstName(fn);
        setLastName(ln);
        setCompanyName(company);
        setEmail(email);
        setEmployeeType(type);
        setPassword(pass);
       
    }
    //Setters
        public void setFirstName(string firstName)
        {
            this.firstName = firstName;
        }
        public void setLastName(string lastName)
        {
            this.lastName = lastName;
        }
        public void setCompanyName(string companyName)
        {
            this.companyName = companyName;
        }
        public void setEmail(string email)
        {
            this.email = email;
        }
        public void setEmployeeType(string employeeType)
        {
            this.employeeType = employeeType;
        }
        public void setPassword(string password)
        {
            this.password = password;
        }
      
    //Getters
        public string getFirstName()
    {
        return firstName;
    }
        public string getLastName()
        {
            return lastName;
        }
        public string getCompanyName()
        {
            return companyName;
        }
        public string getEmail()
        {
            return email;

        }
        public string getEmployeeType()
        {
            return employeeType;
        }
        public string getPassword()
        {
            return password;
        }
        
}