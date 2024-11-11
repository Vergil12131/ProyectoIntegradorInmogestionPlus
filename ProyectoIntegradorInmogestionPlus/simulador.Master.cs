using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class simulador : System.Web.UI.MasterPage
    {
        private CnTblUsuario usu = new CnTblUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "4" || Session["perfilUsuario"].ToString() == "2")
                {
                    if (!IsPostBack)
                    {
                        CargarMenuHeader();
                        CargarNombreUsuario();
                    }
                }
                else
                    Response.Redirect("Inicio_Sesion_Definitivo.aspx");
            }
            else
            {
                if (!IsPostBack)
                    CargarMenuHeader();
            }
        }

        private void CargarNombreUsuario()
        {

            if (Session["idUsuario"] != null)
            {
                var usuario = usu.BuscarUsuarioXId(Session["idUsuario"].ToString()).First();
                string nombre = usuario.usu_primer_nombre;


                lblUsuarioAgente.Text = nombre;
                lblUsuarioCliente.Text = nombre;
            }
        }

        private void CargarMenuHeader()
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "4")
                {
                    pnlLoggedOut.Style["display"] = "block";
                    pnlAgente.Style["display"] = "block";
                    pnlCliente.Style["display"] = "none";
                    pnlLoggedOut.Style["display"] = "none";
                }
                else if (Session["perfilUsuario"].ToString() == "2")
                {
                    pnlLoggedOut.Style["display"] = "block";
                    pnlAgente.Style["display"] = "none";
                    pnlCliente.Style["display"] = "block";
                    pnlLoggedOut.Style["display"] = "none";
                }
            }
            else
            {
                pnlLoggedOut.Style["display"] = "none";
                pnlAgente.Style["display"] = "none";
                pnlCliente.Style["display"] = "none";
                pnlLoggedOut.Style["display"] = "block";
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("pagina_principal.aspx");
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio_Sesion_Definitivo.aspx");
        }

        protected void btnCitas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Citas.aspx");
        }

        protected void btnAvisos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Avisos.aspx");
        }

        protected void btnPublicarPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("Publicacion_Definitivo.aspx");

        }

        protected void btnMisCitas_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerCitasCliente.aspx");
        }
    }
}