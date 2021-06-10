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

public partial class ED_Admin_Action_COI : System.Web.UI.Page
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
            Int32 C01 = 0;
            Int32 C02 = 0;
            Int32 C03 = 0;
            Int32 C04 = 0;
            Int32 C05 = 0;
            Int32 C06 = 0;

            qs = "";
            qs = qs + " SELECT          * ";
            qs = qs + " FROM            vw_form_report_detail ";
            qs = qs + " ORDER BY        declare_date ";
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            cmd = new SqlCommand(qs, con);
            cmd.CommandTimeout = 0;
            SqlDataAdapter daA = new SqlDataAdapter(cmd);
            DataTable dtA = new DataTable();
            daA.Fill(dtA);
            con.Close();

            if (dtA.Rows.Count > 0)
            {
                for (int i = 0; i < dtA.Rows.Count; i++)
                {
                    row = null;
                    row = dtA.Rows[i];
                    C01 += 1; //Total Submission

                    if (row["coi_flag"].ToString() == "Declare")
                        C02 += 1; //Total No COI Declared

                    if (row["coi_flag"].ToString() == "Disclose")
                    {
                        C03 += 1; //Total COI Disclosed

                        if (row["status"].ToString() == "Submit")
                            C04 += 1; //Total Pending Review By HOD

                        if (row["status"].ToString() == "Review")
                            C05 += 1; //Total Pending Verification By 

                        if (row["status"].ToString() == "Close")
                            C06 += 1; //Total Closed COI

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

            //bind gridview
            DataView dvTemp = new DataView(dtA);
            dvTemp.RowFilter = "status = 'Submit' AND coi_flag = 'Disclose' AND total_days > 18";
            DataTable dtTemp = dvTemp.ToTable();

            gvListing.DataSource = dtTemp;
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
        lt.Text = "<a href='ED_Admin_Action_COI_Details.aspx?rid=" + Eval("declare_no") + "&rpid=" + Eval("staff_ic") + "'>" + Eval("declare_no") + "</a>";
    }
}