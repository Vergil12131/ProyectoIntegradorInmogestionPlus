<%@ Page Title="" Language="C#" MasterPageFile="~/Avisos.MASTER" AutoEventWireup="true" CodeBehind="VerCitasCliente.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.VerCitasCliente1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridview-container {
            margin: 20px auto; /* Centra el GridView horizontalmente */
            width: 90%; /* Ocupa la mitad de la pantalla */
            overflow-x: auto; /* Evita que las líneas de la tabla se desborden */
        }

            .gridview-container table {
                width: 100%;
                border-collapse: collapse;
            }

            .gridview-container th, .gridview-container td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            .gridview-container th {
                background-color: #4CAF50;
                color: white;
            }

            .gridview-container td {
                background-color: #f9f9f9;
            }

        .main-content {
            flex: 1; /* Toma el espacio disponible */
        }
    </style>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_mensaje" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_contenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hiddenFieldId" runat="server" />

            <center>
                <h1>Citas</h1>
            </center>
            <asp:Panel ID="pnlCitasVacias" runat="server">
                <center>
                    <asp:Label ID="lblCitasVacias" runat="server" Text="No tiene citas reservadas"></asp:Label>
                </center>
            </asp:Panel>


            <asp:Panel ID="pnlCitasProximas" runat="server">
                <div class="gridview-container">
                    <!-- GridView para mostrar todas las citas -->
                    <asp:GridView ID="gvCitas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvCitasFinalizadas_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="NombrePropiedad" HeaderText="Propiedad" />
                            <asp:BoundField DataField="cit_fecha_cita" HeaderText="Fecha" />
                            <asp:BoundField DataField="cit_hora" HeaderText="Hora" />
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <asp:Button ID="btn_selec" runat="server" class="btn btn-outline-danger" Text="Cancelar Cita" CommandArgument='<%#Eval("cit_id") %>' CommandName="AgregarResena" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>


            <asp:Panel ID="pnlCitasFinalizadas" runat="server">

                <center>
                    <h1>Danos una reseña</h1>
                </center>

                <!-- GridView para mostrar solo citas finalizadas -->
                <div class="gridview-container">
                    <asp:GridView ID="gvCitasFinalizadas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvCitasFinalizadas_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="NombrePropiedad" HeaderText="Propiedad" />
                            <asp:BoundField DataField="cit_fecha_cita" HeaderText="Fecha" />
                            <asp:BoundField DataField="cit_hora" HeaderText="Hora" />
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <asp:Button ID="btn_selec" runat="server" class="btn btn-outline-success" Text="Añadir Reseña" CommandArgument='<%#Eval("cit_id") %>' CommandName="AgregarResena" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </asp:Panel>

            <!-- Panel para agregar reseña -->
            <asp:Panel ID="pnlForm" runat="server" CssClass="form-panel" Visible="false">
                <h5>Agregar Comentario</h5>
                <asp:TextBox ID="txtResena" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" />
                <asp:Button ID="btnGuardarResena" runat="server" Text="Guardar" CssClass="btn btn-primary mt-2" />
                <asp:Button ID="btnCancelarResena" runat="server" Text="Cancelar" CssClass="btn btn-secondary mt-2" />
            </asp:Panel>


            <!-- Panel para cancelar cita -->
            <%--<asp:Panel ID="pnlCancelar" runat="server" CssClass="form-panel" Visible="false">
                <h5>Cancelar Cita</h5>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" placeholder="¿A qué se debe tu cancelación?" />
                <asp:Button ID="Button1" runat="server" Text="Cancelar" CssClass="btn btn-danger mt-2" />
                <asp:Button ID="Button2" runat="server" Text="Cancelar" CssClass="btn btn-secondary mt-2" />
            </asp:Panel>--%>

            <!-- Modal para agregar reseña (usado como ejemplo) -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Agregar Comentario</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="txtModalResena" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" placeholder="Ingrese una descripción, reseña, comentario o sugerencia" />
                            <asp:Label ID="lblErrorDescrip" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <asp:Button ID="btnModalGuardarResena" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnModalGuardarResena_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardarResena" />
            <asp:PostBackTrigger ControlID="btnModalGuardarResena" />
        </Triggers>
    </asp:UpdatePanel>


    <!-- Script para mostrar y ocultar el panel -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function toggleForm() {
            var panel = document.getElementById('<%= pnlForm.ClientID %>');
            panel.style.display = (panel.style.display === 'none' || panel.style.display === '') ? 'block' : 'none';
        }

        <%--function toggleCancelar() {
            var panel = document.getElementById('<%= pnlCancelar.ClientID %>');
            panel.style.display = (panel.style.display === 'none' || panel.style.display === '') ? 'block' : 'none';
        }--%>
    </script>

</asp:Content>
