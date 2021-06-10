using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ED_User_View_Staff_COI_List : System.Web.UI.Page
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
            //bind gridview
            DataView dv = GetdataListing(Request.QueryString["rid"].ToString());
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
        li3.Attributes["class"] = "nav-item active";
        li4.Attributes["class"] = "nav-item";
        li5.Attributes["class"] = "nav-item dropdown";
    }

    private DataView GetdataListing(String sid)
    {
        qs = "";
        qs = qs + " SELECT          * ";
        qs = qs + " FROM            vw_form_report_detail ";
        qs = qs + " WHERE           staff_ic LIKE '%" + sid + "%' ";
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

    protected void lblDeclareNo_DataBinding(object sender, EventArgs e)
    {
        Label lt = (Label)sender;
        lt.Text = "<a href='ED_User_View_Staff_COI_Details.aspx?rid=" + Eval("declare_no") + "&rpid=" + Eval("staff_ic") + "'>" + Eval("declare_no") + "</a>";
    }
}