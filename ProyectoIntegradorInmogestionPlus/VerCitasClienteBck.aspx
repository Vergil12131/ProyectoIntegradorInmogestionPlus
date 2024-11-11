<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerCitasClienteBck.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.VerCitasCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    </style>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hiddenFieldId" runat="server" />
                <div class="gridview-container">
                    <!-- GridView para mostrar todas las citas -->
                    <asp:GridView ID="gvCitas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                        <Columns>
                            <asp:BoundField DataField="cit_id" HeaderText="ID" />
                            <asp:BoundField DataField="cit_fecha_cita" HeaderText="Fecha" />
                            <asp:BoundField DataField="cit_hora" HeaderText="Hora" />
                            <asp:BoundField DataField="cit_estado" HeaderText="Estado" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                            <asp:BoundField DataField="NombrePropiedad" HeaderText="Propiedad" />
                        </Columns>
                    </asp:GridView>
                </div>

                <h1>Danos una reseña</h1>

                <!-- GridView para mostrar solo citas finalizadas -->
                <div class="gridview-container">
                    <asp:GridView ID="gvCitasFinalizadas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvCitasFinalizadas_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="cit_id" HeaderText="ID" />
                            <asp:BoundField DataField="cit_fecha_cita" HeaderText="Fecha" />
                            <asp:BoundField DataField="cit_hora" HeaderText="Hora" />
                            <asp:BoundField DataField="cit_estado" HeaderText="Estado" />
                            <asp:BoundField DataField="cit_descripcion" HeaderText="Reseña" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                            <asp:BoundField DataField="NombrePropiedad" HeaderText="Propiedad" />
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <asp:Button ID="btn_selec" runat="server" class="btn btn-outline-success" Text="Añadir Reseña" CommandArgument='<%#Eval("cit_id") %>' CommandName="AgregarResena" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <!-- Panel para agregar reseña -->
                <asp:Panel ID="pnlForm" runat="server" CssClass="form-panel" Visible="false">
                    <h5>Agregar Reseña</h5>
                    <asp:TextBox ID="txtResena" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" />
                    <asp:Button ID="btnGuardarResena" runat="server" Text="Guardar" CssClass="btn btn-primary mt-2" />
                    <asp:Button ID="btnCancelarResena" runat="server" Text="Cancelar" CssClass="btn btn-secondary mt-2" />
                </asp:Panel>

                <!-- Modal para agregar reseña (usado como ejemplo) -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Agregar Reseña</h1>
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
    </form>
    <!-- Script para mostrar y ocultar el panel -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function toggleForm() {
            var panel = document.getElementById('<%= pnlForm.ClientID %>');
            panel.style.display = (panel.style.display === 'none' || panel.style.display === '') ? 'block' : 'none';
        }
    </script>
</body>
</html>