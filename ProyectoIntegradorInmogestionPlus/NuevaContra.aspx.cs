using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class NuevaContra1 : System.Web.UI.Page
    {

        private CnTblUsuario negocioUsuario = new CnTblUsuario();
        private ValidacionesGenerales vGen = new ValidacionesGenerales();
        private ValidacionesUsuario vUsu = new ValidacionesUsuario();
        
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

        protected void btnRegistrarContraseña_Click(object sender, EventArgs e)
        {
            string password1 = txtNuevaContraseña.Text;
            string password2 = txtConfirmarContraseña.Text;

            if (!ValidarCampos())
                return;

            string nuevaContraseña = txtConfirmarContraseña.Text;

            //if (string.IsNullOrEmpty(HiddenField1.Value))
            //{
            //    lbl_mensaje.Text = "Primero envíe y verifique el código de recuperación.";
            //    return;
            //}

            if (negocioUsuario.CambiarContraseña(nuevaContraseña, Session["correoRecuperacion"].ToString()))
            {
                var usuario = negocioUsuario.BuscarUsuarioXCorreo(Session["correoRecuperacion"].ToString()).First();
                negocioUsuario.RestaurarIntentos(usuario.usu_id);
                Session.Remove("correoRecuperacion");
                Session.Remove("codigoRecuperacion");
                Response.Redirect("pagina_principal.aspx");
                lblMensajeExito.Text = "¡Contraseña cambiada exitosamente!";
            }
            else
            {
                lblMensajeExito.Text = "Error al cambiar la contraseña.";
            }
        }

        // VALIDACION

        public bool ValidarCampos()
        {
            bool ret = true;

            if (!vUsu.ValidarPassword(txtNuevaContraseña.Text))
            {
                lbl_error_contraseña.Text = "Debe ingresar una contraseña con al menos 8 caracteres compuesta de una mezcla de máyúsculas, minúsculas, números y caracteres especiales";
                lbl_error_contraseña.Style["display"] = "block";
                ret = false;
            }
            else
                lbl_error_contraseña.Style["display"] = "none";

            if (txtNuevaContraseña.Text != txtConfirmarContraseña.Text)
            {
                lbl_error_segunda_contra.Text = "Las contraseñas no coinciden";
                lbl_error_segunda_contra.Style["display"] = "block";
                ret = false;
            }
            else
                lbl_error_segunda_contra.Style["display"] = "none";

            return ret;
        }

    }
}
