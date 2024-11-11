<%@ Page Title="" Language="C#" MasterPageFile="~/Avisos.Master" AutoEventWireup="true" CodeBehind="Avisos.aspx.cs" Inherits="PoryectoIntegradorInmogestionPlus.Avisos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

            .property-card img {
                width: 400px; /* Ancho fijo */
                height: 300px; /* Alto fijo */
                object-fit: cover; /* Mantiene la proporción de la imagen, recortando si es necesario */
                display: block; /* Asegura que la imagen se comporte como un bloque */
                margin: 0 auto; /* Centra la imagen dentro de su contenedor */
                margin-left: 10px; /* Ajusta este valor según sea necesario */
                padding: 5px;
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

        .property-image {
            width: 300px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_mensaje" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_contenido" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <center>
                <h1>MIS AVISOS</h1>
                <br />
            </center>
            
            
            
            <table>
                <tr>
                    <td class="auto-style22">
                    </td>
                    <td class="auto-style21">
                        <div class="auto-style15">
                            <h4 class="auto-style24" style="font-weight: normal;">
                                <span class="arrow" style="display: inline-block;">
                                    <img src="/source/images/home/ImgAvisos/productos.png" style="width: 35px; height: 25px;" class="auto-style16" />
                                    <strong><span class="auto-style16">&nbsp;&nbsp; Mis publicaciones disponibles: <asp:Label ID="lblNumeroPublicaciones" runat="server"/></span></strong>
                                </span>
                            </h4>
                        </div>
                    </td>
                </tr>
            </table>


            <asp:Panel ID="pnlSinAvisos" runat="server">
                <center>
                    <img src="/source/images/home/ImgAvisos/aviso.png" class="auto-style25" /></center>
                <center>
                    <h1><strong>No se encontraron avisos </strong>
                        <br />
                        <span class="auto-style26">Todavía no tienes avisos publicados</span></h1>
                </center>
            </asp:Panel>

            <asp:Panel ID="pnlConAvisos" runat="server">
                <div class="row mt-5">
                    <div class="col-12">

                        <asp:Repeater ID="rptPropiedades" runat="server" OnItemDataBound="rptPropiedades_ItemDataBound">

                            <ItemTemplate>
                                <asp:HiddenField ID="hfPropiedadId" runat="server" Value='<%# Eval("Propiedad.pro_id") %>' />
                                <br />
                                <div class="property-card">

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
                                            <asp:Button ID="btnVerPropiedad" CssClass="btn btn-outline-success contact-button" OnClick="btnVerPropiedad_Click" runat="server" Text="Ver Propiedad" CommandArgument='<%# Eval("Propiedad.pro_id") %>' />
                                                     <asp:Button ID="btnEditarPropiedad" CssClass="btn btn-outline-primary contact-button" OnClick="btnEditarPropiedad_Click1" runat="server" Text="Editar Propiedad" CommandArgument='<%# Eval("Propiedad.pro_id") %>' />
                                            <asp:Button ID="btnEliminarPropiedad" CssClass="btn btn-outline-danger contact-button" OnClick="btnEliminarPropiedad_Click" runat="server" Text="Dar de Baja" CommandArgument='<%# Eval("Propiedad.pro_id") %>' />
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
            </asp:Panel>


            <script>
                function toggleTasks() {
                    const tasks = document.querySelector('.tasks');
                    const arrow = document.querySelector('.arrow');
                    tasks.classList.toggle('active');
                    arrow.classList.toggle('down');
                }
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
