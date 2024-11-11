<%@ Page Title="" Language="C#" MasterPageFile="~/Publicacion3.Master" AutoEventWireup="true" CodeBehind="publicacion3_definitivoEdicion.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.publicacion3_definitivoEdicion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .number-control {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
            width: 100%;
            height: 30px; /* Adjust height as needed */
        }

            .number-control button {
                background-color: #f0f0f0;
                color: #333;
                border: none;
                padding: 0 10px;
                font-size: 18px;
                cursor: pointer;
                height: 100%;
            }

            .number-control input {
                border: none;
                background-color: #fff;
                color: #333;
                text-align: center;
                font-size: 16px;
                flex-grow: 1; /* Make input flexible */
                height: 100%; /* Match button height */
                margin: 0; /* Remove margin */
            }

        .no-gutters {
            margin-right: 0;
            margin-left: 0;
        }

            .no-gutters > [class*='col-'] {
                padding-right: 0;
                padding-left: 0;
            }

        .text-box-custom {
            width: 95%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            box-sizing: border-box;
        }

        .text-box-custom2 {
            height: 40%;
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            box-sizing: content-box;
            text-align: left; /* Ensure text is left-aligned */
            vertical-align: top; /* Align text to the top */
            resize: none; /* Prevent resizing */
        }

        .horizontal-radiobuttonlist label {
            margin-right: 10px; /* Ajusta este valor según lo necesites */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="card-container">
                <asp:HiddenField ID="hfHabitaciones" runat="server" />
                <asp:HiddenField ID="hfBanos" runat="server" />
                <asp:HiddenField ID="hfEstacionamiento" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="container mt-3">
                    <div class="row" style="margin-bottom: 20px;">
                        <div class="col-md-12">
                            <caption>
                                <h5 class="text-bold">Caracteristicas Principales</h5>
                            </caption>
                        </div>
                    </div>
                    <div class="row row-cols-4" style="font-size: 14px; margin-bottom: 20px;">
                        <div class="col">
                            <div class="text-left">
                                Habitaciones (opcional)
                            <div class="number-control" style="margin-top: 5px;">
                                <button type="button" class="btn btn-secondary" onclick="decrement('<%= txtHabitaciones.ClientID %>', '<%= hfHabitaciones.ClientID %>')">-</button>
                                <asp:TextBox ID="txtHabitaciones" runat="server" CssClass="aspTextBox" Style="width: 100px;" Text="0" ReadOnly="true"></asp:TextBox>
                                <button type="button" class="btn btn-secondary" onclick="increment('<%= txtHabitaciones.ClientID %>', '<%= hfHabitaciones.ClientID %>')">+</button>
                            </div>
                                <asp:Label ID="lblErrorHabitaciones" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="text-left">
                                Baños (opcional)
                            <div class="number-control" style="margin-top: 5px;">
                                <button type="button" class="btn btn-secondary" onclick="decrement('<%= txtBanos.ClientID %>', '<%= hfBanos.ClientID %>')">-</button>
                                <asp:TextBox ID="txtBanos" runat="server" CssClass="aspTextBox" Style="width: 100px;" Text="0" ReadOnly="true"></asp:TextBox>
                                <button type="button" class="btn btn-secondary" onclick="increment('<%= txtBanos.ClientID %>', '<%= hfBanos.ClientID %>')">+</button>
                            </div>
                                <asp:Label ID="lblErrorBanos" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="text-left">
                                Estacionamiento (opcional)
                            <div class="number-control" style="margin-top: 5px;">
                                <button type="button" class="btn btn-secondary" onclick="decrement('<%= txtEstacionamiento.ClientID %>', '<%= hfEstacionamiento.ClientID %>')">-</button>
                                <asp:TextBox ID="txtEstacionamiento" runat="server" CssClass="aspTextBox" Style="width: 100px;" Text="0" ReadOnly="true"></asp:TextBox>
                                <button type="button" class="btn btn-secondary" onclick="increment('<%= txtEstacionamiento.ClientID %>', '<%= hfEstacionamiento.ClientID %>')">+</button>
                            </div>
                                <asp:Label ID="lblErrorEstacionamiento" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-2">
                        <div class="col">
                            <div class="text-left">
                                <div class="row row-cols-2">
                                    <div class="col" style="width: 100%;">
                                        <p style="margin-bottom: 10px;">Superficie</p>
                                        <p style="font-size: 12px;">Superficie construida</p>
                                        <div class="input-group" style="width: 60%;">
                                            <div class="input-group-text" id="btnGroupAddon">m2</div>
                                            <asp:TextBox ID="txt_superficie_construida" runat="server" CssClass="form-control" Placeholder="0" class="text-right" aria-label="Ingresa la superficie" aria-describedby="btnGroupAddon"></asp:TextBox>
                                        </div>
                                        <asp:Label ID="lblErrorSuperficieConstruida" CssClass="text-danger" runat="server" Text="" Style="display: none;" TextMode="Number"></asp:Label>
                                    </div>
                                    <div class="col">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="text-center">
                                <p style="margin-bottom: 30px; margin-right: 135px;">Antiguedad</p>
                                <div class="row row-cols-3">
                                    <div class="col-lg-9" style="font-size: 12px;">
                                        <asp:RadioButtonList ID="rblAntiguedad" runat="server" RepeatDirection="Horizontal" CssClass="horizontal-radiobuttonlist"></asp:RadioButtonList>
                                        <asp:Label ID="lblErrorAntiguedad" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-2" style="margin-bottom: 15px;">
                        <div class="col">
                        </div>
                        <div class="col-lg-4">
                            <div class="text-center">
                                Precio
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-4" style="font-size: 14px; margin-bottom: 20px;">
                        <div class="col-lg-3" style="margin-right: 150px;">
                            <div class="text-left">
                                <p style="margin-bottom: 10px;">Superficie total</p>
                                <div class="input-group" style="width: 100%;">
                                    <div class="input-group-text" id="btnGroupAddon2">m2</div>
                                    <asp:TextBox ID="txt_superficie_total" runat="server" CssClass="form-control" Placeholder="0" aria-label="Ingresa la superficie" aria-describedby="btnGroupAddon" TextMode="Number"></asp:TextBox>
                                    <asp:Label ID="lblErrorSuperficieTotal" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4" style="width: 30%;">
                            <div class="text-right" style="width: 60%;">
                                <p style="margin-bottom: 10px;">Precio de inmueble</p>


                                <div class="input-group">
                                    <div class="input-group-text" id="btnGroupAddon3">USD</div>
                                    <asp:TextBox ID="txt_precio" runat="server" CssClass="form-control" Placeholder="0" aria-label="Ingresa la superficie" aria-describedby="btnGroupAddon" TextMode="Number"></asp:TextBox>
                                    <asp:Label ID="lblErrorPrecio" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4" style="width: 25%;">
                            <div class="text-left">
                                <p style="margin-bottom: 10px;">Precio alícuota</p>

                                <div class="input-group" style="width: 60%;">
                                    <div class="input-group-text" id="btnGroupAddon4">USD</div>
                                    <asp:TextBox ID="txt_alicuota" runat="server" CssClass="form-control" Placeholder="0" aria-label="Ingresa la superficie" aria-describedby="btnGroupAddon" TextMode="Number"></asp:TextBox>
                                    <asp:Label ID="lblErrorAlicuota" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <p style="margin-bottom: 10px;">Describe el inmueble</p>
                        <p style="font-size: 12px; color: #808080;">Asegurate de incluir todo lo esencial del inmueble, su tipo y tipo de operacion de tu aviso.</p>
                    </div>
                    <div class="row" style="width: 48%; margin-bottom: 20px;">
                        <p style="margin-bottom: 10px;">Titulo</p>
                        <div>
                            <asp:TextBox ID="txt_titulo" runat="server" placeholder="Titulo de tu aviso." CssClass="text-box-custom"></asp:TextBox>
                            <asp:Label ID="lblErrorTitulo" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row" style="width: 90%; margin-left: 10px;">
                    <p style="margin-bottom: 10px;">Descripción</p>
                    <div>
                        <asp:TextBox ID="txt_descripcion" runat="server" placeholder="Parrafo minimo de 150 caracteres." CssClass="text-box-custom2"></asp:TextBox>
                        <asp:Label ID="lblErrorDescripcion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </div>
                </div>
            </div>
            </div>
            <div class="d-flex justify-content-end mt-3">
                <div style="margin-right:13px;">
                    <asp:Button ID="btnregresar" Text="Regresar" type="button" class="btn btn-success" runat="server" OnClick="btnregresar_Click" CausesValidation="false" UseSubmitBehavior="false"/>
                </div>
                <asp:Button ID="btnNext" Text="Continuar" type="button" class="btn btn-success" runat="server" OnClick="btnNext_Click" CausesValidation="false" UseSubmitBehavior="false"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        function increment(id, hf) {
            let input = document.getElementById(id);
            let hiddenField = document.getElementById(hf);
            let value = parseInt(input.value);
            input.value = value + 1;
            hiddenField.value = input.value;
        }

        function decrement(id, hf) {
            let input = document.getElementById(id);
            let hiddenField = document.getElementById(hf);
            let value = parseInt(input.value);
            if (value > 0) {
                input.value = value - 1;
                hiddenField.value = input.value;
            }
        }
    </script>
</asp:Content>