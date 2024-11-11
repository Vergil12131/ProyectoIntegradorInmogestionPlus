<%@ Page Title="" Language="C#" MasterPageFile="~/Publicacion2.Master" AutoEventWireup="true" CodeBehind="publicacion2_definitivoEdicion.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.publicacion2_definitivoEdicion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .text-bold {
            font-weight: 600;
            font-size: 18px;
        }

        .form-label {
            font-weight: bold;
            color: black;
            margin-bottom: 5px;
        }

        .form-control1 {
            width: 90%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            box-sizing: border-box;
        }

        .form-control2 {
            width: 90%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            box-sizing: border-box;
        }

        .text-box-custom {
            width: 95%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            box-sizing: border-box;
        }
    </style>

    <!-- Leaflet CSS y JS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

    <!-- Leaflet GeoSearch CSS y JS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet-geosearch/dist/geosearch.css" />
    <script src="https://unpkg.com/leaflet-geosearch/dist/geosearch.umd.js"></script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="card-container">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="container mt-3">
                    <div class="row">
                        <div class="col-md-12">
                            <caption>
                                <h4 class="text-bold">¿Dónde está ubicado tu inmueble?</h4>
                            </caption>
                        </div>
                    </div>
                    <div class="row mt-2" style="margin-bottom: 30px;">
                        <div class="col-md-12">
                            <div style="margin-bottom: 7px;">Ingrese calle y número</div>
                            <asp:TextBox ID="txt_ubicacion" runat="server" placeholder="Ingrese una dirección" CssClass="text-box-custom"></asp:TextBox>
                            <asp:Label ID="lblErrorDireccion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                        </div>
                    </div>
                    <div class="row mt-2" style="margin-bottom: 30px;">
                        <div class="col-md-12">
                            <div style="margin-bottom: 7px;">Ingrese dirección en el mapa</div>
                            <%--<div id="map" style="height: 500px;"></div>--%>
                            <div id="map" style="height: 500px;"></div>
                            <asp:Label ID="lblErrorCoordenadas" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                            <script>
                                function initializeMap() {
                                    // Inicializar el mapa en una ubicación por defecto
                                    var map = L.map('map').setView([-0.1555025, -78.49097], 15); // Coordenadas y nivel de zoom

                                    // Cargar la capa de mapas de OpenStreetMap
                                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                                    }).addTo(map);

                                    // Crear la barra de búsqueda
                                    const { OpenStreetMapProvider } = window.GeoSearch;
                                    const provider = new OpenStreetMapProvider({
                                        params: {
                                            countrycodes: 'EC', // Limitar a Ecuador
                                        },
                                    });

                                    // Configurar el control de búsqueda
                                    const searchControl = new window.GeoSearch.GeoSearchControl({
                                        provider: provider,
                                        style: 'bar',
                                        searchLabel: '¿Qué dirección buscas?',
                                        showMarker: true, // No mostrar el marcador de búsqueda por defecto
                                        showPopup: false,
                                        maxMarkers: 1,
                                        retainZoomLevel: true,
                                        params: {
                                            countrycodes: 'EC' // Limitar a Ecuador
                                        }
                                    });

                                    // Añadir el control de búsqueda al mapa
                                    map.addControl(searchControl);

                                    // Variable para almacenar el marcador
                                    var marker = null;

                                    // Obtener las coordenadas desde el hidden field
                                    var coordenadas = document.getElementById("ContentPlaceHolder1_hfCoordenadas").value;

                                    // Verificar si hay coordenadas almacenadas
                                    if (coordenadas) {
                                        var regex = /LatLng\(([^,]+),\s*([^)]+)\)/;
                                        var matches = coordenadas.match(regex);

                                        if (matches) {
                                            var lat = parseFloat(matches[1]);
                                            var lng = parseFloat(matches[2]);

                                            // Centrar el mapa en las coordenadas almacenadas
                                            map.setView([lat, lng], 16);

                                            // Crear un marcador en las coordenadas almacenadas
                                            marker = L.marker([lat, lng], { draggable: true }).addTo(map);

                                            // Actualizar la posición del marcador al moverlo
                                            marker.on('dragend', function (e) {
                                                var mark = e.target;
                                                document.getElementById('ContentPlaceHolder1_hfCoordenadas').value = mark.getLatLng();
                                            });
                                        } else {
                                            console.error("Formato de coordenadas no válido en hfCoordenadas.");
                                        }
                                    }

                                    // Manejar el marcador de búsqueda
                                    map.on('geosearch/showlocation', function () {
                                        // Eliminar el marcador anterior si existe
                                        if (marker) {
                                            map.removeLayer(marker);
                                        }

                                        map.eachLayer(item => {
                                            if (item instanceof L.Marker) {
                                                // Configurar el marcador de búsqueda
                                                item.options.draggable = true;
                                                item.options.autoPan = true;
                                                item.dragging.enable();

                                                // Guardar las coordenadas en el hidden field
                                                document.getElementById('ContentPlaceHolder1_hfCoordenadas').value = item.getLatLng();

                                                // Actualizar la posición del marcador al moverlo
                                                item.on('dragend', function (e) {
                                                    var mark = e.target;
                                                    document.getElementById('ContentPlaceHolder1_hfCoordenadas').value = mark.getLatLng();
                                                });
                                            }
                                        });
                                    });

                                    // Añadir marcador al hacer doble clic
                                    map.on('dblclick', function (e) {
                                        // Eliminar el marcador anterior si existe
                                        if (marker) {
                                            map.removeLayer(marker);
                                        }

                                        // Crear un nuevo marcador y añadirlo al mapa
                                        marker = L.marker(e.latlng, { draggable: true }).addTo(map);

                                        // Guardar las coordenadas en el hidden field
                                        document.getElementById('ContentPlaceHolder1_hfCoordenadas').value = e.latlng;

                                        // Actualizar la posición del marcador al moverlo
                                        marker.on('dragend', function (e) {
                                            var mark = e.target;
                                            document.getElementById('ContentPlaceHolder1_hfCoordenadas').value = mark.getLatLng();
                                        });
                                    });
                                }
                            </script>

                            <asp:HiddenField ID="hfCoordenadas" runat="server" />
                        </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="row mt-3">
                <div class="col-md-4">
                    <label for="ddlProvincia" style="margin-bottom: 5px;">Provincia</label>
                    <%--<asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control2">
                                <asp:ListItem Text="Selecciona una provincia" Value="1" />
                                <asp:ListItem Text="Opción 2" Value="2" />
                                <asp:ListItem Text="Opción 3" Value="3" />
                            </asp:DropDownList>--%>
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
                        <asp:ListItem Text="Galápagos" Value="Galápagos" />
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
                <div class="col-md-4">
                    <label for="ddlCanton" style="margin-bottom: 5px;">Canton</label>
                    <%--<asp:DropDownList ID="ddlCanton" runat="server" CssClass="form-control1">
                                <asp:ListItem Text="Seleccione un cantón" Value="A" />
                                <asp:ListItem Text="Opción B" Value="B" />
                                <asp:ListItem Text="Opción C" Value="C" />
                            </asp:DropDownList>--%>
                    <asp:DropDownList ID="ddlCanton" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCanton_SelectedIndexChanged">
                        <asp:ListItem Text="Seleccione un cantón" Value="0" />
                    </asp:DropDownList>
                    <asp:Label ID="lblErrorCanton" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                </div>
                <div class="col-md-4">
                    <label for="ddlParroquia" style="margin-bottom: 5px;">Parroquia</label>
                    <%--<asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control1">
                                <asp:ListItem Text="Seleccione una ciudad" Value="A" />
                                <asp:ListItem Text="Opción B" Value="B" />
                                <asp:ListItem Text="Opción C" Value="C" />
                            </asp:DropDownList>--%>
                    <asp:DropDownList ID="ddlParroquia" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Seleccione una parroquia" Value="0" />
                    </asp:DropDownList>
                    <asp:Label ID="lblErrorParroquia" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    <asp:Label ID="lblErrorCiudad" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                </div>
            </div>






            <br />
            <br />
            </div>
            </div>
       
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="d-flex justify-content-end mt-3">
        <div style="margin-right: 13px;">
            <asp:Button ID="btnregresar" Text="Regresar" type="button" class="btn btn-success" runat="server" OnClick="btnregresar_Click" />
        </div>
        <asp:Button ID="btnContinuar" Text="Continuar" type="button" class="btn btn-success" runat="server" OnClick="btnContinuar_Click" />
    </div>

</asp:Content>
