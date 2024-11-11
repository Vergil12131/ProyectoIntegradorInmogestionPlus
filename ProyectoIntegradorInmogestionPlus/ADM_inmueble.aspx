<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_inmueble.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_inmueble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="sidebar">
        <a href="ADM_antiguedad.aspx">Gestionar Antigüedades </a>
        <a href="ADM_caracteristica.aspx">Gestionar Características </a>
        <a href="ADM_cita.aspx">Gestionar Citas</a>
        <a href="ADM_imagen.aspx">Gestionar Imagenes</a>
        <a href="ADM_inmobiliarias.aspx">
            <img src="source/images/mantenimiento/Imagenes/inmueble.png" alt="Gestionar Empresas" class="sidebar-icon" />
            Gestionar Inmuebles
        </a>
        <a href="ADM_perfil.aspx">Gestionar Perfil </a>

        <a href="ADM_usuario.aspx">Gestionar Usuarios </a>
        <a href="ADM_propiedades.aspx">Gestionar Propiedades</a>
        <a href="ADM_TipoInmueble.aspx">Gestionar Tipo inmueble</a>
        <a href="ADM_plano.aspx">Gestionar Planos </a>
        <a href="ADM_video.aspx">Gestionar Video</a>
        <a href="ADM_TipoOperacion.aspx">Gestionar Tipo operacion</a>
        <a href="ADM_ubicacion.aspx">Gestionar ubicacion </a>
        <br />
        <br />
        <br />
    </div>
    <div class="content">
        <h2>Gestionar Inmobiliaria</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="HiddenFieldId" runat="server" />
                <div class="container">
                    <div class="form-group">
                        <label for="email">Ingrese un nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                        <asp:Label ID="lblErrorNombres" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="nombres">Ingrese su dirección</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Dirección"></asp:TextBox>
                        <asp:Label ID="lblErrorDireccion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Ingrese su RUC</label>
                        <asp:TextBox ID="txtRUC" runat="server" CssClass="form-control" placeholder="RUC" TextMode="Number"></asp:TextBox>
                        <asp:Label ID="lblErrorRUC" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="ci">Ingrese su razón social</label>
                        <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control" placeholder="Razón Social"></asp:TextBox>
                        <asp:Label ID="lblErrorRazonSocial" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Ingrese su teléfono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono" TextMode="Number"></asp:TextBox>
                        <asp:Label ID="lblErrorTelefono" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Ingrese su correo</label>
                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" placeholder="Correo" TextMode="Email"></asp:TextBox>
                        <asp:Label ID="lblErrorCorreo" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <table>
                        <tr>
                            <td colspan="2">Imagen:</td>
                            <td colspan="2">
                                <asp:Image ID="Image1" runat="server" Height="139px" Width="127px" ImageUrl="~/source/images/mantenimiento/Imagenes/Camaara.jpg" CssClass="image-preview" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="spacer"></td>
                            <td colspan="2">
                                <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg, .jpeg, .png" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="spacer"></td>
                            <td colspan="2">
                                <asp:Button ID="btn_visualizar" runat="server" Text="Previsualizar imagen" CssClass="btn btn-custom btn-add" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_visualizar_Click" />
                            </td>
                        </tr>
                    </table>
                    <br>
                    <asp:Label ID="lblErrorUpload" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    <asp:Label ID="lbl_mensaje" runat="server" Style="display: none;"></asp:Label>
                    <div class="button-container">
                        <asp:Button ID="btn_agregar" runat="server" Text="Agregar" CssClass="btn btn-custom btn-add" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_agregar_Click" />
                        <asp:Button ID="btn_editar" runat="server" Text="Editar" CssClass="btn btn-custom btn-edit" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_editar_Click" />
                        <asp:Button ID="btn_eliminar" runat="server" Text="Eliminar" CssClass="btn btn-custom btn-delete" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_eliminar_Click" />
                        <asp:Button ID="btn_limpiar" runat="server" Text="Limpiar" CssClass="btn btn-custom btn-clear" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_limpiar_Click" />
                    </div>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="inm_id" HeaderText="Código" />

                            <asp:BoundField DataField="inm_nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="inm_direccion" HeaderText="Dirección" />
                            <asp:BoundField DataField="inm_ruc" HeaderText="Ruc" />
                            <asp:BoundField DataField="inm_razon_social" HeaderText="Razón Social" />
                            <asp:BoundField DataField="inm_telefono" HeaderText="Teléfono" />
                            <asp:BoundField DataField="inm_correo" HeaderText="Correo" />
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                    <asp:Image ID="imgImagen" runat="server" ImageUrl='<%# Eval("inm_imagen") %>' Height="75px" Width="75px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Acción">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccion" Text="Seleccione" CommandArgument='<%#Eval ("inm_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccionar_Click" />
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
