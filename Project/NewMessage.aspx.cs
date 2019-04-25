using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class NewMessage : System.Web.UI.Page
{
    SqlConnection localDB = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localDB"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView1.SelectedRow;
        mainViewContactSchool.InnerText = row.Cells[1].Text;
       

        GridView1.SelectedRowStyle.CssClass = "bg-primary text-white";


    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView2.SelectedRow;
        mainViewContactSchool.InnerText = row.Cells[1].Text;
    }

    protected void ChangeMain_Click(object sender, EventArgs e)
    {
        
    }
}