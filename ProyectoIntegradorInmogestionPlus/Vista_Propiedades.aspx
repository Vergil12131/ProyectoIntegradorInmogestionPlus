<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vista_Propiedades.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Vista_Propiedades" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Visualización de Propiedades</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            padding: 20px;
        }

        .menu {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: white;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            .menu button, .menu select {
                background-color: white;
                border: 1px solid #ccc;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
            }

                .menu button:hover, .menu select:hover {
                    background-color: #f0f0f0;
                }

        .dropdown {
            position: relative;
            display: inline-block;
        }
        /* Estilo para los checkbox dentro del CheckBoxList en el dropdown */
        .dropdown-content input[type="checkbox"] {
            accent-color: green; /* Cambia el color del check a verde */
        }

        /* Opcional: para personalizar el texto del label */
        .dropdown-content label {
            margin-left: 5px; /* Espacio entre el checkbox y el texto */
            cursor: pointer; /* Cambia el cursor al pasar por el label */
        }

        .dropdown-content input[type="checkbox"]:checked + label {
            font-weight: bold; /* Resalta el texto del label cuando está marcado */
        }


        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 200px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            z-index: 1;
        }

            .dropdown-content div {
                padding: 10px;
                border-bottom: 1px solid #ddd;
                cursor: pointer;
            }

                .dropdown-content div:hover {
                    background-color: #f0f0f0;
                }

                .dropdown-content div:last-child {
                    border-bottom: none;
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .search-bar {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            flex: 1;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 1.5rem;
        }

        .property-card {
            background-color: #333;
            color: #fff;
            border: none;
            margin-bottom: 2rem; /* Espacio entre cuadros */
            display: flex;
            align-items: center;
            padding: 0;
            overflow: hidden;
            border-radius: 10px;
            max-width: 1420px; /* Ajuste del ancho */
            margin: 0 auto; /* Centrado del cuadro */
            height: 350px; /* Ajusta la altura aquí */
        }



            .property-card .card-content {
                padding: 1rem;
                flex-grow: 1;
            }

            .property-card h5 {
                font-size: 1.5em;
                margin-bottom: 0.5rem;
            }

            .property-card p {
                font-size: 1em;
                margin-bottom: 1rem;
            }

        .property-card-action:hover {
            background-color: #444;
        }

        .btn-light {
            margin-right: 0.5rem;
        }

        .btn-success {
            float: right;
        }

        .pagination .page-link {
            color: #000;
        }

            .pagination .page-link:hover {
                background-color: #000;
            }




        .property-card img {
            width: 400px; /* Ancho fijo */
            height: 300px; /* Alto fijo */
            object-fit: cover; /* Mantiene la proporción de la imagen, recortando si es necesario */
            display: block; /* Asegura que la imagen se comporte como un bloque */
            margin: 0 auto; /* Centra la imagen dentro de su contenedor */
            margin-left: 10px; /* Ajusta este valor según sea necesario */
            padding: 5px;
        }


        .property-details {
            margin-left: 20px;
            color: #fff;
        }

        .property-info {
            margin: 0;
            line-height: 1.2;
        }

        .property-title {
            margin: 10px 0;
            font-size: 24px;
        }

        .property-description {
            margin: 10px 0;
            line-height: 1.2;
        }

        .property-tags {
            margin-top: 10px;
        }

        .property-tag {
            display: inline-block;
            margin-right: 5px;
            background-color: #fff;
            color: #000;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .contact-buttons {
            margin-top: 10px;
        }

        .contact-button {
            margin-right: 10px;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
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

        .property-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .property-price {
            font-size: 1.5em;
            color: #28a745;
            font-weight: bold;
        }

        .property-info {
            font-size: 0.9em;
            color: #6c757d;
        }

        .property-tags {
            margin-top: 10px;
        }

        .property-tag {
            display: inline-block;
            background-color: #f0f0f0;
            color: #333;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.85em;
            margin-right: 5px;
        }

        .contact-buttons {
            margin-top: 15px;
        }

        .contact-button {
            margin-right: 10px;
            text-decoration: none;
        }

        .carousel-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.1);
        }

        .arrow-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .arrow-icon {
            margin-left: 5px;
        }

        .arrow-button:hover {
            background-color: #0056b3;
        }

        .navbar {
            box-shadow: none !important;
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
            max-width: 965px;
            margin: 0 auto;
            border-radius: 0.385rem;
        }

        .full-height {
            height: 100%;
        }

            .full-height img {
                width: 100%;
                height: 100%;
                object-fit: cover;
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
            max-width: 250px;
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



        /-----------------------------------------------------------/

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

    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>

                
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







                <!--Fin Barra de navegación-->

                <div class="container">
                    <div class="menu">
                        <div class="input-group" style="max-width: 560px;">
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Placeholder="Ingresa dirección, parroquia, cantón o provincia" aria-label="Search" />
                            <asp:Button ID="btn_buscar" class="btn btn-outline-success btn-black" data-bs-toggle="button" aria-expanded="true" tyle="font-family: Calibri" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CausesValidation="false" UseSubmitBehavior="false" />
                        </div>

                        <div class="dropdown">

                            <button>Acción</button>
                            <div class="dropdown-content">
                                <div>
                                    <asp:CheckBoxList ID="cblAcciones" runat="server"></asp:CheckBoxList>
                                </div>
                                <div>
                                    <asp:Button ID="btnBuscarAccion" class="btn btn-outline-success btn-black" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                    <asp:Button ID="btnLimpiarAccion" class="btn btn-outline-success btn-black" runat="server" Text="Limpiar" OnClick="btnLimpiarAccion_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button>Tipo Propiedad</button>
                            <div class="dropdown-content">
                                <div>
                                    <asp:CheckBoxList ID="cblTipoInmueble" runat="server"></asp:CheckBoxList>
                                </div>
                                <div>
                                    <asp:Button ID="btnBuscarTipoInmueble" class="btn btn-outline-success btn-black" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                    <asp:Button ID="btnLimpiarTipoInmueble" class="btn btn-outline-success btn-black" runat="server" Text="Limpiar" OnClick="btnLimpiarTipoInmueble_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button>Precio</button>
                            <div class="dropdown-content">
                                <div>
                                    <asp:RadioButtonList ID="rblPrecio" runat="server"></asp:RadioButtonList>
                                </div>

                                <div>
                                    <asp:Button ID="btnBuscarPrecio" class="btn btn-outline-success btn-black" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                    <asp:Button ID="btnLimpiarPrecio" class="btn btn-outline-success btn-black" runat="server" Text="Limpiar" OnClick="btnLimpiarPrecio_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button>Baños</button>
                            <div class="dropdown-content">
                                <div>
                                    <asp:CheckBoxList ID="cblNumeroBanos" runat="server"></asp:CheckBoxList>
                                </div>
                                <div>
                                    <asp:Button ID="btnBuscarNumeroBanos" class="btn btn-outline-success btn-black" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                    <asp:Button ID="btnLimpiarNumeroBanos" class="btn btn-outline-success btn-black" runat="server" Text="Limpiar" OnClick="btnLimpiarNumeroBanos_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button>Estacionamientos</button>
                            <div class="dropdown-content">
                                <div>
                                    <asp:CheckBoxList ID="cblNumeroEstacionamientos" runat="server"></asp:CheckBoxList>
                                </div>
                                <div>
                                    <asp:Button ID="btnBuscarNumeroEstacionamientos" class="btn btn-outline-success btn-black" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                    <asp:Button ID="btnLimpiarNumeroEstacionamientos" class="btn btn-outline-success btn-black" runat="server" Text="Limpiar" OnClick="btnLimpiarNumeroEstacionamientos_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="dropdown">
                            <button>Habitaciones</button>
                            <div class="dropdown-content">
                                <div>
                                    <asp:CheckBoxList ID="cblNumeroHabitaciones" runat="server"></asp:CheckBoxList>
                                </div>
                                <div>
                                    <asp:Button ID="btnBuscarNumeroHabitaciones" class="btn btn-outline-success btn-black" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                    <asp:Button ID="btnLimpiarNumeroHabitaciones" class="btn btn-outline-success btn-black" runat="server" Text="Limpiar" OnClick="btnLimpiarNumeroHabitaciones_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <%--<div class="row mt-5">
                    <div class="col-12">
                        <h2 class="text-center mb-4">Propiedades en Venta</h2>
                        <div class="property-card">
                            <a href="Detalle_propiedad.aspx">
                                <img src="/source/images/mantenimiento/Imagenes/mi_casa.jpg" alt="Propiedad 1" class="card-content" />
                            </a>
                            <div class="property-details">
                                <p class="property-info">casa desde</p>
                                <p class="property-price">USD 105.340</p>
                                <h5 class="property-title">Calle Río San Pedro</h5>
                                <p class="property-info">Tumbaco, Quito</p>
                                <p class="property-info">25 un.2 a 3 hab.165 a 393m² tot.</p>
                                <p class="property-description">Para ti que te gusta la conexión con la naturaleza y quieres LA MEJOR VISTA DE CUMBAYÁ. AKANA, urbanización de casas realmente independientes con jardines privados y 2 o 3 parqueaderos individuales. En AKANA puedes personalizar tu hogar</p>
                            </div>
                        </div>
                        <br />
                        <div class="property-card">
                            <a href="Detalle_propiedad.aspx">
                                <img src="/source/images/mantenimiento/Imagenes/NOVA_CASA.png" alt="Propiedad 2" class="card-content" />
                            </a>
                            <div class="property-details">
                                <p class="property-info">casa desde</p>
                                <p class="property-price">USD 129.562</p>
                                <h5 class="property-title">Pajase Casanova</h5>
                                <p class="property-info">Tumbaco, Quito</p>
                                <p class="property-info">39 un.3 hab.142 a 144 m² tot.</p>
                                <p class="property-description">
                                    Terralta es un proyecto ubicado en Tumbaco que destaca por su privilegiada ubicación. Rodeado de naturaleza se caracteriza por su arquitectura, jardines diseño y estética. Una planicie perfecta que se ubica entre las montañas, acompáñanos y descubre tu nueva vida.
                                </p>
                                <div class="property-tags">
                                    <span class="property-tag">Jardín</span>
                                    <span class="property-tag">Piscina</span>
                                    <span class="property-tag">Gimnasio</span>
                                </div>
                                <div class="contact-buttons">
                                    <a href="#" class="btn btn-outline-success contact-button">WhatsApp</a>
                                    <a href="#" class="btn btn-outline-primary contact-button">Contactar</a>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="property-card">
                            <a href="Detalle_propiedad.aspx">
                                <img src="/source/images/mantenimiento/Imagenes/LUZ_CASA.png" alt="Propiedad 2" class="card-content" />
                            </a>
                            <div class="property-details">
                                <p class="property-info">casa desde</p>
                                <p class="property-price">USD 85.000</p>
                                <h5 class="property-title">La Luz</h5>
                                <p class="property-info">La Kennedy, Quito</p>
                                <p class="property-info">143 m² tot.4 hab.3 baños2 estac.</p>
                                <p class="property-description">
                                    Departamento Duplex en Venta en La Luz, La Kennedy
                                </p>
                                <div class="property-tags">
                                    <span class="property-tag">Jardín</span>
                                </div>
                                <div class="contact-buttons">
                                    <a href="#" class="btn btn-outline-success contact-button">WhatsApp</a>
                                    <a href="#" class="btn btn-outline-primary contact-button">Contactar</a>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="property-card">
                            <a href="Detalle_propiedad.aspx">
                                <img src="/source/images/mantenimiento/Imagenes/BOULEVAR_CASA.png" alt="Propiedad 2" class="card-content" />
                            </a>
                            <div class="property-details">
                                <p class="property-info">casa desde</p>
                                <p class="property-price">USD 76.000</p>
                                <h5 class="property-title">Boulevar Escenico Santa Clara</h5>
                                <p class="property-info">Sangolqui, Quito</p>
                                <p class="property-info">277 m² tot..</p>
                                <p class="property-description">
                                    ¡La mejor alternativa para invertir en el Valle de los Chillos está aquí! Esta urbanización ofrece un estilo de vida único y activo, con amplios y generosos jardines, tres lagos, senderos naturales, y dos accesos con seguridad permanente.
                                </p>
                                <div class="property-tags">
                                    <span class="property-tag">Jardín</span>
                                    <span class="property-tag">Piscina</span>
                                </div>
                                <div class="contact-buttons">
                                    <a href="#" class="btn btn-outline-success contact-button">WhatsApp</a>
                                    <a href="#" class="btn btn-outline-primary contact-button">Contactar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>



                <div class="row mt-5">
                    <div class="col-12">
                        <h2 class="text-center mb-4">Propiedades en Venta</h2>

                        <asp:Repeater ID="rptPropiedades" runat="server" OnItemDataBound="rptPropiedades_ItemDataBound">

                            <ItemTemplate>
                                <asp:HiddenField ID="hfPropiedadId" runat="server" Value='<%# Eval("Propiedad.pro_id") %>' />
                                <br />
                                <div class="property-card">

                                    <%--<asp:Repeater ID="rptImagen" runat="server">
                                        <ItemTemplate>
                                            <a href="Detalle_propiedad.aspx">
                                                <img src='<%# Eval("img_url") %>' class="card-content" />
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>--%>

                                    <itemtemplate>
                                        <a href="Detalle_propiedad.aspx">
                                            <asp:Image ID="imgPropiedad" runat="server" CssClass="property-card-img" />
                                        </a>
                                    </itemtemplate>


                                    <div class="property-details">
                                        <p class="property-info">
                                            <%# Eval("Tipo_Inmueble.tinm_nombre") %> desde
                                       
                                        </p>
                                        <p class="property-price">
                                            USD <%# Eval("Propiedad.pro_precio") %>
                                        </p>
                                        <h5 class="property-title">
                                            <%# Eval("Propiedad.pro_titulo") %>
                                        </h5>
                                        <p class="property-info">
                                            <%# String.Format("{0}, {1}", Eval("Ubicacion.ubi_sector"), Eval("Ubicacion.ubi_provincia")) %>
                                        </p>
                                        <p class="property-info">
                                            <%# GetPropertyInfo(Convert.ToInt32(Eval("Caracteristicas.car_habitaciones")),Convert.ToInt32(Eval("Caracteristicas.car_banos")),Convert.ToInt32(Eval("Caracteristicas.car_estacionamineto"))) %>
                                        </p>
                                        <p class="property-description">
                                            <%# Eval("Propiedad.pro_descripcion") %>
                                        </p>
                                        <div class="contact-buttons">
                                            <asp:Button ID="btnVerMas" CssClass="btn btn-outline-success contact-button" OnClick="btnVerMas_Click" runat="server" Text="Más Información" CommandArgument='<%# Eval("Propiedad.pro_id") %>' />
                                            <%--                 <a href="#" class="btn btn-outline-success contact-button">WhatsApp</a>
                                            <a href="#" class="btn btn-outline-primary contact-button">Contactar</a>--%>
                                        </div>
                                    </div>

                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>




                <nav aria-label="Page navigation example" class="mt-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Anterior</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Siguiente</a>
                        </li>
                    </ul>
                </nav>
                
                
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
        </script>
        <script src="/source/javascript/TextToSpeech.js"></script>
        <!--Scripts Bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
