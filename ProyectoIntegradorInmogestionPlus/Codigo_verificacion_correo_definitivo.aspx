<%@ Page Title="" Language="C#" MasterPageFile="~/Codigo_Verificacion.Master" AutoEventWireup="true" CodeBehind="Codigo_verificacion_correo_definitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Codigo_verificacion_correo_definitivo" %>

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
            margin-top: 15px;
            margin-bottom: 5px; /* Añadir espacio debajo del texto */
            height: 35px;
        }

        .custom-textbox {
            border-radius: 15px;
            width: 95%;
            padding: 8px;
            margin-bottom: 10px; /* Aumentar espacio debajo del TextBox */
            border: 2px solid #ccc;
            box-sizing: border-box;
            height: 30px;
        }

        .code-input-container {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .code-input {
            width: 40px;
            height: 40px;
            font-size: 20px;
            text-align: center;
            margin: 0 5px;
            border: 2px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .custom-button-verificar {
            background-color: #24A841;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 15px;
            margin-bottom: 15px;
        }

            .custom-button-verificar:hover {
                opacity: 0.8;
            }

        .info-text {
            font-size: small;
            margin-bottom: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_contenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="text-with-margin">Ingrese el código enviado al correo (4)</div>
            <div class="code-input-container">
                <input type="text" maxlength="1" class="code-input" />
                <input type="text" maxlength="1" class="code-input" />
                <input type="text" maxlength="1" class="code-input" />
                <input type="text" maxlength="1" class="code-input" />
                <input type="text" maxlength="1" class="code-input" />
            </div>
            <asp:Label ID="lbl_error_verificar_codigo" runat="server" Text="" Style="display: none;"></asp:Label>
            <asp:Button ID="btnVerificarCodigo" runat="server" Text="Verificar Código" CssClass="custom-button-verificar" OnClick="btnVerificarCodigo_Click" UseSubmitBehavior="false" CausesValidation="false" />
            <div class="info-text">
                <asp:LinkButton ID="lnkReenviarCodigo" runat="server" Text="Si no ha recibido el código, haga clic aquí para reenviar otro codigo a su correo electrónico" OnClick="lnkReenviarCodigo_Click"></asp:LinkButton>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
