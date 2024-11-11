using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;
//using static ProyectoIntegradorInmogestionPlus.ejemplocakendario;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class AgendarCitas : System.Web.UI.Page
    {
        private CnTblCita cita = new CnTblCita();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["perfilUsuario"] == null)
                    Response.Redirect("Inicio_Sesion_Definitivo.aspx");

                if (Session["perfilUsuario"].ToString() != "2")
                    Response.Redirect("Vista_Propiedades.aspx");

                if (Session["idPropiedad"] == null)
                    Response.Redirect("Vista_Propiedades.aspx");

                int usuarioId = Convert.ToInt32(Session["idUsuario"]); // Obtener el ID del usuario actual desde la sesión
                if (usuarioId > 0)
                {
                    CargarUsuarioActual(usuarioId);
                }
                MostrarCitas(DateTime.Today);
                txtFecha.Text = DateTime.Today.ToShortDateString();
                CargarPropiedades();
            }
        }

        private void CargarUsuarioActual(int usuarioId)
        {
            var usuario = cita.ObtenerUsuarioPorId(usuarioId);

            if (usuario != null)
            {
                ddlUsuario.Items.Clear();

                ddlUsuario.Items.Add(new ListItem(usuario.NombreCompleto, usuario.IdUsuario.ToString()));

                ddlUsuario.Enabled = false;
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

                //

                ddlPropiedad.SelectedValue = Session["idPropiedad"].ToString();
                ddlPropiedad.Enabled = false;
            }
            else
            {
                // Maneja el caso en el que no hay propiedades
                ddlPropiedad.Items.Add(new ListItem("No hay propiedades disponibles", ""));
            }
        }


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            DateTime fechaSeleccionada = Calendar1.SelectedDate;

           

            txtFecha.Text = fechaSeleccionada.ToString("dd/MM/yyyy");


            // Filtrar horas disponibles
            var horasDisponibles = ObtenerHorasDisponibles(fechaSeleccionada);

            // Limpiar el DropDownList antes de actualizar
            ddlHora.Items.Clear();

            // Actualizar el DropDownList de horas con las horas disponibles
            ddlHora.DataSource = horasDisponibles;
            ddlHora.DataBind();

            // Agregar un item por defecto
            ddlHora.Items.Insert(0, new ListItem("-- Seleccione una hora --", "0"));

            // Mostrar las citas del día seleccionado
            MostrarCitas(fechaSeleccionada);


        }


        private void MostrarCitas(DateTime fecha)
        {
            int usuarioId = Convert.ToInt32(Session["idUsuario"]);
            var todasLasCitas = cita.ObtenerCitasPorUsuarioYFecha(usuarioId, fecha);

            gvCitas.DataSource = todasLasCitas;
            gvCitas.DataBind();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime fechaActual = DateTime.Today;
            DateTime fechaLimite = fechaActual.AddDays(7);

            if (e.Day.Date < fechaLimite)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Gray;
            }

            int usuarioId = Convert.ToInt32(Session["idUsuario"]);
            var todasLasCitas = cita.ObtenerCitasPorUsuarioYFecha(usuarioId, e.Day.Date);

            var citasDelDia = todasLasCitas
                .Select(c => new
                {
                    NombreUsuario = c.NombreUsuario,
                    c.cit_hora
                })
                .ToList();

            if (citasDelDia.Count > 0)
            {
                foreach (var cita in citasDelDia)
                {
                    Literal literal = new Literal
                    {
                        //Text = $"<div class='cita'>" +
                        //       $"{cita.NombreUsuario}<br />" +
                        //       $"{cita.cit_hora}" +
                        //       $"</div>"
                        Text = $""
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

                // Convertir la hora seleccionada en el dropdown a TimeSpan
                TimeSpan horaSeleccionada = TimeSpan.Parse(ddlHora.SelectedValue);
                if (string.IsNullOrEmpty(ddlPropiedad.SelectedValue))
                {
                    lblErrorPropiedad.Text = "Error. Debe seleccionar una  primero";
                    lblErrorPropiedad.Style["display"] = "block";
                    lblErrorPropiedad.Attributes["class"] = "text-danger";
                    return;
                }
                if (string.IsNullOrEmpty(ddlHora.SelectedValue))
                {
                    lblErrorPropiedad.Text = "Error. Debe seleccionar una  hora";
                    lblErrorPropiedad.Style["display"] = "block";
                    lblErrorPropiedad.Attributes["class"] = "text-danger";
                    return;
                }

                

                cita.AgregarCita(
                    "",
                    "",
                    horaSeleccionada.ToString(), // Guardar como string o ajustar según tu método AgregarCita
                    fechaSeleccionada,
                    "En espera",
                    usuarioId,
                    propiedadId
                );

                // Limpiar los campos después de guardar
                //ddlUsuario.SelectedIndex = 0;
                //ddlPropiedad.SelectedIndex = 0;
                

                // Filtrar horas disponibles
                var horasDisponibles = ObtenerHorasDisponibles(fechaSeleccionada);

                // Limpiar el DropDownList antes de actualizar
                ddlHora.Items.Clear();

                // Actualizar el DropDownList de horas con las horas disponibles
                ddlHora.DataSource = horasDisponibles;
                ddlHora.DataBind();

                // Agregar un item por defecto
                ddlHora.Items.Insert(0, new ListItem("-- Seleccione una hora --", "0"));

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
                txtFecha.Text = citas.cit_fecha_cita.ToString();

                // Convertir cit_hora de string a TimeSpan
                TimeSpan horaCita;
                if (TimeSpan.TryParse(citas.cit_hora, out horaCita))
                {
                    // Formatear la hora en formato "HH:mm"
                    string horaSeleccionada = horaCita.ToString();

                    // Verificar si la hora seleccionada existe en el DropDownList
                    var horaItem = ddlHora.Items.FindByValue(horaSeleccionada);
                    if (horaItem != null)
                    {
                        ddlHora.SelectedValue = horaSeleccionada;
                    }
                    else
                    {
                        lbl_mensaje.Text = $"Error. El valor de la hora '{horaSeleccionada}' no es válido.";
                        lbl_mensaje.Style["display"] = "block";
                        lbl_mensaje.Attributes["class"] = "text-danger";
                        return;
                    }
                }
                else
                {
                    lbl_mensaje.Text = $"Error. El valor de la hora '{citas.cit_hora}' no es un formato válido.";
                    lbl_mensaje.Style["display"] = "block";
                    lbl_mensaje.Attributes["class"] = "text-danger";
                    return;
                }

                ddlUsuario.SelectedValue = citas.usu_id.ToString();
                ddlPropiedad.SelectedValue = citas.pro_id.ToString();
                ddlHora.Enabled = false;
                btnAgregarCita.Visible = false;
                btnEditarCita.Visible = true;
            }
            else
            {
                lbl_mensaje.Text = "Error. No se encontró la cita.";
                lbl_mensaje.Style["display"] = "block";
                lbl_mensaje.Attributes["class"] = "text-danger";
            }
        }

        protected void btnEditarCita_Click(object sender, EventArgs e)
        {
            TimeSpan horaSeleccionada = TimeSpan.Parse(ddlHora.SelectedValue);
            string id = HiddenField1.Value;
            string hora = ddlHora.SelectedValue;
            DateTime fecha = DateTime.Parse(txtFecha.Text);
            string estado = "En espera";
            int usuarioId = int.Parse(ddlUsuario.SelectedValue);
            int propiedadId = int.Parse(ddlPropiedad.SelectedValue);
            string comentarioA = hfComentarioAgente.Value;

            cita.EditarCita(comentarioA,id, "Sin novedad", hora, fecha, estado, usuarioId, propiedadId);

            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Cita modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";


        }

        private List<string> ObtenerHorasDisponibles(DateTime fechaSeleccionada)
        {
            int usuarioId = Convert.ToInt32(Session["idUsuario"]);
            var todasLasCitas = cita.ObtenerCitasPorUsuarioYFecha(usuarioId, fechaSeleccionada);

            var todasLasHoras = new List<string>
    {
        "09:00",
        "10:30",
        "12:00",
        "14:30",
        "16:00"
    };

            var horasDisponibles = new List<string>();

            var todasLasHorasTimeSpan = todasLasHoras.Select(h => TimeSpan.Parse(h)).ToList();
            var citasHorasTimeSpan = todasLasCitas.Select(c => TimeSpan.Parse(c.cit_hora)).ToList();

            foreach (var hora in todasLasHorasTimeSpan)
            {
                if (!citasHorasTimeSpan.Contains(hora))
                {
                    horasDisponibles.Add(hora.ToString(@"hh\:mm"));
                }
            }

            return horasDisponibles;
        }

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