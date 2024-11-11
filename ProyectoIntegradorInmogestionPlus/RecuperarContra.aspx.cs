using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class RecuperarContra1 : System.Web.UI.Page
    {
        private ValidacionesUsuario vUsu = new ValidacionesUsuario();
        private CnTblUsuario usu = new CnTblUsuario();
        bool ret = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "1")
                    Response.Redirect("~/ADM_usuario.aspx");
                else
                    Response.Redirect("~/pagina_principal.aspx");
            }
        }

        protected void btn_verificar_Correo_Click(object sender, EventArgs e)
        {
            string correo = txtRecuperar.Text.Trim();
            string codigoRecuperacion;
            var verCorreo = usu.BuscarUsuarioXCorreo(txtRecuperar.Text);
            if (!vUsu.ValidarCorreo(txtRecuperar.Text))
            {
                lbl_error_recuperarcontra.Text = "Debe ingresar un correo válido";
                lbl_error_recuperarcontra.Style["display"] = "block";
                ret = false;
            }
            else if (verCorreo.Count() > 0)
            {
                //lbl_error_recuperarcontra.Text = "Ya existe un usuario registrado con ese correo";
                //lbl_error_recuperarcontra.Style["display"] = "block";
                //ret = false;
                Session["correoRecuperacion"] = correo;
                if (usu.EnviarCodigoRecuperacion(correo, out codigoRecuperacion))
                {

                    lbl_error_recuperarcontra.Text = $"Código de recuperación enviado a {correo}.";

                    Session["codigoRecuperacion"] = codigoRecuperacion;
                    Response.Redirect("~/Codigo.aspx");
                }
                else
                {
                    lbl_error_recuperarcontra.Text = $"Error al enviar el código de recuperación a {correo}. Verifique el correo electrónico.";
                }
                
                
            }
            else
                //lbl_error_recuperarcontra.Style["display"] = "none";
                lbl_error_recuperarcontra.Text = "Correo ingresado no registrado";

        }
    }
}