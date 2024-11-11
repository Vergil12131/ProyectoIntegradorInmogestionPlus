using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ReporteTemp : System.Web.UI.Page
    {
        private CnTblUsuario usu = new CnTblUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "1")
                {
                    if (!IsPostBack)
                    {
                        CargarNombreUsuario();
                    }
                }
                else
                    Response.Redirect("Inicio_Sesion_Definitivo.aspx");
            }
            else
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");

        }

        private void CargarNombreUsuario()
        {

            if (Session["idUsuario"] != null)
            {
                var usuario = usu.BuscarUsuarioXId(Session["idUsuario"].ToString()).First();

                lblUsuarioMaster.Text = usuario.usu_primer_nombre;
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("pagina_principal.aspx");
        }

        protected void btnMantenimiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADM_usuario.aspx");
        }

        protected void btnReportes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteTemp.aspx");
        }
    }
}