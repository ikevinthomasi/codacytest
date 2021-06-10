using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ED_User_Review_COI_Details : System.Web.UI.Page
{
    DataRow row = null;
    DataView dv = null;
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
            //select from database
            qs = "";
            qs = qs + " SELECT          tbl_declare_form.*, tbl_declare_user.staff_name ";
            qs = qs + " FROM            tbl_declare_form ";
            qs = qs + " LEFT JOIN       tbl_declare_user ON tbl_declare_form.staff_ic = tbl_declare_user.staff_ic ";
            qs = qs + " WHERE           tbl_declare_form.declare_no = @pdeclare_no AND tbl_declare_form.staff_ic = @pstaff_ic ";
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            cmd = new SqlCommand(qs, con);
            cmd.Parameters.AddWithValue("@pdeclare_no", Request.QueryString["rid"].ToString());
            cmd.Parameters.AddWithValue("@pstaff_ic", Request.QueryString["rpid"].ToString());
            cmd.CommandTimeout = 0;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count > 0)
            {
                row = null;
                row = dt.Rows[0];

                lblYear.Text = Convert.ToDateTime(row["declare_date"]).ToString("yyyy");
                fldDeclareNo.Text = row["declare_no"].ToString();
                fldStatus.Text = row["status"].ToString();
                fldICNo.Text = row["staff_ic"].ToString();
                fldName.Text = row["staff_name"].ToString();
                fldDeclareDate.Text = Convert.ToDateTime(row["declare_date"]).ToString("dd-MMM-yyyy HH:mm:ss");
                fldDeclareType.Text = row["form_name"].ToString();
                fldCOIType.Text = row["coi_flag"].ToString();
                fldCreateDate.Text = Convert.ToDateTime(row["created_date"]).ToString("dd-MMM-yyyy HH:mm:ss");

                dvOther.Visible = false;
                dvPecuniary.Visible = false;

                if (row["other_coi"].ToString().Trim() != "")
                {
                    dvOther.Visible = true;
                    fldOtherConflicts.Text = row["other_coi"].ToString();
                    hidcoiDesc.Value += "Other Conflicts, ";
                }

                //bind gridview A1
                dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_consultant", "");
                if (dv.Count > 0)
                {
                    hidcoiDesc.Value += "Pecuniary Interests (Consulting, Outside Employment, and Other Outside Activities), ";
                    dvPecuniary.Visible = true;
                }
                setDisplay(ref dvConsulting, dv, gvConsulting);

                //bind gridview A2A
                dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_business", "Ownership");
                if (dv.Count > 0)
                {
                    hidcoiDesc.Value += "Pecuniary Interests (Businesses - Ownership of Shares), ";
                    dvPecuniary.Visible = true;
                }
                setDisplay(ref dvBusinessesA, dv, gvBusinessesA);

                //bind gridview A2B
                dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_business", "Others");
                if (dv.Count > 0)
                {
                    hidcoiDesc.Value += "Pecuniary Interests (Businesses - Other Direct & Indirect Interests), ";
                    dvPecuniary.Visible = true;
                }
                setDisplay(ref dvBusinessesB, dv, gvBusinessesB);

                //bind gridview A3
                dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_director", "");
                if (dv.Count > 0)
                {
                    hidcoiDesc.Value += "Pecuniary Interests (Company Directorships), ";
                    dvPecuniary.Visible = true;
                }
                setDisplay(ref dvDirectorships, dv, gvDirectorships);

                //bind gridview A4
                dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_gift", "");
                if (dv.Count > 0)
                {
                    hidcoiDesc.Value += "Pecuniary Interests (Gifts & Solicitations), ";
                    dvPecuniary.Visible = true;
                }
                setDisplay(ref dvGifts, dv, gvGifts);


                //bind gridview B1
                dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_personal", "");
                if (dv.Count > 0)
                    hidcoiDesc.Value += "Personal Interest, ";
                setDisplay(ref dvPInterest, dv, gvPInterest);

                //bind gridview C1
                dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_business", "");
                if (dv.Count > 0)
                    hidcoiDesc.Value += "Business Interest, ";
                setDisplay(ref dvBInterest, dv, gvBInterest);
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
        li3.Attributes["class"] = "nav-item active";
        li4.Attributes["class"] = "nav-item";
        li5.Attributes["class"] = "nav-item dropdown";
    }

    protected void btnReview_Click(object sender, EventArgs e)
    {
        String urlFile = "";

        //upload attachment
        if (fldAttachment.HasFile)
        {
            urlFile = uploadAttachment(Request.QueryString["rid"].ToString(), Request.QueryString["rpid"].ToString());
        }

        //update database
        qs = "";
        qs = qs + " UPDATE  tbl_declare_form ";
        qs = qs + " SET ";
        qs = qs + " hod_rev_resolution = @phod_rev_resolution, ";
        qs = qs + " hod_rev_url = @phod_rev_url, ";
        qs = qs + " status = @pstatus, ";
        qs = qs + " action_date = @paction_date, ";
        qs = qs + " action_by = @paction_by, ";
        qs = qs + " review_date = @preview_date, ";
        qs = qs + " review_by = @preview_by ";
        qs = qs + " WHERE declare_no = @pdeclare_no AND staff_ic = @pstaff_ic ";
        if (con.State == System.Data.ConnectionState.Closed)
        { con.Open(); }
        cmd = new SqlCommand(qs, con);
        cmd.CommandTimeout = 0;
        cmd.Parameters.AddWithValue("@pdeclare_no", Request.QueryString["rid"].ToString());
        cmd.Parameters.AddWithValue("@pstaff_ic", Request.QueryString["rpid"].ToString());
        cmd.Parameters.AddWithValue("@phod_rev_resolution", fldResolution.Text);
        cmd.Parameters.AddWithValue("@phod_rev_url", urlFile);
        cmd.Parameters.AddWithValue("@pstatus", "Review");
        cmd.Parameters.AddWithValue("@paction_date", DateTime.Now);
        cmd.Parameters.AddWithValue("@paction_by", Session["user_id"].ToString());
        cmd.Parameters.AddWithValue("@preview_date", DateTime.Now);
        cmd.Parameters.AddWithValue("@preview_by", Session["user_id"].ToString());
        cmd.ExecuteNonQuery();
        con.Close();

        //email notification
        emailnotification(Request.QueryString["rid"].ToString(), hidcoiDesc.Value.ToString());

        //redirect to page
        Response.Redirect("ED_User_Review_COI.aspx");
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
        bodyMail = bodyMail + "<td colspan='3'>The following action for COI submission is pending for your verification:<br/><br/></td>";
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
        bodyMail = bodyMail + "<td>" + fldName.Text + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td>HOD Resolution</td>";
        bodyMail = bodyMail + "<td>:</td>";
        bodyMail = bodyMail + "<td>" + fldResolution.Text + "</td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'><br/><br/><b>Click link below to view the COI declaration:</b></td>";
        bodyMail = bodyMail + "</tr>";
        bodyMail = bodyMail + "<tr>";
        bodyMail = bodyMail + "<td colspan='3'><a href='https://edeclaration.uemedgenta.com/'>https://edeclaration.uemedgenta.com/</a></td>";
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

        //select from database - risk administrator
        mailMsg.To.Add("compliance@uemedgenta.uemnet.com");
        mailMsg.From = new MailAddress("eDeclaration@uemedgenta.uemnet.com");
        mailMsg.Subject = "ACTION FOR COI SUBMITTED [VERIFICATION REQUIRED] : " + reqNo;
        mailMsg.Body = bodyMail;
        mailMsg.IsBodyHtml = true;
        smtpClient.Send(mailMsg);
    }

    private DataView GetdataListing(String sDNo, String sDIC, String sDTbl, String sPara)
    {
        if (sPara != "")
        {
            sPara = " AND type_bus = '" + sPara + "'";
        }

        qs = "";
        qs = qs + " SELECT          * ";
        qs = qs + " FROM            " + sDTbl;
        qs = qs + " WHERE           declare_no LIKE '%" + sDNo + "%' AND created_by LIKE '%" + sDIC + "%' " + sPara;
        qs = qs + " ORDER BY        id ";
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

    private void setDisplay(ref HtmlGenericControl divS, DataView dataS, GridView gvS)
    {
        if (dataS.Count > 0)
        {
            divS.Visible = true;
            gvS.DataSource = dataS;
            gvS.DataBind();
        }
        else
        {
            divS.Visible = false;
        }
    }

    private String uploadAttachment(String reqId, String ICNo)
    {
        String pathfolder = "Upload/";
        String filenameStr = "HOD_Review_" + reqId;
        string strFileExtension = Path.GetExtension(fldAttachment.PostedFile.FileName);

        //Check path folder
        pathfolder = "Upload/" + ICNo;

        //Check year folder created
        if (Directory.Exists(Server.MapPath(pathfolder)) == false)
        {
            Directory.CreateDirectory(Server.MapPath(pathfolder));
        }

        //Update path to folder assigned
        pathfolder = pathfolder + "/";

        //Upload file
        fldAttachment.PostedFile.SaveAs(Server.MapPath(pathfolder) + filenameStr + strFileExtension);

        return pathfolder + filenameStr + strFileExtension;
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