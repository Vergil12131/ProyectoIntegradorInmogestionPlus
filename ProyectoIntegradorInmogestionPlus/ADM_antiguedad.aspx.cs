using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_antiguedad : System.Web.UI.Page
    {
        private CnTblAntiguedad ant = new CnTblAntiguedad();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarAntiguedad();
            }
        }

        private void CargarAntiguedad()
        {
            var antiguedad = ant.ListarAntiguedades();

            GridView1.DataSource = antiguedad;
            GridView1.DataBind();
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())
                return;

            ant.RegistrarAntiguedad(txtAntiguedad.Text.Trim());

            CargarAntiguedad();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Antiguedad agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            ant.EditarAntiguedad(hiddenFieldId.Value, txtAntiguedad.Text.Trim());

            CargarAntiguedad();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Antiguedad modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            ant.EliminarAntiguedad(hiddenFieldId.Value);

            CargarAntiguedad();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Antiguedad eliminada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnSeleccion_Click(object sender, EventArgs e)
        {
            Limpiar();
            string id = (sender as Button).CommandArgument;

            var antiguedad = ant.BuscarAntiguedadXId(id).First();

            hiddenFieldId.Value = antiguedad.ant_id.ToString();
            txtAntiguedad.Text = antiguedad.ant_nombre.ToString();
        }

        protected void Limpiar()
        {
            hiddenFieldId.Value = txtAntiguedad.Text = "";
            lblErrorNombres.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }

        // VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarCadenaNula(txtAntiguedad.Text))
            {
                lblErrorNombres.Text = "Debe ingresar un nombre";
                lblErrorNombres.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorNombres.Style["display"] = "none";

            return ret;
        }

        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar una antiguedad primero";
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