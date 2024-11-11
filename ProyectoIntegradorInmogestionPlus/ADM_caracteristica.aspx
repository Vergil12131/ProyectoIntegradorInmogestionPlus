<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_caracteristica.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_caracteristicas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="sidebar">
        <a href="ADM_antiguedad.aspx">Gestionar Antiguedad </a>
        <a href="ADM_caracteristica.aspx">
            <img src="source/images/mantenimiento/Imagenes/caracteristicas.png" alt="Gestionar Usuarios" class="sidebar-icon" />
            Gestionar Características </a>
        <a href="ADM_cita.aspx">Gestionar Citas</a>
        <a href="ADM_imagen.aspx">Gestionar Imagenes</a>
        <a href="ADM_inmueble.aspx">Gestionar Inmueble </a>
        <a href="ADM_perfil.aspx">Gestionar Perfil </a>


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
        <h2>Gestionar Características</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="container">
                    <div class="form-group">
                        <label for="customRange3" class="form-label">Ingrese la cantidad de habitaciones</label>
                        &nbsp;<asp:TextBox ID="txtHabitaciones" runat="server" type="range" class="form-range" min="0" max="15" step="1" oninput="updateLabel(this.value)" Style="background-color: #137f34; color: white;" Text="0" ></asp:TextBox>
                        <asp:Label ID="lblHabitaciones" runat="server" Text="0"></asp:Label>
                        <asp:Label ID="lblErrorHabitacion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="customRange3" class="form-label">Ingrese la cantidad de baños</label>
                        &nbsp;<asp:TextBox ID="txtBanios" runat="server" type="range" class="form-range" min="0" max="5" step="1" oninput="updateLabelBanio(this.value)" Style="background-color: #137f34; color: white;" Text="0" ></asp:TextBox>
                        <asp:Label ID="lblBanio" runat="server" Text="0"></asp:Label>
                        <asp:Label ID="lblErrorBanio" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="customRange3" class="form-label">Ingrese la cantidad de estacionamientos</label>
                        &nbsp;<asp:TextBox ID="txtEstacionamientos" runat="server" type="range" class="form-range" min="0" max="5" step="1" oninput="updateLabelEstacionamiento(this.value)" Style="background-color: #137f34; color: white;" Text="0" ></asp:TextBox>
                        <asp:Label ID="lblEstacionamiento" runat="server" Text="0"></asp:Label>
                        <asp:Label ID="lblErrorEstacionamiento" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
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
                            <asp:BoundField DataField="car_id" HeaderText="Codigo" />

                            <asp:BoundField DataField="car_habitaciones" HeaderText="Número de Habitaciones" />
                            <asp:BoundField DataField="car_banos" HeaderText="Número de Baños" />
                            <asp:BoundField DataField="car_estacionamineto" HeaderText="Número de Estacionamientos" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccion" Text="Seleccione" CommandArgument='<%#Eval ("car_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccion_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>

                <script type="text/javascript">
                    function updateLabel(value) {
                        document.getElementById('<%= lblHabitaciones.ClientID %>').innerText = value;
                    }

                    function updateLabelBanio(value) {
                        document.getElementById('<%= lblBanio.ClientID %>').innerText = value;
                    }

                    function updateLabelEstacionamiento(value) {
                        document.getElementById('<%= lblEstacionamiento.ClientID %>').innerText = value;
                    }


                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

