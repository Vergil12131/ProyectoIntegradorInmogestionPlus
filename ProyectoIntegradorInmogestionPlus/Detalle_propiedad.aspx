<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalle_propiedad.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Detalle_propiedad" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Akana - Casas Realmente Independientes y Departamentos</title>
    <style>
        .contact-map {
            display: flex;
            justify-content: space-between; /* Espacio entre las columnas */
            margin-top: 0px; /* Espacio superior para separar de la sección anterior */
        }

        .contact-form {
            flex: 0 0 38%; /* Ajusta el tamaño del formulario (35% del contenedor) */
            margin-left: 20px; /* Espacio entre el formulario y el mapa */
            background: #f9f9f9; /* Fondo para el formulario */
            padding: 10px;
            border-radius: 10px;
        }

        .map {
            flex: 0 0 100%; /* Ajusta el tamaño del mapa (60% del contenedor) */
        }

            .map iframe {
                width: 100%;
                height: 550px; /* Altura fija para el iframe */
                border-radius: 10px;
            }

        .properties {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            color: #333;
        }

        .container {
            width: 90%;
            margin: auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .header img {
            width: 150px;
            display: block;
            margin: 0 auto;
        }

        .main {
            display: flex;
            flex-direction: column; /* Cambia a columna para disponer verticalmente */
            gap: 20px; /* Agrega espacio entre las secciones */
        }

            .main img {
                width: 100%;
                height: auto;
                border-radius: 10px;
            }

        .details {
            padding: 20px;
            width: 100%;
        }

            .details h1 {
                margin: 0 0 20px;
                font-size: 24px;
            }

        .info, .contact-form {
            margin: 20px 0;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
        }

            .info div, .contact-form div {
                margin: 10px 0;
            }

                .info div span, .contact-form div span {
                    font-weight: bold;
                }

        /* Contenedor general de las propiedades */
        .properties {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Espacio entre las tarjetas de propiedad */
            justify-content: space-around;
            padding: 20px 0;
        }

        /* Estilos para cada tarjeta de propiedad */
        .property {
            background: white;
            padding: 15px;
            border-radius: 10px;
            width: calc(25% - 20px); /* Ajuste para espacio entre tarjetas */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .property:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            }

            /* Imagen de la propiedad */
            .property img {
                border-radius: 10px;
                height: 200px;
                object-fit: cover;
                width: 100%;
                transition: opacity 0.3s ease;
            }

                .property img:hover {
                    opacity: 0.9;
                }

            /* Contenedor de la información de la propiedad */
            .property div {
                margin-top: 10px;
            }

            /* Estilo para el precio */
            .property span {
                font-size: 18px;
                font-weight: bold;
                color: #28a745;
            }

            /* Botón en la tarjeta */
            .property button {
                margin-top: 15px; /* Espacio superior para separar el botón */
                background-color: #24A841;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                width: 100%;
            }

                .property button:hover {
                    background-color: #28a745;
                }



        .contact-form input, .contact-form select, .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact-form button {
            background-color: #ff6600;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

            .contact-form button.whatsapp {
                background-color: #24A841;
            }

        .contact-form div.checkbox {
            display: flex;
            align-items: center;
        }

            .contact-form div.checkbox input {
                width: auto;
                margin-right: 10px;
            }

            .contact-form div.checkbox label {
                margin: 0;
            }

        .contact-form p {
            margin: 10px 0 0;
        }

        .gallery {
            display: flex;
            gap: 10px;
        }

            .gallery .main-img {
                max-width: 750px;
                height: 335px;
                margin: 0 auto; /* Centrado del cuadro */
                border-radius: 20px;
            }

            .gallery .side-gallery {
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-template-rows: 1fr 1fr;
                gap: 10px;
                margin: 0 auto; /* Centrado del cuadro */
                max-width: 64%;
                height: 60%;
            }

                .gallery .side-gallery img {
                    border-radius: 10px;
                }

        /* Nuevos estilos para la información de la propiedad */
        .property-info {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-top: 1px;
        }

            .property-info div {
                background: #f0f0f0;
                padding: 10px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                font-size: 16px;
            }

                .property-info div span {
                    font-weight: bold;
                    margin-right: 10px;
                }

        /FOOTER ENCABEZADO/
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

        /-------------------------------------------/

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

        /*//Repeter//*/
        .gallery-container {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 15px;
        }

        .thumbnails-container {
            display: flex;
            flex-direction: column;
            margin-right: 20px;
            max-height: 400px;
            overflow-y: auto;
            /*overflow-x: clip;
            max-width: 120px;*/
        }

        .thumbnail {
            width: 110px;
            height: 110px;
            margin-bottom: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            object-fit: cover;
        }

            .thumbnail:hover {
                border-color: #24A841;
            }

        .main-image-container {
            width: 550px;
            height: 450px;
            border: 2px solid #ddd;
            border-radius: 15px;
            overflow: hidden;
        }

        .main-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .price-tag {
            font-size: 28px;
            color: #28a745;
            font-weight: bold;
        }

        .btn-custom {
            width: 100%;
            margin-top: 10px;
            font-size: 16px;
        }

        .details-text {
            font-size: 19px;
            margin-bottom: 15px;
        }

        .details-descripcion {
            font-size: 15px;
            margin-bottom: 15px;
        }

        .info-section {
            margin-top: 20px;
        }

        .blueprint-container {
            margin-top: 30px;
        }

        .blueprint-image {
            width: 300px;
            height: auto;
            cursor: pointer;
            border: 2px solid #ddd;
            border-radius: 15px;
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 15px;
            overflow: hidden;
            position: relative;
        }

        .modal-image {
            width: 100%;
            height: auto;
        }

        .close-modal {
            position: absolute;
            top: 10px;
            right: 20px;
            color: #000000;
            font-size: 24px;
            cursor: pointer;
        }

        .video-container {
            margin-top: 30px;
            text-align: left;
        }

        .modal-overlay, .video-modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content, .video-modal-content {
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 15px;
            overflow: hidden;
            position: relative;
        }

        .modal-image, .video-modal {
            width: 100%;
            height: auto;
        }

        .close-modal, .close-video-modal {
            position: absolute;
            top: 10px;
            right: 20px;
            color: #fff;
            font-size: 24px;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function changeMainImage(imageUrl) {
            document.getElementById('mainImage').src = imageUrl;

        }
        function openModal(imageUrl) {
            document.getElementById('modalImage').src = imageUrl;
            document.getElementById('modalOverlay').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('modalOverlay').style.display = 'none';
        }
        function openVideoModal(videoUrl) {
            console.log(videoUrl);
            document.getElementById('videoModalOverlay').style.display = 'flex';
            document.getElementById('modalVideoSource').src = videoUrl;
            document.getElementById('modalVideo').load();
        }

        function closeVideoModal() {
            document.getElementById('videoModalOverlay').style.display = 'none';
        }
    </script>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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
                                                                    <li><a class="dropdown-item" href="Vista_Propiedades.aspx">Casa</a></li>
                                                                    <li><a class="dropdown-item" href="#">Departamento</a></li>
                                                                    <li><a class="dropdown-item" href="#">Suite</a></li>
                                                                    <li><a class="dropdown-item" href="#">Urbanizacion</a></li>
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
                                                                    <li><a class="dropdown-item" href="Vista_Propiedades.aspx">Casa</a></li>
                                                                    <li><a class="dropdown-item" href="#">Departamento</a></li>
                                                                    <li><a class="dropdown-item" href="#">Suite</a></li>
                                                                    <li><a class="dropdown-item" href="#">Urbanizacion</a></li>
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
                                                                    <li><a class="dropdown-item" href="Vista_Propiedades.aspx">Casa</a></li>
                                                                    <li><a class="dropdown-item" href="#">Departamento</a></li>
                                                                    <li><a class="dropdown-item" href="#">Suite</a></li>
                                                                    <li><a class="dropdown-item" href="#">Urbanizacion</a></li>
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
                                <li class="auto-style3">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Servicios</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Crédito</th>
                                                            <th scope="col">Tipo de Servicio</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li><a class="dropdown-item" href="#">Simulador de crédito</a></li>

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
                                                                    <li><a class="dropdown-item" href="Vista_Propiedades.aspx">Casa</a></li>
                                                                    <li><a class="dropdown-item" href="#">Departamento</a></li>
                                                                    <li><a class="dropdown-item" href="#">Suite</a></li>
                                                                    <li><a class="dropdown-item" href="#">Urbanizacion</a></li>
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
                                                                    <li><a class="dropdown-item" href="Vista_Propiedades.aspx">Casa</a></li>
                                                                    <li><a class="dropdown-item" href="#">Departamento</a></li>
                                                                    <li><a class="dropdown-item" href="#">Suite</a></li>
                                                                    <li><a class="dropdown-item" href="#">Urbanizacion</a></li>
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
                                                                    <li><a class="dropdown-item" href="Vista_Propiedades.aspx">Casa</a></li>
                                                                    <li><a class="dropdown-item" href="#">Departamento</a></li>
                                                                    <li><a class="dropdown-item" href="#">Suite</a></li>
                                                                    <li><a class="dropdown-item" href="#">Urbanizacion</a></li>
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
                                <li class="auto-style3">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: Calibri">Servicios</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="p-2">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Crédito</th>
                                                            <th scope="col">Tipo de Servicio</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <ul class="list-unstyled">
                                                                    <li><a class="dropdown-item" href="#">Simulador de crédito</a></li>

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
                    <p></p>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="gallery-container">
                                <div class="thumbnails-container">
                                    <!-- Repeater para miniaturas -->
                                    <asp:Repeater ID="rptThumbnails" runat="server">
                                        <ItemTemplate>
                                            <img src='<%# Eval("img_url") %>' alt='<%# Eval("img_url") %>' class="thumbnail" onclick='changeMainImage("<%# Eval("img_url") %>")' />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="main-image-container">
                                    <!-- Imagen principal -->
                                    <asp:Image runat="server" ID="mainImage" alt="Propiedad en venta" class="main-image" />

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <h2 class="details-text" style="color: black;">
                                <asp:Label ID="lblTitulo" runat="server"></asp:Label>
                            </h2>
                            <p class="price-tag">
                                <asp:Label ID="lblPrecio" runat="server"></asp:Label>
                            </p>
                            <p class="details-descripcion">
                                <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                            </p>
                            <asp:Button ID="btn_Agendar" class="btn btn-outline-success btn-custom" data-bs-toggle="button" aria-expanded="true" tyle="font-family: Calibri" runat="server" Text="Agendar cita" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnAgendarCita_Click" />
                            <div class="details-text info-section">
                                <h4>Información del Vendedor</h4>
                                <asp:Label ID="lblInmobiliariaAgente" runat="server" Style="font-weight: bold"></asp:Label>
                                <p></p>
                                <p>
                                    <i class="fas fa-user"></i>Nombre: 
                               
                                    <asp:Label ID="lblNombreAgente" runat="server"></asp:Label>
                                </p>
                                <p>
                                    <i class="fas fa-phone"></i>Teléfono: +593 
                                <asp:Label ID="lblTelefonoAgente" runat="server"></asp:Label>
                                </p>
                                <p>
                                    <i class="fas fa-envelope"></i>Email: 
                                    <asp:Label ID="lblEmailAgente" runat="server"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>
                    <p></p>
                    <h4 style="color: black;">Detalles de la Propiedad</h4>
                    <div class="details">
                        <div class="property-info">
                            <div>
                                <span>Ubicación: 
                                    <asp:Label ID="lblUbicacion" runat="server" Style="font-weight: normal;"></asp:Label>
                                </span>
                            </div>
                            <div>
                                <span>Venta desde:</span>
                                <asp:Label ID="lblPrecioDetalles" runat="server" Style="font-weight: normal;"></asp:Label>
                            </div>

                            <div>
                                <span>Área construida:</span>
                                <%--107 a 359 m² cub.--%>
                                <asp:Label ID="lblAreaConstruida" runat="server" Style="font-weight: normal;"></asp:Label>
                            </div>
                            <div>
                                <span>Área total:</span>
                                <%--107 a 359 m² cub.--%>
                                <asp:Label ID="lblAreaTotal" runat="server" Style="font-weight: normal;"></asp:Label>
                            </div>
                            <%--<div><span>En construcción:</span> Entrega 3<sup>er</sup> trimestre 2025</div>--%>
                            <div>
                                <span>Antiguedad:</span>
                                <asp:Label ID="lblAntiguedad" runat="server" Style="font-weight: normal;"></asp:Label>
                            </div>
                            <div>
                                <span>Habitaciones:</span>
                                <asp:Label ID="lblHabitaciones" runat="server" Style="font-weight: normal;"></asp:Label>
                            </div>
                            <div>
                                <span>Baños:</span>
                                <asp:Label ID="lblBano" runat="server" Style="font-weight: normal;"></asp:Label>
                            </div>
                            <div>
                                <span>Estacionamientos:</span>
                                <asp:Label ID="lblEstacionamiento" runat="server" Style="font-weight: normal;"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <h4 style="color: black;">Ubicación de la Propiedad</h4>
                    <p class="address">
                        <asp:Label ID="lblDireccion" runat="server" Style="font-weight: normal;"></asp:Label>
                    </p>

                    <div class="contact-map">

                        <div class="map">
                            <div id="map" style="height: 500px;"></div>
                            <asp:HiddenField ID="hfCoordenadas" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hfNombreUbicacion" runat="server" ClientIDMode="Static" />


                        </div>

                    </div>
                    <!-- Sección para ver los planos -->
                    <div class="blueprint-container">
                        <h4 style="color: black;">Planos de la Propiedad</h4>
                        <asp:Repeater ID="rptBlueprints" runat="server">
                            <ItemTemplate>
                                <img src='<%# Eval("pla_url") %>' alt='<%# Eval("pla_url") %>' class="blueprint-image" onclick='openModal("<%# Eval("pla_url") %>")' />
                            </ItemTemplate>
                        </asp:Repeater>
                        <!-- Mensaje si no hay planos -->
                        <asp:Panel ID="pnlNoBlueprints" runat="server" Visible="false">
                            <%--<p>No Registrado Planos</p>--%>
                        </asp:Panel>
                    </div>
                    <!-- Modal para ver la imagen del plano -->
                    <div id="modalOverlay" class="modal-overlay" onclick="closeModal()">
                        <div class="modal-content">
                            <img id="modalImage" src="" alt="Plano de la Propiedad" class="modal-image" />
                            <span class="close-modal" onclick="closeModal()">&times;</span>
                        </div>
                    </div>
                    <!-- Sección para ver el videp -->

                    <div class="video-container">
                        <h4>Video de la Propiedad</h4>
                        <asp:Repeater ID="rptVideos" runat="server">
                            <ItemTemplate>
                                <video class="video-preview" onclick='openVideoModal("<%# Eval("vid_url") %>"); return false;' height="300" width="400">
                                    <source src='<%# Eval("vid_url") %>' type="video/mp4" />
                                    Your browser does not support the video tag.
                                </video>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!-- Mensaje si no hay videos -->
                        <asp:Panel ID="pnlNoVideos" runat="server" Visible="false">
                            <p>No Registrado Videos</p>
                        </asp:Panel>
                    </div>
                    <!-- Modal para ver el videp -->

                    <div id="videoModalOverlay" class="video-modal-overlay" onclick="closeVideoModal()">
                        <div class="video-modal-content">
                            <video id="modalVideo" controls class="video-modal">
                                <source id="modalVideoSource" type="video/mp4" />
                                Tu navegador no soporta la etiqueta de video.
                           
                            </video>
                            <span class="close-video-modal" onclick="closeVideoModal()">&times;</span>
                        </div>
                    </div>
                    <p></p>
                    <h4 style="color: black;">Otras propiedades</h4>
                    <p></p>
                    <div class="properties">
                        <asp:Repeater ID="rptPropiedadesRecomendadas" runat="server" OnItemDataBound="rptPropiedades_ItemDataBound">
                            <ItemTemplate>
                                <div class="property">
                                    <asp:HiddenField ID="hfPropiedadId" runat="server" Value='<%# Eval("Propiedad.pro_id") %>' />
                                    <asp:Image ID="imgRecomendaciones" CssClass="property-img" runat="server" />
                                    <div>
                                        <asp:Label Style="font-weight: normal; color: black;" ID="lblitulo" runat="server" Text='<%# Eval("Propiedad.pro_titulo")  %>'></asp:Label>
                                        <%--+ Eval("Caracteristicas.car_habitaciones") + " habitaciones"--%>
                                    </div>
                                    <div>
                                        <span>
                                            <asp:Label ID="lblPrecioRecomendaciones" runat="server" Text='<%# "USD " + Eval("Propiedad.pro_precio") %>'></asp:Label>
                                        </span>
                                    </div>
                                    <div>
                                        <asp:Label Style="font-weight: normal; color: black;" ID="lblDatosRecomendaciones" runat="server" Text='<%# Eval("Propiedad.pro_area_total") + "m² totales. "  %>'></asp:Label>
                                        <%--+ Eval("Caracteristicas.car_habitaciones") + " habitaciones"--%>
                                    </div>

                                    <asp:Button ID="btnRecomendaciones" class="btn btn-outline-success btn-custom" Text="Ver" runat="server" CommandArgument='<%# Eval("Propiedad.pro_id") %>' OnClick="btnRecomendaciones_Click" />

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>




                <%--</div>--%>

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


            document.addEventListener("DOMContentLoaded", function () {
                // Obtener el valor del HiddenField
                var coordenadas = document.getElementById("hfCoordenadas").value;
                var nombreUbicacion = document.getElementById("hfNombreUbicacion").value;

                // Verificar que el campo no esté vacío
                if (coordenadas) {
                    // Utilizar una expresión regular para extraer la latitud y longitud
                    var regex = /LatLng\(([^,]+),\s*([^)]+)\)/;
                    var matches = coordenadas.match(regex);

                    if (matches) {
                        var lat = parseFloat(matches[1]);
                        var lng = parseFloat(matches[2]);

                        // Inicializar el mapa centrado en las coordenadas
                        var map = L.map('map').setView([lat, lng], 16);

                        // Cargar la capa de mapas de OpenStreetMap
                        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                        }).addTo(map);

                        // Agregar un marcador en las coordenadas
                        L.marker([lat, lng]).addTo(map)
                            .bindPopup(nombreUbicacion)
                            .openPopup();
                    } else {
                        console.error("Formato de coordenadas no válido en hfCoordenadas.");
                    }
                } else {
                    console.error("No se encontraron coordenadas en hfCoordenadas.");
                }
            });
        </script>
        <script>
</script>
        <!--Scripts Bootstrap-->
        <script src="/source/javascript/TextToSpeech.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>



    </form>
</body>
</html>