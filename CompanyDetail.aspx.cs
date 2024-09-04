using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompanyDetail : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindState();
        }
    }
    private void BindState()
    {
        using(SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("uspGetState", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ddlCompanystate.DataSource = reader;
            ddlCompanystate.DataTextField = "StateName";
            ddlCompanystate.DataValueField = "StateID";
            ddlCompanystate.DataBind();
        }
        ddlCompanystate.Items.Insert(0, new ListItem("Select State", "0"));
    }
    private void BindCity(int StateID)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("uspGetCityByState", conn);
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

    protected void ddlCompanystate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.TryParse(ddlCompanystate.SelectedValue, out int stateId) && stateId > 0)
        {
            BindCity(stateId);
        }
        else
        {
            ddlCompanyCity.Items.Clear();
        }
    }


}
