using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Settings : System.Web.UI.Page
{
    //Declare connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showData();
        }
    }

    //update gridview
    protected void showData()
    {
        localDB.Open();
        SqlCommand cmd = new SqlCommand("SELECT FirstName FROM Users WHERE UserID = @id", localDB);
        cmd.Parameters.AddWithValue("id", 7);
        txtFirstName.Text = cmd.ExecuteScalar().ToString();

        SqlCommand cmd2 = new SqlCommand("SELECT LastName FROM Users WHERE UserID = @id", localDB);
        cmd2.Parameters.AddWithValue("id", 7);
        txtLastName.Text = cmd2.ExecuteScalar().ToString();

        SqlCommand cmd0 = new SqlCommand("SELECT MiddleName FROM Users WHERE UserID = @id", localDB);
        cmd0.Parameters.AddWithValue("id", 7);
        txtMiddleName.Text = cmd0.ExecuteScalar().ToString();

        lblName1.Text = cmd.ExecuteScalar().ToString() + " " + cmd2.ExecuteScalar().ToString();

        SqlCommand cmd3 = new SqlCommand("SELECT BusinessID FROM BusinessEmployee WHERE UserID = @id", localDB);
        cmd3.Parameters.AddWithValue("id", 7);
        SqlCommand cmd4 = new SqlCommand("SELECT CompanyName FROM Business WHERE BusinessID = @id", localDB);
        cmd4.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        lblBusiness.Text = cmd4.ExecuteScalar().ToString();

        SqlCommand cmd5 = new SqlCommand("SELECT HQAddress FROM Business WHERE BusinessID = @id", localDB);
        cmd5.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        lblLocation.Text = cmd5.ExecuteScalar().ToString();

        SqlCommand cmd6 = new SqlCommand("SELECT Email FROM Users WHERE UserID = @id", localDB);
        cmd6.Parameters.AddWithValue("id", 7);
        txtEmail.Text = cmd6.ExecuteScalar().ToString();

        SqlCommand cmd7 = new SqlCommand("SELECT PhoneNumber FROM Users WHERE UserID = @id", localDB);
        cmd7.Parameters.AddWithValue("id", 7);
        txtPhone.Text = cmd7.ExecuteScalar().ToString();

        SqlCommand cmd8 = new SqlCommand("SELECT DateOfBirth FROM Users WHERE UserID = @id", localDB);
        cmd8.Parameters.AddWithValue("id", 7);
        txtDOB.Text = cmd8.ExecuteScalar().ToString();

        SqlCommand cmd9 = new SqlCommand("SELECT Address FROM Users WHERE UserID = @id", localDB);
        cmd9.Parameters.AddWithValue("id", 7);
        txtAddress.Text = cmd9.ExecuteScalar().ToString();

        SqlCommand cmd10 = new SqlCommand("SELECT Testimonial FROM BusinessEmployee WHERE UserID = @id", localDB);
        cmd10.Parameters.AddWithValue("id", 7);
        txtTestimonial.Text = cmd10.ExecuteScalar().ToString();

        SqlCommand cmd11 = new SqlCommand("SELECT CompanyName FROM Business WHERE BusinessID = @id", localDB);
        cmd11.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtCompanyName.Text = cmd11.ExecuteScalar().ToString();

        SqlCommand cmd12 = new SqlCommand("SELECT Website FROM Business WHERE BusinessID = @id", localDB);
        cmd12.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtWebsite.Text = cmd12.ExecuteScalar().ToString();

        SqlCommand cmd15 = new SqlCommand("SELECT Industry FROM Business WHERE BusinessID = @id", localDB);
        cmd15.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtIndustry.Text = cmd15.ExecuteScalar().ToString();

        SqlCommand cmd14 = new SqlCommand("SELECT Description FROM Business WHERE BusinessID = @id", localDB);
        cmd14.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtDescription.Text = cmd14.ExecuteScalar().ToString();

        SqlCommand cmd13 = new SqlCommand("SELECT MissionStatement FROM Business WHERE BusinessID = @id", localDB);
        cmd13.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtMissionStatement.Text = cmd13.ExecuteScalar().ToString();

        SqlCommand cmd16 = new SqlCommand("SELECT CompanyValues FROM Business WHERE BusinessID = @id", localDB);
        cmd16.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtValues.Text = cmd16.ExecuteScalar().ToString();

        SqlCommand cmd17 = new SqlCommand("SELECT Culture FROM Business WHERE BusinessID = @id", localDB);
        cmd17.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtCulture.Text = cmd17.ExecuteScalar().ToString();

        SqlCommand cmd18 = new SqlCommand("SELECT CompanySize FROM Business WHERE BusinessID = @id", localDB);
        cmd18.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtSize.Text = cmd18.ExecuteScalar().ToString();

        SqlCommand cmd19 = new SqlCommand("SELECT HQAddress FROM Business WHERE BusinessID = @id", localDB);
        cmd19.Parameters.AddWithValue("id", cmd3.ExecuteScalar().ToString());
        txtHQ.Text = cmd19.ExecuteScalar().ToString();

        localDB.Close();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        localDB.Open();
        System.Data.SqlClient.SqlCommand editUser = new System.Data.SqlClient.SqlCommand();
        editUser.Connection = localDB;
        editUser.CommandText = "Update Users set Email = @Email, FirstName = @FirstName, LastName = @LastName, MiddleName = @MiddleName, DateOfBirth = @DOB, Address = @Address, PhoneNumber = @PhoneNumber where UserID = @id";
        editUser.Parameters.AddWithValue("id", 1);
        editUser.Parameters.AddWithValue("Email", HttpUtility.HtmlEncode(txtEmail.Text));
        editUser.Parameters.AddWithValue("FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
        editUser.Parameters.AddWithValue("LastName", HttpUtility.HtmlEncode(txtLastName.Text));
        editUser.Parameters.AddWithValue("MiddleName", HttpUtility.HtmlEncode(txtMiddleName.Text));
        editUser.Parameters.AddWithValue("DOB", HttpUtility.HtmlEncode(txtDOB.Text));
        editUser.Parameters.AddWithValue("Address", HttpUtility.HtmlEncode(txtAddress.Text));
        editUser.Parameters.AddWithValue("PhoneNumber", HttpUtility.HtmlEncode(txtPhone.Text));
        editUser.ExecuteNonQuery();

        System.Data.SqlClient.SqlCommand editEmployee = new System.Data.SqlClient.SqlCommand();
        editEmployee.Connection = localDB;
        editEmployee.CommandText = "Update BusinessEmployee set Testimonial = @Testimonial  where UserID = @id";
        editEmployee.Parameters.AddWithValue("id", 1);
        editEmployee.Parameters.AddWithValue("Testimonial", HttpUtility.HtmlEncode(txtTestimonial.Text));
        editEmployee.ExecuteNonQuery();

        System.Data.SqlClient.SqlCommand editBusiness = new System.Data.SqlClient.SqlCommand();
        editBusiness.Connection = localDB;
        editBusiness.CommandText = "Update Business set CompanyName = @CompanyName, Website = @Website, Industry = @Industry, Description = @Description, MissionStatement = @MissionStatement, CompanyValues = @CompanyValues, Culture = @Culture, CompanySize = @CompanySize, HQAddress = @HQAddress where BusinessID = @id";
        editBusiness.Parameters.AddWithValue("id", 1);
        editBusiness.Parameters.AddWithValue("CompanyName", HttpUtility.HtmlEncode(txtCompanyName.Text));
        editBusiness.Parameters.AddWithValue("Website", HttpUtility.HtmlEncode(txtWebsite.Text));
        editBusiness.Parameters.AddWithValue("Industry", HttpUtility.HtmlEncode(txtIndustry.Text));
        editBusiness.Parameters.AddWithValue("Description", HttpUtility.HtmlEncode(txtDescription.Text));
        editBusiness.Parameters.AddWithValue("MissionStatement", HttpUtility.HtmlEncode(txtMissionStatement.Text));
        editBusiness.Parameters.AddWithValue("CompanyValues", HttpUtility.HtmlEncode(txtValues.Text));
        editBusiness.Parameters.AddWithValue("Culture", HttpUtility.HtmlEncode(txtCulture.Text));
        editBusiness.Parameters.AddWithValue("CompanySize", HttpUtility.HtmlEncode(txtSize.Text));
        editBusiness.Parameters.AddWithValue("HQAddress", HttpUtility.HtmlEncode(txtHQ.Text));
        editBusiness.ExecuteNonQuery();

        localDB.Close();
    }

}