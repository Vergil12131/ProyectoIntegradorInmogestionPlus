<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ADM_propiedades.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.ADM_propiedades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gestionar Propiedades</title>
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
        <a href="ADM_propiedades.aspx">
            <img src="/source/images/mantenimiento/Imagenes/Gestion_Propiedad.png" alt="Gestionar Propiedades" class="sidebar-icon" />
            Gestionar Propiedades</a>
        <a href="ADM_TipoInmueble.aspx">Gestionar Tipo inmueble</a>
        <a href="ADM_plano.aspx">Gestionar Planos</a>
        <a href="ADM_video.aspx">Gestionar Video</a>
        <a href="ADM_TipoOperacion.aspx">Gestionar Tipo operacion </a>
        <a href="ADM_ubicacion.aspx">Gestionar ubicacion</a>
        <br />
        <br />
        <br />
    </div>



    <div class="content">
        <h2>Gestionar Propiedades</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="container">
                    <div class="form-group">
                        <label for="titulo">Ingrese el Tíulo</label>
                        <asp:TextBox ID="txt_Título" runat="server" CssClass="form-control" placeholder="Titulo"></asp:TextBox>
                        <asp:Label ID="lblErrorNombres" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="Precio">Ingrese el precio</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">$$$</span>
                            <asp:TextBox ID="txt_precio" runat="server" CssClass="form-control" placeholder="0" TextMode="Number"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblErrorPrecio" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="superficieConstruida">Superficie construida</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">m2</span>
                            <asp:TextBox ID="txt_superficieConstruida" runat="server" CssClass="form-control" placeholder="0" TextMode="Number"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblErrorSuperficieConstruida" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="superficieTotal">Superficie total</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">m2</span>
                            <asp:TextBox ID="txt_superficieTotal" runat="server" CssClass="form-control" placeholder="0" TextMode="Number"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblErrorSuperficieTotal" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="Alicouta">Ingrese el precio alicouta</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">$$$</span>
                            <asp:TextBox ID="txt_alicouta" runat="server" CssClass="form-control" placeholder="0" TextMode="Number"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblErrorAlicouta" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="descripcion">Ingrese una descripción</label>
                        <asp:TextBox ID="txt_descripcion" runat="server" CssClass="form-control txt-descripcion" placeholder="Descripción" TextMode="MultiLine" Rows="5">
                        </asp:TextBox>
                        <asp:Label ID="lblErrorDescripcion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>


                    <div class="form-group">
                        <label for="Tipo operacion">Escoja el tipo de operacion</label>
                        <asp:DropDownList ID="ddlToperacion" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:Label ID="lblErrorOperacion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="Tipo Inmueble">Escoja el tipo de inmueble</label>
                        <asp:DropDownList ID="ddlTinmueble" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:Label ID="lblErrorTinmueble" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="Antiguedad">Escoja la antiguedad del inmueble</label>
                        <asp:DropDownList ID="ddlAntiguedad" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:Label ID="lblErrorAntiguedad" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="Caracteristica">Escoja una caracteristica</label>
                        <asp:DropDownList ID="ddlCaracteristicas" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorCaracteristica" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="Vendedor">Escoja el vendedor</label>
                        <asp:DropDownList ID="ddlVendedor" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorVendedor" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="Comprador">Escoja el comprador</label>
                        <asp:DropDownList ID="ddlComprador" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorComprador" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="Ubicación">Escoja la ubicación</label>
                        <asp:DropDownList ID="ddlUbicacion" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorUbicacion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
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
                            <asp:BoundField DataField="Propiedad.pro_id" HeaderText="Codigo" />
                            <asp:BoundField DataField="Propiedad.pro_titulo" HeaderText="Titulo" />
                            <asp:BoundField DataField="Propiedad.pro_precio" HeaderText="Precio" />
                            <asp:BoundField DataField="Propiedad.pro_area_total" HeaderText="Area total" />
                            <asp:BoundField DataField="Propiedad.pro_are_construida" HeaderText="Area construida" />
                            <asp:BoundField DataField="Propiedad.pro_alicuota" HeaderText="Precio alicuota" />
                            <asp:BoundField DataField="Propiedad.pro_descripcion" HeaderText="Descripcion" />
                            <%--<asp:BoundField DataField="Propiedad.pro_fecha_registro" HeaderText="Fecha registro" />--%>
                            <asp:BoundField DataField="Tipo_Operacion.tope_nombre" HeaderText="Tipo operacion" />
                            <asp:BoundField DataField="Tipo_Inmueble.tinm_nombre" HeaderText="Tipo inmueble" />
                            <asp:BoundField DataField="Antiguedad.ant_nombre" HeaderText="Antiguedad" />

                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnSeleccion" Text="Seleccione" CommandArgument='<%#Eval ("Propiedad.pro_id") %>' CssClass="btn btn-primary" runat="server" OnClick="btnSeleccion_Click" />
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
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var superficieConstruidaInput = document.getElementById('<%= txt_superficieConstruida.ClientID %>');
            var superficieTotalInput = document.getElementById('<%= txt_superficieTotal.ClientID %>');
            var PrecioPropiedad = document.getElementById('<%= txt_precio.ClientID %>');
            var PrecioAlicuota = document.getElementById('<%= txt_alicouta.ClientID %>');

            function validatePositiveNumber(input) {
                input.addEventListener('input', function (event) {
                    var value = event.target.value;

                    // Eliminar caracteres no numéricos, excepto el punto decimal
                    value = value.replace(/[^0-9.]/g, '');

                    // Asegurar que solo haya un punto decimal
                    var parts = value.split('.');
                    if (parts.length > 2) {
                        value = parts[0] + '.' + parts.slice(1).join('');
                    }

                    // Limitar a 2 decimales
                    if (parts.length === 2 && parts[1].length > 2) {
                        value = parts[0] + '.' + parts[1].substring(0, 2);
                    }

                    // Evitar valores negativos
                    if (value.indexOf('-') !== -1) {
                        value = value.replace('-', '');
                    }

                    event.target.value = value;
                });
            }

            function formatNumber(input) {
                var value = input.value;
                value = value.replace(/\D/g, ""); // Eliminar todo excepto dígitos
                value = value.replace(/\B(?=(\d{3})+(?!\d))/g, "."); // Agregar punto cada 3 dígitos
                input.value = value;
            }

            document.getElementById('<%= txt_precio.ClientID %>').addEventListener('input', function () {
                formatNumber(this);
            });
            document.getElementById('<%= txt_alicouta.ClientID %>').addEventListener('input', function () {
                formatNumber(this);
            });

            validatePositiveNumber(superficieConstruidaInput);
            validatePositiveNumber(superficieTotalInput);
        });
    </script>
</asp:Content>
