<%@ Page Title="" Language="C#" MasterPageFile="~/Principal_inicio.Master" AutoEventWireup="true" CodeBehind="pagina_principal.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.pagina_principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_cabecera" runat="server">
    <style>
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


        /*----------------------------------------------*/

        /*panelUser {
            display: flex !important;
        }*/
        .menu-container.menu-cliente,
        .menu-container.menu-agente {
            position: relative;
            /*display: inline-block;*/
        }

        .dropdown-menu.menu-cliente,
        .dropdown-menu.menu-agente {
            display: none; /* Inicialmente oculto */
            position: absolute;
            background-color: white;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            min-width: 160px;
            transform: translate(-33px, 5px)
        }

            .dropdown-menu.menu-cliente a,
            .dropdown-menu.menu-agente a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

                .dropdown-menu.menu-cliente a:hover,
                .dropdown-menu.menu-agente a:hover {
                    background-color: #f1f1f1;
                }


        .panelDisplayHeader {
            display: flex;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_mensaje" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_contenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
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




            <%--IMAGEN Y BUSQUEDA--%>
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel" data-bs-interval="false">
                <div class="carousel-inner">
                    <div class="carousel-item active" style="position: relative;">
                        <div class="carousel-overlay"></div>
                        <img src="/source/images/home/ImgHome/Imagen3.jpg" class="d-block w-100" style="border-color: #CCCCCC; height: 40vw; background-color: #FFFFFF; vertical-align: 13%;" alt="Casa con piscina en el bosque">
                        <div class="carousel-caption d-none d-md-block" style="position: absolute; top: 35%; left: 35%; transform: translate(-20%, -15%);">
                            <h2>Encuentra tu hogar con nosotros</h2>
                            <br />
                            <div class="card text-center">
                                <div class="card-body" align="center">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-9">
                                                <asp:HiddenField ID="hfAccionBusqueda" Value="Comprar" runat="server" />
                                                <ul class="nav nav-tabs">
                                                    <li class="nav-item">
                                                        <asp:Button ID="btnComprar" runat="server" class="nav-link active" Text="Compra" OnClick="btnComprar_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                                    </li>
                                                    <li class="nav-item">
                                                        <asp:Button ID="btnAlquilar" runat="server" class="nav-link" Text="Alquiler" OnClick="btnAlquilar_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                        <div class="container-fluid">
                                            <asp:DropDownList ID="ddlTipoInmueble" runat="server" CssClass="auto-style4" aria-label="Small select example"></asp:DropDownList>
                                            <span style="margin-left: 20px;"></span>
                                            <form role="search">
                                                <asp:TextBox ID="txtDireccion" runat="server" class="auto-style5" type="search" placeholder="Ingresa dirección, parroquia, cantón o provincia" aria-label="Search" />
                                                <span style="margin-left: 5px;"></span>
                                                <asp:button id="btnBuscar" class="btn btn-success" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                            </form>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--        BOTON DE SIMULADOR--%>
            <br />
            <br />
            <div class="d-flex justify-content-between">
                <span style="margin-left: 20px;"></span>
                <div class="card mb-3" style="width: 26%; height: 220px;">
                    <div class="row g-0">
                        <div class="col-md-4 text-center d-flex align-items-center justify-content-center">
                            <img src="/source/images/home/Credito.png" class="img-fluid rounded-start" style="width: 70%; height: 70%;">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Simulación de Crédito</h5>
                                <p class="card-text">Obtén una estimación precisa de tu cuota. Simula tu cuota fácil, rápido y de manera 100% online</p>
                                <div class="text-right mt-3">
                                    <a href="simuladorDefinitivo.aspx" class="btn btn-success" style="width: 103px; height: 38px; font-family: Arial, Helvetica, sans-serif;">Ver más <i class="fas fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- SOPORTE TECNICO--%>
                <span style="margin-left: 20px;"></span>
                <div class="card mb-3" style="width: 26%; height: 220px;">
                    <div class="row g-0">
                        <div class="col-md-4 text-center d-flex align-items-center justify-content-center">
                            <img class="img-fluid rounded-start" src="/source/images/home/Soporte_tecnico.png" style="width: 70%; height: 70%;">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Soporte Técnico</h5>
                                <p class="card-text">¿Necesitas ayuda? Estamos aquí para asistirte. Cuéntanos en qué podemos colaborar contigo.</p>
                                <div class="text-right mt-3">
                                    <a class="btn btn-success" href="Servico_Tecnico.aspx">Ver más <i class="fas fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--INMOGESTION PLUS--%>
                <span style="margin-left: 20px;"></span>
                <div class="card mb-3" style="width: 26%; height: 220px;">
                    <div class="row g-0">
                        <div class="col-md-4 text-center d-flex align-items-center justify-content-center">
                            <img src="/source/images/home/Inmogestion_plus.png" class="img-fluid rounded-start" style="width: 70%; height: 70%;">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Conoce sobre INMOGESTIÓN PLUS</h5>
                                <p class="card-text">Encuentra tu hogar ideal con nuestro sistema de compra y venta de inmuebles.</p>
                                <div class="text-right mt-3">
                                    <a href="Informacion_Definitivo.aspx" class="btn btn-success">Ver más <i class="fas fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <span style="margin-left: 20px;"></span>
            </div>

            <%--  

            <%--SELECCION DE INMOBILIARIAS--%>
            <br />
            <br />
            <center>
                <h4>Algunas de nuestras inmobiliarias más destacadas</h4>
            </center>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col">
                        <table class="table" width="50%">
                            <tr>
                                <td style="padding: 10px;">
                                    <div class="card" style="width: 15rem;">
                                        <img src="https://mlsacbir.com/wp-content/uploads/2022/11/logo-mls1_Mesa-de-trabajo-1.png" class="card-img-top">
                                        <div class="card-body">
                                            <a href="https://mls-ecuador.com/es" target="_blank" class="card-link">
                                                <center>MLS-Ecuador</center>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td style="padding: 10px;">
                                    <div class="card" style="width: 15rem;">
                                        <img src="https://img77.uenicdn.com/image/upload/v1582923514/business/120ac0e6-ff5d-4dfd-a2bc-693731a198f3/inbound8147979726446411613jpg.jpg" class="card-img-top">
                                        <div class="card-body">
                                            <a href="https://ponce-lobato-construcciones.ueniweb.com" class="card-link" target="_blank">
                                                <center>Constructora Lobato</center>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td style="padding: 10px;">
                                    <div class="card" style="width: 15rem;">
                                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ0Kngc2BRCLhWlbe_gfIkTsyGhMG4vODQ9A&ss" class="card-img-top">
                                        <div class="card-body">
                                            <a href="https://www.remax.com.ec" class="card-link" target="_blank">
                                                <center>RE/MAX Ecuador</center>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td style="padding: 10px;">
                                    <div class="card" style="width: 15rem;">
                                        <img src="/source/images/home/imnumelble.png" class="card-img-top" />
                                        <div class="card-body">
                                            <a href="https://www.metroasesores.com" class="card-link" target="_blank">
                                                <center>Metro Asesores</center>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td style="padding: 10px;">
                                    <div class="card" style="width: 15rem;">
                                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFhqwiRXgxabsNo4R7HELDv01EfOfpwOlL6A&s" class="card-img-top">
                                        <div class="card-body">
                                            <a href="" class="card-link" target="_blank">
                                                <center>kanda inmobiliaria</center>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-6">
                    </div>
                    <div class="col"></div>
                </div>
            </div>
            <br />
            <br />
            <%--  CUADRO NEGRO--%>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxf*KTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</asp:Content>
