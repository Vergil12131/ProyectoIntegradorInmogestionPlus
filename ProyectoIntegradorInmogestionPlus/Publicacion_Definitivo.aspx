<%@ Page Title="" Language="C#" MasterPageFile="~/Publicacion.Master" AutoEventWireup="true" CodeBehind="Publicacion_Definitivo.aspx.cs" Inherits="ProyectoIntegradorInmogestionPlus.Publicacion_Definitivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn.selected {
            background-color: #24A841 !important;
            color: white !important;
        }

        .text-bold {
            font-weight: 600;
            font-size: 18px;
        }

        .btn-group {
            display: flex;
            gap: 10px;
        }

            .btn-group .btn {
                background-color: white;
                color: grey;
                border: 1px solid grey;
                border-radius: 5px;
            }

        .form-label {
            font-weight: bold;
            color: black;
            margin-bottom: 5px;
        }

        .form-control1 {
            width: 80%;
            padding: 8px;
            border-radius: 5px;
            border: none;
            box-sizing: border-box;
        }

        .form-control2 {
            width: 70%;
            padding: 8px;
            border-radius: 5px;
            border: none;
            box-sizing: border-box;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="card-container">

                <div class="container mt-3">
                    <div class="row">
                        <div class="col-md-12">
                            <caption>
                                <h4 class="text-bold">¿Qué deseas publicar?</h4>
                            </caption>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-12">
                            <div>Tipo de operación</div>
                            <asp:RadioButtonList ID="rblOperacion" runat="server" CssClass="form-control2"></asp:RadioButtonList>
                            <asp:Label ID="lblErrorOperacion" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label for="Tipo Inmueble">Tipo de inmueble</label>
                            <asp:RadioButtonList ID="rblTipoInmueble" runat="server" CssClass="form-control2"></asp:RadioButtonList>
                            <asp:Label ID="lblErrorTipoInmueble" CssClass="text-danger" runat="server" Text="" Style="display: none;"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
            <div class="d-flex justify-content-end mt-3">
                <div style="margin-right: 13px;">
                    <asp:Button ID="btnregresar" Text="Regresar" type="button" class="btn btn-success" runat="server" OnClick="btnregresar_Click" />
                </div>
                <asp:Button ID="btnContinuar" class="btn btn-success" runat="server" Text="Continuar" OnClick="btnContinuar_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
