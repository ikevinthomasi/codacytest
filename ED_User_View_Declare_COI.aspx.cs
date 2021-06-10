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

public partial class ED_User_View_Declare_COI : System.Web.UI.Page
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
            //reset view
            dvDiscloseInfo.Visible = false;
            dvHODReview.Visible = false;
            dvRMCDReview.Visible = false;
            dvHODClose.Visible = false;

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

                //check disclose or declare
                if (row["coi_flag"].ToString() == "Declare")
                {
                    //do nothing
                }
                else if (row["coi_flag"].ToString() == "Disclose")
                {
                    if (row["status"].ToString() == "Review")
                    {
                        dvHODReview.Visible = true;
                        fldHODResolution.Text = row["hod_rev_resolution"].ToString();

                        if (row["hod_rev_url"].ToString().Trim() != "")
                        {
                            lblHODRAttachment.Text = row["hod_rev_url"].ToString();
                            btnHODRAttachment.Attributes.Add("href", row["hod_rev_url"].ToString());
                            btnHODRAttachment.Attributes.Add("target", "_blank");
                            btnHODRAttachment.Text = "View Attachment";
                        }
                        else
                        {
                            btnHODRAttachment.Text = "No Attachment";
                            btnHODRAttachment.Enabled = false;
                        }
                    }
                    else if (row["status"].ToString() == "Recommend")
                    {
                        dvRMCDReview.Visible = true;

                        //check flag
                        if (row["rmd_flag"].ToString() == "Yes")
                        {
                            dvHODReview.Visible = false;
                            fldRMCDRemarks.Text = row["rmd_rev_resolution"].ToString();

                            if (row["rmcd_rev_url"].ToString().Trim() != "")
                            {
                                lblRMCDRAttachment.Text = row["rmcd_rev_url"].ToString();
                                btnRMCDRAttachment.Attributes.Add("href", row["rmcd_rev_url"].ToString());
                                btnRMCDRAttachment.Attributes.Add("target", "_blank");
                                btnRMCDRAttachment.Text = "View Attachment";
                            }
                            else
                            {
                                btnRMCDRAttachment.Text = "No Attachment";
                                btnRMCDRAttachment.Enabled = false;
                            }
                        }
                        else
                        {
                            dvHODReview.Visible = true;
                            fldHODResolution.Text = row["hod_rev_resolution"].ToString();
                            fldRMCDRemarks.Text = row["rmd_recom_resolution"].ToString();

                            if (row["hod_rev_url"].ToString().Trim() != "")
                            {
                                lblHODRAttachment.Text = row["hod_rev_url"].ToString();
                                btnHODRAttachment.Attributes.Add("href", row["hod_rev_url"].ToString());
                                btnHODRAttachment.Attributes.Add("target", "_blank");
                                btnHODRAttachment.Text = "View Attachment";
                            }
                            else
                            {
                                btnHODRAttachment.Text = "No Attachment";
                                btnHODRAttachment.Enabled = false;
                            }

                            if (row["rmd_recom_url"].ToString().Trim() != "")
                            {
                                lblRMCDRAttachment.Text = row["rmd_recom_url"].ToString();
                                btnRMCDRAttachment.Attributes.Add("href", row["rmd_recom_url"].ToString());
                                btnRMCDRAttachment.Attributes.Add("target", "_blank");
                                btnRMCDRAttachment.Text = "View Attachment";
                            }
                            else
                            {
                                btnRMCDRAttachment.Text = "No Attachment";
                                btnRMCDRAttachment.Enabled = false;
                            }
                        }
                    }
                    else if (row["status"].ToString() == "Close")
                    {
                        dvHODClose.Visible = true;
                        dvRMCDReview.Visible = true;
                        fldHODJustification.Text = row["hod_close_resolution"].ToString();

                        if (row["hod_close_url"].ToString().Trim() != "")
                        {
                            lblHODCAttachment.Text = row["hod_close_url"].ToString();
                            btnHODCAttachment.Attributes.Add("href", row["hod_close_url"].ToString());
                            btnHODCAttachment.Attributes.Add("target", "_blank");
                            btnHODCAttachment.Text = "View Attachment";
                        }
                        else
                        {
                            btnHODCAttachment.Text = "No Attachment";
                            btnHODCAttachment.Enabled = false;
                        }

                        //check flag
                        if (row["rmd_flag"].ToString() == "Yes")
                        {
                            dvHODReview.Visible = false;
                            fldRMCDRemarks.Text = row["rmd_rev_resolution"].ToString();

                            if (row["rmcd_rev_url"].ToString().Trim() != "")
                            {
                                lblRMCDRAttachment.Text = row["rmcd_rev_url"].ToString();
                                btnRMCDRAttachment.Attributes.Add("href", row["rmcd_rev_url"].ToString());
                                btnRMCDRAttachment.Attributes.Add("target", "_blank");
                                btnRMCDRAttachment.Text = "View Attachment";
                            }
                            else
                            {
                                btnRMCDRAttachment.Text = "No Attachment";
                                btnRMCDRAttachment.Enabled = false;
                            }
                        }
                        else
                        {
                            dvHODReview.Visible = true;
                            fldHODResolution.Text = row["hod_rev_resolution"].ToString();
                            fldRMCDRemarks.Text = row["rmd_recom_resolution"].ToString();

                            if (row["hod_rev_url"].ToString().Trim() != "")
                            {
                                lblHODRAttachment.Text = row["hod_rev_url"].ToString();
                                btnHODRAttachment.Attributes.Add("href", row["hod_rev_url"].ToString());
                                btnHODRAttachment.Attributes.Add("target", "_blank");
                                btnHODRAttachment.Text = "View Attachment";
                            }
                            else
                            {
                                btnHODRAttachment.Text = "No Attachment";
                                btnHODRAttachment.Enabled = false;
                            }

                            if (row["rmd_recom_url"].ToString().Trim() != "")
                            {
                                lblRMCDRAttachment.Text = row["rmd_recom_url"].ToString();
                                btnRMCDRAttachment.Attributes.Add("href", row["rmd_recom_url"].ToString());
                                btnRMCDRAttachment.Attributes.Add("target", "_blank");
                                btnRMCDRAttachment.Text = "View Attachment";
                            }
                            else
                            {
                                btnRMCDRAttachment.Text = "No Attachment";
                                btnRMCDRAttachment.Enabled = false;
                            }
                        }
                    }
                    else
                    {
                        //Do nothing
                    }

                    //online - disclose
                    dvDiscloseInfo.Visible = true;
                    dvOther.Visible = false;
                    dvPecuniary.Visible = false;

                    if (row["other_coi"].ToString().Trim() != "")
                    {
                        dvOther.Visible = true;
                        fldOtherConflicts.Text = row["other_coi"].ToString();
                    }

                    //bind gridview A1
                    dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_consultant", "");
                    if (dv.Count > 0)
                        dvPecuniary.Visible = true;
                    setDisplay(ref dvConsulting, dv, gvConsulting);

                    //bind gridview A2A
                    dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_business", "Ownership");
                    if (dv.Count > 0)
                        dvPecuniary.Visible = true;
                    setDisplay(ref dvBusinessesA, dv, gvBusinessesA);

                    //bind gridview A2B
                    dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_business", "Others");
                    if (dv.Count > 0)
                        dvPecuniary.Visible = true;
                    setDisplay(ref dvBusinessesB, dv, gvBusinessesB);

                    //bind gridview A3
                    dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_director", "");
                    if (dv.Count > 0)
                        dvPecuniary.Visible = true;
                    setDisplay(ref dvDirectorships, dv, gvDirectorships);

                    //bind gridview A4
                    dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_pecuniary_gift", "");
                    if (dv.Count > 0)
                        dvPecuniary.Visible = true;
                    setDisplay(ref dvGifts, dv, gvGifts);


                    //bind gridview B1
                    dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_personal", "");
                    setDisplay(ref dvPInterest, dv, gvPInterest);

                    //bind gridview C1
                    dv = GetdataListing(row["declare_no"].ToString(), row["staff_ic"].ToString(), "tbl_coi_business", "");
                    setDisplay(ref dvBInterest, dv, gvBInterest);

                }
                else
                {
                    //do nothing
                }
            }
        }
            
    }

    private DataView GetdataListing(String sDNo, String sDIC, String sDTbl, String sPara)
    {
        if (sPara != "")
        {
            sPara = " AND type_bus = '"+ sPara + "'";
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