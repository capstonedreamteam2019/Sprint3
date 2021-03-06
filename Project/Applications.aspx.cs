﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Configuration;

public partial class Applications: System.Web.UI.Page
{
    //Declare connection
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);
    
    //Create data tables for gridviews
    SqlDataAdapter da;
    DataTable dt;
    SqlDataAdapter da2;
    DataTable dt2;
    SqlDataAdapter da3;
    DataTable dt3;

    //Declare static id variable
    static Label id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Updates the Gridviews
            showData();
            

        }

        if (Session["UserName"] == null || HttpContext.Current.Request.UrlReferrer == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    //update gridview
    protected void showData()
    {
        //Populates Gridview 1 = Active
        if (localDB.State != ConnectionState.Open)
            localDB.Open();
        dt = new DataTable(); 
        SqlCommand cmd = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Open'", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populates Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteApp LEFT JOIN Users ON Users.UserID = DeleteApp.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN DeletePost ON DeleteApp.PostID = DeletePost.PostID", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        //Populates Gridview 3 = Hired
        localDB.Open();
        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Hired'", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
        }
    }

    //Most Recent filter
    protected void AlphabeticalFilter(object sender, EventArgs e)
    {
        //Populates Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Open' ORDER BY App.LastUpdated", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populates Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteApp LEFT JOIN Users ON Users.UserID = DeleteApp.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN DeletePost ON DeleteApp.PostID = DeletePost.PostID ORDER BY DeleteApp.LastUpdated", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        //Populates Gridview 3 = Hired
        localDB.Open();
        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Hired' ORDER BY App.LastUpdated", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
        }
    }

    //Last updated filter
    protected void LastUpdatedFilter(object sender, EventArgs e)
    {
        //Populates Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Open' ORDER BY LastName ASC", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populates Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteApp LEFT JOIN Users ON Users.UserID = DeleteApp.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN DeletePost ON DeleteApp.PostID = DeletePost.PostID ORDER BY LastName ASC", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        //Populates Gridview 3 = Hired
        localDB.Open();
        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Hired' ORDER BY LastName ASC", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
        }
    }

    //best fit filter
    protected void BestFitFilter(object sender, EventArgs e)
    {
        //Populates Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Open' ORDER BY Score DESC", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populates Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteApp LEFT JOIN Users ON Users.UserID = DeleteApp.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN DeletePost ON DeleteApp.PostID = DeletePost.PostID ORDER BY Score DESC", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        //Populates Gridview 3 = Hired
        localDB.Open();
        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Hired' ORDER BY Score DESC", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
        }
    }

    //Position filter
    protected void PositionFilter(object sender, EventArgs e)
    {
        //Populates Gridview 1 = Active
        localDB.Open();
        dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Open' ORDER BY Title", localDB);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Populates Gridview 2 = Deleted
        localDB.Open();
        dt2 = new DataTable();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM DeleteApp LEFT JOIN Users ON Users.UserID = DeleteApp.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN DeletePost ON DeleteApp.PostID = DeletePost.PostID ORDER BY Title", localDB);
        da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        localDB.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt2;
            GridView2.DataBind();
        }

        //Populates Gridview 3 = Hired
        localDB.Open();
        dt3 = new DataTable();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM App LEFT JOIN Users ON Users.UserID = App.UserID  LEFT JOIN Student ON Student.UserID = Users.UserID LEFT JOIN Post ON App.PostID = Post.PostID where Hired Like 'Hired' ORDER BY Title", localDB);
        da3 = new SqlDataAdapter(cmd3);
        da3.Fill(dt3);
        localDB.Close();
        if (dt3.Rows.Count > 0)
        {
            GridView3.DataSource = dt3;
            GridView3.DataBind();
        }
    }

        //Gridview 1 commands
        protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridView1.Rows[index];
        id = selectedRow.FindControl("lblID") as Label;

        StringBuilder builder = new StringBuilder();

        if (e.CommandName == "Preview")
        {
            id = selectedRow.FindControl("lblUserID") as Label;
            LoadPreview();
            builder.Append("<script language=JavaScript> ShowPreview(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPreview", builder.ToString());
        }
        if (e.CommandName == "Hire")
        {
            builder.Append("<script language=JavaScript> ShowHire(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowHire", builder.ToString());
        }
        if (e.CommandName == "Remove")
        {
            builder.Append("<script language=JavaScript> ShowDelete(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowDelete", builder.ToString());
        }
        if (e.CommandName == "Resume")
        {
            id = selectedRow.FindControl("lblUserID") as Label;
            openApp();
            builder.Append("<script language=JavaScript> ShowResume(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowResume", builder.ToString());
        }
        if (e.CommandName == "Read")
        {
            localDB.Open();
            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Update App set Opened = ' ' where AppID = @id";
            getTitle.Parameters.AddWithValue("id", id.Text);
            getTitle.ExecuteNonQuery();           
            localDB.Close();
            showData();
            Response.Redirect(Request.RawUrl);
        }


    }

    //Gridview 2 commands
    protected void GridView2_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridView2.Rows[index];
        id = selectedRow.FindControl("lblID") as Label;

        StringBuilder builder = new StringBuilder();
        if (e.CommandName == "Preview")
        {
            id = selectedRow.FindControl("lblUserID") as Label;
            LoadPreview();
            builder.Append("<script language=JavaScript> ShowPreview(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPreview", builder.ToString());
        }
        if (e.CommandName == "Re")
        {
            id = selectedRow.FindControl("lblID") as Label;
            builder.Append("<script language=JavaScript> ShowRe(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowRe", builder.ToString());
        }
        if (e.CommandName == "Resume")
        {
            id = selectedRow.FindControl("lblUserID") as Label;
            openApp();
            builder.Append("<script language=JavaScript> ShowResume(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowResume", builder.ToString());
        }

    }

    //Gridview 3 commands
    protected void GridView3_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridView3.Rows[index];
        id = selectedRow.FindControl("lblID") as Label;

        StringBuilder builder = new StringBuilder();

        if (e.CommandName == "Preview")
        {
            LoadPreview();
            builder.Append("<script language=JavaScript> ShowPreview(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPreview", builder.ToString());
        }
        if (e.CommandName == "Resume")
        {
            id = selectedRow.FindControl("lblUserID") as Label;
            openApp();
            builder.Append("<script language=JavaScript> ShowResume(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowResume", builder.ToString());
        }

    }

    //Close Create popup
    protected void CloseCreate(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideCreate(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideCreate", builder.ToString());
    }

    //Close preview popup
    protected void ClosePreview(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HidePreview(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HidePreview", builder.ToString());
    }

    //close edit popup
    protected void CloseHire(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideHire(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideHire", builder.ToString());
    }

    //close delete popup
    protected void CloseDelete(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideDelete(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideDelete", builder.ToString());
    }

    //close Rectivate popup
    protected void CloseRe(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideRe(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideRe", builder.ToString());
    }
    //close Resume popup
    protected void CloseResume(object sender, EventArgs e)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<script language=JavaScript> HideResume(); </script>\n");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "HideResume", builder.ToString());
    }




    //Populates the preview textboxes
    protected void LoadPreview()
    {
        try
        {
            localDB.Open();

            System.Data.SqlClient.SqlCommand getTitle = new System.Data.SqlClient.SqlCommand();
            getTitle.Connection = localDB;
            getTitle.CommandText = "Select FirstName From Users where UserID = @id";
            getTitle.Parameters.AddWithValue("id", id.Text);

            System.Data.SqlClient.SqlCommand getLast = new System.Data.SqlClient.SqlCommand();
            getLast.Connection = localDB;
            getLast.CommandText = "Select LastName From Users where UserID = @id";
            getLast.Parameters.AddWithValue("id", id.Text);

            lblTitle1.InnerText = getTitle.ExecuteScalar().ToString() + " " + getLast.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDescription = new System.Data.SqlClient.SqlCommand();
            getDescription.Connection = localDB;
            getDescription.CommandText = "Select Email From Users where UserID = @id";
            getDescription.Parameters.AddWithValue("id", id.Text);
            lblDescription.Text = getDescription.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getResponsibilities = new System.Data.SqlClient.SqlCommand();
            getResponsibilities.Connection = localDB;
            getResponsibilities.CommandText = "Select PhoneNumber From Users where UserID = @id";
            getResponsibilities.Parameters.AddWithValue("id", id.Text);
            lblResponsibilities.Text = getResponsibilities.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getQualifications = new System.Data.SqlClient.SqlCommand();
            getQualifications.Connection = localDB;
            getQualifications.CommandText = "Select DateOfBirth From Users where UserID = @id";
            getQualifications.Parameters.AddWithValue("id", id.Text);
            lblQualifications.Text = getQualifications.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getDepartment = new System.Data.SqlClient.SqlCommand();
            getDepartment.Connection = localDB;
            getDepartment.CommandText = "Select SchoolID From Student where UserID = @id";
            getDepartment.Parameters.AddWithValue("id", id.Text);
            String SchoolID = getDepartment.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getSchool = new System.Data.SqlClient.SqlCommand();
            getSchool.Connection = localDB;
            getSchool.CommandText = "Select SchoolName From School where SchoolID = @id";
            getSchool.Parameters.AddWithValue("id", SchoolID);
            lblDepartment.Text = getSchool.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getLocation = new System.Data.SqlClient.SqlCommand();
            getLocation.Connection = localDB;
            getLocation.CommandText = "Select AcademicYear From Student where UserID = @id";
            getLocation.Parameters.AddWithValue("id", id.Text);
            lblLocation.Text = getLocation.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getGPA = new System.Data.SqlClient.SqlCommand();
            getGPA.Connection = localDB;
            getGPA.CommandText = "Select GPA From Student where UserID = @id";
            getGPA.Parameters.AddWithValue("id", id.Text);
            lblGPA.Text = getGPA.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getSAT = new System.Data.SqlClient.SqlCommand();
            getSAT.Connection = localDB;
            getSAT.CommandText = "Select SAT From Student where UserID = @id";
            getSAT.Parameters.AddWithValue("id", id.Text);
            lblSAT.Text = getSAT.ExecuteScalar().ToString();

            System.Data.SqlClient.SqlCommand getInterest = new System.Data.SqlClient.SqlCommand();
            getInterest.Connection = localDB;
            getInterest.CommandText = "Select IndustryInterests From Student where UserID = @id";
            getInterest.Parameters.AddWithValue("id", id.Text);
            lblInterest.Text = getInterest.ExecuteScalar().ToString();

            localDB.Close();
        }
        catch
        {
            lblTitle1.InnerText = "";
            lblDescription.Text = "";
            lblResponsibilities.Text = "";
            lblQualifications.Text = "";
            lblDepartment.Text = "";
            lblLocation.Text = "";
        }
    }

    //delete post
    protected void DeleteApp_Click(object sender, EventArgs e)
    {
        localDB.Open();

        System.Data.SqlClient.SqlCommand deletedApp = new System.Data.SqlClient.SqlCommand();
        deletedApp.Connection = localDB;
        deletedApp.CommandText = "DELETE FROM App where AppID = @id";
        deletedApp.Parameters.AddWithValue("id", id.Text);
        deletedApp.ExecuteNonQuery();

        localDB.Close();
        showData();
    }

    protected void Hire_Click(object sender, EventArgs e)
    {
        try
        {

            localDB.Open();

            System.Data.SqlClient.SqlCommand HireApp = new System.Data.SqlClient.SqlCommand();
            HireApp.Connection = localDB;
            HireApp.CommandText = "Update App set Hired = @hired where AppID = @id";
            HireApp.Parameters.AddWithValue("hired", "Hired");
            HireApp.Parameters.AddWithValue("id", id.Text);
            HireApp.ExecuteNonQuery();

            localDB.Close();
            showData();
        }
        catch
        {

        }
    }

    protected void Reactivate_Click(object sender, EventArgs e)
    {
        try
        {     
        localDB.Open();    
        System.Data.SqlClient.SqlCommand deletePost = new System.Data.SqlClient.SqlCommand();
        deletePost.Connection = localDB;
        deletePost.CommandText = "DELETE FROM DeleteApp where AppID = @id";
        deletePost.Parameters.AddWithValue("id", id.Text);
        deletePost.ExecuteNonQuery();       
        localDB.Close();
        showData();
        }
        catch
        {

        }
        showData();

    }

    protected void openApp()
    {   //cole
        if (id.Text == 1.ToString())
        {
            Image1.Attributes["src"] = ResolveUrl("pages/assets/img/cole.png");
        }
        //wang
        if (id.Text == 2.ToString())
        {
            Image1.Attributes["src"] = ResolveUrl("pages/assets/img/wang.png");
        }
        //barlow
        if (id.Text == 3.ToString())
        {
            Image1.Attributes["src"] = ResolveUrl("pages/assets/img/john.png");
        }
        //shelly
        if (id.Text == 4.ToString())
        {
            Image1.Attributes["src"] = ResolveUrl("pages/assets/img/shellyResume.png");
        }
        //seth
        if (id.Text == 5.ToString())
        {
            Image1.Attributes["src"] = ResolveUrl("pages/assets/img/seth.png");
        }
        //becky
        if (id.Text == 6.ToString())
        {
            Image1.Attributes["src"] = ResolveUrl("pages/assets/img/becky2.png");
        }

    }

    //protected void openApp()
    //{
    //    localDB.Open();
    //    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
    //    cmd.Connection = localDB;
    //    cmd.CommandText = "Execute spGetImageById @id";
    //    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id.Text;
    //    cmd.ExecuteNonQuery();       
    //    byte[] bytes = (byte[])cmd.ExecuteScalar();
    //        string strBase64 = Convert.ToBase64String(bytes);
    //        Image1.ImageUrl = "data:Image/png;base64," + strBase64;
    //    localDB.Close();
    //}

    //private void LoadImages()
    //{
    //    localDB.Open();
    //    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
    //    cmd.Connection = localDB;        
    //    cmd.CommandText = "Select * from Users";
    //    SqlDataReader rdr = cmd.ExecuteReader();
    //    GridView1.DataSource = rdr;
    //    GridView1.DataBind();
        
    //}
}


