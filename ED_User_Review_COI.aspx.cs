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

public partial class ED_User_Review_COI : System.Web.UI.Page
{
    DataRow rowA = null;
    DataRow rowB = null;
    String qs = "";
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EDConn"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataTable table = new DataTable();
    String[] pendingSubmit;
    String[] pendingClose;

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
            Int32 C01 = 0;
            Int32 C02 = 0;
            Int32 C03 = 0;
            Int32 C04 = 0;
            Int32 C05 = 0;
            Int32 C06 = 0;

            List<string> termsList = new List<string>();
            List<string> termsListC = new List<string>();

            DataView dv;
            DataView dvC;

            //select from database
            qs = "";
            qs = qs + " SELECT          staff_ic ";
            qs = qs + " FROM            tbl_declare_user ";
            qs = qs + " WHERE           reporting1 = @preporting OR reporting2 = @preporting OR reporting3 = @preporting ";
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            cmd = new SqlCommand(qs, con);
            cmd.Parameters.AddWithValue("@preporting", Session["user_id"].ToString());
            cmd.CommandTimeout = 0;
            SqlDataAdapter daA = new SqlDataAdapter(cmd);
            DataTable dtA = new DataTable();
            daA.Fill(dtA);
            con.Close();

            if (dtA.Rows.Count > 0)
            {
                for (int i = 0; i < dtA.Rows.Count; i++)
                {
                    rowA = null;
                    rowA = dtA.Rows[i];
                    C01 += 1; //Total Number of Employee

                    //select from database
                    qs = "";
                    qs = qs + " SELECT          * ";
                    qs = qs + " FROM            tbl_declare_form ";
                    qs = qs + " WHERE           staff_ic = @pstaff_ic ";
                    if (con.State == System.Data.ConnectionState.Closed)
                        con.Open();
                    cmd = new SqlCommand(qs, con);
                    cmd.Parameters.AddWithValue("@pstaff_ic", rowA["staff_ic"].ToString());
                    cmd.CommandTimeout = 0;
                    SqlDataAdapter daB = new SqlDataAdapter(cmd);
                    DataTable dtB = new DataTable();
                    daB.Fill(dtB);
                    con.Close();

                    if (dtB.Rows.Count > 0)
                    {
                        for (int j = 0; j < dtB.Rows.Count; j++)
                        {
                            
                            rowB = null;
                            rowB = dtB.Rows[j];

                            C02 += 1; //Total Submission

                            if (rowB["coi_flag"].ToString() == "Disclose")
                            {
                                C03 += 1; //Total COI Declared

                                if (rowB["status"].ToString() == "Submit")
                                {
                                    C04 += 1; //Total COI Pending Review
                                    termsList.Add(rowB["declare_no"].ToString() + "|" + rowB["staff_ic"].ToString());
                                }

                                if (rowB["status"].ToString() == "Recommend")
                                {
                                    C05 += 1; //Total COI Pending Closure
                                    termsListC.Add(rowB["declare_no"].ToString() + "|" + rowB["staff_ic"].ToString());
                                }

                                if (rowB["status"].ToString() == "Close")
                                {
                                    C06 += 1; //Total Closed COI
                                }
                            }
                        }
                    }
                }
            }

            //assign value to counter dashbord
            lblC1.Attributes.Add("data-to", C01.ToString());
            lblC2.Attributes.Add("data-to", C02.ToString());
            lblC3.Attributes.Add("data-to", C03.ToString());
            lblC4.Attributes.Add("data-to", C04.ToString());
            lblC5.Attributes.Add("data-to", C05.ToString());
            lblC6.Attributes.Add("data-to", C06.ToString());

            //convert to array
            pendingSubmit = termsList.ToArray();

            if (pendingSubmit.Length == 0)
            {
                //bind gridview
                dv = null;
                gvListing.DataSource = dv;
                gvListing.DataBind();
            }
            else
            {
                //bind gridview
                dv = GetdataListing(pendingSubmit);
                gvListing.DataSource = dv;
                gvListing.DataBind();
            }


            //convert to array
            pendingClose = termsListC.ToArray();

            if (pendingClose.Length == 0)
            {
                //bind gridview
                dvC = null;
                gvListingC.DataSource = dvC;
                gvListingC.DataBind();
            }
            else
            {
                //bind gridview
                dvC = GetdataListingC(pendingClose);
                gvListingC.DataSource = dvC;
                gvListingC.DataBind();
            }
            
            
            //bind gridview
            DataView dvs = GetdataStaffListing(Session["user_id"].ToString());
            gvStaffList.DataSource = dvs;
            gvStaffList.DataBind();
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
        li3.Attributes["class"] = "nav-item active";
        li4.Attributes["class"] = "nav-item";
        li5.Attributes["class"] = "nav-item dropdown";
    }

    private DataView GetdataListing(String[] arrayDeclare)
    {
        String paraID = "";

        //assign array to string
        for (int x = 0; x < arrayDeclare.Length; x++)
            paraID += "'" + arrayDeclare[x].ToString() + "',";
        paraID = paraID.Substring(0, paraID.Length - 1);

        qs = "";
        qs = qs + " SELECT          * ";
        qs = qs + " FROM            vw_form_report_detail ";
        qs = qs + " WHERE           ((declare_no + '|' + staff_ic) IN (" + paraID + ")) ";
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

    private DataView GetdataListingC(String[] arrayDeclareC)
    {
        String paraID = "";

        //assign array to string
        for (int x = 0; x < arrayDeclareC.Length; x++)
            paraID += "'" + arrayDeclareC[x].ToString() + "',";
        paraID = paraID.Substring(0, paraID.Length - 1);

        qs = "";
        qs = qs + " SELECT          * ";
        qs = qs + " FROM            vw_form_report_detail ";
        qs = qs + " WHERE           ((declare_no + '|' + staff_ic) IN (" + paraID + ")) ";
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

    private DataView GetdataStaffListing(String sid)
    {
        qs = "";
        qs = qs + " SELECT          * ";
        qs = qs + " FROM            tbl_declare_user ";
        qs = qs + " WHERE           reporting1 = @preporting OR reporting2 = @preporting OR reporting3 = @preporting ";
        qs = qs + " ORDER BY        staff_name ";
        if (con.State == System.Data.ConnectionState.Closed)
            con.Open();
        cmd = new SqlCommand(qs, con);
        cmd.Parameters.AddWithValue("@preporting", sid);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        DataView dv = new DataView(dt);
        return dv;
    }

    protected void lblDeclareNo_DataBinding(object sender, EventArgs e)
    {
        Label lt = (Label)sender;
        lt.Text = "<a href='ED_User_Review_COI_Details.aspx?rid=" + Eval("declare_no") + "&rpid=" + Eval("staff_ic") + "'>" + Eval("declare_no") + "</a>";
    }

    protected void lblDeclareNoC_DataBinding(object sender, EventArgs e)
    {
        Label lt = (Label)sender;
        lt.Text = "<a href='ED_User_Close_COI_Details.aspx?rid=" + Eval("declare_no") + "&rpid=" + Eval("staff_ic") + "'>" + Eval("declare_no") + "</a>";
    }

    protected void lblStaffName_DataBinding(object sender, EventArgs e)
    {
        Label lt = (Label)sender;
        lt.Text = "<a href='ED_User_View_Staff_COI_List.aspx?rid=" + Eval("staff_ic") + "'>" + Eval("staff_name") + "</a>";
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