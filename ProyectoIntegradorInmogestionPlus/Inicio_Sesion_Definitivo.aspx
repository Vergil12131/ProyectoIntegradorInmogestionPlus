<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio_Sesion.Master" AutoEventWireup="true" CodeBehind="Inicio_Sesion_Definitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Inicio_Sesion_Definitivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            height: 38px;
            color: #CCCCCC;
        }

        .custom-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

            .custom-container h2 {
                text-align: center;
                font-family: Calibri, sans-serif;
                font-size: 24px;
            }

        .custom-textbox {
            border-radius: 15px;
            width: 95%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            height: 30px;
        }

        .forgot-password {
            color: gray;
            display: block;
            margin: 10px 0;
            font-size: small;
        }

        .Register {
            color: black;
            font-size: small;
        }

        .custom-button {
            width: 50%;
            height: auto;
            background-color: #24A841;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 15px;
            cursor: pointer;
        }

            .custom-button:hover {
                background-color: darkgreen;
            }

        .text-center {
            text-align: center;
        }

        .auto-style2 {
            text-align: left;
            height: 60px;
        }

        .auto-style3 {
            text-align: left;
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_contenido" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <table style="width: 100%">
                <br />
                <tr>
                    <td class="text-start">Ingrese su email</td>
                </tr>
                <tr>
                    <td class="text-start">
                        <asp:TextBox ID="textEmail" runat="server" CssClass="custom-textbox" placeholder="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-start auto-style3">
                        <asp:Label ID="Label1" runat="server" Style="font-size: x-small" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-start">Ingrese su contraseña</td>
                </tr>
                <tr>
                    <td class="text-start">
                        <asp:TextBox ID="textPass" runat="server" CssClass="custom-textbox" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:LinkButton ID="btnRecuperacionPass" runat="server" CssClass="forgot-password" OnClick="btnRecuperacionPass_Click">¿Has olvidado la contraseña? Haz click aqui</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblError" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-start">&nbsp;</td>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" CssClass="custom-button" OnClick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="text-start">&nbsp;</td>
                </tr>
                <tr>
                    <td class="text-center">

                        <asp:LinkButton ID="btnRegistro" runat="server" CssClass="Register text-center" OnClick="btnRegistro_Click">¿No tienes una cuenta? Registrate aquí</asp:LinkButton>

                    </td>
                </tr>
                <tr>
                    <td class="text-start">&nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
