<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_Admin_Search_COI.aspx.cs" Inherits="ED_Admin_Search_COI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <label class="form-control-lg"><b>Search Declaration Forms</b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label class="small">Declaration No</label>
            <asp:TextBox ID="fldDeclareNo" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label class="small">Status</label>
            <asp:DropDownList ID="fldStatus" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label class="small">Identification Card Number</label>
            <asp:TextBox ID="fldICNo" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label class="small">Name</label>
            <asp:TextBox ID="fldName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label class="small">Declaration Date</label>
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group date" id="DTSDeclareDate" data-target-input="nearest">
                        <asp:TextBox ID="fldSDeclareDate" runat="server" PlaceHolder="Start Date" CssClass="form-control form-control-sm datetimepicker-input" data-target="#DTSDeclareDate"></asp:TextBox>
                        <div class="input-group-append" data-target="#DTSDeclareDate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                     <div class="input-group date" id="DTEDeclareDate" data-target-input="nearest">
                        <asp:TextBox ID="fldEDeclareDate" runat="server" PlaceHolder="End Date" CssClass="form-control form-control-sm datetimepicker-input" data-target="#DTEDeclareDate"></asp:TextBox>
                        <div class="input-group-append" data-target="#DTEDeclareDate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <label class="small">Conflict of Interest</label>
            <asp:DropDownList ID="fldCOIType" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
        </div>
    </div>

    <hr />

    <div class="row">
        <div class="col-md-2 offset-md-5">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-sm btn-primary btn-block" OnClick="btnSearch_Click" />
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
            <asp:GridView ID="gvListing" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="50" OnPageIndexChanging="gvListing_PageIndexChanging">
            <Columns>
                <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Declaration No" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblDeclareNo" runat="server" OnDataBinding="lblDeclareNo_DataBinding"></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Declaration Details" ItemStyle-Width="30%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblDeclareName" runat="server" Text='<%# Eval("staff_ic_name") %>'></asp:Label><br />
                        <asp:Label ID="lblDeclareDate" runat="server" Text='<%#Convert.ToDateTime(Eval("declare_date")).ToString("dd-MMM-yyyy HH:mm:ss") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COI" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblCOI" runat="server" Text='<%# Eval("coi_flag") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" Text="No data found."></asp:Label></EmptyDataTemplate>
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
            </div>
        </div>
    </div>

<script type="text/javascript">
    $(function () {
        $('#DTSDeclareDate').datetimepicker({
            format: 'DD-MMM-YYYY'
        });

        $('#DTEDeclareDate').datetimepicker({
            format: 'DD-MMM-YYYY',
            useCurrent: false
        });

        $('#DTSDeclareDate').on("change.datetimepicker", function (e) {
            $('#DTEDeclareDate').datetimepicker('minDate', e.date);
        });

        $('#DTEDeclareDate').on("change.datetimepicker", function (e) {
            $('#DTSDeclareDate').datetimepicker('maxDate', e.date);
        });
    });
</script>
</asp:Content>

