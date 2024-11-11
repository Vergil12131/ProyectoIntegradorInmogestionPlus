using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_caracteristicas : System.Web.UI.Page
    {
        private CnTblCaracteristicas car = new CnTblCaracteristicas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCaracteristicas();
            }
        }

        protected void CargarCaracteristicas()
        {
            var carac = car.ListarCaracteristicas();

            GridView1.DataSource = carac;
            GridView1.DataBind();
        }

        protected void btnSeleccion_Click(object sender, EventArgs e)
        {
            Limpiar();
            string id = (sender as Button).CommandArgument;

            var carac = car.BuscarCaracteristicaXId(id).First();

            hiddenFieldId.Value = carac.car_id.ToString();
            txtEstacionamientos.Text = carac.car_estacionamineto.ToString();
            lblEstacionamiento.Text = carac.car_estacionamineto.ToString();
            txtBanios.Text = carac.car_banos.ToString();
            lblBanio.Text = carac.car_banos.ToString();
            txtHabitaciones.Text = carac.car_habitaciones.ToString();
            lblHabitaciones.Text = carac.car_habitaciones.ToString();

        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            car.RegistrarCaracteristica(txtHabitaciones.Text, txtBanios.Text, txtEstacionamientos.Text);

            CargarCaracteristicas();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Características agregadas con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            car.EditarCaracteristica(hiddenFieldId.Value, txtHabitaciones.Text, txtBanios.Text, txtEstacionamientos.Text);

            CargarCaracteristicas();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Características modificadas con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            car.EliminarCaracteristica(hiddenFieldId.Value);

            CargarCaracteristicas();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Características eliminadas con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void Limpiar()
        {
            hiddenFieldId.Value = "";
            txtBanios.Text = txtEstacionamientos.Text = txtHabitaciones.Text = "0";
            lbl_mensaje.Style["display"] = "none";
        }

        // VALIDACIONES
        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar un set de características primero";
                lbl_mensaje.Style["display"] = "block";
                lbl_mensaje.Attributes["class"] = "text-danger";
                return false;
            }
            else
                lbl_mensaje.Style["display"] = "none";
            return true;
        }

    }
}