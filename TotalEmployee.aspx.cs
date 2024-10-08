﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TotalEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGridTotal();
    }


    public void BindGridTotal()
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