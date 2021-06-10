<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_Main_Page.aspx.cs" Inherits="ED_Main_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <section id="Section1" runat="server" style="background-color: #055999;">
        <div class="container">

            <div class="row">
                <div class="col-md-4">
                    <img src="Img/coi_05.png" class="img-fluid" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <label class="text-light">
                        Welcome , <asp:Label ID="lblUser" runat="server"></asp:Label>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="text-light">
                        Employees must declare conflict of interest via e-Declaration system. Action to be taken on case by case basis. Head of Division/ Department may consult UEM Edgenta Risk & Compliance and/or Human Resource Department in determining the appropriate action(s) to be taken.  
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <asp:HyperLink ID="btn04" runat="server" NavigateUrl="ED_User_Declare_COI.aspx">
                        <img src="Img/clickhere.png" class="img-fluid" />
                    </asp:HyperLink>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-backdrop="static" data-target="#modalA01">Types of COI</button>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-backdrop="static" data-target="#modalA02">Declaration Flow</button>
                </div>
                <div class="col-md-4">
                    <asp:Hyperlink ID="btn03" runat="server" CssClass="btn btn-primary btn-block" NavigateUrl="coi_guidancenote.pdf" Target="_blank">Guidance Note</asp:Hyperlink>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-3">
                    <img src="Img/coi_01.png" class="img-fluid"/>
                </div>
                <div class="col-md-3">
                    <img src="Img/coi_02.png" class="img-fluid"/>
                </div>
                <div class="col-md-3">
                    <img src="Img/coi_03.png" class="img-fluid"/>
                </div>
                <div class="col-md-3">
                    <img src="Img/coi_04.png" class="img-fluid"/>
                </div>
            </div>

        </div>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="modalA01" tabindex="-1" role="dialog" aria-labelledby="modalA01Label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalA01Label">Type of COI</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalA01();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12  d-flex flex-column">
                            <img src="Img/coi_info.png" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal -->
    <div class="modal fade" id="modalA02" tabindex="-1" role="dialog" aria-labelledby="modalA02Label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalA02Label">Declaration Flow</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetModalA02();"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12  d-flex flex-column">
                            <img src="Img/coi_flow.png" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

<script>
    function resetModalA01()
    {
        $('#modalA01').modal('hide');

    }

    function resetModalA02()
    {
        $('#modalA02').modal('hide');

    }
</script>

</asp:Content>

