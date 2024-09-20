using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Configuration;

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



    protected void btnSaveEmployeeRegistration_Click(object sender, EventArgs e)
    {
        try
        {

            if (btnSaveEmployeeRegistration.Text == "Save")
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                SqlCommand cmd = new SqlCommand("usp_InsertEmployeeRegistration", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CompanyRegistrationNumber", txtCompanyRagistrationNum.Text.Trim());
                cmd.Parameters.AddWithValue("@EmployeeID", txtEmpID.Text.Trim());
                cmd.Parameters.AddWithValue("@SelectEmployeeShift", ddlEmployeeShift.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@SelectEmployeeDepartment", ddlEmployeeDepartment.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@SelectEmployeePosition", ddlEmployeePosition.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@DateOfJJoining", txtEmployeeDOJ.Text.Trim());
                cmd.Parameters.AddWithValue("@EmployeeFullName", txtEmpName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmployeeNumber", txtEmployeeContectNum.Text.Trim());
                cmd.Parameters.AddWithValue("@EmployeeEmail", txtEmployeeContectEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@SelectEmployeeGender", ddlEmployeeGender.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@SelectEmployeeState", ddlEmployeeState.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@SelectEmployeeCity", ddlEmployeeCity.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@EmployeeAddress", txtEmployeeAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@EmployeeCTC", txtEmployeeCTC.Text.Trim());

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);


                txtCompanyRagistrationNum.Text = "";
                txtEmpID.Text = "";
                ddlEmployeeShift.SelectedValue = "0";
                ddlEmployeeDepartment.SelectedValue = "0";
                ddlEmployeePosition.SelectedValue = "0";
                txtEmployeeDOJ.Text = "";
                txtEmpName.Text = "";
                txtEmployeeContectNum.Text = "";
                txtEmployeeContectEmail.Text = "";
                ddlEmployeeGender.SelectedValue = "0";
                ddlEmployeeState.SelectedValue = "0";
                ddlEmployeeCity.SelectedValue = "0";
                txtEmployeeAddress.Text = "";
                txtEmployeeCTC.Text = "";

            }
            else if (btnSaveEmployeeRegistration.Text == "Update")
            {

            }
        }


        catch (Exception ex)
        {

            Response.Write("Error: " + ex.Message);
        }

    }

}
