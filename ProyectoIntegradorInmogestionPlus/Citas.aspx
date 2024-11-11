<%@ Page Title="" Language="C#" MasterPageFile="~/Avisos.MASTER" AutoEventWireup="true" CodeBehind="Citas.aspx.cs" Inherits="PoryectoIntegradorInmogestionPlus.Citas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .calendar-container {
            width: 65%;
            flex-grow: 1;
            background-color: white; /* Establece un fondo blanco para todo el calendario */
        }

            .calendar-container table {
                width: 100%;
                border-collapse: collapse;
            }

            .calendar-container th, .calendar-container .month-name {
                background-color: #4CAF50; /* Mismo color para los días de la semana y el nombre del mes */
                color: white;
                padding: 10px;
                text-align: center;
                font-size: 16px;
            }

            .calendar-container td, .calendar-container th {
                border: 1px solid #f9f9f9;
                padding: 10px;
                text-align: center;
                vertical-align: top;
            }

            .calendar-container td {
                height: 100px;
                position: relative;
            }

                .calendar-container td .day-number {
                    font-size: 18px;
                    font-weight: bold;
                }

                .calendar-container td .cita {
                    font-size: 12px;
                    color: #333;
                    margin-top: 5px;
                    display: block;
                    text-align: left;
                }

            /* Estilo para el nombre del mes */
            .calendar-container .month-name {
                font-size: 20px;
                font-weight: bold;
            }

        .form-container {
            width: 30%;
            max-width: 400px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-left: auto;
        }

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


        .form-group {
            margin-bottom: 1rem;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_mensaje" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_contenido" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <center>
                <h1>MIS CITAS</h1>
            </center>

            <div class="container">
                <div class="calendar-container">
                    <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" />
                </div>

                <div class="form-container">
                    <asp:HiddenField ID="hfComentarioCliente" runat="server" />
                    <asp:Label ID="Label1" runat="server" Text="Agregar Cita" Font-Bold="True"></asp:Label>
                    <br />
                    <div class="form-group">
                        <asp:Label ID="LabelFecha" runat="server" Text="Fecha:"></asp:Label>
                        <asp:TextBox ID="txtFecha" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                        <asp:Label ID="lblErrorFecha" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelHora" runat="server" Text="Hora:"></asp:Label>
                        <asp:TextBox ID="txtHora" runat="server" TextMode="Time" CssClass="form-control;" />
                        <asp:Label ID="lblErrorHora" runat="server" CssClass="text-danger" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelDescripcion" runat="server" Text="Comentario:"></asp:Label>
                        <asp:TextBox ID="txtDescripcion" runat="server" placeholder="Comentario" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        <asp:Label ID="lblErrorDescripcion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelUsuario" runat="server" Text="Usuario:"></asp:Label>
                        <asp:DropDownList ID="ddlUsuario" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblErrorUsuario" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelPropiedad" runat="server" Text="Propiedad:"></asp:Label>
                        <asp:DropDownList ID="ddlPropiedad" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblErrorPropiedad" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelEstado" runat="server" Text="Estado:"></asp:Label>
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                            <asp:ListItem Text="-- Seleccione --" Value="" />
                            <asp:ListItem Text="En espera" Value="En espera" />
                            <asp:ListItem Text="Finalizada" Value="Finalizada" />
                            <asp:ListItem Text="Cancelada" Value="Cancelada" />
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorEstado" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>

                    <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
                    <div class="button-container">
                        <asp:Button ID="btnAgregarCita" runat="server" Text="Agregar Cita" class="btn btn-outline-success" OnClick="btnAgregarCita_Click" Visible="true" />
                        <asp:Button ID="btnEditarCita" runat="server" Text="Guardar Cambios" class="btn btn-outline-success" OnClick="btnEditarCita_Click" Visible="false" />
                        <br />
                    </div>
                </div>

            </div>
            <div class="gridview-container">
                <asp:GridView ID="gvCitas" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="cit_id" HeaderText="ID" />
                        <asp:BoundField DataField="cit_descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="cit_fecha_cita" HeaderText="Fecha" />
                        <asp:BoundField DataField="cit_hora" HeaderText="Hora" />
                        <asp:BoundField DataField="cit_estado" HeaderText="Estado" />
                        <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="NombrePropiedad" HeaderText="Propiedad" />
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <asp:Button ID="btn_selec" runat="server" CssClass="btn btn-success" Text="Seleccionar" CommandArgument='<%#Eval("cit_id") %>' OnClick="btn_selec_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var timeInput = document.querySelector('.time-picker');

            // Event listener for the input event
            timeInput.addEventListener('input', function () {
                var value = timeInput.value;
                var validTimes = ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00'];
                if (validTimes.indexOf(value) === -1) {
                    // Show error message if the input is invalid
                    document.querySelector('#lblErrorHora').textContent = 'Por favor, ingrese una hora válida entre 09:00 y 16:00.';
                    document.querySelector('#lblErrorHora').style.display = 'block';
                } else {
                    // Hide error message if the input is valid
                    document.querySelector('#lblErrorHora').style.display = 'none';
                }
            });
        });

    </script>


</asp:Content>
