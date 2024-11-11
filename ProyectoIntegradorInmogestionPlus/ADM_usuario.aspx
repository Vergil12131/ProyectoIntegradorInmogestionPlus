<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_usuario.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gestionar Usuarios</title>
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



        <a href="ADM_usuario.aspx">
            <img src="/source/images/mantenimiento/Imagenes/Gestion_Usuario.png" alt="Gestionar Usuarios" class="sidebar-icon" />
            Gestionar Usuarios
        </a>
        <a href="ADM_propiedades.aspx">Gestionar Propiedades</a>
        <a href="ADM_TipoInmueble.aspx">Gestionar Tipo inmueble</a>
        <a href="ADM_plano.aspx">Gestionar Planos</a>
        <a href="ADM_video.aspx">Gestionar Video</a>
        <a href="ADM_TipoOperacion.aspx">Gestionar Tipo Operacion</a>
        <a href="ADM_ubicacion.aspx">Gestionar ubicacion</a>
        <br />
        <br />
        <br />
    </div>

    <div class="content">
        <h2>Gestionar Usuarios</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="container">
                    <div class="form-group">
                        <label for="nombres">Ingrese sus nombres</label>
                        <asp:TextBox ID="txt_nombres" runat="server" CssClass="form-control" placeholder="Nombres"></asp:TextBox>
                        <asp:Label ID="lblErrorNombres" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Ingrese sus apellidos</label>
                        <asp:TextBox ID="txt_apellidos" runat="server" CssClass="form-control" placeholder="Apellidos"></asp:TextBox>
                        <asp:Label ID="lblErrorApellidos" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="ci">Ingrese su cédula de identidad</label>
                        <asp:TextBox ID="txt_cedula" runat="server" CssClass="form-control" placeholder="CI" TextMode="Number"></asp:TextBox>
                        <asp:Label ID="lblErrorCedula" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="email">Ingrese su email</label>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                        <asp:Label ID="lblErrorCorreo" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Ingrese su teléfono</label>
                        <asp:TextBox ID="txt_telefono" runat="server" CssClass="form-control" placeholder="Teléfono" TextMode="Number"></asp:TextBox>
                        <asp:Label ID="lblErrorTelefono" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Ingrese su dirección</label>
                        <asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control" placeholder="Dirección"></asp:TextBox>
                        <asp:Label ID="lblErrorDireccion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="fecha_nacimiento">Ingrese su fecha de nacimiento</label>
                        <asp:TextBox ID="txt_fecha_nacimiento" runat="server" CssClass="form-control" placeholder="Fecha de Nacimiento" TextMode="Date"></asp:TextBox>
                        <asp:Label ID="lblErrorFechaNacimiento" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="perfil">Escoja un perfil</label>
                        <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:Label ID="lblErrorPerfil" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="inmobiliaria">Escoja inmobiliaria</label>
                        <asp:DropDownList ID="ddlInmobiliaria" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:Label ID="Label1" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="password">Ingrese su contraseña</label>
                        <asp:TextBox ID="txt_password" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="lblErrorPass" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
                    <div class="button-container">
                        <asp:Button ID="btn_agregar" runat="server" Text="Agregar" CssClass="btn btn-custom btn-add" OnClick="btn_agregar_Click" UseSubmitBehavior="false" CausesValidation="false" />
                        <asp:Button ID="btn_editar" runat="server" Text="Editar" CssClass="btn btn-custom btn-edit" OnClick="btn_editar_Click" UseSubmitBehavior="false" CausesValidation="false" />
                        <asp:Button ID="btn_eliminar" runat="server" Text="Eliminar" CssClass="btn btn-custom btn-delete" OnClick="btn_eliminar_Click" UseSubmitBehavior="false" CausesValidation="false" />
                        <asp:Button ID="btn_limpiar" runat="server" Text="Limpiar" CssClass="btn btn-custom btn-clear" OnClick="btn_limpiar_Click" UseSubmitBehavior="false" CausesValidation="false" />
                    </div>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Usuario.usu_id" HeaderText="Codigo" />
                            <asp:TemplateField HeaderText="Nombres">
                                <ItemTemplate>
                                    <%# Eval("Usuario.usu_primer_nombre") + " " + Eval("Usuario.usu_segundo_nombre") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Apellidos">
                                <ItemTemplate>
                                    <%# Eval("Usuario.usu_primer_apellido") + " " + Eval("Usuario.usu_segundo_apellido") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Usuario.usu_cedula" HeaderText="Cédula" />
                            <asp:BoundField DataField="Usuario.usu_correo" HeaderText="Correo" />
                            <asp:BoundField DataField="Usuario.usu_telefono" HeaderText="Teléfono" />
                            <asp:BoundField DataField="Usuario.usu_direccion" HeaderText="Dirección" />
                            <asp:BoundField DataField="Usuario.usu_fecha_nacimiento" HeaderText="Fecha Nacimiento" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Perfil.perf_nombre" HeaderText="Perfil" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccionUsuario" Text="Seleccione" CommandArgument='<%#Eval ("Usuario.usu_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccionUsuario_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
