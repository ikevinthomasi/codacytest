using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DataRow row = null;
    String qs = "";
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EDConn"].ConnectionString);
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["sic"] != null)
            {
                //Select from database
                qs = "";
                qs = qs + " SELECT          tbl_declare_user.* ";
                qs = qs + " FROM            tbl_declare_user ";
                qs = qs + " WHERE           staff_ic = '" + Request.QueryString["sic"].ToString() + "' ";
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
                    row = null;
                    row = dtA.Rows[0];

                    Session["user_id"] = row["staff_ic"].ToString();
                    Session["user_name"] = row["staff_name"].ToString();
                    Session["user_email"] = row["email_address"].ToString();

                    Response.Redirect("ED_Main_Page.aspx");
                }
                else
                {
                    Response.Redirect("https://apps.uemedgenta.com/AE_Dashboard.aspx");
                }
            }
            else
            {
                Response.Redirect("https://apps.uemedgenta.com/AE_Dashboard.aspx");
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Select from database
        qs = "";
        qs = qs + " SELECT          tbl_declare_user.* ";
        qs = qs + " FROM            tbl_declare_user ";
        qs = qs + " WHERE           staff_ic = '" + fldICNO.Text + "' ";
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
            row = null;
            row = dtA.Rows[0];

            Session["user_id"] = row["staff_ic"].ToString();
            Session["user_name"] = row["staff_name"].ToString();
            Session["user_email"] = row["email_address"].ToString();

            Response.Redirect("ED_Main_Page.aspx");
        }
        else
        {
            Response.Redirect("Default.aspx");
        }

    }
}