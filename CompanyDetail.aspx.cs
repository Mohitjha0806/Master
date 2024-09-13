using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompanyDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindState();
            BindCompanyIndustry();
            BindGridCompany();
        }
    }

    private void BindState()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("uspGetState", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            ddlCompanyState.DataSource = cmd.ExecuteReader();
            ddlCompanyState.DataTextField = "StateName";
            ddlCompanyState.DataValueField = "StateID";
            ddlCompanyState.DataBind();
        }
        ddlCompanyState.Items.Insert(0, new ListItem("Select State", "0"));
    }

    private void BindCity(int StateID)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("usp_SetCityByState", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StateID", StateID);
            conn.Open();
            ddlCompanyCity.DataSource = cmd.ExecuteReader();
            ddlCompanyCity.DataTextField = "CityName";
            ddlCompanyCity.DataValueField = "CityID";
            ddlCompanyCity.DataBind();
        }
        ddlCompanyCity.Items.Insert(0, new ListItem("Select City", "0"));
    }

    protected void ddlCompanyState_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.TryParse(ddlCompanyState.SelectedValue, out int stateId) && stateId > 0)
        {
            BindCity(stateId);
        }
        else
        {
            ddlCompanyCity.Items.Clear();
        }
    }

    private void BindCompanyIndustry()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("Usp_GetCompanyIndustries", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            ddlIndustry.DataSource = cmd.ExecuteReader();
            ddlIndustry.DataTextField = "IndustryName";
            ddlIndustry.DataValueField = "ID";
            ddlIndustry.DataBind();
        }
        ddlIndustry.Items.Insert(0, new ListItem("Select Industry", "0"));
    }

    protected void BindGridCompany()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("Usp_GetGridData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }

    protected void btnRegistrainSubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        cmd = new SqlCommand(btnRegistrainSubmit.Text == "Submit" ? "Usp_insertCompanyRegistration" : "Usp_UpdateCompanyRow", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        if (btnRegistrainSubmit.Text == "Update")
        {
            cmd.Parameters.AddWithValue("@ID", ViewState["glblID"]);
        }

        cmd.Parameters.AddWithValue("@CompanyName", TxtCompanyName.Text.Trim());
        cmd.Parameters.AddWithValue("@CompanyRegistrationNumber", txtCompanyRagistrationNum.Text.Trim());
        cmd.Parameters.AddWithValue("@CompanyIndustry", ddlIndustry.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@CompanyPersonName", txtCompanyContectPersonName.Text.Trim());
        cmd.Parameters.AddWithValue("@CompanyPersonNumber", txtCompanyContectPersonNum.Text.Trim());
        cmd.Parameters.AddWithValue("@CompanyPersonEmail", txtCompanyContectPersonEmail.Text.Trim());
        cmd.Parameters.AddWithValue("@CompanyStateName", ddlCompanyState.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@CompanyStateCity", ddlCompanyCity.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@CompanyAddress", txtCompanyAddress.Text.Trim());

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        BindGridCompany();

        ClearForm();
        btnRegistrainSubmit.Text = "Submit";
    }

    private void ClearForm()
    {
        TxtCompanyName.Text = "";
        txtCompanyRagistrationNum.Text = "";
        ddlIndustry.SelectedValue = "0";
        txtCompanyContectPersonName.Text = "";
        txtCompanyContectPersonNum.Text = "";
        txtCompanyContectPersonEmail.Text = "";
        ddlCompanyState.SelectedValue = "0";
        ddlCompanyCity.SelectedValue = "0";
        txtCompanyAddress.Text = "";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        conn.Open();
        SqlCommand cmd;
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

        if (e.CommandName == "UpdateRecord")
        {
            Label glblID = (Label)row.FindControl("glblID");
            ViewState["glblID"] = glblID.Text;

            SetFormValues(row);

            btnRegistrainSubmit.Text = "Update";
        }
        else if (e.CommandName == "DeleteRecord")
        {
            string query = "DELETE FROM tblCompanyRegistration WHERE ID = @ID";
            using (cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@ID", e.CommandArgument.ToString());
                cmd.ExecuteNonQuery();
            }
            BindGridCompany();
        }
    }

    private void SetFormValues(GridViewRow row)
    {
        TxtCompanyName.Text = ((Label)row.FindControl("glblCompanyName")).Text;
        txtCompanyRagistrationNum.Text = ((Label)row.FindControl("glblCompanyRegistrationNumber")).Text;
        txtCompanyContectPersonName.Text = ((Label)row.FindControl("glblCompanyPersonName")).Text;
        txtCompanyContectPersonNum.Text = ((Label)row.FindControl("glblCompanyPersonNumbar")).Text;
        txtCompanyContectPersonEmail.Text = ((Label)row.FindControl("glblCompanyPersonEmail")).Text;
        txtCompanyAddress.Text = ((Label)row.FindControl("glblCompanyAdderss")).Text;

        SelectDropdownItem(ddlIndustry, ((Label)row.FindControl("glblCompanyIndustry")).Text);
        SelectDropdownItem(ddlCompanyState, ((Label)row.FindControl("glblCompanyState")).Text);
        SelectDropdownItem(ddlCompanyCity, ((Label)row.FindControl("glblCompanyCity")).Text);
    }

    private void SelectDropdownItem(DropDownList ddl, string value)
    {
        ddl.ClearSelection();
        ListItem newItem = new ListItem(value, "0");
        ddl.Items.Add(newItem);
        newItem.Selected = true;
    }

}
