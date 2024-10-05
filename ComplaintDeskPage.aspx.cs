using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ComplaintDeskPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ComplaintGrid();
    }

    protected void ComplaintGrid()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("GetComplaintData", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridViewComplaintDesk.DataSource = dt;
        GridViewComplaintDesk.DataBind();

    }
}