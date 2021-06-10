<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_Admin_Action_COI_Details.aspx.cs" Inherits="ED_Admin_Action_COI_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hidcoiDesc" runat="server" />
    <div class="row">
        <div class="col-md-12">
            <label class="form-control-lg"><b>Employee Declaration Form - Conflict of Interest <asp:Label ID="lblYear" runat="server"></asp:Label></b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label class="small">Declaration No</label>
            <asp:TextBox ID="fldDeclareNo" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label class="small">Status</label>
            <asp:TextBox ID="fldStatus" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label class="small">Identification Card Number</label>
            <asp:TextBox ID="fldICNo" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label class="small">Name</label>
            <asp:TextBox ID="fldName" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label class="small">Declaration Date</label>
            <asp:TextBox ID="fldDeclareDate" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label class="small">Declaration Type</label>
            <asp:TextBox ID="fldDeclareType" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label class="small">Conflict of Interest</label>
            <asp:TextBox ID="fldCOIType" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label class="small">Created Date</label>
            <asp:TextBox ID="fldCreateDate" runat="server" Enabled="false" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
    </div>

    <%--disclose info details--%>
    <div id="dvDiscloseInfo" runat="server">

        <br />

        <div id="dvPecuniary" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-md"><b>Pecuniary Interests</b></label>
                </div>
            </div>
        </div>
                
        <%--view table A1--%>
        <div id="dvConsulting" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        Consulting, Outside Employment, and Other Outside Activities<br />
                        <i>Includes, but is not limited to, service as an employee, operator, independent contractor, consultant, etc. (paid or unpaid) at organisations other than the Company.</i>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="gvConsulting" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Organisation" ItemStyle-Width="35%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA01Organisation" runat="server" Text='<%# Eval("organisation") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Capacity / Position" ItemStyle-Width="25%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA01Capacity" runat="server" Text='<%# Eval("capacity") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nature of Work" ItemStyle-Width="35%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA01Nature" runat="server" Text='<%# Eval("nature") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%--view table A2A--%>
        <div id="dvBusinessesA" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        Businesses - Ownership of Shares<br />
                        <i>Businesses of which I am a sole proprietor, a partner, or a shareholder.</i>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="gvBusinessesA" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA2A" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Company" ItemStyle-Width="60%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02ACompany" runat="server" Text='<%# Eval("company") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No of Shares" ItemStyle-Width="20%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02ANoShares" runat="server" Text='<%# Eval("shares") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="% Shareholding" ItemStyle-Width="15%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02APShare" runat="server" Text='<%# Eval("per_share") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%--view table A2B--%>
        <div id="dvBusinessesB" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        Businesses - Other Direct & Indirect Interests<br />
                        <i>Businesses of which I am a sole proprietor, a partner, or a shareholder.</i>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="gvBusinessesB" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA2B" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Company" ItemStyle-Width="40%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02BCompany" runat="server" Text='<%# Eval("company") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nature of Interest" ItemStyle-Width="40%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02BNature" runat="server" Text='<%# Eval("nature") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="% Shareholding" ItemStyle-Width="15%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02BPShare" runat="server" Text='<%# Eval("per_share") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%--view table A3--%>
        <div id="dvDirectorships" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        Company Directorships<br />
                        <i>Provide details of all companies of which I am a director.</i>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="gvDirectorships" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA03" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type of Company" ItemStyle-Width="30%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA03Type" runat="server" Text='<%# Eval("company_type") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Company Name" ItemStyle-Width="30%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA03Company" runat="server" Text='<%# Eval("company") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" ItemStyle-Width="35%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA03Description" runat="server" Text='<%# Eval("description") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
                </div>
        </div>

        <%--view table A4--%>
        <div id="dvGifts" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        Gifts & Solicitations<br />
                        <i>Where you or your close family members have accepted or solicited gifts or perquisites, including travel expenses, lodging, dining, entertainment, or other reimbursements that might reasonably appear to influence your judgment or actions concerning the business of the Company or any other companies within UEM Edgenta Berhad.</i>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="gvGifts" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA04" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Person Name" ItemStyle-Width="30%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04Person" runat="server" Text='<%# Eval("person_name") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estimated Value" ItemStyle-Width="20%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04Value" runat="server" Text='<%# Eval("estimate_value") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Business Entity" ItemStyle-Width="30%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04Entity" runat="server" Text='<%# Eval("business_entity") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Received" ItemStyle-Width="15%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04DateReceived" runat="server" Text='<%# Convert.ToDateTime(Eval("date_received")).ToString("dd-MMM-yyyy") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%--view table B1--%>
        <div id="dvPInterest" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-md"><b>Personal Interest</b></label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        <i>Immediate family/persons closely connected to me.</i>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="gvPInterest" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNoB01" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Person" ItemStyle-Width="25%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Person" runat="server" Text='<%# Eval("person_name") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Relationship to Me" ItemStyle-Width="20%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Relationship" runat="server" Text='<%# Eval("relationship") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Organisation" ItemStyle-Width="25%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Organisation" runat="server" Text='<%# Eval("organisation") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nature of the Interest" ItemStyle-Width="25%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Nature" runat="server" Text='<%# Eval("nature") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%--view table B1--%>
        <div id="dvBInterest" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-md"><b>Business Interest</b></label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-sm">
                        <i>Company directorships or ownership of family/persons closely connected to me.</i>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="gvBInterest" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNoC01" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Person" ItemStyle-Width="25%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Person" runat="server" Text='<%# Eval("person_name") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Relationship to Me" ItemStyle-Width="20%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Relationship" runat="server" Text='<%# Eval("relationship") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Organisation" ItemStyle-Width="25%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Organisation" runat="server" Text='<%# Eval("organisation") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nature of the Interest" ItemStyle-Width="25%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Nature" runat="server" Text='<%# Eval("nature") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%--view other--%>
        <div id="dvOther" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-md"><b>Any other conflicts</b></label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:TextBox ID="fldOtherConflicts" runat="server" Enabled="false" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>

    <hr />

    <div class="row">
        <div class="col-md-6">
            <label class="small">RMCD Resolution &nbsp; <i class="fa fa-asterisk text-danger"></i></label>
            <asp:TextBox ID="fldRemarks" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="5"></asp:TextBox>
            <div class="invalid-feedback">Valid Resolution is required.</div>
        </div>
        <div class="col-md-6">
            <label class="small">Upload Attachment (if any)</label>
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
        <div class="col-md-2 offset-md-5">
            <asp:Button ID="btnReview" runat="server" Text="Review" CssClass="btn btn-sm btn-primary btn-block" OnClick="btnReview_Click" OnClientClick="return validateErr();" />
        </div>
    </div>
    <br />

<script type="text/javascript">
    function validateErr() {
        var chckErr = true;

        //Reset error
        document.getElementById('<%=fldAttachment.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=errAttach.ClientID%>').innerText = '';
        document.getElementById('<%=fldRemarks.ClientID%>').className = "form-control form-control-sm";

        if (document.getElementById('<%=fldRemarks.ClientID%>').value == "") {
            document.getElementById('<%=fldRemarks.ClientID%>').className = "form-control form-control-sm is-invalid";
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

        return chckErr;

    }
</script>
</asp:Content>

