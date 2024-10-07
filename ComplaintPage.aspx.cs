using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Compalint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void btnSaveEmployeeRegistration_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("UspInsertComplaints", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ComplaintDate", txtComplaintDate.Text.Trim());
        cmd.Parameters.AddWithValue("@ComplaintTime", txtComplaintTime.Text.Trim());
        cmd.Parameters.AddWithValue("@ComplaintType", ddlComplaintType.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@ComplaintAgainstEmployeeID", txtComplaintAgainstID.Text.Trim());
        cmd.Parameters.AddWithValue("@YourFirstName", txtComplainerFirstName.Text.Trim());
        cmd.Parameters.AddWithValue("@YourLastName", txtComplainerLastName.Text.Trim());
        cmd.Parameters.AddWithValue("@PhoneNumber", txtComplainerPhone.Text.Trim());
        cmd.Parameters.AddWithValue("@Email", txtComplainerEmail.Text.Trim());
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());

        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        try
        {
            sda.Fill(dt);
            lblComplaintSuccessMsg.Visible = true;
        }
        catch (Exception)
        {
            lblComplaintErrorMsg.Visible = true;

        }

        txtComplaintDate.Text = "";
        txtComplaintTime.Text = "";
        ddlComplaintType.SelectedValue = "";
        txtComplaintAgainstID.Text = "";
        txtComplainerFirstName.Text = "";
        txtComplainerLastName.Text = "";
        txtComplainerPhone.Text = "";
        txtComplainerEmail.Text = "";
        txtAddress.Text = "";

    }
}