<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="publicacion5_definitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.publicacion5_definitivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet" />
    <style>
        .full-width-img {
            width: 95%; /* Ocupa todo el ancho de la ventana */
            left: 0; /* Posiciona la imagen al lado izquierdo de la ventana */
            right: 0; /* Posiciona la imagen al lado derecho de la ventana */
            height: 5%;
        }

        .content {
            position: relative; /* Asegura que el contenido se superponga correctamente */
            z-index: 1; /* Coloca el contenido delante de la imagen */
        }

        .underline-green {
            border-bottom: 5px solid green; /* Subrayado verde grueso */
            display: inline-block; /* Hace que el subrayado solo ocupe el ancho del texto */
            font-size: 15px;
            color: black;
        }

        body {
            overflow-x: hidden; /* Evita el scroll horizontal */
        }

        .custom-bg {
            /*background-color: black;*/
            color: white; /* Opcional: para que el texto sea visible en el fondo negro */
            position: absolute;
            top: 480px; /* Ajusta esta altura según tus necesidades */
            width: 100%;
            height: 300px; /* Ajusta la altura según tus necesidades */
            z-index: -1; /* Asegura que esté detrás del contenido principal */
        }

        .card-container {
            border: 1px solid grey; /* Bordes grises */
            padding: 20px;
            border-radius: 5px;
            background-color: white;
            width: 100%; /* Más ancho */
            margin-bottom: 20px; /* Margen inferior */
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            text-align: left;
            margin-bottom: 10px;
            padding-top: 20px; /* Ajuste de padding-top */
        }

        .close-texts {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .card-img-container {
            text-align: center; /* Centra la imagen dentro del contenedor */
        }

        .card-img {
            margin-top: 30px;
            margin-left: 5px;
            margin-bottom: 10px;
            max-width: 100%; /* Ajusta al contenedor */
            height: auto; /* Mantiene la proporción */
            /* Puedes ajustar el tamaño de la imagen aquí */
            width: var(--img-width, 140px); /* Tamaño ajustable */
            height: var(--img-height, 120px); /* Tamaño ajustable */
            display: inline-block; /* Para centrar con text-align en el contenedor */
        }

        .success-message {
            text-align: center; /* Centra el texto */
            color: green; /* Color verde */
            margin-top: 20px;
        }

        .info-message {
            text-align: center; /* Centra el texto */
            color: grey; /* Color gris */
            font-size: 14px; /* Tamaño de fuente más pequeño */
            margin-top: 10px;
            margin-bottom: 20px; /* Espacio debajo del texto */
        }

        .contact-info {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px; /* Espacio entre los iconos y el texto */
            margin-bottom: 20px;
        }

            .contact-info img {
                width: 24px; /* Tamaño del icono */
                height: 24px; /* Tamaño del icono */
            }

        .custom-btn {
            background-color: #24A841; /* Color verde claro */
            color: white; /* Texto blanco */
            border: none; /* Sin borde */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container content">
            <div class="row justify-content-center">
                <div class="col-12 text-center">
                    <br />
                    <h3>Publicar</h3>
                    <br />
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <img src="/source/images/publicaciones/Barranumero3.png" alt="Imagen principal" class="img-fluid full-width-img" />
            </div>
        </div>

        <!-- Título ajustado y alineado a la izquierda -->
        <div class="container content mt-4">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card-title">¡Estamos cerca de acabar!</div>
                    <div class="card-container">
                        <div class="card-img-container">
                            <img src="/source/images/publicaciones/ImagenVisto.png" alt="Imagen ejemplo" class="card-img" />
                        </div>
                        <div class="success-message">
                            ¡Solicitud realizada con éxito!
                        </div>
                        <div class="info-message">
                            Su anuncio se ha publicado con éxito y ahora es visible para todos los usuarios. <br />
                            Gracias por elegir Inmogestion Plus.
                        </div>
                        <div class="contact-info">
                            <div>
                                <img src="/source/images/publicaciones/iconotelefono.png" alt="Icono Quito" />
                                Quito: (02) 5000070
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end mt-3">
                        <%--<div style="margin-right: 13px;">
                            <asp:Button ID="btnregresar" Text="Regresar" type="button" class="btn btn-success" runat="server" OnClick="btnregresar_Click" />
                        </div>--%>
                        <asp:Button ID="btnNext" Text="Finalizar" class="btn custom-btn" runat="server" OnClick="btnNext_Click" />
                    </div>
                </div>
            </div>
        </div>

        <div>
        </div>
    </form>
    <div class="custom-bg"></div>
    <script src="/source/javascript/TextToSpeech.js"></script>
    <!--Scripts Boostrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
