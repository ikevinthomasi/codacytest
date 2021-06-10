<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_User_Declare_COI_List.aspx.cs" Inherits="ED_User_Declare_COI_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <label class="form-control-lg"><b>View Declaration Form</b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
            <asp:GridView ID="gvListing" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" ShowHeaderWhenEmpty="true">
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
                <asp:TemplateField HeaderText="Declaration Date Time" ItemStyle-Width="25%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblDeclareDate" runat="server" Text='<%#Convert.ToDateTime(Eval("declare_date")).ToString("dd-MMM-yyyy HH:mm:ss") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COI" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblCOI" runat="server" Text='<%# Eval("coi_flag") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Declaration Type" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblType" runat="server" Text='<%# Eval("form_name") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Declaration Status" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
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
</asp:Content>

