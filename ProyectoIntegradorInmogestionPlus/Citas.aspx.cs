using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;
//using static ProyectoIntegradorInmogestionPlus.ejemplocakendario;

namespace PoryectoIntegradorInmogestionPlus
{
    public partial class Citas : System.Web.UI.Page
    {
        private CnTblCita cita = new CnTblCita();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUsuario"] == null)
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");

            if (Session["perfilUsuario"].ToString() != "4")
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");

            if (!IsPostBack)
            {
                MostrarCitas(DateTime.Today);
                txtFecha.Text = DateTime.Today.ToShortDateString();
                CargarUsuarios();
                CargarPropiedades();
            }
        }

        private void CargarPropiedades()
        {
            var inmobiliarias = cita.ListarInmuebles();

            // Verifica si hay elementos en la lista
            if (inmobiliarias.Any())
            {
                ddlPropiedad.DataSource = inmobiliarias;
                ddlPropiedad.DataValueField = "pro_id";
                ddlPropiedad.DataTextField = "pro_titulo";
                ddlPropiedad.DataBind();

                ddlPropiedad.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
            }
            else
            {
                // Maneja el caso en el que no hay propiedades
                ddlPropiedad.Items.Add(new ListItem("No hay propiedades disponibles", ""));
            }
        }



        private void CargarUsuarios()
        {
            var usuarios = cita.SeleccionarUsuariosActivos();

            ddlUsuario.DataSource = usuarios;
            ddlUsuario.DataValueField = "IdUsuario";
            ddlUsuario.DataTextField = "NombreCompleto";
            ddlUsuario.DataBind();
            ddlUsuario.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            MostrarCitas(Calendar1.SelectedDate);
            txtFecha.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        private void MostrarCitas(DateTime fecha)
        {
            var todasLasCitas = cita.ObtenerCitasXAgente(Session["idUsuario"].ToString());

            string fechaStr = fecha.ToString("yyyy-MM-dd");

            var citasDelDia = new List<CapaNegocio.CnTblCita.tbl_cita>();

            foreach (var cita in todasLasCitas)
            {
                if (cita.cit_fecha_cita == fechaStr)
                {
                    citasDelDia.Add(cita);
                }
            }

            gvCitas.DataSource = citasDelDia;
            gvCitas.DataBind();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            var todasLasCitas = cita.ObtenerCitasXAgente(Session["idUsuario"].ToString());

            string fechaDia = e.Day.Date.ToString("yyyy-MM-dd");

            var citasDelDia = new List<PoryectoIntegradorInmogestionPlus.Citas.tbl_cita>();

            foreach (var cita in todasLasCitas)
            {
                if (cita.cit_fecha_cita == fechaDia)
                {
                    var citaParaMostrar = new PoryectoIntegradorInmogestionPlus.Citas.tbl_cita
                    {
                        NombreUsuario = cita.NombreUsuario,
                        cit_hora = cita.cit_hora
                    };
                    citasDelDia.Add(citaParaMostrar);
                }
            }

            if (citasDelDia.Count > 0)
            {
                foreach (var cita in citasDelDia)
                {
                    Literal literal = new Literal
                    {
                        Text = $"<div class='cita'>" +
                               $"{cita.NombreUsuario}<br />" +
                               $"{cita.cit_hora}" +
                               $"</div>"
                    };
                    e.Cell.Controls.Add(literal);
                }
            }
        }



        protected void btnAgregarCita_Click(object sender, EventArgs e)
        {

            DateTime fechaSeleccionada = Calendar1.SelectedDate;

            DateTime fechaActual = DateTime.Now;

            DateTime fechaLimite = fechaActual.AddDays(1);

            if (fechaSeleccionada < fechaLimite.Date)
            {
                lblErrorFecha.Visible = true;
                lblErrorFecha.Text = $"La fecha debe ser al menos 24 horas después de la fecha actual ({fechaLimite.ToString("dd/MM/yyyy")}).";
                lblErrorFecha.Attributes["class"] = "text-danger";
                lblErrorFecha.Style["display"] = "block";
                return;
            }
            else
            {
                int usuarioId = Convert.ToInt32(ddlUsuario.SelectedValue);
                int propiedadId = Convert.ToInt32(ddlPropiedad.SelectedValue);

                string comentario = "";

                if (!string.IsNullOrEmpty(txtDescripcion.Text))
                    comentario = txtDescripcion.Text.Trim();


                cita.AgregarCita(
                    comentario,
                    "",
                    txtHora.Text,
                    fechaSeleccionada,
                    ddlEstado.SelectedValue,
                    usuarioId,
                    propiedadId
                );

                txtHora.Text = string.Empty;
                txtDescripcion.Text = string.Empty;
                ddlUsuario.SelectedIndex = 0;
                ddlPropiedad.SelectedIndex = 0;
                ddlEstado.SelectedIndex = 0;

            }

            MostrarCitas(fechaSeleccionada);
            Calendar1.VisibleDate = fechaSeleccionada;

            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Cita creada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }


        protected void btn_selec_Click(object sender, EventArgs e)
        {
            int citId = Convert.ToInt32((sender as Button).CommandArgument);


            var citas = cita.ObtenerCitaPorId(citId);




            if (citas != null)
            {
                HiddenField1.Value = citId.ToString();
                hfComentarioCliente.Value = citas.cit_descripcion.ToString();
                txtFecha.Text = citas.cit_fecha_cita.ToString();
                txtHora.Text = citas.cit_hora.ToString();
                txtDescripcion.Text = citas.cit_descripcion.ToString();
                ddlUsuario.SelectedValue = citas.usu_id.ToString();
                ddlPropiedad.SelectedValue = citas.pro_id.ToString();
                ddlEstado.Text = citas.cit_estado.ToString();
                btnAgregarCita.Visible = false;
                btnEditarCita.Visible = true;
            }

        }

        protected void btnEditarCita_Click(object sender, EventArgs e)
        {
            string id = HiddenField1.Value;
            string comentarioCliente = hfComentarioCliente.Value;
            string descripcion = txtDescripcion.Text;
            string hora = txtHora.Text;
            DateTime fecha = DateTime.Parse(txtFecha.Text);
            string estado = ddlEstado.SelectedValue;
            int usuarioId = int.Parse(ddlUsuario.SelectedValue);
            int propiedadId = int.Parse(ddlPropiedad.SelectedValue);

            cita.EditarCita(descripcion, id, comentarioCliente, hora, fecha, estado, usuarioId, propiedadId);

            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Cita modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";


        }


        public class tbl_cita
        {
            public DateTime cit_fecha_cita { get; set; }
            public string cit_hora { get; set; }
            public string cit_descripcion { get; set; }
            public int usu_id { get; set; }
            public string NombreUsuario { get; set; }
        }


    }
}


