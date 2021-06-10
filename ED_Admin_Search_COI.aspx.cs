using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ED_Admin_Search_COI : System.Web.UI.Page
{
    DataRow row = null;
    String qs = "";
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EDConn"].ConnectionString);
    SqlCommand cmd = new SqlCommand();

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
            bindCOI();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //bind gridview
        DataView dv = GetdataListing(fldDeclareNo.Text, fldStatus.SelectedValue, fldICNo.Text, fldName.Text, fldSDeclareDate.Text, fldEDeclareDate.Text, fldCOIType.SelectedValue);
        gvListing.DataSource = dv;
        gvListing.DataBind();
    }


    private DataView GetdataListing(String sDno, String sSts, String sICNo, String sName, String sSDdt, String sEDdt, String sCOI)
    {
        String paraQry = "";

        if (sDno != "")
            paraQry += " AND declare_no LIKE '%" + sDno + "%' ";

        if (sSts != "")
            paraQry += " AND status LIKE '%" + sSts + "%' ";

        if (sICNo != "")
            paraQry += " AND staff_ic LIKE '%" + sICNo + "%' ";

        if (sName != "")
            paraQry += " AND staff_ic_name LIKE '%" + sName + "%' ";

        if (sSDdt != "" || sEDdt != "")
        {
            if (sSDdt != "" && sEDdt != "")
            {
                if (sSDdt == sEDdt)
                {
                    //same date enter
                    paraQry += " AND cast(declare_date as date)  = '" + sSDdt + "' ";
                }
                else
                {
                    //diff date enter
                    paraQry += " AND cast(declare_date as date) BETWEEN  '" + sSDdt + "' AND '" + sEDdt + "' ";
                }
            }
            else if (sSDdt != "")
            {
                //start only enter
                paraQry += " AND cast(declare_date as date) >= '" + sSDdt + "' ";
            }
            else if (sEDdt != "")
            {
                //end only enter
                paraQry += " AND cast(declare_date as date) <= '" + sEDdt + "' ";
            }
            else
            {
                //do nothing
            }

        }

        if (sCOI != "")
            paraQry += " AND coi_flag LIKE '%" + sCOI + "%' ";

        qs = "";
        qs = qs + " SELECT          vw_form_report_detail.* ";
        qs = qs + " FROM            vw_form_report_detail ";
        qs = qs + " WHERE           declare_no IS NOT NULL " + paraQry;
        qs = qs + " ORDER BY        declare_date DESC ";
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
    protected void bindStatus()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT          drop_id, drop_desc ";
        qs = qs + " FROM            tbl_coi_dropdownlist ";
        qs = qs + " WHERE           drop_status = '1' AND drop_type = 'DeclareStatus' ";
        qs = qs + " ORDER BY        id ";
        fldStatus.DataSource = GetData(qs);
        fldStatus.DataTextField = "drop_desc";
        fldStatus.DataValueField = "drop_id";
        fldStatus.DataBind();
        fldStatus.Items.Insert(0, new ListItem("-- Please select one --", ""));
    }

    protected void bindCOI()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT          drop_id, drop_desc ";
        qs = qs + " FROM            tbl_coi_dropdownlist ";
        qs = qs + " WHERE           drop_status = '1' AND drop_type = 'DeclareType' ";
        qs = qs + " ORDER BY        id ";
        fldCOIType.DataSource = GetData(qs);
        fldCOIType.DataTextField = "drop_desc";
        fldCOIType.DataValueField = "drop_id";
        fldCOIType.DataBind();
        fldCOIType.Items.Insert(0, new ListItem("-- Please select one --", ""));
    }
   
    protected void gvListing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvListing.PageIndex = e.NewPageIndex;
        gvListing.DataSource = GetdataListing(fldDeclareNo.Text, fldStatus.SelectedValue, fldICNo.Text, fldName.Text, fldSDeclareDate.Text, fldEDeclareDate.Text, fldCOIType.SelectedValue);
        gvListing.DataBind();
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

    protected void lblDeclareNo_DataBinding(object sender, EventArgs e)
    {
        Label lt = (Label)sender;
        lt.Text = "<a href='ED_User_View_Declare_COI.aspx?rid=" + Eval("declare_no") + "&rpid=" + Eval("staff_ic") + "'>" + Eval("declare_no") + "</a>";
    }
}