<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_Admin_UserDetails_Update_List.aspx.cs" Inherits="ED_Admin_UserDetails_Update_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-12">
            <label class="form-control-lg"><b>Update Staff Information</b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:TextBox ID="fldStaff" runat="server" CssClass="form-control form-control-sm" PlaceHolder="Staff Name or IC No (with -)"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:DropDownList ID="fldDivision" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
        </div>
        <div class="col-md-3">
            <asp:DropDownList ID="fldDepartment" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-sm btn-primary btn-block"  OnClick="btnSearch_Click" />
        </div>
    </div>



    <hr />

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
            <asp:GridView ID="gvListing" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="50"  OnPageIndexChanging="gvListing_PageIndexChanging">
            <Columns>
                <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Staff Name / IC No / Email" ItemStyle-Width="40%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblStaffICNO" runat="server" OnDataBinding="lblStaffICNO_DataBinding"></asp:Label><br />
                    <asp:Label ID="lblStaffName" runat="server" Text='<%# "Name : " +  Eval("staff_name") %>'></asp:Label><br />
                    <asp:Label ID="lblStaffEmail" runat="server" Text='<%# "Email : " +  Eval("email_address") %>'></asp:Label><br />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Position / Division / Department / Section" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblPosition" runat="server" Text='<%# "Position : " + Eval("position") %>'></asp:Label><br />
                    <asp:Label ID="lblDivision" runat="server" Text='<%# "Division : " + Eval("division") %>'></asp:Label><br />
                    <asp:Label ID="lblDepartment" runat="server" Text='<%# "Department : " + Eval("department") %>'></asp:Label><br />
                    <asp:Label ID="lblSection" runat="server" Text='<%# "Section : " + Eval("section") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" Text="No data found."></asp:Label></EmptyDataTemplate>
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

