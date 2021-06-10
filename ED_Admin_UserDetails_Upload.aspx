<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_Admin_UserDetails_Upload.aspx.cs" Inherits="ED_Admin_UserDetails_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <label class="form-control-lg"><b>Upload Staff Listing</b></label>
        </div>
    </div>
    <asp:Label ID="errExcelFile" runat="server" />
    <div class="row">
        <div class="col-md-2">
            <label class="form-control-sm">File Upload &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
        </div>
        <div class="col-md-4">
            <div class="input-group">
                <asp:FileUpload ID="fldExcelFile" runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" />
                <div class="input-group-append">
                    <button type="button" class="btn btn-danger btn-sm" onclick="clearUpload();" >Clear</button>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-sm btn-primary btn-block"  OnClick="btnUpload_Click" OnClientClick="return validateErr();" />
                </div>
                <div class="invalid-feedback">Valid File Upload is required.</div>
            </div>
        </div>
        <div class="col-md-4">&nbsp;</div>
        <div class="col-md-2">
            <asp:Hyperlink ID="btnTemplate" runat="server" CssClass="btn btn-primary btn-sm btn-block" NavigateUrl="coi_template.xlsx" Target="_blank">Excel Template</asp:Hyperlink>
        </div>
    </div>

    <hr />

    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lblSkip" runat="server" Text="Skipped : 0" CssClass="form-control-sm" />
        </div>
        <div class="col-md-2">
            <asp:Label ID="lblTotal" runat="server" Text="Total : 0" CssClass="form-control-sm" />
        </div>
        <div class="col-md-6">&nbsp;</div>
        <div class="col-md-2">
            <asp:Button ID="btnImport" runat="server" Text="Import Data" CssClass="btn btn-success btn-sm btn-block" OnClick="btnImport_Click" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvUpload" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" DataKeyNames="Id" ShowHeaderWhenEmpty="true" OnRowCommand="gvUpload_RowCommand">
            <Columns>
                <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Staff No / IC" ItemStyle-Width="15%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblStaffNo" runat="server" Text='<%# Eval("staff_no") %>' CssClass="form-control-sm"></asp:Label><br />
                    <asp:Label ID="lblStaffIC" runat="server" Text='<%# Eval("staff_ic") %>' CssClass="form-control-sm"></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Staff Name" ItemStyle-Width="30%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblStaffName" runat="server" Text='<%# Eval("staff_name") %>' CssClass="form-control-sm"></asp:Label><br />
                    <asp:Label ID="lblEmailAddress" runat="server" Text='<%# Eval("email_address") %>' CssClass="form-control-sm"></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Staff Details" ItemStyle-Width="30%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblPosition" runat="server" Text='<%# Eval("position") %>' CssClass="form-control-sm"></asp:Label><br />
                    <asp:Label ID="lblDivision" runat="server" Text='<%# Eval("division") %>' CssClass="form-control-sm"></asp:Label><br />
                    <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("department") %>' CssClass="form-control-sm"></asp:Label><br />
                    <asp:Label ID="lblSection" runat="server" Text='<%# Eval("section") %>' CssClass="form-control-sm"></asp:Label>                
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reporting Line" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblReporting1" runat="server" Text='<%# Eval("reporting1") %>' CssClass="form-control-sm"></asp:Label><br />
                    <asp:Label ID="lblReporting2" runat="server" Text='<%# Eval("reporting2") %>' CssClass="form-control-sm"></asp:Label><br />
                    <asp:Label ID="lblReporting3" runat="server" Text='<%# Eval("reporting3") %>' CssClass="form-control-sm"></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Role" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblRole" runat="server" Text='<%# Eval("role") %>' CssClass="form-control-sm"></asp:Label>
                    <asp:HiddenField ID="hidStatus" runat="server" Value='<%# Eval("status") %>' />
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" Text="No data found."></asp:Label></EmptyDataTemplate>
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>

<script type="text/javascript">
    function clearUpload() {
        document.getElementById('<%=fldExcelFile.ClientID%>').value = "";
        document.getElementById('<%=fldExcelFile.ClientID%>').className = "form-control form-control-sm";
    }

    function validateErr() {
        var chckErr = true;

        //Reset error
        document.getElementById('<%=fldExcelFile.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=errExcelFile.ClientID%>').innerText = '';

        if (document.getElementById('<%=fldExcelFile.ClientID%>').value != "") {
            var sFile = document.getElementById('<%=fldExcelFile.ClientID%>');
            var sFileName = sFile.value;
            var maxFileSize = 5.0;
            var extension = sFileName.substr(sFileName.lastIndexOf('.') + 1).toLowerCase();
            var allowedExtensions = ['xls', 'XLS', 'xlsx', 'XLSX'];

            if (allowedExtensions.indexOf(extension) == -1) {
                document.getElementById('<%=fldExcelFile.ClientID%>').className = "form-control form-control-sm is-invalid";
                chckErr = false;
            }

            if ((sFile.files[0].size / 1024 / 1024).toFixed(2) > maxFileSize) {
                document.getElementById('<%=errExcelFile.ClientID%>').innerText = 'This file size is ' + (sFile.files[0].size / 1024 / 1024).toFixed(2) + 'MB';
                document.getElementById('<%=fldExcelFile.ClientID%>').className = "form-control form-control-sm is-invalid";
                chckErr = false;
            }
        }
        else {
            document.getElementById('<%=errExcelFile.ClientID%>').innerText = '';
            document.getElementById('<%=fldExcelFile.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        return chckErr;

    }
</script>

</asp:Content>

