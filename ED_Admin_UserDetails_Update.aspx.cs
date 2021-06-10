using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ED_Admin_UserDetails_Update : System.Web.UI.Page
{
    DataRow row = null;
    String qs = "";
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EDConn"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataTable table = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Default.aspx", true);
        }
        else
        {
            Session["user_id"] = Session["user_id"].ToString();
            Session["user_name"] = Session["user_name"].ToString();
            Session["user_email"] = Session["user_email"].ToString();
        }

        if (!Page.IsPostBack)
        {

            //bind dropdownlist
            bindStatus();
            bindRole();
            bindReporting01();
            bindReporting02();
            bindReporting03();

            //select from database
            qs = "";
            qs = qs + " SELECT          tbl_declare_user.* ";
            qs = qs + " FROM            tbl_declare_user ";
            qs = qs + " WHERE           staff_ic = @pstaff_ic";
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            cmd = new SqlCommand(qs, con);
            cmd.Parameters.AddWithValue("@pstaff_ic", Request.QueryString["rid"].ToString());
            cmd.CommandTimeout = 0;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count > 0)
            {
                row = null;
                row = dt.Rows[0];

                //status


                fldICNO.Text = row["staff_ic"].ToString();
                fldSName.Text = row["staff_name"].ToString();
                fldEmail.Text = row["email_address"].ToString();
                fldPosition.Text = row["position"].ToString();
                fldDivision.Text = row["division"].ToString();
                fldDepartment.Text = row["department"].ToString();
                fldSection.Text = row["section"].ToString();
                fldRole.SelectedValue = row["role"].ToString();
                fldStatus.SelectedValue = row["status"].ToString();
                fldReport1.SelectedValue = row["reporting1"].ToString();
                fldReport2.SelectedValue = row["reporting2"].ToString();
                fldReport3.SelectedValue = row["reporting3"].ToString();

            }
        }
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        HtmlGenericControl li1 = (HtmlGenericControl)Page.Master.FindControl("menulist").FindControl("menu11");
        HtmlGenericControl li2 = (HtmlGenericControl)Page.Master.FindControl("menulist").FindControl("menu12");
        HtmlGenericControl li3 = (HtmlGenericControl)Page.Master.FindControl("menulist").FindControl("menu13");
        HtmlGenericControl li4 = (HtmlGenericControl)Page.Master.FindControl("menulist").FindControl("menu14");
        HtmlGenericControl li5 = (HtmlGenericControl)Page.Master.FindControl("menulist").FindControl("menu15");

        li1.Attributes["class"] = "nav-item";
        li2.Attributes["class"] = "nav-item dropdown";
        li3.Attributes["class"] = "nav-item";
        li4.Attributes["class"] = "nav-item";
        li5.Attributes["class"] = "nav-item dropdown active";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //update database 
        qs = "";
        qs = qs + " UPDATE  tbl_declare_user ";
        qs = qs + " SET ";
        qs = qs + " staff_name = @pstaff_name, ";
        qs = qs + " email_address = @pemail_address, ";
        qs = qs + " position = @pposition, ";
        qs = qs + " division = @pdivision, ";
        qs = qs + " department = @pdepartment, ";
        qs = qs + " section = @psection, ";
        qs = qs + " role = @prole, ";
        qs = qs + " reporting1 = @preporting1, ";
        qs = qs + " reporting2 = @preporting2, ";
        qs = qs + " reporting3 = @preporting3, ";
        qs = qs + " status = @status ";
        qs = qs + " WHERE staff_ic = @pstaff_ic ";
        if (con.State == System.Data.ConnectionState.Closed)
        { con.Open(); }
        cmd = new SqlCommand(qs, con);
        cmd.CommandTimeout = 0;
        cmd.Parameters.AddWithValue("@pstaff_ic", fldICNO.Text);
        cmd.Parameters.AddWithValue("@pstaff_name", fldSName.Text);
        cmd.Parameters.AddWithValue("@pemail_address", fldEmail.Text.ToLower());
        cmd.Parameters.AddWithValue("@pposition", fldPosition.Text);
        cmd.Parameters.AddWithValue("@pdivision", fldDivision.Text);
        cmd.Parameters.AddWithValue("@pdepartment", fldDepartment.Text);
        cmd.Parameters.AddWithValue("@psection", fldSection.Text);
        cmd.Parameters.AddWithValue("@prole", fldRole.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@preporting1", fldReport1.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@preporting2", fldReport2.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@preporting3", fldReport3.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@status", fldStatus.SelectedValue.ToString());
        cmd.ExecuteNonQuery();
        con.Close();

        //redirect to page
        Response.Redirect("ED_Admin_UserDetails_Update_List.aspx");

    }

    protected void bindStatus()
    {
        // Bind data to the dropdownlist control.
        fldStatus.Items.Insert(0, new ListItem("Active", "1"));
        fldStatus.Items.Insert(1, new ListItem("In-Active", "0"));
    }

    protected void bindRole()
    {
        // Bind data to the dropdownlist control.
        fldRole.Items.Insert(0, new ListItem("User", ""));
        fldRole.Items.Insert(1, new ListItem("HOD", "hod"));
    }

    protected void bindReporting01()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT          staff_ic, staff_name ";
        qs = qs + " FROM            tbl_declare_user ";
        qs = qs + " WHERE           status = '1' AND role = 'hod' ";
        qs = qs + " ORDER BY        staff_name ";
        fldReport1.DataSource = GetData(qs);
        fldReport1.DataTextField = "staff_name";
        fldReport1.DataValueField = "staff_ic";
        fldReport1.DataBind();
        fldReport1.Items.Insert(0, new ListItem("-- Please select one --", ""));
    }

    protected void bindReporting02()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT          staff_ic, staff_name ";
        qs = qs + " FROM            tbl_declare_user ";
        qs = qs + " WHERE           status = '1' AND role = 'hod' ";
        qs = qs + " ORDER BY        staff_name ";
        fldReport2.DataSource = GetData(qs);
        fldReport2.DataTextField = "staff_name";
        fldReport2.DataValueField = "staff_ic";
        fldReport2.DataBind();
        fldReport2.Items.Insert(0, new ListItem("-- Please select one --", ""));
    }

    protected void bindReporting03()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT          staff_ic, staff_name ";
        qs = qs + " FROM            tbl_declare_user ";
        qs = qs + " WHERE           status = '1' AND role = 'hod' ";
        qs = qs + " ORDER BY        staff_name ";
        fldReport3.DataSource = GetData(qs);
        fldReport3.DataTextField = "staff_name";
        fldReport3.DataValueField = "staff_ic";
        fldReport3.DataBind();
        fldReport3.Items.Insert(0, new ListItem("-- Please select one --", ""));
    }

    public DataSet GetData(string queryString)
    {
        // Retrieve the connection string stored in the Web.config file.
        DataSet ds = new DataSet();
        try
        {
            // Connect to the database and run the query.
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, con);

            // Fill the DataSet.
            adapter.Fill(ds);
            con.Close();
        }
        catch (SqlException SqlEx)
        {
            Debug.WriteLine("Errors Count:" + SqlEx.Errors.Count);
        }
        return ds;
    }

    
}