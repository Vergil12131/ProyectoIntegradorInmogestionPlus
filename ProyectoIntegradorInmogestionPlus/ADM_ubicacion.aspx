<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_ubicacion.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_ubicacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gestionar ubicacion</title>
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



        <a href="ADM_usuario.aspx">Gestionar Usuarios</a>
        <a href="ADM_propiedades.aspx">Gestionar Propiedades</a>
        <a href="ADM_TipoInmueble.aspx">Gestionar Tipo inmueble</a>
        <a href="ADM_plano.aspx">Gestionar Planos</a>
        <a href="ADM_video.aspx">Gestionar Video</a>
        <a href="ADM_TipoOperacion.aspx">Gestionar Tipo Operacion</a>
        <a href="ADM_ubicacion.aspx">
            <img src="/source/images/mantenimiento/Imagenes/Gestion_ubicacion.png" alt="Gestionar ubicacion" class="sidebar-icon" />
            Gestionar ubicacion
        </a>
        <br />
        <br />
        <br />
    </div>

    <div class="content">
        <h2>Gestionar ubicacion</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="container">
                    <div class="form-group">
                        <label for="provincia">Seleccione una provincia</label>
                        <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                            <asp:ListItem Text="Seleccione una provincia" Value="0" />
                            <asp:ListItem Text="Azuay" Value="Azuay" />
                            <asp:ListItem Text="Bolívar" Value="Bolívar" />
                            <asp:ListItem Text="Cañar" Value="Cañar" />
                            <asp:ListItem Text="Carchi" Value="Carchi" />
                            <asp:ListItem Text="Chimborazo" Value="Chimborazo" />
                            <asp:ListItem Text="Cotopaxi" Value="Cotopaxi" />
                            <asp:ListItem Text="El Oro" Value="El Oro" />
                            <asp:ListItem Text="Esmeraldas" Value="Esmeraldas" />
                            <asp:ListItem Text="Galápagos" Value="Galápagos"/>
                            <asp:ListItem Text="Guayas" Value="Guayas" />
                            <asp:ListItem Text="Imbabura" Value="Imbabura" />
                            <asp:ListItem Text="Loja" Value="Loja" />
                            <asp:ListItem Text="Los Ríos" Value="Los Ríos" />
                            <asp:ListItem Text="Manabí" Value="Manabí" />
                            <asp:ListItem Text="Morona Santiago" Value="Morona Santiago" />
                            <asp:ListItem Text="Napo" Value="Napo" />
                            <asp:ListItem Text="Orellana" Value="Orellana" />
                            <asp:ListItem Text="Pastaza" Value="Pastaza" />
                            <asp:ListItem Text="Pichincha" Value="Pichincha" />
                            <asp:ListItem Text="Santa Elena" Value="Santa Elena" />
                            <asp:ListItem Text="Santo Domingo de los Tsáchilas" Value="Santo Domingo de los Tsáchilas" />
                            <asp:ListItem Text="Sucumbíos" Value="Sucumbíos" />
                            <asp:ListItem Text="Tungurahua" Value="Tungurahua" />
                            <asp:ListItem Text="Zamora-Chinchipe" Value="Zamora-Chinchipe" />
                        </asp:DropDownList>
                            <asp:Label ID="lblErrorProvincia" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>

                    </div>
                    <div class="form-group">
                        <label for="canton">Seleccione un cantón</label>
                        <asp:DropDownList ID="ddlCanton" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccione un cantón" Value="0" />
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorCanton" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="sector">Ingrese el sector</label>
                        <asp:TextBox ID="txtSector" runat="server" CssClass="form-control" placeholder="Sector"></asp:TextBox>
                        <asp:Label ID="lblErrorSector" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="direccion">Ingrese la direccion</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Direccion"></asp:TextBox>
                        <asp:Label ID="lblErrorDireccion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
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
                            <asp:BoundField DataField="ubi_id" HeaderText="Codigo" />
                            <asp:BoundField DataField="ubi_provincia" HeaderText="Provincia" />
                            <asp:BoundField DataField="ubi_canton" HeaderText="Canton" />
                            <asp:BoundField DataField="ubi_sector" HeaderText="Sector" />
                            <asp:BoundField DataField="ubi_direccion" HeaderText="Direccion" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccion" Text="Seleccione" CommandArgument='<%# Eval("ubi_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccion_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

