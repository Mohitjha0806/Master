using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ShowEmployeeDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindEmployee();

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        int companyRegistrationNumber;
        if (int.TryParse(txtCompanyRegistrationNumber.Text.Trim(), out companyRegistrationNumber))
        {
            BindGrid(companyRegistrationNumber);
        }
        else
        {
        }

    }

    private void BindGrid(int companyRegistrationNumber)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("usp_GetCompanyRegistrationNumbertblEmployee", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CompanyRegistrationNumber", companyRegistrationNumber);
        conn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvEmployee.DataSource = dt;
        gvEmployee.DataBind();
    }

    protected void BindEmployee()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("UspGetEmployeeData", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        GridEmployeeData.DataSource = ds;
        GridEmployeeData.DataBind();
    }
}