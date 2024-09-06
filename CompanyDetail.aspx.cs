﻿using System;
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



    protected void ddlCompanystate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.TryParse(ddlCompanyState.Text, out int stateId) && stateId > 0)
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
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

    }
    protected void btnRegistrainSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("Usp_insertCompanyRegistration", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CompanyName", TxtCompanyName.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyRegistrationNumber", txtCompanyRagistrationNum.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyIndustry", (ddlIndustry.SelectedItem.Text));
            cmd.Parameters.AddWithValue("@CompanyPersonName", txtCompanyContectPersonName.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyPersonNumber", txtCompanyContectPersonNum.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyPersonEmail", txtCompanyContectPersonEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyStateName", (ddlCompanyState.SelectedItem.Text));
            cmd.Parameters.AddWithValue("@CompanyStateCity", (ddlCompanyCity.SelectedItem.Text));
            cmd.Parameters.AddWithValue("@CompanyAddress", txtCompanyAddress.Text.Trim());


            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            BindGridCompany();
        }
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
        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

        using(SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {

        }
    }
}









