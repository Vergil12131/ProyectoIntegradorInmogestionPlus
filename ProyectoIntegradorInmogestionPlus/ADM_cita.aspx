<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_cita.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_cita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />


    <div class="sidebar">
        <a href="ADM_antiguedad.aspx">Gestionar Antigüedades </a>
        <a href="ADM_caracteristica.aspx">Gestionar Características </a>
        <a href="ADM_cita.aspx">
            <img src="source/images/mantenimiento/Imagenes/cita.png" alt="Gestionar Usuarios" class="sidebar-icon" />
            Gestionar Citas
        </a>
        <a href="ADM_imagen.aspx">Gestionar Imagenes</a>
        <a href="ADM_inmueble.aspx">Gestionar Inmueble </a>
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
        <h2>Gestionar Citas</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="container">
                    <div class="form-group">
                        <label for="descripcion">Ingrese una descripción</label>
                        <asp:TextBox ID="txt_descripcion" runat="server" CssClass="form-control txt-descripcion" placeholder="Descripción" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        <asp:Label ID="lblErrorDescripcion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Ingrese la fecha de la cita</label>
                        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" placeholder="Fecha de la cita" TextMode="Date"></asp:TextBox>
                        <asp:Label ID="lblErrorFecha" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="perfil">Escoja un usuario</label>
                        <asp:DropDownList ID="ddlUsuario" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccione una opción" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorUsuario" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="perfil">Escoja una propiedad</label>
                        <asp:DropDownList ID="ddlPropiedad" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccione una opción" Value=""></asp:ListItem>
                        </asp:DropDownList>
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
                            <asp:BoundField DataField="Cita.cit_id" HeaderText="Codigo" />
                            <asp:BoundField DataField="Cita.cit_descripcion" HeaderText="Descripcion" />
                            <asp:BoundField DataField="Cita.cit_fecha_cita" HeaderText="Fecha Cita" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                            <asp:BoundField DataField="Propiedad.pro_titulo" HeaderText="Propiedad" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccion" Text="Seleccione" CommandArgument='<%#Eval ("Cita.cit_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccion_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <style>
        .txt-descripcion {
            resize: vertical;
            min-height: 50px;
            max-height: 100px;
        }
    </style>

</asp:Content>
