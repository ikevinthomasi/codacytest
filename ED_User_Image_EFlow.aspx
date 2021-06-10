<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ED_User_Image_EFlow.aspx.cs" Inherits="ED_User_Image_EFlow" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="cache-control" content="no-cache" />
    <title>UEMeD E-Declaration</title>

    <!-- Bootstrap CSS -->
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <%--<link href="Content/font-awesome.min.css" rel="stylesheet" />--%>
    <link href="Content/all.min.css" rel="stylesheet" />
    <link href="Content/tempusdominus-bootstrap-4.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="formEdeclarationMP" runat="server">

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <asp:ScriptManager ID="ScriptManagerCros" runat="server">
    <Scripts>
        <asp:ScriptReference Path="Scripts/jquery-3.4.1.min.js" />
        <asp:ScriptReference Path="Scripts/popper.min.js" />
        <asp:ScriptReference Path="Scripts/bootstrap.min.js" />
        <asp:ScriptReference Path="Scripts/moment.min.js" />
        <asp:ScriptReference Path="Scripts/tempusdominus-bootstrap-4.min.js" />
        
    </Scripts>
    </asp:ScriptManager>

    <div class="container-fluid">

    <img src="Img/coi.png" class="img-fluid"/>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul id="menulist" runat="server" class="navbar-nav mr-auto">
                <li id="menu11" runat="server" class="nav-item">
                    <a class="nav-link form-control-sm" href="#">&nbsp</a>
                </li>
            </ul>
        </div>

    </nav>

    <img src="Img/coi_info.png" class="img-fluid" />

    </div>
    </form>
</body>
</html>
