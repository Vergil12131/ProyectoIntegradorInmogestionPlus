using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class VerCitasCliente : System.Web.UI.Page
    {
        private CnTblCita cita = new CnTblCita();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verifica si hay un usuario en la sesión
                if (Session["idUsuario"] != null)
                {
                    int idUsuario = Convert.ToInt32(Session["idUsuario"]);

                    // Mostrar las citas del usuario
                    MostrarCitas(idUsuario);

                    // Cargar las citas finalizadas del usuario
                    CargarCitasFinalizadas(idUsuario);
                }
                else
                {
                    // Redirige a la página de inicio de sesión si no hay usuario en sesión
                    Response.Redirect("~/Inicio_Sesion_Definitivo.aspx");
                }
            }
        }

        public void CargarCitasFinalizadas(int idUsuario)
        {
            var citasFinalizadas = cita.ObtenerCitasFinalizadasPorUsuario(idUsuario);

            // Asignar datos al GridView y enlazar
            gvCitasFinalizadas.DataSource = citasFinalizadas;
            gvCitasFinalizadas.DataBind();

        }

        private void MostrarCitas(int idUsuario)
        {
            var citasUsuario = cita.ObtenerCitasPorUsuario(idUsuario);

            // Asignar datos al GridView y enlazar
            gvCitas.DataSource = citasUsuario;
            gvCitas.DataBind();

        }

        protected void gvCitasFinalizadas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AgregarResena")
            {
                // Obtener el ID de la cita desde el CommandArgument
                int citaId = Convert.ToInt32(e.CommandArgument);

                // Establecer el ID de la cita en el ViewState
                ViewState["CitaId"] = citaId;

                // Mostrar el modal (esto se hace usando JavaScript)
                ScriptManager.RegisterStartupScript(this, GetType(), "MostrarModal", "$('#staticBackdrop').modal('show');", true);
            }
        }


        protected void btnGuardarResena_Click(object sender, EventArgs e)
        {
            if (ViewState["CitaId"] != null)
            {
                int citaId = Convert.ToInt32(ViewState["CitaId"]);
                if (string.IsNullOrEmpty(txtModalResena.Text))
                {
                    lblErrorDescrip.Text = "Ingrese una descripción, reseña o comentario";
                }
                else if (string.IsNullOrEmpty(txtResena.Text))
                {
                    lblErrorDescrip.Text = "Ingrese una descripción, reseña o comentario";
                }
                else
                {
                    string reseña = txtResena.Text;
                    cita.GuardarResena(citaId, reseña);

                    pnlForm.Visible = false;

                    txtResena.Text = "";

                    int idUsuario = Convert.ToInt32(Session["idUsuario"]);
                    CargarCitasFinalizadas(idUsuario);
                }
            }
        }

        protected void btnCancelarResena_Click(object sender, EventArgs e)
        {
            // Ocultar el panel de reseña
            pnlForm.Visible = false;

            // Limpiar el TextBox
            txtResena.Text = "";
        }

        protected void btnModalGuardarResena_Click(object sender, EventArgs e)
        {
            if (ViewState["CitaId"] != null)
            {
                int citaId = Convert.ToInt32(ViewState["CitaId"]);
                string reseña = txtModalResena.Text;

                // Guardar la reseña
                cita.GuardarResena(citaId, reseña);

                // Ocultar el modal de reseña
                ScriptManager.RegisterStartupScript(this, GetType(), "hideModal", "$('#staticBackdrop').modal('hide');", true);

                // Limpiar el TextBox del modal
                txtModalResena.Text = "";

                // Volver a cargar el GridView si es necesario
                int idUsuario = Convert.ToInt32(Session["idUsuario"]);
                CargarCitasFinalizadas(idUsuario);
            }
        }
    }

}