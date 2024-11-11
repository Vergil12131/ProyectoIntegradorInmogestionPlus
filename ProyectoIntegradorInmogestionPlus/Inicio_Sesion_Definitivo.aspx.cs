using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class Inicio_Sesion_Definitivo : System.Web.UI.Page
    {
        private CnTblUsuario usu = new CnTblUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                //Perfil admin
                if (Session["perfilUsuario"].ToString() == "1")
                    Response.Redirect("~/ADM_usuario.aspx");
                
                //Perfil agente inmobiliaria
                else if (Session["perfilUsuario"].ToString() == "4")
                    Response.Redirect("~/Avisos.aspx");


                //Perfil cliente
                else
                    Response.Redirect("~/pagina_principal.aspx");
            }
        }

        // RESPALDO DE BOTON LOGIN ANTERIOR

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    string mail = textEmail.Text;
        //    string pass = textPass.Text;

        //    if (string.IsNullOrEmpty(textEmail.Text) || string.IsNullOrEmpty(textEmail.Text))
        //    {
        //        lblError.Text = "Debe llenar ambos campos";
        //        lblError.Style["display"] = "block";
        //        return;
        //    }

        //    if (!(usu.BuscarUsuarioXCorreo(mail).Count() > 0))
        //    {
        //        lblError.Text = "Error. Usuario no encontrado";
        //        lblError.Style["display"] = "block";
        //    }
        //    else
        //    {
        //        var usuario = usu.BuscarUsuarioXCorreo(mail).First();

        //        if (usu.RetornarIntentos(usuario.usu_id) <= 0)
        //        {
        //            lblError.Text = "Usuario bloqueado ";
        //            lblError.Style["display"] = "block";
        //            return;
        //        }


        //        if (usu.BuscarUsuarioXCorreoYPass(mail, pass).Count() > 0)
        //        {
        //            usu.RestaurarIntentos(usuario.usu_id);

        //            Session["idUsuario"] = usuario.usu_id.ToString();
        //            Session["perfilUsuario"] = usuario.perf_id.ToString();

        //            //Perfil admin
        //            if (usuario.perf_id == 1)
        //                Response.Redirect("~/ADM_usuario.aspx");
                    
        //            //Perfil admin inmobiliaria
        //            else if (usuario.perf_id == 4)
        //                Response.Redirect("~/Avisos.aspx");

        //            //Perfil cliente
        //            else
        //                Response.Redirect("~/pagina_principal.aspx");


        //        }
        //        else
        //        {
        //            usu.RestarIntentos(usuario.usu_id);

        //            int intentosRes = usu.RetornarIntentos(usuario.usu_id);

        //            if (intentosRes >= 1)
        //            {
        //                lblError.Text = "Combinación de Clave/Contraseña equivocada. Intentos restantes: " + intentosRes;
        //                lblError.Style["display"] = "block";
        //            }
        //            else
        //            {
        //                lblError.Text = "Combinación de Clave/Contraseña equivocada. Usuario bloqueado";
        //                lblError.Style["display"] = "block";
        //            }

        //        }
        //    }
        //}

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string mail = textEmail.Text;
            string pass = textPass.Text;

            if (string.IsNullOrEmpty(textEmail.Text) || string.IsNullOrEmpty(textPass.Text))
            {
                lblError.Text = "Debe llenar ambos campos";
                lblError.Style["display"] = "block";
                return;
            }

            var usuarios = usu.BuscarUsuarioXCorreo(mail);
            if (usuarios.Count() == 0)
            {
                lblError.Text = "Error. Usuario no encontrado";
                lblError.Style["display"] = "block";
            }
            else
            {
                var usuario = usuarios.First();

                if (usu.RetornarIntentos(usuario.usu_id) <= 0)
                {
                    lblError.Text = "Usuario bloqueado";
                    lblError.Style["display"] = "block";
                    return;
                }

                if (usu.BuscarUsuarioXCorreoYPass(mail, pass).Count() > 0)
                {
                    usu.RestaurarIntentos(usuario.usu_id);

                    Session["idUsuario"] = usuario.usu_id.ToString();
                    Session["perfilUsuario"] = usuario.perf_id.ToString();

                    // Redirigir según el perfil
                    if (usuario.perf_id == 1)
                        Response.Redirect("~/ADM_usuario.aspx");
                    else if (usuario.perf_id == 4)
                        Response.Redirect("~/Avisos.aspx");
                    else
                        Response.Redirect("~/pagina_principal.aspx");
                }
                else
                {
                    usu.RestarIntentos(usuario.usu_id);
                    int intentosRes = usu.RetornarIntentos(usuario.usu_id);

                    if (intentosRes > 0)
                    {
                        lblError.Text = "Combinación de Clave/Contraseña equivocada. Intentos restantes: " + intentosRes;
                        lblError.Style["display"] = "block";
                    }
                    else
                    {
                        lblError.Text = "Combinación de Clave/Contraseña equivocada. Usuario bloqueado";
                        lblError.Style["display"] = "block";
                    }
                }
            }
        }

        protected void btnRecuperacionPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecuperarContra.aspx");
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro_Definitivo.aspx");
        }
    }
}