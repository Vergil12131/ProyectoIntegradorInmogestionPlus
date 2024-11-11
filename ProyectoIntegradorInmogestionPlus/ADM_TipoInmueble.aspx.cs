using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_TipoInmueble : System.Web.UI.Page
    {
        private CnTblTipoInmueble tinm = new CnTblTipoInmueble();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarTInmueble();
            }
        }

        protected void CargarTInmueble()
        {
            var tinmu = tinm.ListarInmueblees();

            GridView1.DataSource = tinmu;
            GridView1.DataBind();
        }

        protected void Limpiar()
        {
            hiddenFieldId.Value = txt_TipoInmueble.Text = "";
            lblErrorTinmueble.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())
                return;

            tinm.RegistrarInmueble(txt_TipoInmueble.Text.Trim());

            CargarTInmueble();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Tipo de inmueble agregado con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            tinm.EditarInmueble(hiddenFieldId.Value,txt_TipoInmueble.Text.Trim());

            CargarTInmueble();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Tipo de inmueble modificado con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            tinm.EliminarInmueble(hiddenFieldId.Value);

            CargarTInmueble();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Tipo de inmueble eliminado con éxito";
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

            var tinmu = tinm.BuscarInmuebleXId(id).First();

            hiddenFieldId.Value = tinmu.tinm_id.ToString();
            txt_TipoInmueble.Text = tinmu.tinm_nombre.ToString();
        }

        // VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarCadenaNula(txt_TipoInmueble.Text))
            {
                lblErrorTinmueble.Text = "Debe ingresar un nombre";
                lblErrorTinmueble.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorTinmueble.Style["display"] = "none";

            return ret;
        }

        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar un tipo de inmueble primero";
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