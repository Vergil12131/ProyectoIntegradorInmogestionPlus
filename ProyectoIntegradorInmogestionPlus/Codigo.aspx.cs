using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class Codigo1 : System.Web.UI.Page
    {
        private CnTblUsuario usu = new CnTblUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "1")
                    Response.Redirect("~/ADM_usuario.aspx");
                else
                    Response.Redirect("~/pagina_principal.aspx");
            }
            if (Session["correoRecuperacion"] == null || Session["codigoRecuperacion"] == null)
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");
        }

        protected void btnVerificarCodigo_Click(object sender, EventArgs e)
        {

            string codigoRecuperacionIngresado = txtv_verificar.Text;
            string codigoRecuperacionEnviado = Session["codigoRecuperacion"].ToString();
            if (codigoRecuperacionEnviado == codigoRecuperacionIngresado)
            {
                lbl_error_verificar_codigo.Text = "Código de recuperación válido. Puede cambiar la contraseña ahora.";
                Response.Redirect("~/NuevaContra.aspx");
            }
            else
            {
                lbl_error_verificar_codigo.Text = "El código de recuperación ingresado no es válido.";
                lbl_error_verificar_codigo.Style["display"] = "block";
            }
        }

        protected void lnkReenviarCodigo_Click(object sender, EventArgs e)
        {
            //string correo = txtRecuperar.Text.Trim();
            //if (usu.EnviarCodigoRecuperacion(correo, out codigoRecuperacion))
            //{

            //    lbl_error_verificar_codigo.Text = $"Código de recuperación enviado a {correo}.";

            //    HiddenField1.Value = codigoRecuperacion;
            //    Response.Redirect("~/Codigo.aspx");
            //}
            //else
            //{
            //    lbl_error_verificar_codigo.Text = $"Error al enviar el código de recuperación a {correo}. Verifique el correo electrónico.";
            //}
        }
    }
}
