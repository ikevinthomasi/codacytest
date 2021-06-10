using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ED_Admin_UserDetails_Upload : System.Web.UI.Page
{
    DataRow row = null;
    DataRow rowT = null;
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
            btnImport.Visible = false;
        }

        if (table.Rows.Count == 0)
        {
            //Create array
            table.Columns.Add("id", typeof(string));
            table.Columns.Add("staff_no", typeof(string));
            table.Columns.Add("staff_ic", typeof(string));
            table.Columns.Add("staff_name", typeof(string));
            table.Columns.Add("email_address", typeof(string));
            table.Columns.Add("position", typeof(string));
            table.Columns.Add("division", typeof(string));
            table.Columns.Add("department", typeof(string));
            table.Columns.Add("section", typeof(string));
            table.Columns.Add("role", typeof(string));
            table.Columns.Add("reporting1", typeof(string));
            table.Columns.Add("reporting2", typeof(string));
            table.Columns.Add("reporting3", typeof(string));
            table.Columns.Add("status", typeof(string));
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

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        btnImport.Visible = true;

        string FileName = Path.GetFileName(fldExcelFile.PostedFile.FileName);
        string Extension = Path.GetExtension(fldExcelFile.PostedFile.FileName);
        string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

        string FilePath = Server.MapPath(FolderPath + FileName);
        fldExcelFile.SaveAs(FilePath);

        try
        {
            Import_To_DB_User(FilePath, Extension, "Yes");

            //Delete temp file
            File.Delete(Server.MapPath(FolderPath + FileName));

            //Response.Redirect(Request.RawUrl);
        }
        catch (Exception error)
        {
            errExcelFile.Visible = true;
            errExcelFile.Text = "1-" + error.ToString();
            File.Delete(Server.MapPath(FolderPath + FileName));
        }
    }

    protected void btnImport_Click(object sender, EventArgs e)
    {
        //Assign gridview to datatable
        for (int i = 0; i < gvUpload.Rows.Count; i++)
        {
            row = null;
            row = table.NewRow();

            row["staff_no"] = ((Label)gvUpload.Rows[i].Cells[1].FindControl("lblStaffNo")).Text;
            row["staff_ic"] = ((Label)gvUpload.Rows[i].Cells[1].FindControl("lblStaffIC")).Text;
            row["staff_name"] = ((Label)gvUpload.Rows[i].Cells[2].FindControl("lblStaffName")).Text;
            row["email_address"] = ((Label)gvUpload.Rows[i].Cells[2].FindControl("lblEmailAddress")).Text;
            row["position"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblPosition")).Text;
            row["division"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblDivision")).Text;
            row["department"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblDepartment")).Text;
            row["section"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblSection")).Text;
            row["role"] = ((Label)gvUpload.Rows[i].Cells[5].FindControl("lblRole")).Text;
            row["reporting1"] = ((Label)gvUpload.Rows[i].Cells[4].FindControl("lblReporting1")).Text;
            row["reporting2"] = ((Label)gvUpload.Rows[i].Cells[4].FindControl("lblReporting2")).Text;
            row["reporting3"] = ((Label)gvUpload.Rows[i].Cells[4].FindControl("lblReporting3")).Text;
            row["status"] = ((HiddenField)gvUpload.Rows[i].Cells[5].FindControl("hidStatus")).Value;

            table.Rows.Add(row);
        }

        //Insert update into database
        if (table.Rows.Count != 0)
        {
            for (int i = 0; i < table.Rows.Count; i++)
            {
                row = null;
                row = table.Rows[i];

                //Insert update into database
                qs = "";
                qs = qs + " IF NOT EXISTS(SELECT 1 FROM tbl_declare_user WHERE  staff_ic = @pstaff_ic) ";
                qs = qs + "     INSERT INTO tbl_declare_user ";
                qs = qs + "     ( staff_no, staff_ic, staff_name, email_address, ";
                qs = qs + "       position, division, department, section, ";
                qs = qs + "       role, reporting1, reporting2, reporting3, status )";
                qs = qs + "     VALUES ";
                qs = qs + "     ( @pstaff_no, @pstaff_ic, @pstaff_name, @pemail_address, ";
                qs = qs + "       @pposition, @pdivision, @pdepartment, @psection, ";
                qs = qs + "       @prole, @preporting1, @preporting2, @preporting3, @pstatus )";
                qs = qs + " ELSE ";
                qs = qs + "     UPDATE tbl_declare_user SET ";
                qs = qs + "     staff_no = @pstaff_no, staff_name = @pstaff_name, email_address = @pemail_address, ";
                qs = qs + "     position = @pposition, division = @pdivision, department = @pdepartment, section = @psection, ";
                qs = qs + "     role = @prole, reporting1 = @preporting1, reporting2 = @preporting2, reporting3 = @preporting3, status = @pstatus ";
                qs = qs + "     WHERE  staff_ic = @pstaff_ic ";
                if (con.State == System.Data.ConnectionState.Closed)
                { con.Open(); }
                cmd = new SqlCommand(qs, con);
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@pstaff_no", row["staff_no"].ToString());
                cmd.Parameters.AddWithValue("@pstaff_ic", row["staff_ic"].ToString());
                cmd.Parameters.AddWithValue("@pstaff_name", row["staff_name"].ToString());
                cmd.Parameters.AddWithValue("@pemail_address", row["email_address"].ToString());
                cmd.Parameters.AddWithValue("@pposition", row["position"].ToString());
                cmd.Parameters.AddWithValue("@pdivision", row["division"].ToString());
                cmd.Parameters.AddWithValue("@pdepartment", row["department"].ToString());
                cmd.Parameters.AddWithValue("@psection", row["section"].ToString());
                cmd.Parameters.AddWithValue("@prole", row["role"].ToString());
                cmd.Parameters.AddWithValue("@preporting1", row["reporting1"].ToString());
                cmd.Parameters.AddWithValue("@preporting2", row["reporting2"].ToString());
                cmd.Parameters.AddWithValue("@preporting3", row["reporting3"].ToString());
                cmd.Parameters.AddWithValue("@pstatus", row["status"].ToString());
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Response.Redirect("ED_Admin_UserDetails_Upload.aspx");
        }
    }

    private void Import_To_DB_User(string FilePath, string Extension, string isHDR)
    {
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                break;
            case ".xlsx": //Excel 07
                conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath, isHDR);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;
        connExcel.Open();

        //Get the name of First Sheet
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

        //Read Data from First Sheet
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        oda.SelectCommand = cmdExcel;
        oda.Fill(dt);
        connExcel.Close();

        //try
        //{
        //    //Get the name of First Sheet
        //    DataTable dtExcelSchema;
        //    dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        //    string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

        //    //Read Data from First Sheet
        //    cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        //    oda.SelectCommand = cmdExcel;
        //    oda.Fill(dt);
        //    connExcel.Close();
        //}
        //catch (Exception error)
        //{
        //    errExcelFile.Visible = true;
        //    errExcelFile.Text = error.ToString();
        //    connExcel.Close();
        //}

        if (dt.Rows.Count != 0)
        {
            int skip = 0;
            int incl = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                row = null;
                row = dt.Rows[i];

                rowT = null;
                rowT = table.NewRow();

                if (row["staff_ic"].ToString() == "")
                {
                    skip += 1;
                }
                else
                {
                    rowT["id"] = i.ToString();
                    rowT["staff_no"] = removeNull(row["staff_no"].ToString());
                    rowT["staff_ic"] = removeNull(row["staff_ic"].ToString());
                    rowT["staff_name"] = removeNull(row["staff_name"].ToString());
                    rowT["email_address"] = removeNull(row["email_address"].ToString());
                    rowT["position"] = removeNull(row["position"].ToString());
                    rowT["division"] = removeNull(row["division"].ToString());
                    rowT["department"] = removeNull(row["department"].ToString());
                    rowT["section"] = removeNull(row["section"].ToString());
                    rowT["role"] = removeNull(row["role"].ToString());
                    rowT["reporting1"] = removeNull(row["reporting1"].ToString());
                    rowT["reporting2"] = removeNull(row["reporting2"].ToString());
                    rowT["reporting3"] = removeNull(row["reporting3"].ToString());
                    rowT["status"] = removeNull(row["status"].ToString());

                    table.Rows.Add(rowT);
                    incl += 1;
                }
            }

            if (skip > 0)
            {
                lblSkip.Text = "Skipped : " + skip.ToString();
            }

            lblTotal.Text = "Total : " + Convert.ToString(skip + incl);

            //Bind gridview
            DataView dv = new DataView(table);
            gvUpload.DataSource = dv;
            gvUpload.DataBind();
        }
    }

    protected void gvUpload_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DDelete")
        {
            String pVal = Convert.ToString(e.CommandArgument);
            int y = 0;

            for (int i = 0; i < gvUpload.Rows.Count; i++)
            {
                if (Convert.ToInt32(pVal) != i)
                {
                    rowT = null;
                    rowT = table.NewRow();

                    rowT["id"] = y.ToString();
                    rowT["staff_no"] = ((Label)gvUpload.Rows[i].Cells[1].FindControl("lblStaffNo")).Text;
                    rowT["staff_ic"] = ((Label)gvUpload.Rows[i].Cells[1].FindControl("lblStaffIC")).Text;
                    rowT["staff_name"] = ((Label)gvUpload.Rows[i].Cells[2].FindControl("lblStaffName")).Text;
                    rowT["email_address"] = ((Label)gvUpload.Rows[i].Cells[2].FindControl("lblEmailAddress")).Text;
                    rowT["position"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblPosition")).Text;
                    rowT["division"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblDivision")).Text;
                    rowT["department"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblDepartment")).Text;
                    rowT["section"] = ((Label)gvUpload.Rows[i].Cells[3].FindControl("lblSection")).Text;
                    rowT["role"] = ((Label)gvUpload.Rows[5].Cells[1].FindControl("lblRole")).Text;
                    rowT["reporting1"] = ((Label)gvUpload.Rows[i].Cells[4].FindControl("lblReporting1")).Text;
                    rowT["reporting2"] = ((Label)gvUpload.Rows[i].Cells[4].FindControl("lblReporting2")).Text;
                    rowT["reporting3"] = ((Label)gvUpload.Rows[i].Cells[4].FindControl("lblReporting3")).Text;
                    rowT["status"] = ((HiddenField)gvUpload.Rows[i].Cells[5].FindControl("hidStatus")).Value;

                    table.Rows.Add(rowT);
                    y += 1;
                }
            }

            //Bind gridview
            DataView dv = new DataView(table);
            gvUpload.DataSource = dv;
            gvUpload.DataBind();
        }
    }

    private String removeNull(String input)
    {
        String cleanStr = input;

        if (input == "NULL" || input == "NA" || input == "-")
        {
            cleanStr = "";
        }

        return cleanStr;

    }
    
}