using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddNewEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDepartment();
        }
    }

    protected void BindDepartment()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("UspGetDepartment", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ddlEmployeeDepartment.DataSource = reader;
            ddlEmployeeDepartment.DataTextField = "DepartmentName";
            ddlEmployeeDepartment.DataValueField = "DepartmentID";
            ddlEmployeeDepartment.DataBind();
            reader.Close();
        }
        ddlEmployeeDepartment.Items.Insert(0, new ListItem("Select Department", "0"));
    }

    protected void BindPosition(int DepartmentID)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("usp_GetPositionByDepartment", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ddlEmployeePosition.DataSource = reader;
            ddlEmployeePosition.DataTextField = "PositionName";
            ddlEmployeePosition.DataValueField = "PositionID";
            ddlEmployeePosition.DataBind();
            reader.Close();
        }
        ddlEmployeePosition.Items.Insert(0, new ListItem("Select Position", "0"));
    }

    protected void ddlEmployeeDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.TryParse(ddlEmployeeDepartment.SelectedValue, out int DepartmentID) && DepartmentID > 0)
        {
            ddlEmployeePosition.Items.Clear();
            BindPosition(DepartmentID);
        }
        else
        {
            ddlEmployeePosition.Items.Clear();
            ddlEmployeePosition.Items.Insert(0, new ListItem("Select Position", "0"));
        }
    }
}
