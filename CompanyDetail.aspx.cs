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
            this.BindGridCompany();
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
            ddlCompanyState.DataSource = reader;
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
            SqlDataReader reader = cmd.ExecuteReader();
            ddlCompanyCity.DataSource = reader;
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
            SqlDataReader reader = cmd.ExecuteReader();
            ddlIndustry.DataSource = reader;
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

        if (btnRegistrainSubmit.Text == "Submit")
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            cmd = new SqlCommand("Usp_insertCompanyRegistration", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CompanyName", TxtCompanyName.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyRegistrationNumber", txtCompanyRagistrationNum.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyIndustry", ddlIndustry.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CompanyPersonName", txtCompanyContectPersonName.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyPersonNumber", txtCompanyContectPersonNum.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyPersonEmail", txtCompanyContectPersonEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyStateName", ddlCompanyState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CompanyStateCity", ddlCompanyCity.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CompanyAddress", txtCompanyAddress.Text.Trim());


            try
            {
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                lblSuccessMsg.Visible = true;
                lblErrorMsg.Visible = false;
            }
            catch (Exception)
            {
                lblSuccessMsg.Visible = false;
                lblErrorMsg.Visible = true;
            }

            GridView1.DataBind();
            conn.Close();
            BindGridCompany();

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
        else if (btnRegistrainSubmit.Text == "Update")
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
            cmd = new SqlCommand("Usp_UpdateCompanyRow", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ID", ViewState["glblID"]);
            cmd.Parameters.AddWithValue("@CompanyName", TxtCompanyName.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyRegistrationNumber", txtCompanyRagistrationNum.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyIndustry", ddlIndustry.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CompanyPersonName", txtCompanyContectPersonName.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyPersonNumber", txtCompanyContectPersonNum.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyPersonEmail", txtCompanyContectPersonEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyStateName", ddlCompanyState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CompanyStateCity", ddlCompanyCity.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CompanyAddress", txtCompanyAddress.Text.Trim());
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();


            sda.Fill(ds);
            GridView1.DataBind();
            conn.Close();

            TxtCompanyName.Text = "";
            txtCompanyRagistrationNum.Text = "";
            ddlIndustry.SelectedValue = "0";
            txtCompanyContectPersonName.Text = "";
            txtCompanyContectPersonNum.Text = "";
            txtCompanyContectPersonEmail.Text = "";
            ddlCompanyState.SelectedValue = "0";
            ddlCompanyCity.SelectedValue = "0";
            txtCompanyAddress.Text = "";

            btnRegistrainSubmit.Text = "Submit";
            BindGridCompany();

        }
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
            var aa = glblID.Text;
            Label glblCompanyName = (Label)row.FindControl("glblCompanyName");
            Label glblCompanyRegistrationNumber = (Label)row.FindControl("glblCompanyRegistrationNumber");
            Label glblCompanyIndustry = (Label)row.FindControl("glblCompanyIndustry");
            Label glblCompanyPersonName = (Label)row.FindControl("glblCompanyPersonName");
            Label glblCompanyPersonNumbar = (Label)row.FindControl("glblCompanyPersonNumbar");
            Label glblCompanyPersonEmail = (Label)row.FindControl("glblCompanyPersonEmail");
            Label glblCompanyState = (Label)row.FindControl("glblCompanyState");
            Label glblCompanyCity = (Label)row.FindControl("glblCompanyCity");
            Label glblCompanyAdderss = (Label)row.FindControl("glblCompanyAdderss");

            TxtCompanyName.Text = glblCompanyName.Text;
            txtCompanyRagistrationNum.Text = glblCompanyRegistrationNumber.Text;
           
            ddlIndustry.ClearSelection(); 
            ListItem newItem = new ListItem(glblCompanyIndustry.Text, "aa"); 
            ddlIndustry.Items.Add(newItem); 
            newItem.Selected = true;

            txtCompanyContectPersonName.Text = glblCompanyPersonName.Text;
            txtCompanyContectPersonNum.Text = glblCompanyPersonNumbar.Text;
            txtCompanyContectPersonEmail.Text = glblCompanyPersonEmail.Text;
           
            ddlCompanyState.ClearSelection();
            ListItem newItem2 = new ListItem(glblCompanyState.Text, "aa"); 
            ddlCompanyState.Items.Add(newItem2);
            newItem2.Selected = true;

            ddlCompanyCity.ClearSelection(); 
            ListItem newItem3 = new ListItem(glblCompanyCity.Text, "aa"); 
            ddlCompanyCity.Items.Add(newItem3); 
            newItem3.Selected = true;


            txtCompanyAddress.Text = glblCompanyAdderss.Text;

            btnRegistrainSubmit.Text = "Update";
        }
        else if (e.CommandName == "DeleteRecord")
        {
            string commandArgument = e.CommandArgument.ToString();
            int id;
            if (int.TryParse(commandArgument, out id))

            {
                string query = "DELETE FROM tblCompanyRegistration1 WHERE ID = @ID";
                string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;


                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ID", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                this.BindGridCompany();
            }
        }
    }
}
