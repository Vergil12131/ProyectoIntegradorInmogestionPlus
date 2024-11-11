<%@ Page Title="" Language="C#" MasterPageFile="~/Recuperar_Contra.Master" AutoEventWireup="true" CodeBehind="Rcuperar_Contra_Definitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Rcuperar_Contra_Definitivo" %>

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

        .custom-button-verificar {
            background-color: #24A841;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            cursor: pointer;
            margin-bottom: 15px; /* Aumentar espacio debajo del botón */
        }

            .custom-button-verificar:hover {
                opacity: 0.8;
            }

        .info-text {
            color: gray;
            font-size: small;
            margin-top: 10px; /* Añadir espacio encima del texto */
            margin-bottom: 15px;
        }

        .hidden-label {
            visibility: hidden; /* Ocultar el contenido pero mantener el espacio */
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
                        <td class="text-with-margin">Ingrese su Correo Electrónico</td>
                    </tr>
                    <tr>
                        <td class="text-left">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="custom-textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="text-start">
                        <td>
                            <asp:Label ID="lbl_error_recuperarcontra" runat="server" Text="&nbsp;" CssClass="hidden-label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Button ID="btn_verificar_Correo" OnClick="btn_verificar_Correo_Click" runat="server" Text="Verificar Correo Electrónico" CssClass="custom-button-verificar" UseSubmitBehavior="false" CausesValidation="false" />
                        </td>
                    </tr>
                    <tr>
                        <td class="info-text">Proporcione su correo electrónico para rastrear su cuenta y enviar un codigo de seguridad. Su correo electrónico no será utilizada para otros fines.
                        </td>
                    </tr>
                </caption>
                <tr>
                    <td class="info-text">&nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
