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

public partial class ED_Admin_UserDetails_Update_List : System.Web.UI.Page
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
            bindDivision();
            bindDepartment();

            //bind gridview
            DataView dv = GetdataListing(fldStaff.Text, fldDivision.SelectedValue, fldDepartment.SelectedValue);
            gvListing.DataSource = dv;
            gvListing.DataBind();
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //bind gridview
        DataView dv = GetdataListing(fldStaff.Text, fldDivision.SelectedValue, fldDepartment.SelectedValue);
        gvListing.DataSource = dv;
        gvListing.DataBind();
    }

    private DataView GetdataListing(String sNameNo, String sDiv, String sDept)
    {
        String paraQry = "";

        if (sNameNo != "")
            paraQry += " AND ( staff_ic LIKE '%" + sNameNo + "%' OR staff_name LIKE '%" + sNameNo + "%' )";

        if(sDiv != "")
            paraQry += " AND division LIKE '%" + sDiv + "%' ";

        if (sDept != "")
            paraQry += " AND department LIKE '%" + sDept + "%' ";

        qs = "";
        qs = qs + " SELECT          * ";
        qs = qs + " FROM            tbl_declare_user ";
        qs = qs + " WHERE           staff_ic IS NOT NULL " + paraQry;
        qs = qs + " ORDER BY        staff_name ";
        if (con.State == System.Data.ConnectionState.Closed)
        { con.Open(); }
        cmd = new SqlCommand(qs, con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        DataView dv = new DataView(dt);
        return dv;
    }

    protected void lblStaffICNO_DataBinding(object sender, EventArgs e)
    {
        Label lt = (Label)sender;
        lt.Text = "<a href='ED_Admin_UserDetails_Update.aspx?rid=" + Eval("staff_ic") + "'>" + Eval("staff_ic") + "</a>";
    }

    protected void gvListing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvListing.PageIndex = e.NewPageIndex;
        gvListing.DataSource = GetdataListing(fldStaff.Text, fldDivision.SelectedValue, fldDepartment.SelectedValue);
        gvListing.DataBind();
    }

    protected void bindDivision()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT DISTINCT     division ";
        qs = qs + " FROM                tbl_declare_user ";
        qs = qs + " ORDER BY            division ";
        fldDivision.DataSource = GetData(qs);
        fldDivision.DataTextField = "division";
        fldDivision.DataValueField = "division";
        fldDivision.DataBind();
        fldDivision.Items.Insert(0, new ListItem("-- Select Division --", ""));
    }

    protected void bindDepartment()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT DISTINCT     department ";
        qs = qs + " FROM                tbl_declare_user ";
        qs = qs + " ORDER BY            department ";
        fldDepartment.DataSource = GetData(qs);
        fldDepartment.DataTextField = "department";
        fldDepartment.DataValueField = "department";
        fldDepartment.DataBind();
        fldDepartment.Items.Insert(0, new ListItem("-- Select Department --", ""));
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