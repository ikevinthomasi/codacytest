<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_Admin_UserDetails_Update.aspx.cs" Inherits="ED_Admin_UserDetails_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <label class="form-control-lg"><b>Update Staff Information</b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label class="form-control-sm">
                Please fill up the detail of declaration.<br />
                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
            </label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label class="form-control-sm">Identification Card No &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
            <asp:Label ID="fldICNO" runat="server" CssClass="form-control form-control-sm"></asp:Label>
        </div>
        <div class="col-md-6">
            <label class="form-control-sm">Full Name &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
            <asp:TextBox ID="fldSName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            <div class="invalid-feedback">Valid Name is required.</div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label class="form-control-sm">Email Address &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
            <asp:TextBox ID="fldEmail" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            <div class="invalid-feedback">Valid Email is required.</div>
        </div>
        <div class="col-md-6">
            <label class="form-control-sm">Position &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
            <asp:TextBox ID="fldPosition" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            <div class="invalid-feedback">Valid Position is required.</div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">Division &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
                    <asp:TextBox ID="fldDivision" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    <div class="invalid-feedback">Valid Division is required.</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">Department &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
                    <asp:TextBox ID="fldDepartment" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    <div class="invalid-feedback">Valid Department is required.</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">Section &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
                    <asp:TextBox ID="fldSection" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    <div class="invalid-feedback">Valid Section is required.</div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">Reporting Line 1 &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
                    <asp:DropDownList ID="fldReport1" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                    <div class="invalid-feedback">Valid Section is required.</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">Reporting Line 2</label>
                    <asp:DropDownList ID="fldReport2" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                    <div class="invalid-feedback">Valid Reporting Line 2 is required.</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">Reporting Line 3</label>
                    <asp:DropDownList ID="fldReport3" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                    <div class="invalid-feedback">Valid Reporting Line 3 is required.</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label class="form-control-sm">Status &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
            <asp:DropDownList ID="fldStatus" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
            <div class="invalid-feedback">Valid Status is required.</div>
        </div>
        <div class="col-md-6">
            <label class="form-control-sm">Role &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
            <asp:DropDownList ID="fldRole" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
            <div class="invalid-feedback">Valid Role is required.</div>
        </div>
    </div>

    <hr />
    <div class="row">
        <div class="col-md-2 offset-md-5">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-sm btn-primary btn-block"  OnClick="btnUpdate_Click" OnClientClick="return validateErr();" />
        </div>
    </div>
    <br />

<script type="text/javascript">

    function validateErr() {
        var chckErr = true;

        //Reset error         
        document.getElementById('<%=fldICNO.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldSName.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldEmail.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldPosition.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldDivision.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldDepartment.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldSection.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldRole.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=fldReport1.ClientID%>').className = "form-control form-control-sm";

        if (document.getElementById('<%=fldICNO.ClientID%>').value == "") {
            document.getElementById('<%=fldICNO.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldSName.ClientID%>').value == "") {
            document.getElementById('<%=fldSName.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        var filter = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!filter.test(document.getElementById('<%=fldEmail.ClientID%>').value)) {
            document.getElementById('<%=fldEmail.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldPosition.ClientID%>').value == "") {
            document.getElementById('<%=fldPosition.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldDivision.ClientID%>').value == "") {
            document.getElementById('<%=fldDivision.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldDepartment.ClientID%>').value == "") {
            document.getElementById('<%=fldDepartment.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldSection.ClientID%>').value == "") {
            document.getElementById('<%=fldSection.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=fldReport1.ClientID%>').value == "") {
            document.getElementById('<%=fldReport1.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        return chckErr;

    }
</script>
</asp:Content>

