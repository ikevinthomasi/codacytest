using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.DirectoryServices.Protocols;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ED_User_Declare_COI_M : System.Web.UI.Page
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
            bindSelection();

            //select from database
            qs = "";
            qs = qs + " SELECT          * ";
            qs = qs + " FROM            tbl_declare_user ";
            qs = qs + " WHERE           staff_ic = @pstaff_ic ";
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand(qs, con);
            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
            cmd.CommandTimeout = 0;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count != 0)
            {
                row = null;
                row = dt.Rows[0];

                lblDecName.Text = row["staff_name"].ToString();
                lblDecDivision.Text = row["division"].ToString();
                lblDecDepartment.Text = row["department"].ToString();
                lblDecPosition.Text = row["position"].ToString();
                lblDecEmail.Text = row["email_address"].ToString();
            }
            else
            {
                Response.Redirect("ED_User_Profile_Update.aspx");
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
        li2.Attributes["class"] = "nav-item dropdown active";
        li3.Attributes["class"] = "nav-item";
        li4.Attributes["class"] = "nav-item";
        li5.Attributes["class"] = "nav-item dropdown";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String urlStr = "";
        String coiNo = DateTime.Now.ToString("yyyyMMddHHmmss");

        Boolean validUser = chckCredential(lblDecEmail.Text, fldDecPassword.Text);

        if (validUser == false)
        {
            errlbl.Text = "Wrong password entered.";
        }
        else
        {

            //upload attachment
            if (fldAttachment.HasFile)
            {
                urlStr = uploadAttachment(Session["user_id"].ToString(), coiNo);
            }


            if (fldSelection.SelectedValue.ToString() == "Declare")
            {
                //insert into database
                qs = "";
                qs = qs + "     INSERT INTO tbl_declare_form ";
                qs = qs + "     (declare_no, form_name, staff_ic, declare_date, status, coi_flag, url,  ";
                qs = qs + "     created_date, created_by, submit_date, submit_by, close_date, close_by) ";
                qs = qs + "     VALUES ";
                qs = qs + "     (@pdeclare_no, @pform_name, @pstaff_ic, @pdeclare_date, @pstatus, @pcoi_flag, @purl, ";
                qs = qs + "     @pcreated_date, @pcreated_by, @psubmit_date, @psubmit_by, @pclose_date, @pclose_by) ";

                if (con.State == System.Data.ConnectionState.Closed)
                { con.Open(); }
                cmd = new SqlCommand(qs, con);
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                cmd.Parameters.AddWithValue("@pform_name", "Manual");
                cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@pdeclare_date", Convert.ToDateTime(fldDeclareDate.Text));
                cmd.Parameters.AddWithValue("@pstatus", "Close");
                cmd.Parameters.AddWithValue("@pcoi_flag", fldSelection.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@purl", urlStr);
                cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@psubmit_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@psubmit_by", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@pclose_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@pclose_by", Session["user_id"].ToString());
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                //insert into database
                qs = "";
                qs = qs + "     INSERT INTO tbl_declare_form ";
                qs = qs + "     (declare_no, form_name, staff_ic, declare_date, status, coi_flag, url,  ";
                qs = qs + "     created_date, created_by, submit_date, submit_by) ";
                qs = qs + "     VALUES ";
                qs = qs + "     (@pdeclare_no, @pform_name, @pstaff_ic, @pdeclare_date, @pstatus, @pcoi_flag, @purl, ";
                qs = qs + "     @pcreated_date, @pcreated_by, @psubmit_date, @psubmit_by) ";

                if (con.State == System.Data.ConnectionState.Closed)
                { con.Open(); }
                cmd = new SqlCommand(qs, con);
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                cmd.Parameters.AddWithValue("@pform_name", "Manual");
                cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@pdeclare_date", Convert.ToDateTime(fldDeclareDate.Text));
                cmd.Parameters.AddWithValue("@pstatus", "Submit");
                cmd.Parameters.AddWithValue("@pcoi_flag", fldSelection.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@purl", urlStr);
                cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@psubmit_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@psubmit_by", Session["user_id"].ToString());
                cmd.ExecuteNonQuery();
                con.Close();
            }
            

            //redirect to page
            Response.Redirect("ED_User_Declare_COI_List.aspx");
        }
    }

    private String uploadAttachment(String UserId, String reqId)
    {
        String pathfolder = "Manual/";
        String filenameStr = UserId;
        string strFileExtension = Path.GetExtension(fldAttachment.PostedFile.FileName);

        //Check path folder
        pathfolder = "Manual/" + UserId;

        //Check year folder created
        if (Directory.Exists(Server.MapPath(pathfolder)) == false)
        {
            Directory.CreateDirectory(Server.MapPath(pathfolder));
        }

        //Update path to folder assigned
        pathfolder = pathfolder + "/";

        //Upload file
        fldAttachment.PostedFile.SaveAs(Server.MapPath(pathfolder) + reqId + strFileExtension);

        return pathfolder + reqId + strFileExtension;
    }

    protected Boolean chckCredential(String email, String pass)
    {
        bool validlogin = true;
        LdapConnection connection = null;

        NetworkCredential credential = new NetworkCredential(email, pass);

        if (email.Contains("uemedgenta") == true)
        {
            //Checking credential for uemedgenta is valid or not
            try
            {
                connection = new LdapConnection("uemedgenta.uemgroup.net");
                connection.Credential = credential;
                connection.Bind();
                validlogin = true;
            }
            catch
            {
                //Error not valid credential
                validlogin = false;
            }
        }
        else if (email.Contains("opusbhd") == true || email.Contains("ksamudra") == true)
        {
            //Checking credential for uemedgenta is valid or not
            try
            {
                connection = new LdapConnection("opus.uemgroup.net");
                connection.Credential = credential;
                connection.Bind();
                validlogin = true;
            }
            catch
            {
                //Error not valid credential
                validlogin = false;
            }
        }
        else
        {
            validlogin = false;
        }

        return validlogin;
    }

    protected void bindSelection()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT          drop_id, drop_desc ";
        qs = qs + " FROM            tbl_coi_dropdownlist ";
        qs = qs + " WHERE           drop_status = '1' AND drop_type = 'DeclareType' ";
        fldSelection.DataSource = GetData(qs);
        fldSelection.DataTextField = "drop_desc";
        fldSelection.DataValueField = "drop_id";
        fldSelection.DataBind();
        fldSelection.Items.Insert(0, new ListItem("-- Please select one --", ""));
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