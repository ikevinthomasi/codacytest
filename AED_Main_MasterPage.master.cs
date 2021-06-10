using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AED_Main_MasterPage : System.Web.UI.MasterPage
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
            menu13.Visible = false;
            menu14.Visible = false;
            menu15.Visible = false;

            //Select from database
            qs = "";
            qs = qs + " SELECT          tbl_declare_user.*, tbl_declare_admin.ad_status ";
            qs = qs + " FROM            tbl_declare_user ";
            qs = qs + " LEFT JOIN       tbl_declare_admin ON tbl_declare_admin.staff_ic = tbl_declare_user.staff_ic ";
            qs = qs + " WHERE           tbl_declare_user.staff_ic LIKE '%" + Session["user_id"].ToString() + "%' ";
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

                if (row["role"].ToString() == "hod" || row["role"].ToString() == "HOD")
                {
                    menu13.Visible = true;
                    //menu14.Visible = true;
                }

                if (row["ad_status"].ToString() == "1" )
                {
                    menu14.Visible = true;
                    menu15.Visible = true;
                }

            }

            menu122.Visible = false;
            menu16.Visible = false;
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
