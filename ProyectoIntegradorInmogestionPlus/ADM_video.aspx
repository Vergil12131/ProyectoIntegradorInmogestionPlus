<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_video.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gestionar Videos</title>
    <style>
        .video-preview {
            border: 2px solid #000000; /* Color del borde del video */
            padding: 5px;
            display: block;
            margin: 0 auto; /* Centra el video si el contenedor tiene un ancho definido */
            max-width: 100%; /* Ajusta el video al ancho del contenedor */
        }

        .spacer {
            height: 20px; /* Espacio entre los elementos */
        }

        .btn-file, .btn-preview {
            display: block;
            width: 100%;
            margin-top: 10px;
        }

        .btn-preview {
            margin-top: 20px; /* Mayor espacio arriba del botón de previsualización */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="sidebar">
        <a href="ADM_antiguedad.aspx">Gestionar Antiguedad</a>
        <a href="ADM_caracteristica.aspx">Gestionar Características </a>
        <a href="ADM_cita.aspx">Gestionar Citas</a>
        <a href="ADM_imagen.aspx">Gestionar Imagenes</a>
        <a href="ADM_inmueble.aspx">Gestionar Inmueble </a>
        <a href="ADM_perfil.aspx">Gestionar Perfil </a>

        <a href="ADM_usuario.aspx">Gestionar Usuarios </a>
        <a href="ADM_propiedades.aspx">Gestionar Propiedades</a>
        <a href="ADM_TipoInmueble.aspx">Gestionar Tipo inmueble</a>
        <a href="ADM_plano.aspx">Gestionar Plano
        <a href="ADM_video.aspx">
            <img src="/source/images/mantenimiento/Imagenes/Gestion_video.png" alt="Gestionar Propiedades" class="sidebar-icon" />
            Gestionar Video</a>
            <a href="ADM_TipoOperacion.aspx">Gestionar Tipo operacion</a>
            <a href="ADM_ubicacion.aspx">Gestionar ubicacion </a>
            <br />
            <br />
            <br />
    </div>

    <div class="content">
        <h2>Gestionar Videos</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="container">
                    <table>
                        <tr>
                            <td colspan="2">Video:</td>
                            <td colspan="2">

                                <asp:PlaceHolder ID="phVideoPreview" runat="server">

                                    <asp:Literal ID="videoPreview" runat="server" />

                                </asp:PlaceHolder>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="spacer"></td>
                            <td colspan="2">
                                <asp:FileUpload ID="FileUpload1" runat="server" accept=".mp4" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="spacer"></td>
                            <td colspan="2">
                                <asp:Button ID="btn_visualizar" runat="server" Text="Previsualizar video" CssClass="btn btn-custom btn-add" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_visualizar_Click" />

                            </td>
                        </tr>
                    </table>
                    <br>
                    <asp:Label ID="lblErrorUpload" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>


                    <div class="form-group">
                        <label for="Propiedad">Escoja una propiedad asociada</label>
                        <asp:DropDownList ID="ddlpropiedad" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:Label ID="lblErrorPropiedad" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
                    <div class="button-container">
                        <asp:Button ID="btn_agregar" runat="server" Text="Agregar" CssClass="btn btn-custom btn-add" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_agregar_Click" />
                        <asp:Button ID="btn_editar" runat="server" Text="Editar" CssClass="btn btn-custom btn-edit" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_editar_Click" />
                        <asp:Button ID="btn_eliminar" runat="server" Text="Eliminar" CssClass="btn btn-custom btn-delete" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_eliminar_Click" />
                        <asp:Button ID="btn_limpiar" runat="server" Text="Limpiar" CssClass="btn btn-custom btn-clear" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_limpiar_Click" />
                    </div>

                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Video.vid_id" HeaderText="Codigo" />
                            <asp:BoundField DataField="Propiedad.pro_titulo" HeaderText="Propiedad" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccion" Text="Seleccione" CommandArgument='<%#Eval("Video.vid_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccionUsuario_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btn_visualizar" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        function validateFileSize() {
            var fileUpload = document.getElementById('<%= FileUpload1.ClientID %>');
            var maxSize = 1 * 1024 * 1024 * 1024; // Tamaño máximo en bytes (1 GB)
            if (fileUpload.files.length > 0) {
                if (fileUpload.files[0].size > maxSize) {
                    alert("El tamaño del archivo no debe exceder los 1 GB.");
                    return false;
                }
            }
            return true;
        }
    </script>
</asp:Content>
