<%@ Page Title="" Language="C#" MasterPageFile="~/Nueva_Contraseña.Master" AutoEventWireup="true" CodeBehind="Nueva_Contraseña_Definitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Nueva_Contraseña_Definitivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 43px;
        }

        .text-left {
            text-align: left;
            font-size: small;
        }

        .text-with-margin {
            text-align: left;
            font-size: small;
            margin-bottom: 10px; /* Añadir espacio debajo del texto */
            height: 35px;
        }

        .custom-textbox {
            border-radius: 15px;
            width: 95%;
            padding: 8px;
            margin-bottom: 0px; /* Aumentar espacio debajo del TextBox */
            border: 2px solid #ccc;
            box-sizing: border-box;
            height: 30px;
        }

        .custom-button-registrar {
            background-color: #24A841;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 20px;
            margin-bottom: 15px; /* Aumentar espacio debajo del botón */
        }

            .custom-button-registrar:hover {
                opacity: 0.8;
            }

        .labels {
            font-size: small;
        }

        .success-message {
            color: #24A841;
            font-size: small;
            margin-top: 10px;
            display: none; /* Inicialmente oculto */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_contenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <table style="width: 95%">
                <caption>
                    <tr>
                        <td class="text-with-margin">Ingrese su nueva contraseña</td>
                    </tr>
                    <tr>
                        <td class="text-left">
                            <asp:TextBox ID="txtNuevaContraseña" runat="server" TextMode="Password" CssClass="custom-textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-start">
                            <asp:Label ID="lbl_error_contraseña" Visible="false" CssClass="labels" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-with-margin">Confirmar contraseña</td>
                    </tr>
                    <tr>
                        <td class="text-left">
                            <asp:TextBox ID="txtConfirmarContraseña" runat="server" TextMode="Password" CssClass="custom-textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-left">
                            <asp:Label ID="lbl_error_segunda_contra" CssClass="labels" Visible="false" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Button ID="btnRegistrarContraseña" runat="server" Text="Registrar Nueva Contraseña" CssClass="custom-button-registrar" OnClick="btnRegistrarContraseña_Click" UseSubmitBehavior="false" CausesValidation="false"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMensajeExito" runat="server" CssClass="success-message"></asp:Label>
                        </td>
                    </tr>
                </caption>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
