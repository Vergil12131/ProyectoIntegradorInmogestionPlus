using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class Publicacion_Definitivo : System.Web.UI.Page
    {
        private CnTblTipoInmueble tipo = new CnTblTipoInmueble();
        private CnTblTipoOperacion ope = new CnTblTipoOperacion();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarTiposInmueble();
                CargarTiposOperacion();
            }
        }

        protected void CargarBotonesOperacion()
        {
            var operacion = ope.ListarOperaciones();

            //rptBotones.DataSource = operacion;
            //rptBotones.DataBind();
        }

        private void CargarTiposInmueble()
        {
            var tipos = tipo.ListarInmueblees();
            rblTipoInmueble.DataSource = tipos;
            rblTipoInmueble.DataTextField = "tinm_nombre";
            rblTipoInmueble.DataValueField = "tinm_id";
            rblTipoInmueble.DataBind();
            //rblTipoInmueble.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        private void CargarTiposOperacion()
        {
            var tipos = ope.ListarOperaciones();
            rblOperacion.DataSource = tipos;
            rblOperacion.DataTextField = "tope_nombre";
            rblOperacion.DataValueField = "tope_id";
            rblOperacion.DataBind();
            //rblOperacion.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            if (!ValidarFormulario())
                return;

            Session["Operacion"] = rblOperacion.SelectedValue;
            Session["TipoInmueble"] = rblTipoInmueble.SelectedValue;

            Response.Redirect("publicacion2_definitivo.aspx");
        }

        
        // Validaciones


        protected bool ValidarFormulario()
        {
            bool ret = true;

            if (!vGen.ValidarDdl(rblOperacion.SelectedValue))
            {
                lblErrorOperacion.Text = "Debe seleccionar un tipo de operación";
                lblErrorOperacion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorOperacion.Style["display"] = "none";


            if (!vGen.ValidarDdl(rblTipoInmueble.SelectedValue))
            {
                lblErrorTipoInmueble.Text = "Debe seleccionar un tipo de inmueble";
                lblErrorTipoInmueble.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorTipoInmueble.Style["display"] = "none";


            return ret;
        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Avisos.aspx");
        }
    }
}