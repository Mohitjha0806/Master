using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class AddNewEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindDepartment();
            BindState();
            BindEmployee();
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
        ShowEmployeedataSamePage.DataSource = dt;
        ShowEmployeedataSamePage.DataBind();
    }

    protected void BindEmployee()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("UspGetEmployeeData", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        ShowEmployeedataSamePage.DataSource = ds;
        ShowEmployeedataSamePage.DataBind();
    }




    protected void btnSaveEmployeeRegistration_Click(object sender, EventArgs e)
    {
        //try
        //{

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
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                string msg = row["Msg"].ToString();
                string errorMsg = row["ErrorMsg"].ToString();

                if (msg == "OK")
                {
                    lblAlertMsgSuccess.Visible = true;
                    lblErrorMsg1.Text = errorMsg;
                    lblAlertMsgError.Visible = false;
                }
                else if (msg == "ERROR")
                {
                    lblAlertMsgError.Visible = true;
                    lblErrorMsg2.Text = errorMsg;
                    lblAlertMsgSuccess.Visible = false;
                }

            }

            //txtCompanyRagistrationNum.Text = "";
            //txtEmpID.Text = "";
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
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("", conn);
            conn.Open();
            cmd = new SqlCommand("Usp_UpdateEmployeeRow", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ID", ViewState["glblID"]);
            //cmd.Parameters.AddWithValue("@CompanyRegistrationNumber", txtCompanyRagistrationNum.Text.Trim());
            //cmd.Parameters.AddWithValue("@EmployeeID", txtEmpID.Text.Trim());
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
            ShowEmployeedataSamePage.DataBind();
            conn.Close();



            //txtCompanyRagistrationNum.Text = "";
            //txtEmpID.Text = "";
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
            btnSaveEmployeeRegistration.Text = "Submit";
        }

    }


    //catch (Exception ex)
    //{
    //    Response.Write("Error: " + ex.Message);
    //}










    protected void ShowEmployeedataSamePage_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

        if (e.CommandName == "UpdateRecord")
        {


            Label glblID = (Label)row.FindControl("glblID");
            ViewState["glblID"] = glblID.Text;
            var aa = glblID.Text;

            Label glblEmployeeID = (Label)row.FindControl("glblEmployeeID");
            Label glblSelectEmployeeDepartment = (Label)row.FindControl("glblSelectEmployeeDepartment");
            Label glblSelectEmployeeShift = (Label)row.FindControl("glblSelectEmployeeShift");
            Label glblSelectEmployeePosition = (Label)row.FindControl("glblSelectEmployeePosition");
            Label glblDateOfJJoining = (Label)row.FindControl("glblDateOfJJoining");
            Label glblEmployeeFullName = (Label)row.FindControl("glblEmployeeFullName");
            Label glblEmployeeNumber = (Label)row.FindControl("glblEmployeeNumber");
            Label glblEmployeeEmail = (Label)row.FindControl("glblEmployeeEmail");
            Label glblSelectEmployeeGender = (Label)row.FindControl("glblSelectEmployeeGender");
            Label glblSelectEmployeeState = (Label)row.FindControl("glblSelectEmployeeState");
            Label glblSelectEmployeeCity = (Label)row.FindControl("glblSelectEmployeeCity");
            Label glblEmployeeAddress = (Label)row.FindControl("glblEmployeeAddress");
            Label glblEmployeeCTC = (Label)row.FindControl("glblEmployeeCTC");

            txtEmpID.Text = glblEmployeeID.Text;
            txtEmployeeDOJ.Text = glblDateOfJJoining.Text;
            txtEmpName.Text = glblEmployeeFullName.Text;
            txtEmployeeContectNum.Text = glblEmployeeNumber.Text;
            txtEmployeeContectEmail.Text = glblEmployeeEmail.Text;
            txtEmployeeAddress.Text = glblEmployeeAddress.Text;
            txtEmployeeCTC.Text = glblEmployeeCTC.Text;



            ddlEmployeeShift.ClearSelection();
            ListItem newItem1 = new ListItem(glblSelectEmployeeShift.Text, "aa");
            ddlEmployeeShift.Items.Add(newItem1);
            newItem1.Selected = true;

            ddlEmployeeDepartment.ClearSelection();
            ListItem newItem2 = new ListItem(glblSelectEmployeeDepartment.Text, "aa");
            ddlEmployeeDepartment.Items.Add(newItem2);
            newItem2.Selected = true;


            //ddlEmployeePosition.ClearSelection();
            //ListItem newItem3 = new ListItem(glblSelectEmployeePosition.Text, "aa");
            //ddlEmployeePosition.Items.Add(newItem3);
            //newItem3.Selected = true;

            ddlEmployeeGender.ClearSelection();
            ListItem newItem4 = new ListItem(glblSelectEmployeeGender.Text, "aa");
            ddlEmployeeGender.Items.Add(newItem4);
            newItem4.Selected = true;

            ddlEmployeeState.ClearSelection();
            ListItem newItem5 = new ListItem(glblSelectEmployeeState.Text, "aa");
            ddlEmployeeState.Items.Add(newItem5);
            newItem5.Selected = true;

            //ddlEmployeeCity.ClearSelection();
            //ListItem newItem6 = new ListItem(glblSelectEmployeeCity.Text, "aa");
            //ddlEmployeeCity.Items.Add(newItem6);
            //newItem6.Selected = true;

            btnSaveEmployeeRegistration.Text = "Update";


        }
        else if (e.CommandName == "DeleteRecord")
        {
            string commandArgument = e.CommandArgument.ToString();
            int id;

            if (int.TryParse(commandArgument, out id))
            {
                string query = "DELETE FROM tblEmployeeRegistration1 WHERE ID = @ID";
                string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    SuccessMsgDeleteEmp1.Visible = true;
                    ErrorMsgDeleteEmp.Visible = false;
                }
                catch (Exception)
                {
                    ErrorMsgDeleteEmp.Visible = true;
                    SuccessMsgDeleteEmp1.Visible = false;
                }

                con.Close();

            }
        }
        BindEmployee();
    }

}