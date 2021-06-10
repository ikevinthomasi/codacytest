<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_User_Declare_COI.aspx.cs" Inherits="ED_User_Declare_COI" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-lg"><b>Employee Declaration Form - Conflict of Interest <asp:Label ID="lblYear" runat="server"></asp:Label></b></label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-lg"><i class="fa fa-file-contract text-primary"></i> &nbsp;<b>Declaration</b></label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <label class="text-justify">
                        I certify by signing below that I have read the UEM Edgenta’s Code of Conduct, and that I have accurately completed this Declaration Form to the best of my knowledge and belief. Should a possible conflict of interest arise in my responsibilities to the Company, or if any changes occur in my affiliations, duties, or financial circumstances, I recognize that I have a continuing obligation to notify Head of Division, Risk Management and Compliance Department, or Human Resource Department and file a new Declaration Form as and when they arise.
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="small text-justify">
                        <i>Dengan menandatangani deklarasi di bawah ini, saya mengakui bahawa saya telah membaca Kod Etika UEM Edgenta Berhad, dan melengkapkan Borang Akuan dengan sebaik-baik pengetahuan dan kepercayaan saya. Sekiranya berlaku sebarang pembaharuan konflik kepentingan semasa berkhidmat dengan syarikat, atau berlaku sebarang perubahan tugasan atau kedudukan kewangan, adalah menjadi kewajipan saya untuk terus memaklumkannya kepada Ketua Jabatan, Jabatan Pengurusan Risiko dan Pematuhan dan Ketua Jabatan Sumber Manusia Syarikat dan memfailkan Borang Perakuan yang baharu sekiranya diperlukan.</i>
                    </label>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-12">
                    <label class="text-justify">
                        A conflict of interest may exist when an employee is involved in any activity, or has a pecuniary, a business, or a personal or familial interest that could improperly influence, or be seen to influence, his/her decisions or the performance of his/her duties, or that these interests take precedence over the interests, goals and/or mission of the Company. Conflicts of interest can be actual, apparent or potential and can be financial or non-financial in nature. Please see the Guidance Notes for further details.
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="small text-justify">
                         <i>Konflik Kepentingan wujud apabila seseorang pekerja terlibat dengan sebarang aktiviti, memperoleh kewangan, perniagaan atau minat peribadi atau kekeluargaan yang boleh mempengaruhi secara tidak wajar, ataupun mampu mempengaruhi keputusan atau prestasi tugasan seseorang pekerja atau kepentingan-kepentingan tersebut dilakukan mengatasi kepentingan-kepentingan, matlamat-matlamat dan/atau misi Syarikat.  Konflik Kepentingan secara dasarnya boleh dikaitkan dengan nyata atau berpotensi serta berkemungkinan dalam bentuk kewangan atau sebaliknya.  Sila rujuk Nota Panduan berikut untuk maklumat lanjut.</i>
                    </label>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-12">
                    <label class="text-justify">
                        Please choose (<i>Sila pilih</i>) :
                    </label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-1 text-center">
                    <asp:RadioButton GroupName="rbCOI" ID="rbDeclare" OnCheckedChanged="rbDeclare_CheckedChanged" AutoPostBack="true" runat="server" />
                </div>
                <div class="col-md-11">
                    <label class="text-justify">
                        I hereby <b>DECLARE</b> that there is <b>NO CONFLICT OF INTEREST</b> to the best of my knowledge, information and belief, no situation in which I am involved personally or professionally could be construed as a violation of the Code of Conduct, or as placing me in a position of having a conflict of interest with the Company or any other companies within UEM Edgenta Berhad.
                    </label>
                    <label class="small text-justify">
                        <i>Saya dengan ini mengisytiharkan bahawa sepanjang pengetahuan, maklumat dan kepercayaan saya, tidak ada keadaan di mana saya terlibat secara peribadi atau profesional yang boleh ditafsirkan sebagai pelanggaran Kod Etika, atau menyebabkan saya dalam kedudukan mempunyai konflik kepentingan dengan Syarikat atau mana-mana syarikat lain dalam UEM Edgenta Berhad.</i>
                    </label>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-1 text-center">
                    <asp:RadioButton GroupName="rbCOI" ID="rbDisclose" OnCheckedChanged="rbDisclose_CheckedChanged" AutoPostBack="true" runat="server" />
                </div>
                <div class="col-md-11">
                    <label class="text-justify">
                        I hereby <b>DISCLOSE</b> the following circumstances that may constitute a <b>CONFLICT OF INTEREST</b> as described in the Code of Conduct above.
                    </label>
                    <label class="small text-justify">
                        <i>Saya dengan ini mendedahkan keadaan berikut yang mungkin membentuk suatu konflik kepentingan seperti yang dihuraikan dalam Kod Etika di atas.</i>
                    </label>
                    <label class="text-justify">
                        <i class="fa fa-asterisk"></i>&nbsp;&nbsp;<i>Describe your private interests and/or associations below that are or may be considered a conflict of interest. Attach additional sheet(s) if necessary.</i>
                    </label>
                    <label class="small text-justify">
                        <i class="fa fa-asterisk"></i>&nbsp;&nbsp;<i>Nyatakan kepentingan persendirian anda dan / atau persatuan di bawah yang boleh dianggap atau mungkin dianggap sebagai konflik kepentingan). Lampirkan lembaran tambahan jika perlu.</i>
                    </label>
                </div>
            </div>
            
            <div id="coiDV" runat="server">

                <hr />

                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-lg"><i class="fa fa-file-contract text-primary"></i> &nbsp;<b>Type of Conflict of Interest</b></label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-md"><b>Pecuniary Interests</b></label>
                    </div>
                </div>

                <%--A01 : Section Consulting, Outside Employment, and Other Outside Activities--%>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-outline-dark btn-sm" id="btnConsulting" runat="server" data-toggle="modal" data-backdrop="static" data-target="#modalA01"><i class="fa fa-plus text-info"></i> &nbsp; Consulting, Outside Employment, and Other Outside Activities</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-sm">
                            <i>Includes, but is not limited to, service as an employee, operator, independent contractor, consultant, etc. (paid or unpaid) at organisations other than the Company.</i>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <asp:GridView ID="gvConsulting" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" OnRowCommand="gvConsulting_RowCommand">
                            <Columns>
                                <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoA1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Organisation" ItemStyle-Width="35%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblA01Organisation" runat="server" Text='<%# Eval("A01Organisation") %>'></asp:Label><br />
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Capacity / Position" ItemStyle-Width="20%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblA01Capacity" runat="server" Text='<%# Eval("A01Capacity") %>'></asp:Label><br />
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nature of Work" ItemStyle-Width="35%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblA01Nature" runat="server" Text='<%# Eval("A01Nature") %>'></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDeleteA01" runat="server" CssClass="btn btn-link btn-sm" CausesValidation="False" CommandArgument='<%# Eval("A01Id")%>' CommandName="A01Delete"><i class="fa fa-times"></i></asp:LinkButton>
                                </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <%--A02A : Section Businesses Ownership--%>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-outline-dark btn-sm" id="btnBusinessesA" runat="server" data-toggle="modal" data-backdrop="static" data-target="#modalA02A"><i class="fa fa-plus text-info"></i> &nbsp; Businesses - Ownership of Shares</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-sm"><i>Businesses of which I am a sole proprietor, a partner, or a shareholder.</i></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">

                        <asp:GridView ID="gvBusinessesA" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" OnRowCommand="gvBusinessesA_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="5%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA2A" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Company" ItemStyle-Width="35%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02ACompany" runat="server" Text='<%# Eval("A02ACompany") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No of Shares" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02ANoShares" runat="server" Text='<%# Eval("A02ANoShares") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="% Shareholding" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02APShare" runat="server" Text='<%# Eval("A02APShare") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeleteA02A" runat="server" CssClass="btn btn-link" CausesValidation="False" CommandArgument='<%# Eval("A02AId")%>' CommandName="A02DeleteA"><i class="fa fa-times"></i></asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>

                        </div>
                    </div>
                </div>

                <%--A02B : Section Businesses Others--%>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-outline-dark btn-sm" id="btnBusinessesB" runat="server" data-toggle="modal" data-backdrop="static" data-target="#modalA02B"><i class="fa fa-plus text-info"></i> &nbsp; Businesses - Other Direct & Indirect Interests</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-sm"><i>Businesses of which I am a sole proprietor, a partner, or a shareholder.</i></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">

                        <asp:GridView ID="gvBusinessesB" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" OnRowCommand="gvBusinessesB_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="5%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA2B" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Company" ItemStyle-Width="35%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02BCompany" runat="server" Text='<%# Eval("A02BCompany") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nature of the Interest" ItemStyle-Width="35%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02BNature" runat="server" Text='<%# Eval("A02BNature") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="% Shareholding" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA02BPShare" runat="server" Text='<%# Eval("A02BPShare") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeleteA02B" runat="server" CssClass="btn btn-link" CausesValidation="False" CommandArgument='<%# Eval("A02BId")%>' CommandName="A02DeleteB"><i class="fa fa-times"></i></asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>

                        </div>
                    </div>
                </div>

                <%--A03 : Section Company Directorships--%>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-outline-dark btn-sm" id="btnDirectorships" runat="server" data-toggle="modal" data-backdrop="static" data-target="#modalA03"><i class="fa fa-plus text-info"></i> &nbsp; Company Directorships</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-sm">
                            <i>Provide details of all companies of which I am a director.</i>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">

                        <asp:GridView ID="gvDirectorships" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" OnRowCommand="gvDirectorships_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="5%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA3" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type of Company" ItemStyle-Width="35%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA03Type" runat="server" Text='<%# Eval("A03Type") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Company Name" ItemStyle-Width="35%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA03Company" runat="server" Text='<%# Eval("A03Company") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" ItemStyle-Width="55%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA03Description" runat="server" Text='<%# Eval("A03Description") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeleteA03" runat="server" CssClass="btn btn-link" CausesValidation="False" CommandArgument='<%# Eval("A03Id")%>' CommandName="A03Delete"><i class="fa fa-times"></i></asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>

                        </div>
                    </div>
                </div>

                <%--A04 : Section Gifts & Solicitations--%>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-outline-dark btn-sm" id="btnGifts" runat="server" data-toggle="modal" data-backdrop="static" data-target="#modalA04"><i class="fa fa-plus text-info"></i> &nbsp; Gifts & Solicitations</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-sm">
                            <i>Where you or your close family members have accepted or solicited gifts or perquisites, including travel expenses, lodging, dining, entertainment, or other reimbursements that might reasonably appear to influence your judgment or actions concerning the business of the Company or any other companies within UEM Edgenta Berhad.</i>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">

                        <asp:GridView ID="gvGifts" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" OnRowCommand="gvGifts_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblNoA4" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Person Name" ItemStyle-Width="30%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04Person" runat="server" Text='<%# Eval("A04Person") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estimated Value" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04Value" runat="server" Text='<%# Eval("A04Value") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Business Entity" ItemStyle-Width="30%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04Entity" runat="server" Text='<%# Eval("A04Entity") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Received" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblA04DateReceived" runat="server" Text='<%# Eval("A04DateReceived") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="5%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeleteA04" runat="server" CssClass="btn btn-link" CausesValidation="False" CommandArgument='<%# Eval("A04Id")%>' CommandName="A04Delete"><i class="fa fa-times"></i></asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>

                        </div>
                    </div>
                </div>


                <%--B01 : Section Personal Interest--%>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-md"><b>Personal Interest</b></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-outline-dark btn-sm" id="btnPInterest" runat="server" data-toggle="modal" data-backdrop="static" data-target="#modalB01"><i class="fa fa-plus text-info"></i> &nbsp; Personal Interest</button> 
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

                        <asp:GridView ID="dvPInterest" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" OnRowCommand="dvPInterest_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="5%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblNoB1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Person" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Person" runat="server" Text='<%# Eval("B01Person") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Relationship to Me" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Relationship" runat="server" Text='<%# Eval("B01Relationship") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Organisation" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Organisation" runat="server" Text='<%# Eval("B01Organisation") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nature of the Interest" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblB01Nature" runat="server" Text='<%# Eval("B01Nature") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeleteB01" runat="server" CssClass="btn btn-link" CausesValidation="False" CommandArgument='<%# Eval("B01Id")%>' CommandName="B01Delete"><i class="fa fa-times"></i></asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>

                        </div>
                    </div>
                </div>

                <%--C01 : Section Business Interest--%>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-md"><b>Business Interest</b></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-outline-dark btn-sm" id="btnBInterest" runat="server" data-toggle="modal" data-backdrop="static" data-target="#modalC01"><i class="fa fa-plus text-info"></i> &nbsp; Business Interest</button>
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

                        <asp:GridView ID="dvBInterest" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" OnRowCommand="dvBInterest_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="5%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblNoC1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name of Person" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Person" runat="server" Text='<%# Eval("C01Person") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Relationship to Me" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Relationship" runat="server" Text='<%# Eval("C01Relationship") %>'></asp:Label><br />
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Organisation" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Organisation" runat="server" Text='<%# Eval("C01Organisation") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nature of the Interest" ItemStyle-Width="20%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblC01Nature" runat="server" Text='<%# Eval("C01Nature") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeleteC01" runat="server" CssClass="btn btn-link" CausesValidation="False" CommandArgument='<%# Eval("C01Id")%>' CommandName="C01Delete"><i class="fa fa-times"></i></asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data added / found."></asp:Label></EmptyDataTemplate>
                        </asp:GridView>

                        </div>
                    </div>
                </div>

                <%--D01 : Section Any other conflicts--%>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-control-md"><b>Any other conflicts</b></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:TextBox ID="fldOtherConflicts" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </div>
                </div>

            </div>

            <hr />

            <div class="row">
                <div class="col-md-12">
                    <label class="form-control-lg"><i class="fa fa-file-contract text-primary"></i> &nbsp;<b>Final Declaration</b></label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <label>
                        I understand that it is my responsibility to contact the Company's Head of Human Resource Department to complete a new Declaration Form to notify the Company of any changes and/or additions that may occur throughout the year within 5 days of such occurrence.
                    </label>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-4"><label>Name</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecName" runat="server"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label>Division</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecDivision" runat="server"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label>Department</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecDepartment" runat="server"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label>Position</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecPosition" runat="server"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label>Email Address</label></div>
                <div class="col-md-8"><asp:Label ID="lblDecEmail" runat="server"></asp:Label></div>
            </div>

            <div class="row">
                <div class="col-md-4"><label>Email Password</label></div>
                <div class="col-md-4">
                    <asp:TextBox ID="fldDecPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
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
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-sm btn-primary btn-block" OnClientClick="return validateCancelErr();" OnClick="btnSubmit_Click" />
                </div>
            </div>

        </div>

    </div>

    <br />

    <!-- Modal -->
    <div class="modal fade" id="modalA01" tabindex="-1" role="dialog" aria-labelledby="modalA01Label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalA01Label">Consulting, Outside Employment, and Other Outside Activities</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalA01();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="small">
                                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Organisation &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldA01Organisation" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Organisation is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Capacity/Position &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldA01Capacity" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Capacity/Position is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                Nature of Work &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>Salary or payment for services, allowances, intellectual property rights (ie: patents, copyright, and royalties</i>)
                            </label>
                            <asp:TextBox ID="fldA01Nature" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Nature of Work is required.</div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="resetModalA01();">Close</button>
                    <asp:Button ID="btnA01Submit" runat="server" Text="Confirm" CssClass="btn btn-primary btn-sm" OnClientClick="return validateModalA01();" Onclick="btnA01Submit_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal -->
    <div class="modal fade" id="modalA02A" tabindex="-1" role="dialog" aria-labelledby="modalA02ALabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalA02ALabel">Ownership of Shares</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalA02A();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="small">
                                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Name of Company &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldA02ACompany" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Name of Company is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                No of Shares &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>Please key-in only numeric answer</i>

                            </label>
                            <asp:TextBox ID="fldA02ANoShares" runat="server" CssClass="form-control form-control-sm" MaxLength="10" onKeyUp="numericFilter(this);"></asp:TextBox>
                            <div class="invalid-feedback">Valid No of Shares is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                % Shareholding &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>Please key-in only numeric answer</i>
                            </label>
                            <asp:TextBox ID="fldA02APShare" runat="server" CssClass="form-control form-control-sm" MaxLength="5" onKeyUp="numericFilter(this);"></asp:TextBox>
                            <div class="invalid-feedback">Valid % Sharing is required.</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="resetModalA02A();">Close</button>
                    <asp:Button ID="btnA02ASubmit" runat="server" Text="Confirm" CssClass="btn btn-primary btn-sm" OnClientClick="return validateModalA02A();" Onclick="btnA02ASubmit_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal -->
    <div class="modal fade" id="modalA02B" tabindex="-1" role="dialog" aria-labelledby="modalA02BLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalA02BLabel">Other Direct & Indirect Interests</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalA02();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="small">
                                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Name of Company &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldA02BCompany" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Name of Company is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                Nature of the Interest &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>Example: sole proprietorship, partnership, etc</i>
                            </label>
                            <asp:TextBox ID="fldA02BNature" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Nature of Interest is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                % Shareholding &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>Please key-in only numeric answer</i>
                            </label>
                            <asp:TextBox ID="fldA02BPShare" runat="server" CssClass="form-control form-control-sm" MaxLength="5" onKeyUp="numericFilter(this);"></asp:TextBox>
                            <div class="invalid-feedback">Valid % Sharing is required.</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="resetModalA02B();">Close</button>
                    <asp:Button ID="btnA02BSubmit" runat="server" Text="Confirm" CssClass="btn btn-primary btn-sm" OnClientClick="return validateModalA02B();" Onclick="btnA02BSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal -->
    <div class="modal fade" id="modalA03" tabindex="-1" role="dialog" aria-labelledby="modalA03Label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalA03Label">Company Directorships</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalA03();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="small">
                                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Type of Company &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:DropDownList ID="fldA03Type" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                            <div class="invalid-feedback">Valid Type of Company is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Company Name &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldA03Company" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Company Name is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Description &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldA03Description" runat="server" CssClass="form-control form-control-sm" MaxLength="500"></asp:TextBox>
                            <div class="invalid-feedback">Valid Description is required.</div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="resetModalA03();">Close</button>
                    <asp:Button ID="btnA03Submit" runat="server" Text="Confirm" CssClass="btn btn-primary btn-sm" OnClientClick="return validateModalA03();" Onclick="btnA03Submit_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal -->
    <div class="modal fade" id="modalA04" tabindex="-1" role="dialog" aria-labelledby="modalA04Label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalA04Label">Gifts & Solicitations</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalA04();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="small">
                                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                Person Name &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>The name of the person who provide you with, or assumed the cost of, such good and/or services</i>
                            </label>
                            <asp:TextBox ID="fldA04Person" runat="server" CssClass="form-control form-control-sm" MaxLength="150"></asp:TextBox>
                            <div class="invalid-feedback">Valid Person Name is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                Estimated Value &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>State currency and amount</i>
                            </label>
                            <asp:TextBox ID="fldA04Value" runat="server" CssClass="form-control form-control-sm" MaxLength="100"></asp:TextBox>
                            <div class="invalid-feedback">Valid Estimated Value is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                Business Entity &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>The business entity with such person is associated</i>
                            </label>
                            <asp:TextBox ID="fldA04Entity" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Business Entity is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Date Received &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <div class="input-group date" id="DTA04Date" data-target-input="nearest">
                                <asp:TextBox ID="fldA04Date" runat="server" CssClass="form-control form-control-sm datetimepicker-input" data-target="#DTA04Date"></asp:TextBox>
                                <div class="input-group-append" data-target="#DTA04Date" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                                <div class="invalid-feedback">Valid Date is required.</div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="resetModalA04();">Close</button>
                    <asp:Button ID="btnA04Submit" runat="server" Text="Confirm" CssClass="btn btn-primary btn-sm" OnClientClick="return validateModalA04();" Onclick="btnA04Submit_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal -->
    <div class="modal fade" id="modalB01" tabindex="-1" role="dialog" aria-labelledby="modalB01Label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalB01Label">Personal Interest</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalB01();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="small">
                                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Name of Person &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldB01Person" runat="server" CssClass="form-control form-control-sm" MaxLength="150"></asp:TextBox>
                            <div class="invalid-feedback">Valid Name of Person is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Relationship to Me &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldB01Relationship" runat="server" CssClass="form-control form-control-sm" MaxLength="150"></asp:TextBox>
                            <div class="invalid-feedback">Valid Relationship to Me is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Organisation &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldB01Organisation" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Organisation is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                Nature of the Interest &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>Example: hiring, merit increases, work assignments, performance appraisals, etc.</i>
                            </label>
                            <asp:TextBox ID="fldB01Nature" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Nature of the Interest is required.</div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="resetModalB01();">Close</button>
                    <asp:Button ID="btnB01Submit" runat="server" Text="Confirm" CssClass="btn btn-primary btn-sm" OnClientClick="return validateModalB01();" Onclick="btnB01Submit_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal -->
    <div class="modal fade" id="modalC01" tabindex="-1" role="dialog" aria-labelledby="modalC01Label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalC01Label">Business Interest</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalC01();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="small">
                                <i class="fa fa-angle-right"></i>&nbsp;&nbsp;<i class="fa fa-asterisk text-danger"></i> is required field.<br />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Name of Person &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldC01Person" runat="server" CssClass="form-control form-control-sm" MaxLength="150"></asp:TextBox>
                            <div class="invalid-feedback">Valid Name of Person is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Relationship to Me &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldC01Relationship" runat="server" CssClass="form-control form-control-sm" MaxLength="150"></asp:TextBox>
                            <div class="invalid-feedback">Valid Relationship to Me is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">Organisation &nbsp;<i class="fa fa-asterisk text-danger"></i></label>
                            <asp:TextBox ID="fldC01Organisation" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Organisation is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-control-sm">
                                Nature of the Interest &nbsp;<i class="fa fa-asterisk text-danger"></i><br />
                                <i>Example: director/partner of enterprise, has a close personal or familial relationship</i>
                            </label>
                            <asp:TextBox ID="fldC01Nature" runat="server" CssClass="form-control form-control-sm" MaxLength="250"></asp:TextBox>
                            <div class="invalid-feedback">Valid Nature of the Interest is required.</div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="resetModalC01();">Close</button>
                    <asp:Button ID="btnC01Submit" runat="server" Text="Confirm" CssClass="btn btn-primary btn-sm" OnClientClick="return validateModalC01();" Onclick="btnC01Submit_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

<script type="text/javascript">
    $(function () {
        $('#DTA04Date').datetimepicker({
            format: 'DD-MMM-YYYY',
            showToday: true,
            showClear: true,
            showClose: true
        });
    });
</script>

<script type="text/javascript">
    function numericFilter(txb) {
        txb.value = txb.value.replace(/[^0-9.]/, "");
    }
</script>

<script type="text/javascript">
    function resetModalA01() {
        document.getElementById('<%=fldA01Organisation.ClientID%>').value = "";
        document.getElementById('<%=fldA01Organisation.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA01Capacity.ClientID%>').value = "";
        document.getElementById('<%=fldA01Capacity.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA01Nature.ClientID%>').value = "";
        document.getElementById('<%=fldA01Nature.ClientID%>').className = 'form-control form-control-sm';

        $('#modalA01').modal('hide');
    }

    function validateModalA01() {
        var chckValidMA01 = true;

        document.getElementById('<%=fldA01Organisation.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA01Capacity.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA01Nature.ClientID%>').className = 'form-control form-control-sm';

        if (document.getElementById('<%=fldA01Organisation.ClientID%>').value == "") {
            document.getElementById('<%=fldA01Organisation.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA01 = false;
        }

        if (document.getElementById('<%=fldA01Capacity.ClientID%>').value == "") {
            document.getElementById('<%=fldA01Capacity.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA01 = false;
        }

        if (document.getElementById('<%=fldA01Nature.ClientID%>').value == "") {
            document.getElementById('<%=fldA01Nature.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA01 = false;
        }

        return chckValidMA01;
    }
</script>

<script type="text/javascript">
    function resetModalA02A() {
        document.getElementById('<%=fldA02ACompany.ClientID%>').value = "";
        document.getElementById('<%=fldA02ACompany.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA02ANoShares.ClientID%>').value = "";
        document.getElementById('<%=fldA02ANoShares.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA02APShare.ClientID%>').value = "";
        document.getElementById('<%=fldA02APShare.ClientID%>').className = 'form-control form-control-sm';

        $('#modalA02A').modal('hide');
    }

    function validateModalA02A() {
        var chckValidMA02A = true;

        document.getElementById('<%=fldA02ACompany.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA02ANoShares.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA02APShare.ClientID%>').className = 'form-control form-control-sm';

        if (document.getElementById('<%=fldA02ACompany.ClientID%>').value == "") {
            document.getElementById('<%=fldA02ACompany.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA02A = false;
        }

        if (document.getElementById('<%=fldA02ANoShares.ClientID%>').value == "") {
            document.getElementById('<%=fldA02ANoShares.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA02A = false;
        }

        if (document.getElementById('<%=fldA02APShare.ClientID%>').value == "") {
            document.getElementById('<%=fldA02APShare.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA02A = false;
        }

        return chckValidMA02A;
    }
</script>

<script type="text/javascript">
    function resetModalA02B() {

        document.getElementById('<%=fldA02BCompany.ClientID%>').value = "";
        document.getElementById('<%=fldA02BCompany.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA02BPShare.ClientID%>').value = "";
        document.getElementById('<%=fldA02BPShare.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA02BNature.ClientID%>').value = "";
        document.getElementById('<%=fldA02BNature.ClientID%>').className = 'form-control form-control-sm';

        $('#modalA02B').modal('hide');
    }

    function validateModalA02() {
        var chckValidMA02B = true;

        document.getElementById('<%=fldA02BCompany.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA02BPShare.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA02BNature.ClientID%>').className = 'form-control form-control-sm';

        if (document.getElementById('<%=fldA02BCompany.ClientID%>').value == "") {
            document.getElementById('<%=fldA02BCompany.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA02B = false;
        }

        if (document.getElementById('<%=fldA02BPShare.ClientID%>').value == "") {
            document.getElementById('<%=fldA02BPShare.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA02B = false;
        }

        if (document.getElementById('<%=fldA02BNature.ClientID%>').value == "") {
            document.getElementById('<%=fldA02BNature.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA02B = false;
        }

        return chckValidMA02B;
    }
</script>

<script type="text/javascript">
    function resetModalA03() {
        document.getElementById('<%=fldA03Type.ClientID%>').value = "";
        document.getElementById('<%=fldA03Type.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA03Company.ClientID%>').value = "";
        document.getElementById('<%=fldA03Company.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA03Description.ClientID%>').value = "";
        document.getElementById('<%=fldA03Description.ClientID%>').className = 'form-control form-control-sm';

        $('#modalA03').modal('hide');
    }

    function validateModalA03() {
        var chckValidMA03 = true;

        document.getElementById('<%=fldA03Type.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA03Company.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA03Description.ClientID%>').className = 'form-control form-control-sm';

        if (document.getElementById('<%=fldA03Type.ClientID%>').value == "") {
            document.getElementById('<%=fldA03Type.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA03 = false;
        }

        if (document.getElementById('<%=fldA03Company.ClientID%>').value == "") {
            document.getElementById('<%=fldA03Company.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA03 = false;
        }

        if (document.getElementById('<%=fldA03Description.ClientID%>').value == "") {
            document.getElementById('<%=fldA03Description.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA03 = false;
        }

        return chckValidMA03;
    }
</script>

<script type="text/javascript">
    function resetModalA04() {
        document.getElementById('<%=fldA04Person.ClientID%>').value = "";
        document.getElementById('<%=fldA04Person.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA04Value.ClientID%>').value = "";
        document.getElementById('<%=fldA04Value.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA04Entity.ClientID%>').value = "";
        document.getElementById('<%=fldA04Entity.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldA04Date.ClientID%>').value = "";
        document.getElementById('<%=fldA04Date.ClientID%>').className = 'form-control form-control-sm';

        $('#modalA04').modal('hide');
    }

    function validateModalA04() {
        var chckValidMA04 = true;

        document.getElementById('<%=fldA04Person.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA04Value.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA04Entity.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldA04Date.ClientID%>').className = 'form-control form-control-sm';

        if (document.getElementById('<%=fldA04Person.ClientID%>').value == "") {
            document.getElementById('<%=fldA04Person.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA04 = false;
        }

        if (document.getElementById('<%=fldA04Value.ClientID%>').value == "") {
            document.getElementById('<%=fldA04Value.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA04 = false;
        }

        if (document.getElementById('<%=fldA04Entity.ClientID%>').value == "") {
            document.getElementById('<%=fldA04Entity.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA04 = false;
        }

        if (document.getElementById('<%=fldA04Date.ClientID%>').value == "") {
            document.getElementById('<%=fldA04Date.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMA04 = false;
        }

        return chckValidMA04;
    }
</script>

<script type="text/javascript">
    function resetModalB01() {
        document.getElementById('<%=fldB01Person.ClientID%>').value = "";
        document.getElementById('<%=fldB01Person.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldB01Relationship.ClientID%>').value = "";
        document.getElementById('<%=fldB01Relationship.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldB01Organisation.ClientID%>').value = "";
        document.getElementById('<%=fldB01Organisation.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldB01Nature.ClientID%>').value = "";
        document.getElementById('<%=fldB01Nature.ClientID%>').className = 'form-control form-control-sm';

        $('#modalB01').modal('hide');
    }

    function validateModalB01() {
        var chckValidMB01 = true;

        document.getElementById('<%=fldB01Person.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldB01Relationship.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldB01Organisation.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldB01Nature.ClientID%>').className = 'form-control form-control-sm';

        if (document.getElementById('<%=fldB01Person.ClientID%>').value == "") {
            document.getElementById('<%=fldB01Person.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMB01 = false;
        }

        if (document.getElementById('<%=fldB01Relationship.ClientID%>').value == "") {
            document.getElementById('<%=fldB01Relationship.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMB01 = false;
        }

        if (document.getElementById('<%=fldB01Organisation.ClientID%>').value == "") {
            document.getElementById('<%=fldB01Organisation.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMB01 = false;
        }

        if (document.getElementById('<%=fldB01Nature.ClientID%>').value == "") {
            document.getElementById('<%=fldB01Nature.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMB01 = false;
        }

        return chckValidMB01;
    }
</script>

<script type="text/javascript">
    function resetModalC01() {
        document.getElementById('<%=fldC01Person.ClientID%>').value = "";
        document.getElementById('<%=fldC01Person.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldC01Relationship.ClientID%>').value = "";
        document.getElementById('<%=fldC01Relationship.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldC01Organisation.ClientID%>').value = "";
        document.getElementById('<%=fldC01Organisation.ClientID%>').className = 'form-control form-control-sm';

        document.getElementById('<%=fldC01Nature.ClientID%>').value = "";
        document.getElementById('<%=fldC01Nature.ClientID%>').className = 'form-control form-control-sm';

        $('#modalC01').modal('hide');
    }

    function validateModalC01() {
        var chckValidMC01 = true;

        document.getElementById('<%=fldC01Person.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldC01Relationship.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldC01Organisation.ClientID%>').className = 'form-control form-control-sm';
        document.getElementById('<%=fldC01Nature.ClientID%>').className = 'form-control form-control-sm';

        if (document.getElementById('<%=fldC01Person.ClientID%>').value == "") {
            document.getElementById('<%=fldC01Person.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMC01 = false;
        }

        if (document.getElementById('<%=fldC01Relationship.ClientID%>').value == "") {
            document.getElementById('<%=fldC01Relationship.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMC01 = false;
        }

        if (document.getElementById('<%=fldC01Organisation.ClientID%>').value == "") {
            document.getElementById('<%=fldC01Organisation.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMC01 = false;
        }

        if (document.getElementById('<%=fldC01Nature.ClientID%>').value == "") {
            document.getElementById('<%=fldC01Nature.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckValidMC01 = false;
        }

        return chckValidMC01;
    }
</script>

<script type="text/javascript">
    function validateCancelErr() {
        var chckErr = true;

        document.getElementById('<%=fldDecPassword.ClientID%>').className = "form-control form-control-sm";
        document.getElementById('<%=errlbl.ClientID%>').innerText = '';

        if (document.getElementById('<%=fldDecPassword.ClientID%>').value == "") {
            document.getElementById('<%=fldDecPassword.ClientID%>').className = "form-control form-control-sm is-invalid";
            chckErr = false;
        }

        if (document.getElementById('<%=rbDisclose.ClientID%>').checked == false && document.getElementById('<%= rbDeclare.ClientID%>').checked == false) {
            chckErr = false;
            document.getElementById('<%=errlbl.ClientID%>').innerText = 'Please choose to delcare or disclose.';
        }

        return chckErr;
    }
</script>
</asp:Content>

