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
            BindState();
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

    private void BindState()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("uspGetState", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ddlEmployeeState.DataSource = reader;
            ddlEmployeeState.DataTextField = "StateName";
            ddlEmployeeState.DataValueField = "StateID";
            ddlEmployeeState.DataBind();
        }
        ddlEmployeeState.Items.Insert(0, new ListItem("Select State", "0"));
    }
    private void BindCity(int StateID)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("usp_SetCityByState", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StateID", StateID);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ddlEmployeeCity.DataSource = reader;
            ddlEmployeeCity.DataTextField = "CityName";
            ddlEmployeeCity.DataValueField = "CityID";
            ddlEmployeeCity.DataBind();
        }
        ddlEmployeeCity.Items.Insert(0, new ListItem("Select City", "0"));
    }



    protected void ddlEmployeeState_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.TryParse(ddlEmployeeState.SelectedValue, out int stateId) && stateId > 0)
        {
            BindCity(stateId);
        }
        else
        {
            ddlEmployeeCity.Items.Clear();
        }
    }


}
