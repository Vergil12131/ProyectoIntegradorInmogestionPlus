<%@ Page Title="" Language="C#" MasterPageFile="~/Publicacion4.Master" AutoEventWireup="true" CodeBehind="publicacion4_definitivoEdicion.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.publicacion4_definitivoEdicion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .text-bold {
            font-weight: 600;
            font-size: 18px;
        }

        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
            margin-bottom: 30px;
        }

        .text-box-custom {
            width: 34%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            box-sizing: border-box;
        }

        .btnAgregar {
            background-color: white;
            border: 1px solid #24A841;
            color: black;
            cursor: pointer;
            padding: 5px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            --btn-width: 120px; /* Default width */
            --btn-height: 41px; /* Default height */
            width: var(--btn-width);
            height: var(--btn-height);
        }



        .btn:hover {
            background-color: #24A841;
            color: white;
        }


        .image-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

            .image-container img {
                width: 500px;
                height: 500px;
            }

        .video-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

            .video-container video {
                width: 500px;
                height: 500px;
            }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); /* Ajusta el tamaño de las columnas según la necesidad */
            gap: 10px;
        }

        .grid-item img {
            width: 100%;
            height: 150px; /* Tamaño fijo para todas las imágenes */
            object-fit: cover;
            border-radius: 5px;
        }

        .grid-container2 {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* Ajusta el tamaño de las columnas según la necesidad */
            gap: 10px;
        }

        .grid-item iframe {
            width: 100%;
            height: 250px; /* Tamaño reducido para los videos */
            object-fit: cover;
        }

        .btnEliminar {
            border: 1px solid #24A841; /* Borde de color verde */
            color: black; /* Texto de color negro */
            background-color: white; /* Fondo blanco */
            padding: 5px 10px; /* Espaciado interno */
            font-size: 16px; /* Tamaño de la fuente */
            border-radius: 5px; /* Bordes redondeados */
            cursor: pointer; /* Indicador de cursor al pasar sobre el botón */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="card-container">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="container mt-3">
                    <div class="row" style="margin-bottom: 30px;">
                        <div class="col-md-12">
                            <caption>
                                <h4 class="text-bold">Fotos Principales</h4>
                                <h7 style="font-size: 15px; color: gray;">Carga entre 3 y 5 fotos. Se admiten formatos jpg, jpeg y png</h7>
                            </caption>
                        </div>
                    </div>
                    <div class="grid-container">
                        <asp:Repeater ID="rptImages" runat="server" OnItemCommand="rptImages_ItemCommand">
                            <ItemTemplate>
                                <div class="grid-item">
                                    <img src='<%# Container.DataItem %>' alt="Uploaded Image" />
                                    <asp:Button ID="btnDeleteImagen" runat="server" CommandName="Delete" CommandArgument='<%# Container.DataItem %>' Text="Eliminar" UseSubmitBehavior="false" CausesValidation="false" CssClass="btnEliminar"/>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="row center-container">
                        <div class="col-md-9">
                            <asp:FileUpload ID="fuImagen" runat="server" Accept=".jpg,.jpeg,.png" />
                            <asp:Button ID="btnUploadImagen" runat="server" Text="Visualizar Imagen" OnClick="btnUploadImagen_Click" class="btn btn-success" />
                            <asp:Label ID="lblErrorUploadImagen" CssClass="text-danger" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 30px;">
                        <div class="col-md-12">
                            <caption>
                                <h4 class="text-bold">Planos (opcional)</h4>
                                <h7 style="font-size: 15px; color: gray;">Carga los planos del inmueble, maximo 3 imagenes. Se admiten formatos jpg, jpeg y png</h7>
                            </caption>
                        </div>
                    </div>
                    <div class="grid-container">
                        <asp:Repeater ID="rptPlano" runat="server" OnItemCommand="rptPlano_ItemCommand">
                            <ItemTemplate>
                                <div class="grid-item">
                                    <img src='<%# Container.DataItem %>' alt="Uploaded Image" />
                                    <asp:Button ID="btnDeletePlano" runat="server" CommandName="Delete" CommandArgument='<%# Container.DataItem %>' Text="Eliminar" CssClass="btnEliminar" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="row center-container">
                        <div class="col-md-9">
                            <asp:FileUpload ID="fuPlano" runat="server" Accept=".jpg,.jpeg,.png" />
                            <asp:Button ID="btnUploadPlano" runat="server" Text="Visualizar Imagen" OnClick="btnUploadPlano_Click" class="btn btn-success" />
                            <asp:Label ID="lblErrorUploadPlano" CssClass="text-danger" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 30px;">
                        <div class="col-md-12">
                            <caption>
                                <h4 class="text-bold">Video (opcional)</h4>
                                <div style="margin-bottom: 10px;">
                                    <h7 style="font-size: 15px; color: gray;">Puedes cargar hasta 2 videos. Se admite formato mp4</h7>
                                </div>
                            </caption>
                        </div>
                    </div>
                    <div class="grid-container2">
                        <asp:Repeater ID="rptVideo" runat="server" OnItemCommand="rptVideo_ItemCommand">
                            <ItemTemplate>
                                <div class="grid-item">
                                    <iframe width="100%" height="150" src='<%# Container.DataItem %>' frameborder="0" allowfullscreen></iframe>
                                    <asp:Button ID="btnDeleteVideo" runat="server" CommandName="Delete" CommandArgument='<%# Container.DataItem %>' Text="Eliminar" CssClass="btnEliminar"/>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="row center-container">
                        <div class="col-md-9">
                            <asp:FileUpload ID="fuVideo" runat="server" Accept=".mp4" />
                            <asp:Button ID="btnUploadVideo" runat="server" Text="Visualizar Video" OnClick="btnUploadVideo_Click" class="btn btn-success" />
                            <asp:Label ID="lblErrorUploadVideo" CssClass="text-danger" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
            <div class="d-flex justify-content-end mt-3">
                <div style="margin-right: 13px;">
                    <asp:Button ID="btnregresar" Text="Regresar" type="button" class="btn btn-success" runat="server" OnClick="btnregresar_Click" />
                </div>
                <asp:Button ID="btnNext" Text="Continuar" type="button" class="btn btn-success" runat="server" OnClick="btnNext_Click" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUploadImagen" />
            <asp:PostBackTrigger ControlID="btnUploadPlano" />
            <asp:PostBackTrigger ControlID="btnUploadVideo" />
        </Triggers>
    </asp:UpdatePanel>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var dropzone1 = document.getElementById('dropzone1');
            var fileUpload1 = document.getElementById('<%= fuImagen.ClientID %>');
            var dropzone2 = document.getElementById('dropzone2');
            var fuPlano = document.getElementById('<%= fuPlano.ClientID %>');

            setupDropzone(dropzone1, fileUpload1);
            setupDropzone(dropzone2, fuPlano);

            function setupDropzone(dropzone, fileUpload) {
                dropzone.addEventListener('click', function () {
                    fileUpload.click();
                });

                dropzone.addEventListener('dragover', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    dropzone.classList.add('dragover');
                });

                dropzone.addEventListener('dragleave', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    dropzone.classList.remove('dragover');
                });

                dropzone.addEventListener('drop', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    dropzone.classList.remove('dragover');

                    var files = e.dataTransfer.files;
                    handleFiles(files);
                });

                fileUpload.addEventListener('change', function () {
                    var files = fileUpload.files;
                    handleFiles(files);
                });

                function handleFiles(files) {
                    for (var i = 0; i < files.length; i++) {
                        console.log(files[i].name);
                        // Aquí puedes manejar los archivos, por ejemplo, subirlos al servidor
                    }
                }
            }
        });
    </script>
</asp:Content>