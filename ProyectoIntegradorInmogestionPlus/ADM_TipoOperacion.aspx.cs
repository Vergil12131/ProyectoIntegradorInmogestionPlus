using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_TipoOperacion : System.Web.UI.Page
    {
        private CnTblTipoOperacion tope = new CnTblTipoOperacion();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarTOperacion();
            }
        }

        protected void btnSeleccion_ClickbtnSeleccion_Click(object sender, EventArgs e)
        {
            Limpiar();
            string id = (sender as Button).CommandArgument;

            var toper = tope.BuscarOperacionXId(id).First();

            hiddenFieldId.Value = toper.tope_id.ToString();
            txt_TipoOperacion.Text = toper.tope_nombre.ToString();
            
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())
                return;

            tope.RegistrarOperacion(txt_TipoOperacion.Text.Trim());

            CargarTOperacion();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Tipo de operación agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            tope.EditarOperacion(hiddenFieldId.Value,txt_TipoOperacion.Text.Trim());

            CargarTOperacion();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Tipo de operación modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            tope.EliminarOperacion(hiddenFieldId.Value);

            CargarTOperacion();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Tipo de operación eliminada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void CargarTOperacion()
        {
            var toper = tope.ListarOperaciones();

            GridView1.DataSource = toper;
            GridView1.DataBind();
        }

        protected void Limpiar()
        {
            hiddenFieldId.Value = txt_TipoOperacion.Text = "";
            lblErrorToperacion.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }


        // VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarCadenaNula(txt_TipoOperacion.Text))
            {
                lblErrorToperacion.Text = "Debe ingresar un nombre";
                lblErrorToperacion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorToperacion.Style["display"] = "none";

            return ret;
        }

        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar un tipo de operación primero";
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