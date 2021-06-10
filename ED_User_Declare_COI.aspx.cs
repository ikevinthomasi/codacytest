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
using System.DirectoryServices;
using System.Windows.Input;
using System.DirectoryServices.Protocols;
using System.Net;
using System.Diagnostics;
using System.Net.Mail;

public partial class ED_User_Declare_COI : System.Web.UI.Page
{
    DataRow row = null;
    DataTable tableA01 = new DataTable();
    DataTable tableA02A = new DataTable();
    DataTable tableA02B = new DataTable();
    DataTable tableA03 = new DataTable();
    DataTable tableA04 = new DataTable();
    DataTable tableB01 = new DataTable();
    DataTable tableC01 = new DataTable();
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

        if (tableA01.Rows.Count == 0)
        {
            //Create array
            tableA01.Columns.Add("A01Id", typeof(string));
            tableA01.Columns.Add("A01Organisation", typeof(string));
            tableA01.Columns.Add("A01Capacity", typeof(string));
            tableA01.Columns.Add("A01Nature", typeof(string));
        }

        if (tableA02A.Rows.Count == 0)
        {
            //create array
            tableA02A.Columns.Add("A02AId", typeof(string));
            tableA02A.Columns.Add("A02ACompany", typeof(string));
            tableA02A.Columns.Add("A02ANoShares", typeof(string));
            tableA02A.Columns.Add("A02APShare", typeof(string));
        }

        if (tableA02B.Rows.Count == 0)
        {
            //create array
            tableA02B.Columns.Add("A02BCompany", typeof(string));
            tableA02B.Columns.Add("A02BNature", typeof(string));
            tableA02B.Columns.Add("A02BId", typeof(string));
            tableA02B.Columns.Add("A02BPShare", typeof(string));
        }

        if (tableA03.Rows.Count == 0)
        {
            //Create array
            tableA03.Columns.Add("A03Id", typeof(string));
            tableA03.Columns.Add("A03Type", typeof(string));
            tableA03.Columns.Add("A03Company", typeof(string));
            tableA03.Columns.Add("A03Description", typeof(string));
        }

        if (tableA04.Rows.Count == 0)
        {
            //Create array
            tableA04.Columns.Add("A04Id", typeof(string));
            tableA04.Columns.Add("A04Person", typeof(string));
            tableA04.Columns.Add("A04Value", typeof(string));
            tableA04.Columns.Add("A04Entity", typeof(string));
            tableA04.Columns.Add("A04DateReceived", typeof(string));
        }

        if (tableB01.Rows.Count == 0)
        {
            //Create array
            tableB01.Columns.Add("B01Id", typeof(string));
            tableB01.Columns.Add("B01Person", typeof(string));
            tableB01.Columns.Add("B01Relationship", typeof(string));
            tableB01.Columns.Add("B01Organisation", typeof(string));
            tableB01.Columns.Add("B01Nature", typeof(string));
        }

        if (tableC01.Rows.Count == 0)
        {
            //Create array
            tableC01.Columns.Add("C01Id", typeof(string));
            tableC01.Columns.Add("C01Person", typeof(string));
            tableC01.Columns.Add("C01Relationship", typeof(string));
            tableC01.Columns.Add("C01Organisation", typeof(string));
            tableC01.Columns.Add("C01Nature", typeof(string));
        }

        if (!Page.IsPostBack)
        {
            //Bind dropdownlist
            bindA03Type();

            //select from database
            qs = "";
            qs = qs + " SELECT          * ";
            qs = qs + " FROM            tbl_declare_user ";
            qs = qs + " WHERE           staff_ic = @pstaff_ic ";
            if (con.State == System.Data.ConnectionState.Closed)
            { con.Open();
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

            lblYear.Text = DateTime.Now.ToString("yyyy");

            //bind gridview resource
            DataView dvA01 = new DataView(tableA01);
            gvConsulting.DataSource = dvA01;
            gvConsulting.DataBind();

            DataView dvA02A = new DataView(tableA02A);
            gvBusinessesA.DataSource = dvA02A;
            gvBusinessesA.DataBind();

            DataView dvA02B = new DataView(tableA02B);
            gvBusinessesB.DataSource = dvA02B;
            gvBusinessesB.DataBind();

            DataView dvA03 = new DataView(tableA03);
            gvDirectorships.DataSource = dvA03;
            gvDirectorships.DataBind();

            DataView dvA04 = new DataView(tableA04);
            gvGifts.DataSource = dvA04;
            gvGifts.DataBind();

            DataView dvB01 = new DataView(tableB01);
            dvPInterest.DataSource = dvB01;
            dvPInterest.DataBind();

            DataView dvC01 = new DataView(tableC01);
            dvBInterest.DataSource = dvC01;
            dvBInterest.DataBind();

            setControlDisabled();

            coiDV.Visible = false;
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
        String coiNo = DateTime.Now.ToString("yyyyMMddHHmmss");
        String coiDesc = "";
        Boolean dataEntry = false;
        Boolean validUser = chckCredential(lblDecEmail.Text, fldDecPassword.Text);

        if (validUser == false)
        {
            errlbl.Text = "Wrong password entered.";
        }
        else
        {
            if (rbDeclare.Checked == true)
            {
                //insert into database
                qs = "";
                qs = qs + "     INSERT INTO tbl_declare_form ";
                qs = qs + "     (declare_no, form_name, staff_ic, declare_date, status, coi_flag, ";
                qs = qs + "     created_date, created_by, submit_date, submit_by, close_date, close_by) ";
                qs = qs + "     VALUES ";
                qs = qs + "     (@pdeclare_no, @pform_name, @pstaff_ic, @pdeclare_date, @pstatus, @pcoi_flag, ";
                qs = qs + "     @pcreated_date, @pcreated_by, @psubmit_date, @psubmit_by, @pclose_date, @pclose_by) ";

                if (con.State == System.Data.ConnectionState.Closed)
                { con.Open(); }
                cmd = new SqlCommand(qs, con);
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                cmd.Parameters.AddWithValue("@pform_name", "Online");
                cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@pdeclare_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@pstatus", "Close");
                cmd.Parameters.AddWithValue("@pcoi_flag", "Declare");
                cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@psubmit_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@psubmit_by", Session["user_id"].ToString());
                cmd.Parameters.AddWithValue("@pclose_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@pclose_by", Session["user_id"].ToString());
                cmd.ExecuteNonQuery();
                con.Close();

                //redirect to page
                Response.Redirect("ED_User_Declare_COI_List.aspx");
            }
            else if (rbDisclose.Checked == true)
            {
                //check data key in
                dataEntry = false;

                if (fldOtherConflicts.Text.Trim() != "")
                    dataEntry = true;
                else if (gvConsulting.Rows.Count > 0)
                    dataEntry = true;
                else if (gvBusinessesA.Rows.Count > 0)
                    dataEntry = true;
                else if (gvBusinessesB.Rows.Count > 0)
                    dataEntry = true;
                else if (gvDirectorships.Rows.Count > 0)
                    dataEntry = true;
                else if (gvGifts.Rows.Count > 0)
                    dataEntry = true;
                else if (dvPInterest.Rows.Count > 0)
                    dataEntry = true;
                else if (dvBInterest.Rows.Count > 0)
                    dataEntry = true;

                if (dataEntry == true)
                {
                    //insert into database
                    qs = "";
                    qs = qs + "     INSERT INTO tbl_declare_form ";
                    qs = qs + "     (declare_no, form_name, staff_ic, declare_date, status, coi_flag, ";
                    qs = qs + "     other_coi, created_date, created_by, submit_date, submit_by) ";
                    qs = qs + "     VALUES ";
                    qs = qs + "     (@pdeclare_no, @pform_name, @pstaff_ic, @pdeclare_date, @pstatus, @pcoi_flag, ";
                    qs = qs + "     @pother_coi, @pcreated_date, @pcreated_by, @psubmit_date, @psubmit_by) ";

                    if (con.State == System.Data.ConnectionState.Closed)
                    { con.Open(); }
                    cmd = new SqlCommand(qs, con);
                    cmd.CommandTimeout = 0;
                    cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                    cmd.Parameters.AddWithValue("@pform_name", "Online");
                    cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                    cmd.Parameters.AddWithValue("@pdeclare_date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@pstatus", "Submit");
                    cmd.Parameters.AddWithValue("@pcoi_flag", "Disclose");

                    if (fldOtherConflicts.Text.Trim() != "")
                    {
                        cmd.Parameters.AddWithValue("@pother_coi", fldOtherConflicts.Text);
                        coiDesc += "Other Conflicts, ";
                    }
                    else
                        cmd.Parameters.AddWithValue("@pother_coi", DBNull.Value);

                    cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                    cmd.Parameters.AddWithValue("@psubmit_date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@psubmit_by", Session["user_id"].ToString());
                    cmd.ExecuteNonQuery();
                    con.Close();

                    if (gvConsulting.Rows.Count > 0)
                    {
                        coiDesc += "Pecuniary Interests (Consulting, Outside Employment, and Other Outside Activities), ";
                        for (int i = 0; i < gvConsulting.Rows.Count; i++)
                        {
                            //insert into database
                            qs = "";
                            qs = qs + "     INSERT INTO tbl_coi_pecuniary_consultant ";
                            qs = qs + "     (declare_no, staff_ic, organisation, capacity, nature, created_date, created_by) ";
                            qs = qs + "     VALUES ";
                            qs = qs + "     (@pdeclare_no, @pstaff_ic, @porganisation, @pcapacity, @pnature, @pcreated_date, @pcreated_by) ";
                            if (con.State == System.Data.ConnectionState.Closed)
                            { con.Open(); }
                            cmd = new SqlCommand(qs, con);
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                            cmd.Parameters.AddWithValue("@porganisation", ((Label)gvConsulting.Rows[i].Cells[1].FindControl("lblA01Organisation")).Text);
                            cmd.Parameters.AddWithValue("@pcapacity", ((Label)gvConsulting.Rows[i].Cells[2].FindControl("lblA01Capacity")).Text);
                            cmd.Parameters.AddWithValue("@pnature", ((Label)gvConsulting.Rows[i].Cells[3].FindControl("lblA01Nature")).Text);
                            cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    if (gvBusinessesA.Rows.Count > 0)
                    {
                        coiDesc += "Pecuniary Interests (Businesses - Ownership of Shares), ";
                        for (int ja = 0; ja < gvBusinessesA.Rows.Count; ja++)
                        {
                            //insert into database
                            qs = "";
                            qs = qs + "     INSERT INTO tbl_coi_pecuniary_business ";
                            qs = qs + "     (declare_no, staff_ic, type_bus, company, shares, per_share,  created_date, created_by) ";
                            qs = qs + "     VALUES ";
                            qs = qs + "     (@pdeclare_no, @pstaff_ic, @ptype_bus, @pcompany, @pshares, @pper_share,  @pcreated_date, @pcreated_by) ";
                            if (con.State == System.Data.ConnectionState.Closed)
                            { con.Open(); }
                            cmd = new SqlCommand(qs, con);
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                            cmd.Parameters.AddWithValue("@ptype_bus", "Ownership");
                            cmd.Parameters.AddWithValue("@pcompany", ((Label)gvBusinessesA.Rows[ja].Cells[1].FindControl("lblA02ACompany")).Text);
                            cmd.Parameters.AddWithValue("@pshares", ((Label)gvBusinessesA.Rows[ja].Cells[2].FindControl("lblA02ANoShares")).Text);
                            cmd.Parameters.AddWithValue("@pper_share", ((Label)gvBusinessesA.Rows[ja].Cells[3].FindControl("lblA02APShare")).Text);
                            cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    if (gvBusinessesB.Rows.Count > 0)
                    {
                        coiDesc += "Pecuniary Interests (Businesses - Other Direct & Indirect Interests), ";
                        for (int jb = 0; jb < gvBusinessesB.Rows.Count; jb++)
                        {
                            //insert into database
                            qs = "";
                            qs = qs + "     INSERT INTO tbl_coi_pecuniary_business ";
                            qs = qs + "     (declare_no, staff_ic, type_bus, company, nature, per_share, created_date, created_by) ";
                            qs = qs + "     VALUES ";
                            qs = qs + "     (@pdeclare_no, @pstaff_ic, @ptype_bus, @pcompany, @pnature, @pper_share,  @pcreated_date, @pcreated_by) ";
                            if (con.State == System.Data.ConnectionState.Closed)
                            { con.Open(); }
                            cmd = new SqlCommand(qs, con);
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                            cmd.Parameters.AddWithValue("@ptype_bus", "Others");
                            cmd.Parameters.AddWithValue("@pcompany", ((Label)gvBusinessesB.Rows[jb].Cells[1].FindControl("lblA02BCompany")).Text);
                            cmd.Parameters.AddWithValue("@pnature", ((Label)gvBusinessesB.Rows[jb].Cells[2].FindControl("lblA02BNature")).Text);
                            cmd.Parameters.AddWithValue("@pper_share", ((Label)gvBusinessesB.Rows[jb].Cells[3].FindControl("lblA02BPShare")).Text);
                            cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    if (gvDirectorships.Rows.Count > 0)
                    {
                        coiDesc += "Pecuniary Interests (Company Directorships), ";
                        for (int k = 0; k < gvDirectorships.Rows.Count; k++)
                        {
                            //insert into database
                            qs = "";
                            qs = qs + "     INSERT INTO tbl_coi_pecuniary_director ";
                            qs = qs + "     (declare_no, staff_ic, company_type, company, description, created_date, created_by) ";
                            qs = qs + "     VALUES ";
                            qs = qs + "     (@pdeclare_no, @pstaff_ic, @pcompany_type, @pcompany, @pdescription, @pcreated_date, @pcreated_by) ";
                            if (con.State == System.Data.ConnectionState.Closed)
                            { con.Open(); }
                            cmd = new SqlCommand(qs, con);
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                            cmd.Parameters.AddWithValue("@pcompany_type", ((Label)gvDirectorships.Rows[k].Cells[1].FindControl("lblA03Type")).Text);
                            cmd.Parameters.AddWithValue("@pcompany", ((Label)gvDirectorships.Rows[k].Cells[2].FindControl("lblA03Company")).Text);
                            cmd.Parameters.AddWithValue("@pdescription", ((Label)gvDirectorships.Rows[k].Cells[3].FindControl("lblA03Description")).Text);
                            cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    if (gvGifts.Rows.Count > 0)
                    {
                        coiDesc += "Pecuniary Interests (Gifts & Solicitations), ";
                        for (int l = 0; l < gvGifts.Rows.Count; l++)
                        {
                            //insert into database
                            qs = "";
                            qs = qs + "     INSERT INTO tbl_coi_pecuniary_gift ";
                            qs = qs + "     (declare_no, staff_ic, person_name, estimate_value, business_entity, date_received, created_date, created_by) ";
                            qs = qs + "     VALUES ";
                            qs = qs + "     (@pdeclare_no, @pstaff_ic, @pperson_name, @pestimate_value, @pbusiness_entity, @pdate_received, @pcreated_date, @pcreated_by) ";
                            if (con.State == System.Data.ConnectionState.Closed)
                            { con.Open(); }
                            cmd = new SqlCommand(qs, con);
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                            cmd.Parameters.AddWithValue("@pperson_name", ((Label)gvGifts.Rows[l].Cells[1].FindControl("lblA04Person")).Text);
                            cmd.Parameters.AddWithValue("@pestimate_value", ((Label)gvGifts.Rows[l].Cells[2].FindControl("lblA04Value")).Text);
                            cmd.Parameters.AddWithValue("@pbusiness_entity", ((Label)gvGifts.Rows[l].Cells[3].FindControl("lblA04Entity")).Text);
                            cmd.Parameters.AddWithValue("@pdate_received", ((Label)gvGifts.Rows[l].Cells[4].FindControl("lblA04DateReceived")).Text);
                            cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    if (dvPInterest.Rows.Count > 0)
                    {
                        coiDesc += "Personal Interest, ";
                        for (int m = 0; m < dvPInterest.Rows.Count; m++)
                        {
                            //insert into database
                            qs = "";
                            qs = qs + "     INSERT INTO tbl_coi_personal ";
                            qs = qs + "     (declare_no, staff_ic, person_name, relationship, organisation, nature, created_date, created_by) ";
                            qs = qs + "     VALUES ";
                            qs = qs + "     (@pdeclare_no, @pstaff_ic, @pperson_name, @prelationship, @porganisation, @pnature, @pcreated_date, @pcreated_by) ";
                            if (con.State == System.Data.ConnectionState.Closed)
                            { con.Open(); }
                            cmd = new SqlCommand(qs, con);
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                            cmd.Parameters.AddWithValue("@pperson_name", ((Label)dvPInterest.Rows[m].Cells[1].FindControl("lblB01Person")).Text);
                            cmd.Parameters.AddWithValue("@prelationship", ((Label)dvPInterest.Rows[m].Cells[2].FindControl("lblB01Relationship")).Text);
                            cmd.Parameters.AddWithValue("@porganisation", ((Label)dvPInterest.Rows[m].Cells[3].FindControl("lblB01Organisation")).Text);
                            cmd.Parameters.AddWithValue("@pnature", ((Label)dvPInterest.Rows[m].Cells[4].FindControl("lblB01Nature")).Text);
                            cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    if (dvBInterest.Rows.Count > 0)
                    {
                        coiDesc += "Business Interest, ";
                        for (int n = 0; n < dvBInterest.Rows.Count; n++)
                        {
                            //insert into database
                            qs = "";
                            qs = qs + "     INSERT INTO tbl_coi_business ";
                            qs = qs + "     (declare_no, staff_ic, person_name, relationship, organisation, nature, created_date, created_by) ";
                            qs = qs + "     VALUES ";
                            qs = qs + "     (@pdeclare_no, @pstaff_ic, @pperson_name, @prelationship, @porganisation, @pnature, @pcreated_date, @pcreated_by) ";
                            if (con.State == System.Data.ConnectionState.Closed)
                            { con.Open(); }
                            cmd = new SqlCommand(qs, con);
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@pdeclare_no", coiNo);
                            cmd.Parameters.AddWithValue("@pstaff_ic", Session["user_id"].ToString());
                            cmd.Parameters.AddWithValue("@pperson_name", ((Label)dvBInterest.Rows[n].Cells[1].FindControl("lblC01Person")).Text);
                            cmd.Parameters.AddWithValue("@prelationship", ((Label)dvBInterest.Rows[n].Cells[2].FindControl("lblC01Relationship")).Text);
                            cmd.Parameters.AddWithValue("@porganisation", ((Label)dvBInterest.Rows[n].Cells[3].FindControl("lblC01Organisation")).Text);
                            cmd.Parameters.AddWithValue("@pnature", ((Label)dvBInterest.Rows[n].Cells[4].FindControl("lblC01Nature")).Text);
                            cmd.Parameters.AddWithValue("@pcreated_date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@pcreated_by", Session["user_id"].ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }

                    }

                    //email notification
                    emailnotification(coiNo, coiDesc);

                    //redirect to page
                    Response.Redirect("ED_User_Declare_COI_List.aspx");
                }
                else
                {
                    errlbl.Text = "Please fill up at least ONE of the Type of Conflict of Interest .";
                }
            }
            else
            {
                //redirect to page
                Response.Redirect("ED_User_Declare_COI_List.aspx");
            }
        }

    }

    private void emailnotification(String reqNo, String coiDesc)
    {
        coiDesc = coiDesc.Substring(0, coiDesc.Length - 1);

        //email notification
        String bodyMail = "";
        bodyMail = bodyMail + "<table border='0' style='font-family: verdana,arial,sans-serif;font-size:12px;color:#333333;'>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'><br/>Dear Sir/ Madam,<br/><br/></td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'>A COI declaration has been submitted for your review and action:<br/><br/></td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>COI No</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + reqNo + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>Date of Submission</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + DateTime.Now + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>Description of COI declared</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + coiDesc + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>Name of Declarer</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + lblDecName.Text + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>Division</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + lblDecDivision.Text + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>Department</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + lblDecDepartment.Text + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>Position</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + lblDecPosition.Text + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>Email Address</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + lblDecEmail.Text + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'><br/><br/><b>Click link below to view the COI declaration:</b></td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'><a href='https://edeclaration.uemedgenta.com/'>https://edeclaration.uemedgenta.com/</a></td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'><br/><br/><i>Note: First reminder will be sent after ten (10) calendar days from the date of submission should there be no action recorded/ documented through the portal.</i></td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'><br/><br/><b>THIS IS AN AUTO GENERATED EMAIL. PLEASE DO NOT REPLY.</b></td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'>For any queries or clarification, please contact Risk Management & Compliance at compliance@uemedgenta.uemnet.com</ td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "</table>";
        MailMessage mailMsg = new MailMessage();
        SmtpClient smtpClient = new SmtpClient("smtp.uemedgenta.com");

        //select from database - hod
        qs = "";
        qs = qs + " SELECT          * ";
        qs = qs + " FROM            vw_user_reporting ";
        qs = qs + " WHERE           staff_ic = @pstaff_ic ";
        if (con.State == System.Data.ConnectionState.Closed)
            con.Open();
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

            if (row["reporting1_role"].ToString() == "hod")
                mailMsg.To.Add(row["reporting1_email"].ToString());

            else if (row["reporting2_role"].ToString() == "hod")
                mailMsg.To.Add(row["reporting2_email"].ToString());

            else if (row["reporting3_role"].ToString() == "hod")
                mailMsg.To.Add(row["reporting3_email"].ToString());
        }

        mailMsg.From = new MailAddress("eDeclaration@uemedgenta.uemnet.com");
        mailMsg.Subject = "NEW COI SUBMITTED [ACTION REQUIRED BY HOD] : " + reqNo;
        mailMsg.Body = bodyMail;
        mailMsg.IsBodyHtml = true;
        smtpClient.Send(mailMsg);
    }

    protected void rbDeclare_CheckedChanged(object sender, EventArgs e)
    {
        setControlDisabled();
        coiDV.Visible = false;
    }

    protected void rbDisclose_CheckedChanged(object sender, EventArgs e)
    {
        coiDV.Visible = true;
        setControlEnabled();
    }

    protected void setControlEnabled()
    {
        btnConsulting.Attributes.Remove("disabled");
        btnBusinessesA.Attributes.Remove("disabled");
        btnBusinessesB.Attributes.Remove("disabled");
        btnDirectorships.Attributes.Remove("disabled");
        btnGifts.Attributes.Remove("disabled");
        btnPInterest.Attributes.Remove("disabled");
        btnBInterest.Attributes.Remove("disabled");
        fldOtherConflicts.Enabled = true;
    }

    protected void setControlDisabled()
    {
        //set to null
        fldOtherConflicts.Text = null;

        //clear row in dataset
        tableA01.Rows.Clear();
        tableA02A.Rows.Clear();
        tableA02B.Rows.Clear();
        tableA03.Rows.Clear();
        tableA04.Rows.Clear();
        tableB01.Rows.Clear();
        tableC01.Rows.Clear();

        //bind gridview
        DataView dvA01 = new DataView(tableA01);
        gvConsulting.DataSource = dvA01;
        gvConsulting.DataBind();

        DataView dvA02A = new DataView(tableA02A);
        gvBusinessesA.DataSource = dvA02A;
        gvBusinessesA.DataBind();

        DataView dvA02B = new DataView(tableA02B);
        gvBusinessesB.DataSource = dvA02B;
        gvBusinessesB.DataBind();

        DataView dvA03 = new DataView(tableA03);
        gvDirectorships.DataSource = dvA03;
        gvDirectorships.DataBind();

        DataView dvA04 = new DataView(tableA04);
        gvGifts.DataSource = dvA04;
        gvGifts.DataBind();

        DataView dvB01 = new DataView(tableB01);
        dvPInterest.DataSource = dvB01;
        dvPInterest.DataBind();

        DataView dvC01 = new DataView(tableC01);
        dvBInterest.DataSource = dvC01;
        dvBInterest.DataBind();

        //disable field and button
        btnConsulting.Attributes.Add("disabled", "disabled");
        btnBusinessesA.Attributes.Add("disabled", "disabled");
        btnBusinessesB.Attributes.Add("disabled", "disabled");
        btnDirectorships.Attributes.Add("disabled", "disabled");
        btnGifts.Attributes.Add("disabled", "disabled");
        btnPInterest.Attributes.Add("disabled", "disabled");
        btnBInterest.Attributes.Add("disabled", "disabled");
        fldOtherConflicts.Enabled = false;
    }

    protected void gvConsulting_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "A01Delete")
        {
            String parameterValue = Convert.ToString(e.CommandArgument);

            int setId = 0;

            //bind gridview
            for (int i = 0; i < gvConsulting.Rows.Count; i++)
            {
                if (Convert.ToInt32(parameterValue) != i)
                {
                    row = null;
                    row = tableA01.NewRow();
                    row["A01Id"] = setId;
                    row["A01Organisation"] = ((Label)gvConsulting.Rows[i].Cells[1].FindControl("lblA01Organisation")).Text;
                    row["A01Capacity"] = ((Label)gvConsulting.Rows[i].Cells[2].FindControl("lblA01Capacity")).Text;
                    row["A01Nature"] = ((Label)gvConsulting.Rows[i].Cells[3].FindControl("lblA01Nature")).Text;
                    tableA01.Rows.Add(row);
                    setId += 1;
                }
            }

            //bind gridview resource
            DataView dv = new DataView(tableA01);
            gvConsulting.DataSource = dv;
            gvConsulting.DataBind();
        }
    }

    protected void btnA01Submit_Click(object sender, EventArgs e)
    {
        //get gridview data
        if (gvConsulting.Rows.Count == 0)
        {
            row = null;
            row = tableA01.NewRow();

            //assign data to datasource
            row["A01Id"] = "0";
            row["A01Organisation"] = fldA01Organisation.Text;
            row["A01Capacity"] = fldA01Capacity.Text;
            row["A01Nature"] = fldA01Nature.Text;
            tableA01.Rows.Add(row);
        }
        else
        {
            for (int i = 0; i < gvConsulting.Rows.Count; i++)
            {
                row = null;
                row = tableA01.NewRow();
                row["A01Id"] = Convert.ToString(i);
                row["A01Organisation"] = ((Label)gvConsulting.Rows[i].Cells[1].FindControl("lblA01Organisation")).Text;
                row["A01Capacity"] = ((Label)gvConsulting.Rows[i].Cells[2].FindControl("lblA01Capacity")).Text;
                row["A01Nature"] = ((Label)gvConsulting.Rows[i].Cells[3].FindControl("lblA01Nature")).Text;
                tableA01.Rows.Add(row);
            }

            row = null;
            row = tableA01.NewRow();

            //assign data to datasource
            row["A01Id"] = gvConsulting.Rows.Count;
            row["A01Organisation"] = fldA01Organisation.Text;
            row["A01Capacity"] = fldA01Capacity.Text;
            row["A01Nature"] = fldA01Nature.Text;
            tableA01.Rows.Add(row);
        }

        //bind gridview resource
        DataView dv = new DataView(tableA01);
        gvConsulting.DataSource = dv;
        gvConsulting.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "resetModalA01();", true);
    }

    protected void gvBusinessesA_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "A02DeleteA")
        {
            String parameterValue = Convert.ToString(e.CommandArgument);

            int setId = 0;

            //bind gridview
            for (int i = 0; i < gvBusinessesA.Rows.Count; i++)
            {
                if (Convert.ToInt32(parameterValue) != i)
                {
                    row = null;
                    row = tableA02A.NewRow();
                    row["A02AId"] = setId;
                    row["A02ACompany"] = ((Label)gvBusinessesA.Rows[i].Cells[1].FindControl("lblA02ACompany")).Text;
                    row["A02ANoShares"] = ((Label)gvBusinessesA.Rows[i].Cells[2].FindControl("lblA02ANoShares")).Text;
                    row["A02APShare"] = ((Label)gvBusinessesA.Rows[i].Cells[3].FindControl("lblA02APShare")).Text;
                    tableA02A.Rows.Add(row);
                    setId += 1;
                }
            }

            //bind gridview resource
            DataView dv = new DataView(tableA02A);
            gvBusinessesA.DataSource = dv;
            gvBusinessesA.DataBind();
        }
    }

    protected void btnA02ASubmit_Click(object sender, EventArgs e)
    {
        //get gridview data
        if (gvBusinessesA.Rows.Count == 0)
        {
            row = null;
            row = tableA02A.NewRow();

            //assign data to datasource
            row["A02AId"] = "0";
            row["A02ACompany"] = fldA02ACompany.Text;
            row["A02ANoShares"] = fldA02ANoShares.Text;
            row["A02APShare"] = fldA02APShare.Text;
            tableA02A.Rows.Add(row);
        }
        else
        {
            for (int i = 0; i < gvBusinessesA.Rows.Count; i++)
            {
                row = null;
                row = tableA02A.NewRow();
                row["A02AId"] = Convert.ToString(i);
                row["A02ACompany"] = ((Label)gvBusinessesA.Rows[i].Cells[1].FindControl("lblA02ACompany")).Text;
                row["A02ANoShares"] = ((Label)gvBusinessesA.Rows[i].Cells[2].FindControl("lblA02ANoShares")).Text;
                row["A02APShare"] = ((Label)gvBusinessesA.Rows[i].Cells[3].FindControl("lblA02APShare")).Text;
                tableA02A.Rows.Add(row);
            }

            row = null;
            row = tableA02A.NewRow();

            //assign data to datasource
            row["A02AId"] = gvBusinessesA.Rows.Count;
            row["A02ACompany"] = fldA02ACompany.Text;
            row["A02ANoShares"] = fldA02ANoShares.Text;
            row["A02APShare"] = fldA02APShare.Text;
            tableA02A.Rows.Add(row);
        }

        //bind gridview resource
        DataView dv = new DataView(tableA02A);
        gvBusinessesA.DataSource = dv;
        gvBusinessesA.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "resetModalA02A();", true);
    }

    protected void gvBusinessesB_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "A02DeleteB")
        {
            String parameterValue = Convert.ToString(e.CommandArgument);

            int setId = 0;

            //bind gridview
            for (int i = 0; i < gvBusinessesB.Rows.Count; i++)
            {
                if (Convert.ToInt32(parameterValue) != i)
                {
                    row = null;
                    row = tableA02B.NewRow();
                    row["A02BId"] = setId;
                    row["A02BCompany"] = ((Label)gvBusinessesA.Rows[i].Cells[1].FindControl("lblA02BCompany")).Text;
                    row["A02BNature"] = ((Label)gvBusinessesB.Rows[i].Cells[2].FindControl("lblA02BNature")).Text;
                    row["A02BPShare"] = ((Label)gvBusinessesB.Rows[i].Cells[3].FindControl("lblA02BPShare")).Text;
                    tableA02B.Rows.Add(row);
                    setId += 1;
                }
            }

            //bind gridview resource
            DataView dv = new DataView(tableA02B);
            gvBusinessesB.DataSource = dv;
            gvBusinessesB.DataBind();
        }
    }

    protected void btnA02BSubmit_Click(object sender, EventArgs e)
    {
        //get gridview data
        if (gvBusinessesB.Rows.Count == 0)
        {
            row = null;
            row = tableA02B.NewRow();

            //assign data to datasource
            row["A02BId"] = "0";
            row["A02BCompany"] = fldA02BCompany.Text;
            row["A02BNature"] = fldA02BNature.Text;
            row["A02BPShare"] = fldA02BPShare.Text;
            
            tableA02B.Rows.Add(row);
        }
        else
        {
            for (int i = 0; i < gvBusinessesB.Rows.Count; i++)
            {
                row = null;
                row = tableA02B.NewRow();
                row["A02BId"] = Convert.ToString(i);
                row["A02BCompany"] = ((Label)gvBusinessesB.Rows[i].Cells[1].FindControl("lblA02BCompany")).Text;
                row["A02BNature"] = ((Label)gvBusinessesB.Rows[i].Cells[2].FindControl("lblA02BNature")).Text;
                row["A02BPShare"] = ((Label)gvBusinessesB.Rows[i].Cells[3].FindControl("lblA02BPShare")).Text;
                
                tableA02B.Rows.Add(row);
            }

            row = null;
            row = tableA02B.NewRow();

            //assign data to datasource
            row["A02BId"] = gvBusinessesB.Rows.Count;
            row["A02BCompany"] = fldA02BCompany.Text;
            row["A02BNature"] = fldA02BNature.Text;
            row["A02BPShare"] = fldA02BPShare.Text;
            
            tableA02B.Rows.Add(row);
        }

        //bind gridview resource
        DataView dv = new DataView(tableA02B);
        gvBusinessesB.DataSource = dv;
        gvBusinessesB.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "resetModalA02B();", true);
    }

    protected void gvDirectorships_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "A03Delete")
        {
            String parameterValue = Convert.ToString(e.CommandArgument);

            int setId = 0;

            //bind gridview
            for (int i = 0; i < gvDirectorships.Rows.Count; i++)
            {
                if (Convert.ToInt32(parameterValue) != i)
                {
                    row = null;
                    row = tableA03.NewRow();
                    row["A03Id"] = setId;
                    row["A03Type"] = ((Label)gvDirectorships.Rows[i].Cells[1].FindControl("lblA03Type")).Text;
                    row["A03Company"] = ((Label)gvDirectorships.Rows[i].Cells[2].FindControl("lblA03Company")).Text;
                    row["A03Description"] = ((Label)gvDirectorships.Rows[i].Cells[3].FindControl("lblA03Description")).Text;
                    tableA03.Rows.Add(row);
                    setId += 1;
                }
            }

            //bind gridview resource
            DataView dv = new DataView(tableA03);
            gvDirectorships.DataSource = dv;
            gvDirectorships.DataBind();
        }
    }

    protected void btnA03Submit_Click(object sender, EventArgs e)
    {
        //get gridview data
        if (gvDirectorships.Rows.Count == 0)
        {
            row = null;
            row = tableA03.NewRow();

            //assign data to datasource
            row["A03Id"] = "0";
            row["A03Type"] = fldA03Type.Text;
            row["A03Company"] = fldA03Company.Text;
            row["A03Description"] = fldA03Description.Text;
            tableA03.Rows.Add(row);
        }
        else
        {
            for (int i = 0; i < gvDirectorships.Rows.Count; i++)
            {
                row = null;
                row = tableA03.NewRow();
                row["A03Id"] = Convert.ToString(i);
                row["A03Type"] = ((Label)gvDirectorships.Rows[i].Cells[1].FindControl("lblA03Type")).Text;
                row["A03Company"] = ((Label)gvDirectorships.Rows[i].Cells[2].FindControl("lblA03Company")).Text;
                row["A03Description"] = ((Label)gvDirectorships.Rows[i].Cells[3].FindControl("lblA03Description")).Text;
                tableA03.Rows.Add(row);
            }

            row = null;
            row = tableA03.NewRow();

            //assign data to datasource
            row["A03Id"] = gvDirectorships.Rows.Count;
            row["A03Type"] = fldA03Type.Text;
            row["A03Company"] = fldA03Company.Text;
            row["A03Description"] = fldA03Description.Text;
            tableA03.Rows.Add(row);
        }

        //bind gridview resource
        DataView dv = new DataView(tableA03);
        gvDirectorships.DataSource = dv;
        gvDirectorships.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "resetModalA03();", true);
    }

    protected void gvGifts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "A04Delete")
        {
            String parameterValue = Convert.ToString(e.CommandArgument);

            int setId = 0;

            //bind gridview
            for (int i = 0; i < gvGifts.Rows.Count; i++)
            {
                if (Convert.ToInt32(parameterValue) != i)
                {
                    row = null;
                    row = tableA04.NewRow();
                    row["A04Id"] = setId;
                    row["A04Person"] = ((Label)gvGifts.Rows[i].Cells[1].FindControl("lblA04Person")).Text;
                    row["A04Value"] = ((Label)gvGifts.Rows[i].Cells[2].FindControl("lblA04Value")).Text;
                    row["A04Entity"] = ((Label)gvGifts.Rows[i].Cells[3].FindControl("lblA04Entity")).Text;
                    row["A04DateReceived"] = ((Label)gvGifts.Rows[i].Cells[4].FindControl("lblA04DateReceived")).Text;
                    tableA04.Rows.Add(row);
                    setId += 1;
                }
            }

            //bind gridview resource
            DataView dv = new DataView(tableA04);
            gvGifts.DataSource = dv;
            gvGifts.DataBind();
        }
    }

    protected void btnA04Submit_Click(object sender, EventArgs e)
    {
        //get gridview data
        if (gvGifts.Rows.Count == 0)
        {
            row = null;
            row = tableA04.NewRow();

            //assign data to datasource
            row["A04Id"] = "0";
            row["A04Person"] = fldA04Person.Text;
            row["A04Value"] = fldA04Value.Text;
            row["A04Entity"] = fldA04Entity.Text;
            row["A04DateReceived"] = fldA04Date.Text;
            tableA04.Rows.Add(row);
        }
        else
        {
            for (int i = 0; i < gvGifts.Rows.Count; i++)
            {
                row = null;
                row = tableA04.NewRow();
                row["A04Id"] = Convert.ToString(i);
                row["A04Person"] = ((Label)gvGifts.Rows[i].Cells[1].FindControl("lblA04Person")).Text;
                row["A04Value"] = ((Label)gvGifts.Rows[i].Cells[2].FindControl("lblA04Value")).Text;
                row["A04Entity"] = ((Label)gvGifts.Rows[i].Cells[3].FindControl("lblA04Entity")).Text;
                row["A04DateReceived"] = ((Label)gvGifts.Rows[i].Cells[4].FindControl("lblA04DateReceived")).Text;
                tableA04.Rows.Add(row);
            }

            row = null;
            row = tableA04.NewRow();

            //assign data to datasource
            row["A04Id"] = gvGifts.Rows.Count;
            row["A04Person"] = fldA04Person.Text;
            row["A04Value"] = fldA04Value.Text;
            row["A04Entity"] = fldA04Entity.Text;
            row["A04DateReceived"] = fldA04Date.Text;
            tableA04.Rows.Add(row);
        }

        //bind gridview resource
        DataView dv = new DataView(tableA04);
        gvGifts.DataSource = dv;
        gvGifts.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "resetModalA04();", true);
    }

    protected void dvPInterest_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "B01Delete")
        {
            String parameterValue = Convert.ToString(e.CommandArgument);

            int setId = 0;

            //bind gridview
            for (int i = 0; i < dvPInterest.Rows.Count; i++)
            {
                if (Convert.ToInt32(parameterValue) != i)
                {
                    row = null;
                    row = tableB01.NewRow();
                    row["B01Id"] = setId;
                    row["B01Person"] = ((Label)dvPInterest.Rows[i].Cells[1].FindControl("lblB01Person")).Text;
                    row["B01Relationship"] = ((Label)dvPInterest.Rows[i].Cells[2].FindControl("lblB01Relationship")).Text;
                    row["B01Organisation"] = ((Label)dvPInterest.Rows[i].Cells[3].FindControl("lblB01Organisation")).Text;
                    row["B01Nature"] = ((Label)dvPInterest.Rows[i].Cells[4].FindControl("lblB01Nature")).Text;
                    tableB01.Rows.Add(row);
                    setId += 1;
                }
            }

            //bind gridview resource
            DataView dv = new DataView(tableB01);
            dvPInterest.DataSource = dv;
            dvPInterest.DataBind();
        }
    }

    protected void btnB01Submit_Click(object sender, EventArgs e)
    {
        //get gridview data
        if (dvPInterest.Rows.Count == 0)
        {
            row = null;
            row = tableB01.NewRow();

            //assign data to datasource
            row["B01Id"] = "0";
            row["B01Person"] = fldB01Person.Text;
            row["B01Relationship"] = fldB01Relationship.Text;
            row["B01Organisation"] = fldB01Organisation.Text;
            row["B01Nature"] = fldB01Nature.Text;
            tableB01.Rows.Add(row);
        }
        else
        {
            for (int i = 0; i < dvPInterest.Rows.Count; i++)
            {
                row = null;
                row = tableB01.NewRow();
                row["B01Id"] = Convert.ToString(i);
                row["B01Person"] = ((Label)dvPInterest.Rows[i].Cells[1].FindControl("lblB01Person")).Text;
                row["B01Relationship"] = ((Label)dvPInterest.Rows[i].Cells[2].FindControl("lblB01Relationship")).Text;
                row["B01Organisation"] = ((Label)dvPInterest.Rows[i].Cells[3].FindControl("lblB01Organisation")).Text;
                row["B01Nature"] = ((Label)dvPInterest.Rows[i].Cells[4].FindControl("lblB01Nature")).Text;
                tableB01.Rows.Add(row);
            }

            row = null;
            row = tableB01.NewRow();

            //assign data to datasource
            row["B01Id"] = dvPInterest.Rows.Count;
            row["B01Person"] = fldB01Person.Text;
            row["B01Relationship"] = fldB01Relationship.Text;
            row["B01Organisation"] = fldB01Organisation.Text;
            row["B01Nature"] = fldB01Nature.Text;
            tableB01.Rows.Add(row);
        }

        //bind gridview resource
        DataView dv = new DataView(tableB01);
        dvPInterest.DataSource = dv;
        dvPInterest.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "resetModalB01();", true);
    }

    protected void dvBInterest_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "C01Delete")
        {
            String parameterValue = Convert.ToString(e.CommandArgument);

            int setId = 0;

            //bind gridview
            for (int i = 0; i < dvBInterest.Rows.Count; i++)
            {
                if (Convert.ToInt32(parameterValue) != i)
                {
                    row = null;
                    row = tableC01.NewRow();
                    row["C01Id"] = setId;
                    row["C01Person"] = ((Label)dvBInterest.Rows[i].Cells[1].FindControl("lblC01Person")).Text;
                    row["C01Relationship"] = ((Label)dvBInterest.Rows[i].Cells[2].FindControl("lblC01Relationship")).Text;
                    row["C01Organisation"] = ((Label)dvBInterest.Rows[i].Cells[3].FindControl("lblC01Organisation")).Text;
                    row["C01Nature"] = ((Label)dvBInterest.Rows[i].Cells[4].FindControl("lblC01Nature")).Text;
                    tableC01.Rows.Add(row);
                    setId += 1;
                }
            }

            //bind gridview resource
            DataView dv = new DataView(tableC01);
            dvBInterest.DataSource = dv;
            dvBInterest.DataBind();
        }
    }

    protected void btnC01Submit_Click(object sender, EventArgs e)
    {
        //get gridview data
        if (dvBInterest.Rows.Count == 0)
        {
            row = null;
            row = tableC01.NewRow();

            //assign data to datasource
            row["C01Id"] = "0";
            row["C01Person"] = fldC01Person.Text;
            row["C01Relationship"] = fldC01Relationship.Text;
            row["C01Organisation"] = fldC01Organisation.Text;
            row["C01Nature"] = fldC01Nature.Text;
            tableC01.Rows.Add(row);
        }
        else
        {
            for (int i = 0; i < dvBInterest.Rows.Count; i++)
            {
                row = null;
                row = tableC01.NewRow();
                row["C01Id"] = Convert.ToString(i);
                row["C01Person"] = ((Label)dvBInterest.Rows[i].Cells[1].FindControl("lblC01Person")).Text;
                row["C01Relationship"] = ((Label)dvBInterest.Rows[i].Cells[2].FindControl("lblC01Relationship")).Text;
                row["C01Organisation"] = ((Label)dvBInterest.Rows[i].Cells[3].FindControl("lblC01Organisation")).Text;
                row["C01Nature"] = ((Label)dvBInterest.Rows[i].Cells[4].FindControl("lblC01Nature")).Text;
                tableC01.Rows.Add(row);
            }

            row = null;
            row = tableC01.NewRow();

            //assign data to datasource
            row["C01Id"] = dvPInterest.Rows.Count;
            row["C01Person"] = fldC01Person.Text;
            row["C01Relationship"] = fldC01Relationship.Text;
            row["C01Organisation"] = fldC01Organisation.Text;
            row["C01Nature"] = fldC01Nature.Text;
            tableC01.Rows.Add(row);
        }

        //bind gridview resource
        DataView dv = new DataView(tableC01);
        dvBInterest.DataSource = dv;
        dvBInterest.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "resetModalC01();", true);
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

    protected void bindA03Type()
    {
        // Bind data to the dropdownlist control.
        qs = "";
        qs = qs + " SELECT          drop_id, drop_desc ";
        qs = qs + " FROM            tbl_coi_dropdownlist ";
        qs = qs + " WHERE           drop_status = '1' AND drop_type = 'CompanyType'";
        qs = qs + " ORDER BY        id ";
        fldA03Type.DataSource = GetData(qs);
        fldA03Type.DataTextField = "drop_desc";
        fldA03Type.DataValueField = "drop_id";
        fldA03Type.DataBind();
        fldA03Type.Items.Insert(0, new ListItem("-- Please select one --", ""));
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