<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformacionPoliticas.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.InformacionPoliticas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Información legal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            overflow-x: hidden; /* Evita el desplazamiento horizontal */
        }

        .nav-link {
            padding: 20px 15px;
        }

        .nav-tabs .nav-link.active {
            border-color: #000;
            color: #28a745;
        }

        .faq-item {
            border-bottom: 1px solid #dee2e6;
            padding: 25px 0;
        }

            .faq-item:hover {
                background-color: #f8f9fa;
            }

            .faq-item a {
                text-decoration: none;
                color: #000;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

        footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }

            footer a {
                color: #fff;
                text-decoration: none;
            }

        .footer {
            background-color: #000000;
            color: #ffffff;
        }

            .footer h5 {
                font-family: 'Open Sans', sans-serif;
                font-size: 20px;
            }

            .footer ul {
                list-style: none;
                padding: 0;
            }

            .footer li {
                margin-bottom: 10px;
            }

            .footer a {
                color: #ffffff;
                text-decoration: none;
            }

                .footer a:hover {
                    color: #f1f1f1;
                }

        .social-icons {
            margin-bottom: 0;
        }

            .social-icons li {
                display: inline-block;
                margin-right: 10px;
            }

            .social-icons i {
                font-size: 20px;
            }

        .footer img {
            max-width: 60px;
            height: auto;
        }

        .footer .logo-img {
            max-width: 250px; /* Ajusta el tamaño máximo del logo según tus necesidades */
            height: auto;
        }

        .navbar-custom {
            background-color: white;
        }

            .navbar-custom .navbar-brand,
            .navbar-custom .nav-link {
                color: black;
            }

                .navbar-custom .nav-link:hover {
                    color: gray;
                }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        .nav-tabs {
            border-bottom: none;
        }

            .nav-tabs .nav-link {
                border: none;
                padding: 10px 15px;
                position: relative;
                cursor: pointer;
            }

                .nav-tabs .nav-link.active::after {
                    content: '';
                    display: block;
                    width: 100%;
                    height: 4px;
                    background-color: green;
                    position: absolute;
                    bottom: 0;
                    left: 0;
                }

        .navbar {
            box-shadow: none !important; /* Elimina la sombra */
        }

        .faq-item a span {
            margin-left: auto;
            transition: transform 0.3s ease;
        }

        .faq-item a.collapsed span {
            transform: rotate(0deg);
        }

        .faq-item a:not(.collapsed) span {
            transform: rotate(90deg);
        }

        .search-bar {
            display: flex;
            margin: 20px 0;
        }

        .table-container {
            margin-top: 20px;
        }

        .custom-btn {
            background-color: white;
            color: black;
            border: 2px solid #24A841;
        }

            .custom-btn:hover {
                background-color: #24A841;
                color: white;
            }

        .nav-pills .nav-link {
            text-align: center;
            width: 100%;
            background-color: #f8f9fa;
            color: #000;
            margin-bottom: 5px;
        }

            .nav-pills .nav-link.active {
                background-color: #24A841 !important;
                color: #fff !important;
            }

        .tab-content {
            padding: 20px;
        }

        .nav {
            padding-right: 20px;
        }

        h1 {
            margin-top: 20px;
            text-align: center;
        }

        .panelDisplayHeader {
            display: flex;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                <asp:Panel ID="pnlAgente" runat="server" class="navbar navbar-expand-lg navbar-custom" Style="display: none">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="pagina_principal.aspx">
                            <img src="/source/images/home/logo.png" width="182px" height="62px" /></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">

                            <%--LISTA DE OPCIONES DE COMPRAR--%>
                            <%--USUARIO--%>

                            <div class="ms-auto panelUser">
                                <div class="ms-auto panelDisplayHeader">
                                    <asp:Button ID="btnCitas" class="btn btn-outline-success " Style="font-family: Calibri" data-bs-toggle="button" aria-expanded="true" runat="server" Text="Citas Agendadas" OnClick="btnCitas_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                    <span style="margin-left: 20px;"></span>
                                    <asp:Button ID="btnAvisos" class="btn btn-outline-success" Style="font-family: Calibri" data-bs-toggle="button" aria-expanded="true" runat="server" Text="Avisos" OnClick="btnAvisos_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                    <span style="margin-left: 20px;"></span>
                                    <asp:Button ID="btnPublicarPropiedad" class="btn btn-outline-success" Style="font-family: Calibri" data-bs-toggle="button" aria-expanded="true" runat="server" Text="Publicar Propiedad" OnClick="btnPublicarPropiedad_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                    <span style="margin-left: 20px;"></span>
                                    <div class="menu-container">
                                        <div class="menu-button menu-agente">
                                            <asp:Label ID="lblUsuarioAgente" runat="server" Text="Usuario"></asp:Label>
                                            <img src="/source/images/mantenimiento/Imagenes/usuariooo.png" alt="Usuario" width="50" height="50" alt="Foto del Menú" class="menu-photo">
                                        </div>
                                        <div class="dropdown-menu menu-agente">
                                            <center>
                                                <asp:Button ID="Button1" class="btn btn-outline-success" data-bs-toggle="button" aria-expanded="true" tyle="font-family: Calibri" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                            </center>
                                        </div>
                                    </div>
                                    <span style="margin-left: 20px;"></span>
                                </div>

                            </div>

                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlCliente" runat="server" class="navbar navbar-expand-lg navbar-custom" Style="display: none">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="pagina_principal.aspx">
                            <img src="/source/images/home/logo.png" class="auto-style2" /></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav" style="">
                            
                            <ul class="navbar-nav lead">
                                <%--LISTA DE OPCIONES DE COMPRAR--%>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Comprar</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Tipo de propiedad</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                        <asp:LinkButton ID="hlComprarCasa" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarCasa_Click">Casa</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="hlComprarDepartamento" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarDepartamento_Click">Departamento</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="hlComprarSuite" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarSuite_Click">Suite</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="hlComprarUrbanizacion" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarUrbanizacion_Click">Urbanización</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <%--LISTA DE OPCIONES DE Alquilar--%>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Alquilar</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Tipo de propiedad</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                        <asp:LinkButton ID="lbAlquilarCasa" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarCasa_Click">Casa</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbAlquilarDepartamento" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarDepartamento_Click">Departamento</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbAlquilarSuite" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarSuite_Click">Suite</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbAlquilarUrbanizacion" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarUrbanizacion_Click">Urbanización</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <%--LISTA DE OPCIONES DE Temporal--%>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Temporal</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Tipo de propiedad</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                        <asp:LinkButton ID="lbTemporalCasa" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalCasa_Click">Casa</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbTemporalDepartamento" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalDepartamento_Click">Departamento</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbTemporalSuite" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalSuite_Click">Suite</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbTemporalUrbanizacion" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalUrbanizacion_Click">Urbanización</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <%--LISTA DE OPCIONES DE servicios--%>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Servicios</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <%--<th scope="col">Crédito</th>--%>
                                                            <th scope="col">Tipo de Servicio</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li><a class="dropdown-item" href="simuladorDefinitivo.aspx">Simulador de crédito</a></li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                            </ul>

                            <%--BARAS DE USUARIO--%>

                            <div class="ms-auto panelDisplayHeader">
                                <asp:Button ID="btcCitas2" class="btn btn-outline-success " Style="font-family: Calibri" data-bs-toggle="button" aria-expanded="true" runat="server" Text="Mis Citas" OnClick="btnMisCitas_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                <span style="margin-left: 20px;"></span>
                                <div class="menu-container">

                                    <div class="menu-button menu-cliente">
                                        <asp:Label ID="lblUsuarioCliente" runat="server" Text="Usuario"></asp:Label>
                                        <img src="/source/images/mantenimiento/Imagenes/usuariooo.png" alt="Usuario" width="50" height="50" alt="Foto del Menú" class="menu-photo">
                                    </div>
                                    <div class="dropdown-menu menu-cliente">
                                        <center>
                                            <asp:Button ID="Button2" class="btn btn-outline-success" data-bs-toggle="button" aria-expanded="true" tyle="font-family: Calibri" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                        </center>
                                    </div>
                                </div>
                                <span style="margin-left: 20px;"></span>
                            </div>

                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlLoggedOut" runat="server" class="navbar navbar-expand-lg navbar-custom" Style="display: none">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="pagina_principal.aspx">
                            <img src="/source/images/home/logo.png" class="auto-style2" /></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                           
                            <ul class="navbar-nav lead">
                                <%--LISTA DE OPCIONES DE COMPRAR--%>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Comprar</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Tipo de propiedad</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarCasa_Click">Casa</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarDepartamento_Click">Departamento</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarSuite_Click">Suite</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="hlComprarUrbanizacion_Click">Urbanización</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <%--LISTA DE OPCIONES DE Alquilar--%>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Alquilar</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Tipo de propiedad</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarCasa_Click">Casa</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton6" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarDepartamento_Click">Departamento</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton7" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarSuite_Click">Suite</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton8" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbAlquilarUrbanizacion_Click">Urbanización</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <%--LISTA DE OPCIONES DE Temporal--%>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Temporal</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Tipo de propiedad</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton9" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalCasa_Click">Casa</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton10" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalDepartamento_Click">Departamento</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton11" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalSuite_Click">Suite</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="LinkButton12" runat="server" CssClass="dropdown-item" NavigateUrl="Vista_Propiedades.aspx" OnClick="lbTemporalUrbanizacion_Click">Urbanización</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <%--LISTA DE OPCIONES DE servicios--%>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Servicios</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <%--<th scope="col">Crédito</th>--%>
                                                            <th scope="col">Tipo de Servicio</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li><a class="dropdown-item" href="simuladorDefinitivo.aspx">Simulador de crédito</a></li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                            </ul>

                            <%--BARAS DE USUARIO--%>

                            <div class="ms-auto">
                                <span style="margin-left: 20px;"></span>
                                <asp:Button ID="btnIniciarSesion" class="btn btn-outline-success btn-black" data-bs-toggle="button" aria-expanded="true" tyle="font-family: Calibri" runat="server" Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" CausesValidation="false" UseSubmitBehavior="false" />
                            </div>

                        </div>
                    </div>
                </asp:Panel>



                <div class="container mt-5">
                    <h1 class="mb-4">Información Legal</h1>
                    <div class="d-flex align-items-start">
                        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-top: 15px;">
                            <button class="nav-link active" id="v-pills-terminos-tab" data-bs-toggle="pill" data-bs-target="#v-pills-terminos" type="button" role="tab" aria-controls="v-pills-terminos" aria-selected="true">Términos y Condiciones</button>
                            <button class="nav-link" id="v-pills-privacidad-tab" data-bs-toggle="pill" data-bs-target="#v-pills-privacidad" type="button" role="tab" aria-controls="v-pills-privacidad" aria-selected="false">Política de Privacidad</button>
                            <button class="nav-link" id="v-pills-uso-tab" data-bs-toggle="pill" data-bs-target="#v-pills-uso" type="button" role="tab" aria-controls="v-pills-uso" aria-selected="false">Uso de la Plataforma</button>
                            <button class="nav-link" id="v-pills-cookies-tab" data-bs-toggle="pill" data-bs-target="#v-pills-cookies" type="button" role="tab" aria-controls="v-pills-cookies" aria-selected="false">Política de Cookies</button>
                        </div>
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-terminos" role="tabpanel" aria-labelledby="v-pills-terminos-tab">
                                <h3>Términos y Condiciones</h3>
                                <p>Estos Términos y Condiciones regulan el uso de la plataforma de InmoGestiónPlus. Al acceder o utilizar nuestra plataforma, el usuario acepta cumplir con estos términos en su totalidad. La plataforma se reserva el derecho de modificar estos términos en cualquier momento, por lo que se recomienda revisarlos periódicamente.</p>
                                <p>El usuario es responsable de mantener la confidencialidad de su cuenta y contraseña, así como de todas las actividades que ocurran bajo su cuenta. Está prohibido el uso de la plataforma para fines ilegales o no autorizados.</p>
                                <p>Nos esforzamos por mantener la plataforma accesible en todo momento, pero no garantizamos que el acceso será ininterrumpido o libre de errores. La plataforma puede estar temporalmente no disponible debido a mantenimiento u otras razones.</p>
                                <p>La propiedad intelectual de todo el contenido presente en la plataforma, incluyendo textos, imágenes, logotipos y software, pertenece exclusivamente a sus respectivos propietarios. Queda prohibida la reproducción total o parcial de cualquier contenido sin el permiso previo por escrito.</p>
                                <p>La plataforma se reserva el derecho de suspender o cancelar la cuenta de cualquier usuario que viole estos términos o que realice actividades que, a criterio de la plataforma, sean perjudiciales para otros usuarios o para la propia plataforma.</p>
                            </div>
                            <div class="tab-pane fade" id="v-pills-privacidad" role="tabpanel" aria-labelledby="v-pills-privacidad-tab">
                                <h3>Política de Privacidad</h3>
                                <p>La privacidad de nuestros usuarios es de suma importancia. Esta política describe cómo recopilamos, utilizamos y protegemos la información personal que los usuarios proporcionan al utilizar la plataforma.</p>
                                <p>Recopilamos información personal como nombre, dirección de correo electrónico y número de teléfono únicamente cuando es proporcionada voluntariamente por el usuario. Esta información se utiliza para proporcionar los servicios solicitados, mejorar la experiencia del usuario y enviar comunicaciones relacionadas con la plataforma.</p>
                                <p>No compartimos la información personal de los usuarios con terceros, excepto cuando es necesario para cumplir con las obligaciones legales o para proteger los derechos, propiedad o seguridad de la plataforma y sus usuarios.</p>
                                <p>Implementamos medidas de seguridad para proteger la información personal contra el acceso no autorizado, alteración, divulgación o destrucción. Sin embargo, ningún sistema es completamente seguro, por lo que no podemos garantizar la seguridad absoluta de la información transmitida a través de Internet.</p>
                                <p>Los usuarios tienen derecho a acceder, corregir o eliminar su información personal en cualquier momento. Para ejercer estos derechos, pueden ponerse en contacto con nuestro equipo de soporte a través de los canales disponibles en la plataforma.</p>
                            </div>
                            <div class="tab-pane fade" id="v-pills-uso" role="tabpanel" aria-labelledby="v-pills-uso-tab">
                                <h3>Uso de la Plataforma</h3>
                                <p>La plataforma de InmoGestiónPlus está diseñada para facilitar la compra, venta y alquiler de bienes raíces. El uso de la plataforma está sujeto a las siguientes condiciones:</p>
                                <p>Los usuarios deben proporcionar información precisa y veraz al registrarse en la plataforma y al utilizar sus servicios. Cualquier información falsa o engañosa puede resultar en la suspensión o cancelación de la cuenta.</p>
                                <p>La plataforma no se responsabiliza por las transacciones realizadas entre usuarios. Todas las negociaciones y acuerdos alcanzados a través de la plataforma son responsabilidad exclusiva de las partes involucradas.</p>
                                <p>Los usuarios deben respetar las normas de conducta establecidas en la plataforma, absteniéndose de realizar actividades que puedan perjudicar a otros usuarios o al funcionamiento de la plataforma.</p>
                                <p>La plataforma se reserva el derecho de eliminar cualquier contenido que considere inapropiado, ofensivo o en violación de estos términos.</p>
                                <p>El uso no autorizado de la plataforma, como el acceso a sistemas informáticos, el uso de software malicioso o la realización de actividades fraudulentas, está estrictamente prohibido y puede dar lugar a acciones legales.</p>
                            </div>
                            <div class="tab-pane fade" id="v-pills-cookies" role="tabpanel" aria-labelledby="v-pills-cookies-tab">
                                <h3>Política de Cookies</h3>
                                <p>La plataforma utiliza cookies para mejorar la experiencia del usuario y personalizar el contenido que se muestra. Al utilizar la plataforma, el usuario acepta el uso de cookies según lo descrito en esta política.</p>
                                <p>Las cookies son pequeños archivos de texto que se almacenan en el dispositivo del usuario cuando visita la plataforma. Estas cookies nos permiten recordar sus preferencias y mejorar su experiencia en futuras visitas.</p>
                                <p>Existen diferentes tipos de cookies, algunas de las cuales son esenciales para el funcionamiento de la plataforma, mientras que otras se utilizan para recopilar datos estadísticos o para mostrar anuncios personalizados.</p>
                                <p>El usuario puede configurar su navegador para rechazar las cookies o para recibir una notificación antes de que se almacenen. Sin embargo, al desactivar las cookies, es posible que algunas funciones de la plataforma no estén disponibles.</p>
                                <p>La plataforma también utiliza servicios de terceros que pueden instalar sus propias cookies en el dispositivo del usuario. Estos servicios incluyen herramientas de análisis web y redes publicitarias.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer mt-5 text-white">
                    <div class="container py-4" style="background-color: #000000">
                        <div class="row m-0 p-0" style="border-color: #000000; background-color: #000000;">
                            <div class="col-lg-2 col-md-6 mb-4" style="max-width: 300px;">
                                <h5 class="text-uppercase">Búsquedas Frecuentes</h5>
                                <ul class="list-unstyled">
                                    <li><a href="Vista_Propiedades.aspx">Departamentos en ventas</a></li>
                                    <li><a href="Vista_Propiedades.aspx">Departamentos en alquiler</a></li>
                                    <li><a href="Vista_Propiedades.aspx">Casas en venta</a></li>
                                    <li><a href="Vista_Propiedades.aspx">Casas en alquiler</a></li>
                                </ul>
                            </div>

                            <div class="col-lg-2 col-md-6 mb-4" style="max-width: 200px;">
                                <h5 class="text-uppercase">Anunciantes</h5>
                                <ul class="list-unstyled">
                                    <li><a href="Vista_Propiedades.aspx">Dueños directos</a></li>
                                    <li><a href="Vista_Propiedades.aspxk">Inmobiliarias</a></li>
                                </ul>
                            </div>

                            <div class="col-lg-3 col-md-6 mb-4">
                                <div class="d-flex flex-column justify-content-center">
                                    <h5 class="text-uppercase mb-3">INMOGESTIÓN PLUS</h5>
                                    <ul class="list-unstyled">
                                        <li class="mb-2"><a href="Informacion_Definitivo.aspx">Acerca de INMOGESTIÓN PLUS</a></li>
                                        <li class="mb-2"><a href="InformacionPoliticas.aspx">Política de privacidad</a></li>
                                        <li class="mb-2"><a href="InformacionPoliticas.aspx">Política de cookies</a></li>
                                        <%--<li class="mb-2"><a href="#">Trabaja con nosotros</a></li>
                        <li class="mb-2"><a href="#">Contáctanos</a></li>--%>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-6 mb-4">
                                <!-- Ajusta el espacio izquierdo en pantallas grandes -->
                                <div class="d-flex flex-column align-items-center">
                                    <ul class="list-unstyled social-icons ">
                                        <li class="mb-3">
                                            <img src="/source/images/home/ImgInicioSesion/Twitter.jpeg" alt="Twitter"></li>
                                        <li class="mb-3">
                                            <img src="/source/images/home/ImgInicioSesion/avioncito.jpeg" alt="Avioncito"></li>
                                        <li class="mb-3">
                                            <img src="/source/images/home/ImgInicioSesion/WhatsApp.jpeg" alt="WhatsApp"></li>
                                        <li class="mb-3">
                                            <img src="/source/images/home/ImgInicioSesion/Facebook.jpeg" alt="Facebook"></li>
                                        <li class="mb-3">
                                            <img src="/source/images/home/ImgInicioSesion/Instagram.jpeg" alt="Instagram"></li>
                                    </ul>
                                    <div class="d-flex justify-content-center" style="width: 100%; height: 75px;">
                                        <img src="/source/images/home/ImgInicioSesion/LogoNegro.png" alt="INMOGESTIÓN PLUS Logo" class="mt-3 logo-img">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <p class="mb-0">© 2024 INMOGESTIÓN PLUS. Todos los derechos reservados.</p>
                    </div>
                    <br />

                </footer>


            </ContentTemplate>
        </asp:UpdatePanel>
        <script>

            document.addEventListener('DOMContentLoaded', function () {
                var menuButtonCliente = document.querySelector('.menu-button.menu-cliente');
                var dropdownMenuCliente = document.querySelector('.dropdown-menu.menu-cliente');
                var menuButtonAgente = document.querySelector('.menu-button.menu-agente');
                var dropdownMenuAgente = document.querySelector('.dropdown-menu.menu-agente');


                menuButtonCliente.addEventListener('click', function () {
                    dropdownMenuCliente.style.display = dropdownMenuCliente.style.display === 'block' ? 'none' : 'block';
                });

                menuButtonAgente.addEventListener('click', function () {
                    dropdownMenuAgente.style.display = dropdownMenuAgente.style.display === 'block' ? 'none' : 'block';
                });

                // Cierra el menú si se hace clic fuera de él
                window.addEventListener('click', function (event) {
                    if (!menuButtonCliente.contains(event.target) && !menuButtonAgente.contains(event.target)) {
                        dropdownMenuCliente.style.display = 'none';
                        dropdownMenuAgente.style.display = 'none';
                    }
                });


            });


        </script>
        <!--Scripts Bootstrap-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    </form>
</body>
</html>
