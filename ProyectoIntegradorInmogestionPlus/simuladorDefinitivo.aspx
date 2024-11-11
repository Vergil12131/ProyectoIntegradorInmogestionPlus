<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="simuladorDefinitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.simuladorDefinitivo1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Simulador de Crédito</title>
    <!-- CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Barra de navegación */
        .navbar {
            background-color: #FFFFFF; /* Fondo blanco */
            padding: 0.5rem 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombreado sutil en la parte inferior */
            position: sticky;
            top: 0;
            z-index: 1000;
        }

            .navbar img {
                height: 30px; /* Tamaño reducido de las imágenes */
                margin-right: 10px; /* Espacio entre las imágenes */
            }

            .navbar .btn {
                margin-left: 1rem;
            }

        /* Botón Cómo obtener tu crédito */
        .btn-info {
            background-color: #CCCCCC; /* Gris claro */
            color: #152544; /* Azul oscuro */
            border: none;
        }

            .btn-info:hover {
                background-color: #B3B3B3; /* Gris más oscuro */
                color: #152544; /* Azul oscuro */
            }

        /* Botón Comenzar ahora */
        .btn-primary {
            background-color: #F9E300; /* Amarillo más claro */
            color: #152544; /* Azul oscuro */
            border: none;
        }

            .btn-primary:hover {
                background-color: #F8C700; /* Amarillo oscuro cuando pasa el ratón */
                color: #152544; /* Azul oscuro para el texto */
            }

        /* Titulos y textos */
        h2 {
            color: #152544; /* Azul oscuro */
            font-weight: normal; /* Reducir el peso de la fuente */
        }

        h3 {
            color: #152544; /* Azul oscuro */
            font-weight: normal; /* Reducir el peso de la fuente */
        }

        .form-label {
            color: #152544; /* Azul oscuro */
            font-weight: normal; /* Reducir el peso de la fuente */
        }

        /* Estilos para los RadioButtons */
        input[type="radio"] {
            accent-color: #152544; /* Azul oscuro para el borde del circulito */
        }

            input[type="radio"]:checked {
                accent-color: #F9E300; /* Amarillo más claro para el círculo interior cuando está seleccionado */
            }

        /* GridView */
        .table thead th {
            background-color: #152544; /* Azul oscuro para el encabezado de la tabla */
            color: #F9E300; /* Amarillo más claro para el texto del encabezado */
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2; /* Color de fondo alternativo para las filas */
        }

        .table tbody tr:nth-child(even) {
            background-color: #FFFFFF; /* Color de fondo alternativo para las filas */
        }

        .table tbody td {
            color: #152544; /* Azul oscuro para el texto de las celdas */
        }

        .mensaje-atras {
            color: #152544; /* Azul oscuro */
            font-size: 1.25rem; /* Tamaño de fuente */
            font-weight: normal;
            margin-top: 1rem;
            margin-left: 1rem;
        }

        /* Botón Volver a Calcular */
        .btn-info {
            background-color: #CCCCCC; /* Gris claro */
            color: #152544; /* Azul oscuro */
            border: none;
        }

            .btn-info:hover {
                background-color: #B3B3B3; /* Gris más oscuro */
                color: #152544; /* Azul oscuro */
            }

        /* Botón Comenzar Ahora */
        .btn-primary {
            background-color: #F9E300; /* Amarillo más claro */
            color: #152544; /* Azul oscuro */
            border: none;
        }

            .btn-primary:hover {
                background-color: #F8C700; /* Amarillo oscuro cuando pasa el ratón */
                color: #152544; /* Azul oscuro para el texto */
            }
    </style>
</head>
<body>
    <!-- Barra de navegación -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a href="pagina_principal.aspx">
                <img src="/source/images/simulador/logoInmogestion.jpg" alt="Logo de la Empresa" />
            </a>
            <a class="navbar-brand" href="https://creditohipotecario.pichincha.com/" target="_blank">
                <img src="/source/images/simulador/logoBanco.jpg" alt="Logo del Banco" />
            </a>
            <div class="d-flex ms-auto">
                <a class="btn btn-info" href="https://creditohipotecario.pichincha.com/guia_hipotecaria" target="_blank">Cómo obtener tu crédito</a>
                <a class="btn btn-primary ms-2" href="https://creditohipotecario.pichincha.com/login" target="_blank">Comenzar ahora</a>
            </div>
        </div>
    </nav>


    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <img src="/source/images/simulador/image.jpg" class="img-fluid" alt="Conectar con aplicaciones" />
                    <div class="mensaje-atras">
                        ¡Con Banco Pichincha, realiza tu sueño de casa propia!
                   
                    </div>
                    <!-- Aquí va el texto -->
                </div>
                <div class="col-md-6">
                    <!-- Inicio del Formulario -->
                    <h2>Simulador de Crédito</h2>
                    <div class="mb-3">
                        <label for="tipoVivienda" class="form-label">Tipo de Vivienda</label><br />
                        <asp:RadioButton ID="rbtnNuevaUsada" runat="server" GroupName="tipoVivienda" Text="Vivienda Nueva o Usada" Checked="True" />
                        <asp:RadioButton ID="rbtnInteresPublico" runat="server" GroupName="tipoVivienda" Text="Vivienda de Interés Público y Social" />
                        <span class="material-symbols-outlined" data-bs-toggle="modal" data-bs-target="#ayudaTipoVivienda">help</span>

                    </div>
                    <div class="mb-3">
                        <label for="precioVivienda" class="form-label">¿Cuánto cuesta la vivienda que deseas comprar?</label>
                        <asp:TextBox ID="txtPrecioVivienda" runat="server" CssClass="form-control" placeholder="Ingrese el precio en USD"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="montoPrestamo" class="form-label">¿Cuánto dinero necesitas que te prestemos?</label>
                        <asp:TextBox ID="txtMontoPrestamo" runat="server" CssClass="form-control" placeholder="Ingrese el monto en USD"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="tiempoPago" class="form-label">¿En cuánto tiempo deseas pagar el préstamo?</label>
                        <asp:TextBox ID="txtPlazoAnios" runat="server" CssClass="form-control" placeholder="Ingrese el tiempo en años"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="tipoAmortizacion" class="form-label">Tipo de Amortización</label><br />
                        <asp:RadioButton ID="rbtnFrancesa" runat="server" GroupName="tipoAmortizacion" Text="Francesa" Checked="True" />
                        <asp:RadioButton ID="rbtnAlemana" runat="server" GroupName="tipoAmortizacion" Text="Alemana" />
                        <span class="material-symbols-outlined" data-bs-toggle="modal" data-bs-target="#ayudaTipoAmortizacion">help</span>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnSimular" runat="server" CssClass="btn btn-primary" Text="Simular Crédito" OnClick="btnSimular_Click" />
                    </div>
                    <!-- Fin del Formulario -->
                </div>
            </div>
        </div>
        <div class="container mt-12 text-center h3" style="margin-top: 53px; margin-bottom: 53px;">
            <asp:Label ID="lblResultadosTitulo" runat="server" Visible="false">Los resultados de tu cálculo</asp:Label>
        </div>
        <div class="container mt-4" style="margin-bottom: 53px;">
            <!-- GridView para mostrar resultados -->


            <asp:GridView ID="gvResultados" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" Visible="False">
                <Columns>
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="container mt-4 text-center" style="margin-bottom: 53px;">
            <asp:Button ID="btnVolverCalcular" runat="server" CssClass="btn btn-info me-2" Text="Volver a Calcular" OnClick="btnVolverCalcular_Click" Visible="false" />
            <asp:Button ID="btnComenzarAhora" runat="server" CssClass="btn btn-primary" Text="Comenzar Ahora" OnClick="btnComenzarAhora_Click" Visible="false" />
        </div>
        <div class="modal fade" id="ayudaTipoVivienda" tabindex="-1" aria-labelledby="ayudaTipoViviendaLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ayudaTipoViviendaLabel">Ayuda - Tipo de Vivienda</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6>Vivienda nueva o usada:</h6>
                        <ul>
                            <li>El valor mínimo de la vivienda debe ser $15.000.</li>
                            <li>Te financiamos hasta el 80% del valor de la vivienda que deseas adquirir, incluyendo gastos legales, avalúos y tributo SOLCA.</li>
                            <li>El monto mínimo del préstamo debe ser de $3.000.</li>
                            <li>Tasa de interés anual referencial de 10.86%.</li>
                            <li>Plazo de pago de 3 a 20 años.</li>
                        </ul>
                        <h6>Vivienda de interés público o social:</h6>
                        <ul>
                            <li>Aplica para viviendas nuevas, no para viviendas usadas.</li>
                            <li>El ingreso mensual del solicitante no debe superar los $2.916,40. En caso solicite con su cónyuge, los ingresos mensuales combinados no deberán superar dicho monto.</li>
                            <li>La vivienda debe calificar como Vivienda de Interés Público (VIP) o de interés social (VIS).</li>
                            <li>El valor de la vivienda a financiar debe estar entre $26.482,20 y los $105.340,00.</li>
                            <li>El área mínima de la vivienda debe ser 57m².</li>
                            <li>El valor del m² debe ser menor a $1.145,40.</li>
                            <li>Te financiamos hasta el 100% del valor de la vivienda que deseas adquirir, incluyendo gastos legales, avalúos y tributo SOLCA.</li>
                            <li>Tasa especial de interés anual referencial de 4.87%.</li>
                            <li>Plazo de pago de 20 a 25 años.</li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="ayudaTipoAmortizacion" tabindex="-1" aria-labelledby="ayudaTipoAmortizacionLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ayudaTipoAmortizacionLabel">Ayuda - Tipo de Amortización</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6>Tipo de Amortización Francés:</h6>
                        <p>El valor de las cuotas que pagarás se mantendrá fijo en el tiempo.</p>
                        <h6>Tipo de Amortización Alemán:</h6>
                        <p>El valor de las cuotas que pagarás será variable e irá decreciendo en el tiempo.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script src="/source/javascript/TextToSpeech.js"></script>
    <!-- JavaScript Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>


</body>
</html>
