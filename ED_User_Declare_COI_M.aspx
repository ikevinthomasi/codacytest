<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_User_Declare_COI_M.aspx.cs" Inherits="ED_User_Declare_COI_M" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-lg"><b>Employee Declaration Form - Conflict of Interest</b></label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        Please fill up the detail of declaration.<br />
                        <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                        <i class="fa fa-angle-right"></i>&nbsp;&nbsp;Maximum size of attachment is 5MB with file type ( .pdf ).
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-lg"><i class="fa fa-file-contract text-primary"></i> &nbsp;<b>Declaration</b></label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label class="form-control-sm">Declare Selection &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
                    <asp:DropDownList ID="fldSelection" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                    <div class="invalid-feedback">Valid Declare Selection is required.</div>
                </div>
                <div class="col-md-6">
                    <label class="form-control-sm">Declare Date &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
                    <div class="input-group date" id="DTDeclareDate" data-target-input="nearest">
                        <asp:TextBox ID="fldDeclareDate" runat="server" CssClass="form-control form-control-sm datetimepicker-input" data-target="#DTDeclareDate"></asp:TextBox>
                        <div class="input-group-append" data-target="#DTDeclareDate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                        <div class="invalid-feedback">Valid Date is required.</div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-control-sm">Attachment &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
                    <div class="input-group">
                        <asp:FileUpload ID="fldAttachment" runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" />
                        <div class="input-group-append">
                            <button type="button" class="btn btn-danger btn-sm" onclick="clearUpload();" >Clear</button>
                        </div>
                        <div class="invalid-feedback">Valid Attachment is required.<asp:Label ID="errAttach" runat="server" /></div>
                    </div>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-md-4"><label class="form-control-sm">Name</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecName" runat="server" CssClass="form-control-sm"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label class="form-control-sm">Division</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecDivision" runat="server" CssClass="form-control-sm"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label class="form-control-sm">Department</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecDepartment" runat="server" CssClass="form-control-sm"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label class="form-control-sm">Position</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecPosition" runat="server" CssClass="form-control-sm"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label class="form-control-sm">Email Address</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecEmail" runat="server" CssClass="form-control-sm"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label class="form-control-sm">Email Password</label></div>
                <div class="col-md-4">
                    <asp:TextBox ID="fldDecPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password"></asp:TextBox>
                    <div class="invalid-feedback">Valid Email Password is required.</div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="errlbl" runat="server" CssClass="form-control-sm text-danger"></asp:Label>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-md-2 offset-md-5">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-sm btn-primary btn-block"  OnClick="btnSubmit_Click" OnClientClick="return validateErr();" />
                </div>
            </div>

        </div>
    </div>

<script type="text/javascript">
    $(function () {
        $('#DTDeclareDate').datetimepicker({
            format: 'DD-MMM-YYYY',
            showToday: true,
            showClear: true,
            showClose: true
        });
    });
</script>

<script type="text/javascript">
    function clearUpload() {
        document.getElementById('<%=fldAttachment.ClientID%>').value = "";
        document.getElementById('<%=fldAttachment.ClientID%>').className = "form-control form-control-sm";
    }

    function validateErr() {
        var chckErr = true;

        //Reset error
        document.getElementById('<%=fldSelection.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldDeclareDate.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldAttachment.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=errAttach.ClientID%>').innerText = '';
        document.getElementById('<%=fldDecPassword.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=errlbl.ClientID%>').innerText = '';

        if (document.getElementById('<%=fldDecPassword.ClientID%>').value == "") {
            document.getElementById('<%=fldDecPassword.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldSelection.ClientID%>').value == "") {
            document.getElementById('<%=fldSelection.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldDeclareDate.ClientID%>').value == "") {
            document.getElementById('<%=fldDeclareDate.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldAttachment.ClientID%>').value != "") {
            var sFile = document.getElementById('<%=fldAttachment.ClientID%>');
            var sFileName = sFile.value;
            var maxFileSize = 5.0;
            var extension = sFileName.substr(sFileName.lastIndexOf('.') + 1).toLowerCase();
            var allowedExtensions = ['pdf', 'PDF'];

            if (allowedExtensions.indexOf(extension) == -1) {
                document.getElementById('<%=fldAttachment.ClientID%>').className = "form-control form-control-sm is-invalid";
                chckErr = false;
            }

            if ((sFile.files[0].size / 1024 / 1024).toFixed(2) > maxFileSize) {
                document.getElementById('<%=errAttach.ClientID%>').innerText = 'This file size is ' + (sFile.files[0].size / 1024 / 1024).toFixed(2) + 'MB';
                document.getElementById('<%=fldAttachment.ClientID%>').className = "form-control form-control-sm is-invalid";
                chckErr = false;
            }
        }
        else {
            document.getElementById('<%=errAttach.ClientID%>').innerText = '';
            document.getElementById('<%=fldAttachment.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        return chckErr;

    }
</script>

</asp:Content>

