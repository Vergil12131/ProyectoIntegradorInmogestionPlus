<%@ Page Title="" Language="C#" MasterPageFile="~/Registro.Master" AutoEventWireup="true" CodeBehind="Registro_Definitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Registro_Definitivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .text-left {
            text-align: left;
            font-size: small;
        }

        .text-left2 {
            text-align: center;
            font-size: small;
        }

        .custom-textbox {
            border-radius: 15px;
            width: 95%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            height: 25px;
        }

        .custom-DropDownList {
            border-radius: 15px;
            width: 95%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            height: 25px;
        }

        .custom-textbox2 {
            border-radius: 15px;
            width: 90%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            height: 25px;
        }

        .custom-checkbox {
            margin-right: 10px;
        }

        .custom-button-volver {
            background-color: white;
            border: 2px solid green;
            color: green;
            padding: 3px 20px;
            border-radius: 10px;
            cursor: pointer;
            width: 150px;
        }

        .custom-button-registrar {
            background-color: green;
            border: none;
            color: white;
            padding: 5px 20px;
            border-radius: 10px;
            cursor: pointer;
            width: 150px;
        }

        .custom-calendar {
            border-radius: 15px;
            width: 95%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            height: 25px;
        }

        .auto-style1 {
            text-align: center;
            font-size: x-small;
            color: crimson;
        }

        .auto-style2 {
            text-align: left;
            font-size: x-small;
            color: crimson;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_contenido2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <table style="width: 100%">
                <tr>
                    <td class="text-left">Ingrese su nombres</td>
                    <td class="text-left">Ingrese su apellidos</td>
                </tr>
                <tr>
                    <td class="text-left">
                        <asp:TextBox ID="txt_nombres" runat="server" CssClass="custom-textbox" placeholder="Nombre"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:TextBox ID="txt_apellidos" runat="server" CssClass="custom-textbox2" placeholder="Apellido"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lbl_nombres" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lbl_apellidos" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">Ingrese su cédula de identidad</td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">
                        <asp:TextBox ID="txt_cedula" runat="server" CssClass="custom-textbox" placeholder="CI"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-left auto-style2" colspan="2">
                        <asp:Label ID="lbl_cedula" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">Ingrese su email</td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">
                        <asp:TextBox ID="txt_email" runat="server" CssClass="custom-textbox" placeholder="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-left auto-style2" colspan="2">
                        <asp:Label ID="lbl_email" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">Ingrese su dirección</td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">
                        <asp:TextBox ID="txt_direccion" runat="server" CssClass="custom-textbox" placeholder="Dirección"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-left auto-style2" colspan="2">
                        <asp:Label ID="lbl_direccion" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">Ingrese su fecha de nacimiento</td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">
                        <asp:TextBox ID="txt_fecha_nacimiento" runat="server" CssClass="custom-calendar" placeholder="Fecha de Nacimiento" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-left auto-style2" colspan="2">
                        <asp:Label ID="lbl_fecha_nacimiento" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">Ingrese su teléfono</td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">
                        <asp:TextBox ID="txt_telefono" runat="server" CssClass="custom-textbox" placeholder="Teléfono"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-left auto-style2" colspan="2">
                        <asp:Label ID="lbl_telefono" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">Ingrese una contraseña</td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">
                        <asp:TextBox ID="txt_contraseña" runat="server" CssClass="custom-textbox" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-left auto-style2" colspan="2">
                        <asp:Label ID="lbl_contra" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">Confirmar contraseña</td>
                </tr>
                <tr>
                    <td class="text-left" colspan="2">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="custom-textbox" placeholder="Confirmar contraseña" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-left auto-style2" colspan="2">
                        <asp:Label ID="lbl_confirmar_contra" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">
                        <asp:CheckBox ID="CheckBox1" runat="server" CssClass="custom-checkbox"/>Acepto los 
                        <a href="InformacionPoliticas.aspx" target="_blank">Términos y Condiciones de Uso</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left">
                        <asp:CheckBox ID="CheckBox2" runat="server" CssClass="custom-checkbox"/>Acepto la 
                        <a href="InformacionPoliticas.aspx" target="_blank">Política de Privacidad</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left auto-style2">
                        <asp:Label ID="lbl_chekbox" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_volver" runat="server" Text="Volver" CssClass="custom-button-volver" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_volver_Click" />
                        <asp:Button ID="btn_registrar" runat="server" Text="Registrarme" CssClass="custom-button-registrar" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_registrar_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-left2 auto-style1">
                        <asp:Label ID="lbl_succes" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

