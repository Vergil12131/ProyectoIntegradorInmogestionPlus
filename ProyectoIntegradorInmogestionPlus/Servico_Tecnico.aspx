<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Servico_Tecnico.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Servico_Tecnico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
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









        .faq-item a {
            font-size: 1.25rem; /* Tamaño de letra más grande */
            text-decoration: none;
            color: #000;
            display: flex;
            align-items: center;
        }

            .faq-item a span {
                margin-left: auto;
                transition: transform 0.3s ease;
            }

        .faq-item .collapse.show + .card .card-body {
            border: 1px solid #000;
        }

        .faq-item a.collapsed span {
            transform: rotate(0deg);
        }

        .faq-item a:not(.collapsed) span {
            transform: rotate(90deg);
        }







        .btn-black {
            background-color: black;
            color: white;
            border-color: black;
        }

        h2 {
            color: white;
        }

        .btn-black:hover {
            background-color: darkgray;
            border-color: darkgray;
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

        .carousel-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.1); /* Cambia el último valor para ajustar la opacidad del gris */
        }

        .arrow-button {
            background-color: #007bff; /* Color de fondo */
            color: #fff; /* Color del texto */
            border: none; /* Sin borde */
            padding: 10px 20px; /* Espaciado interno */
            border-radius: 5px; /* Borde redondeado */
            cursor: pointer; /* Cursor de apuntar */
            transition: background-color 0.3s; /* Transición suave */
        }

        /* Estilo para el ícono de flecha */
        .arrow-icon {
            margin-left: 5px; /* Espacio entre el texto y el ícono */
        }

        /* Cambia el color del botón al pasar el mouse sobre él */
        .arrow-button:hover {
            background-color: #0056b3; /* Color de fondo al pasar el mouse */
        }

        .navbar {
            box-shadow: none !important; /* Elimina la sombra */
        }

        .auto-style2 {
            width: 182px;
            height: 62px;
        }

        .selected {
            color: #28a745;
        }

        .bordered-container {
            border: 2px solid black;
            padding: 20px;
            max-width: 965px; /* Cambia este valor según tus necesidades */
            margin: 0 auto; /* Centra el contenedor horizontalmente */
            border-radius: 0.385rem;
        }

        .full-height {
            height: 100%;
        }

            .full-height img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Asegura que la imagen cubra todo el contenedor sin deformarse */
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

        .auto-style3 {
            left: 0px;
            top: 0px;
        }

        .auto-style4 {
            width: 38%;
            height: 38px;
            border-color: #CCCCCC;
            border-radius: 3px;
        }

        .auto-style5 {
            width: 426px;
            height: 38px;
            border: 1px solid #CCCCCC;
            border-radius: 3px;
        }

        .auto-style11 {
            width: 26%;
            height: 225px;
        }

        /*------------------------------------------*/

        .panelUser {
            display: flex !important;
        }

        .menu-container .username {
            position: relative;
            display: inline-block;
        }

        .dropdown-menu.username {
            display: none; /* Inicialmente oculto */
            position: absolute;
            background-color: white;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            min-width: 160px;
            transform: translate(-33px, 5px)
        }

            .dropdown-menu.username a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

                .dropdown-menu.username a:hover {
                    background-color: #f1f1f1;
                }

        .panelDisplayHeader {
            display: flex;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <!--Barra de busqueda headear-->
                
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



                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center mt-5">
                            <h1 class="display-4">SOPORTE TÉCNICO</h1>
                            <p class="lead">¿En qué necesitas ayuda?</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="buscar-tab" data-toggle="tab" href="#buscar" role="tab" aria-controls="buscar" aria-selected="true">Busco Propiedad</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="publicar-tab" data-toggle="tab" href="#publicar" role="tab" aria-controls="publicar" aria-selected="false">Publicar Propiedad</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="buscar" role="tabpanel" aria-labelledby="buscar-tab">
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq1" role="button" aria-expanded="false" aria-controls="faq1" class="collapsed">¿Cómo busco un inmueble? <span>➤</span>
                                        </a>
                                        <div class="collapse" id="faq1">
                                            <div class="card card-body">
                                                <p>Paso 1: Ir a la página principal.</p>
                                                <p>Paso 2: Seleccionar la opción de "Buscar Propiedad".</p>
                                                <p>Paso 3: Introducir los criterios de búsqueda y hacer clic en "Buscar".</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq2" role="button" aria-expanded="false" aria-controls="faq2" class="collapsed">¿Cómo denuncio un aviso? <span>➤</span>
                                        </a>
                                        <div class="collapse" id="faq2">
                                            <div class="card card-body">
                                                <p>Paso 1: Encontrar el aviso que deseas denunciar.</p>
                                                <p>Paso 2: Hacer clic en el botón "Denunciar".</p>
                                                <p>Paso 3: Completar el formulario de denuncia y enviarlo.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq3" role="button" aria-expanded="false" aria-controls="faq3" class="collapsed">¿Cómo puedo contactar a un propietario o agente inmobiliario? <span>➤</span>
                                        </a>
                                        <div class="collapse" id="faq3">
                                            <div class="card card-body">
                                                <p>Paso 1: Ir al detalle de la propiedad.</p>
                                                <p>Paso 2: Buscar la información de contacto del propietario o agente.</p>
                                                <p>Paso 3: Utilizar los datos proporcionados para hacer contacto.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq4" role="button" aria-expanded="false" aria-controls="faq4" class="collapsed">¿Cómo puedo eliminar una propiedad publicada? <span>➤</span>
                                        </a>
                                        <div class="collapse" id="faq4">
                                            <div class="card card-body">
                                                <p>Paso 1: Iniciar sesión en tu cuenta.</p>
                                                <p>Paso 2: Ir a la sección de "Mis Propiedades".</p>
                                                <p>Paso 3: Seleccionar la propiedad que deseas eliminar y hacer clic en "Eliminar".</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="publicar" role="tabpanel" aria-labelledby="publicar-tab">
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq5" role="button" aria-expanded="false" aria-controls="faq5" class="collapsed">¿Cómo puedo publicar una propiedad? <span>➤</span>
                                        </a>
                                        <div class="collapse" id="faq5">
                                            <div class="card card-body">
                                                <p>Paso 1: Iniciar sesión en tu cuenta.</p>
                                                <p>Paso 2: Ir a la sección de "Publicar Propiedad".</p>
                                                <p>Paso 3: Completar el formulario con los detalles de la propiedad.</p>
                                                <p>Paso 4: Hacer clic en "Publicar" para finalizar.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="faq-item">
                                    <a data-toggle="collapse" href="#faq6" role="button" aria-expanded="false" aria-controls="faq6" class="collapsed">¿Qué documentos necesito para publicar una propiedad? <span>➤</span>
                                    </a>
                                    <div class="collapse" id="faq6">
                                        <div class="card card-body">
                                            <p>Paso 1: Documento de identidad del propietario.</p>
                                            <p>Paso 2: Escritura de la propiedad.</p>
                                            <p>Paso 3: Certificado de impuestos al día.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="faq-item">
                                    <a data-toggle="collapse" href="#faq7" role="button" aria-expanded="false" aria-controls="faq7" class="collapsed">¿Cuáles son las tarifas para publicar una propiedad? <span>➤</span>
                                    </a>
                                    <div class="collapse" id="faq7">
                                        <div class="card card-body">
                                            <p>Paso 1: Ir a la sección de "Tarifas y Planes".</p>
                                            <p>Paso 2: Seleccionar el plan que mejor se adapte a tus necesidades.</p>
                                            <p>Paso 3: Realizar el pago según las instrucciones proporcionadas.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
        <script src="/source/javascript/TextToSpeech.js"></script>
        <!--Scripts Boostrap-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    </form>
</body>
</html>
