<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_perfil.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="sidebar">
        <a href="ADM_antiguedad.aspx">Gestionar Antigüedades </a>
        <a href="ADM_caracteristica.aspx">Gestionar Características </a>
        <a href="ADM_cita.aspx">Gestionar Citas</a>
        <a href="ADM_imagen.aspx">Gestionar Imagenes</a>
        <a href="ADM_inmueble.aspx">Gestionar Inmueble </a>
        <a href="ADM_perfil.aspx">
            <img src="source/images/mantenimiento/Imagenes/perfil.png" alt="Gestionar Usuarios" class="sidebar-icon" />
            Gestionar Perfil
        </a>
        <a href="ADM_usuario.aspx">Gestionar Usuarios</a>
        <a href="ADM_propiedades.aspx">Gestionar Propiedades</a>
        <a href="ADM_TipoInmueble.aspx">Gestionar Tipo inmueble</a>
        <a href="ADM_plano.aspx">Gestionar Planos</a>
        <a href="ADM_video.aspx">Gestionar Video</a>
        <a href="ADM_TipoOperacion.aspx">Gestionar Tipo operacion</a>
        <a href="ADM_ubicacion.aspx">Gestionar ubicacion</a>
        <br />
        <br />
        <br />
    </div>

    <div class="content">
        <h2>Gestionar Perfiles</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="container">
                    <div class="form-group">
                        <label for="nombres">Ingrese el nombre del perfil</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                        <asp:Label ID="lblErrorNombres" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Ingrese una descripción</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeholder="Descripicon"></asp:TextBox>
                        <asp:Label ID="lblErrorADescripcion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
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
                            <asp:BoundField DataField="perf_id" HeaderText="Codigo" />

                            <asp:BoundField DataField="perf_nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="perf_descripcion" HeaderText="Descripción" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccion" Text="Seleccione" CommandArgument='<%#Eval ("perf_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccion_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
