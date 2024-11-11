<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteTemp.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ReporteTemp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Reportes</title>
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

        /*------------------------------------------*/
        .container {
            width: 800px; /* Ajusta el valor según tus necesidades */
        }

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

                <nav class="navbar navbar-expand-lg navbar-custom">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="pagina_principal.aspx">
                            <img src="/source/images/home/logo.png" class="auto-style2" /></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav lead" style="margin-left:750px;">

                                <%--BARAS DE USUARIO--%>

                                <asp:Button ID="btnMantenimiento" class="btn btn-outline-success " Style="font-family: Calibri" data-bs-toggle="button" aria-expanded="true" runat="server" Text="Mantenimiento" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnMantenimiento_Click" />
                                <span style="margin-left: 20px;"></span>


                                <asp:Button ID="btnReportes" class="btn btn-outline-success " Style="font-family: Calibri" data-bs-toggle="button" aria-expanded="true" runat="server" Text="Reportes" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnReportes_Click" />
                                <span style="margin-left: 20px;"></span>

                                <asp:Panel ID="pnlLoggedOut" runat="server" class="ms-auto" Style="display: none">
                                    <span style="margin-left: 20px;"></span>
                                    <asp:Button ID="Button1" class="btn btn-outline-success" data-bs-toggle="button" aria-expanded="true" tyle="font-family: Calibri" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                </asp:Panel>

                                <asp:Panel ID="pnlLoggedIn" runat="server" class="ms-auto" Style="display: block; margin-bottom: 0px;">
                                    <div class="menu-container username">
                                        <div class="menu-button username">
                                            <asp:Label ID="lblUsuarioMaster" runat="server" Text="Usuario"></asp:Label>
                                            <img src="/source/images/mantenimiento/Imagenes/usuariooo.png" alt="Usuario" width="50" height="50" alt="Foto del Menú" class="menu-photo">
                                        </div>
                                        <div class="dropdown-menu  username">
                                            <center>
                                                <asp:Button ID="Button2" class="btn btn-outline-success" data-bs-toggle="button" aria-expanded="true" tyle="font-family: Calibri" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CausesValidation="false" UseSubmitBehavior="false" />
                                            </center>
                                        </div>
                                    </div>
                                </asp:Panel>
                        </div>
                    </div>
                </nav>

                <div class="container">
                    <div class="row">
                        <div class="col-md-8 mx-auto text-center mt-5">
                            <h1 class="display-4" style="font-size: 45px;">Reportes</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="buscar" role="tabpanel" aria-labelledby="buscar-tab">
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq1" role="button" aria-expanded="false" aria-controls="faq1" class="collapsed">Resumen de Transacciones de Propiedades por Tipo de Operación en Agosto 2024<span style="margin-right: 20px;">➤</span>
                                        </a>
                                        <div class="collapse" id="faq1" style="margin-top: 20px;">
                                            <div class="card card-body">
                                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" Height="1150px" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="800px">
                                                    <LocalReport ReportPath="TransaccionesPropiedades.rdlc">
                                                        <DataSources>
                                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                                                        </DataSources>
                                                    </LocalReport>
                                                </rsweb:ReportViewer>
                                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ProyectoIntegradorInmogestionPlus.DataSet1TableAdapters.TransaccionesPropiedadesTableAdapter"></asp:ObjectDataSource>
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq2" role="button" aria-expanded="false" aria-controls="faq2" class="collapsed">Análisis de Inmuebles Activos por Ubicación en Provincias, Cantones y Sectores<span style="margin-right: 20px;">➤</span>
                                        </a>
                                        <div class="collapse" id="faq2" style="margin-top: 20px;">
                                            <div class="card card-body">
                                                <rsweb:ReportViewer ID="ReportViewer2" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="800px" Height="1150px" >
                                                    <LocalReport ReportPath="InmueblesActivos.rdlc">
                                                        <DataSources>
                                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                                                        </DataSources>
                                                    </LocalReport>
                                                </rsweb:ReportViewer>
                                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="ProyectoIntegradorInmogestionPlus.DataSet1TableAdapters.InmueblesActivosTableAdapter"></asp:ObjectDataSource>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="faq-item">
                                        <a data-toggle="collapse" href="#faq4" role="button" aria-expanded="false" aria-controls="faq4" class="collapsed">Detalle de Propiedades Vendidas y Compradores en Agosto 2024<span style="margin-right: 20px;">➤</span>
                                        </a>
                                        <div class="collapse" id="faq4" style="margin-top: 20px;">
                                            <div class="card card-body">
                                                <rsweb:ReportViewer ID="ReportViewer3" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="805px" Height="1150px">
                                                    <LocalReport ReportPath="PropiedadesVendidas.rdlc">
                                                        <DataSources>
                                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DataSet1" />
                                                        </DataSources>
                                                    </LocalReport>
                                                </rsweb:ReportViewer>
                                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetData" TypeName="ProyectoIntegradorInmogestionPlus.DataSet1TableAdapters.PropiedadesVendidasTableAdapter"></asp:ObjectDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer mt-5 text-white">
                    <div class="container py-4">
                        <div class="row">
                            <div class="col-lg-2 col-md-6 mb-4" style="max-width: 300px;">
                                <h5 class="text-uppercase">Búsquedas Frecuentes</h5>
                                <ul class="list-unstyled">
                                    <li><a href="#">Departamentos en ventas</a></li>
                                    <li><a href="#">Departamentos en alquiler</a></li>
                                    <li><a href="#">Casas en venta</a></li>
                                    <li><a href="#">Casas en alquiler</a></li>
                                </ul>
                            </div>

                            <div class="col-lg-2 col-md-6 mb-4" style="max-width: 200px;">
                                <h5 class="text-uppercase">Anunciantes</h5>
                                <ul class="list-unstyled">
                                    <li><a href="#">Dueños directos</a></li>
                                    <li><a href="#">Inmobiliarias</a></li>
                                </ul>
                            </div>

                            <div class="col-lg-3 col-md-6 mb-4">
                                <div class="d-flex flex-column justify-content-center">
                                    <h5 class="text-uppercase mb-3">INMOGESTIÓN PLUS</h5>
                                    <ul class="list-unstyled">
                                        <li class="mb-2"><a href="#">Acerca de INMOGESTIÓN PLUS</a></li>
                                        <li class="mb-2"><a href="#">Política de privacidad</a></li>
                                        <li class="mb-2"><a href="#">Política de cookies</a></li>
                                        <li class="mb-2"><a href="#">Trabaja con nosotros</a></li>
                                        <li class="mb-2"><a href="#">Contáctanos</a></li>
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
                var menuButton = document.querySelector('.menu-button.username');
                var dropdownMenu = document.querySelector('.dropdown-menu.username');

                menuButton.addEventListener('click', function () {
                    dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
                });

                // Cierra el menú si se hace clic fuera de él
                window.addEventListener('click', function (event) {
                    if (!menuButton.contains(event.target)) {
                        dropdownMenu.style.display = 'none';
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
