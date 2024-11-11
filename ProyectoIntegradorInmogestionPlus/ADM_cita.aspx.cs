using CapaNegocio;
using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_cita : System.Web.UI.Page
    {
        private CnTblPropiedad pro = new CnTblPropiedad();
        private CnTblUsuario usu = new CnTblUsuario();
        private CnTblCita cita = new CnTblCita();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarCitas();
                CargarUsuarios();
                CargarPropiedad();
            }
        }

        private void CargarPropiedad()
        {
            var propiedad = pro.ListarPropiedadesSimple();

            ddlPropiedad.DataSource = propiedad;
            ddlPropiedad.DataValueField = "pro_id";
            ddlPropiedad.DataTextField = "pro_titulo";
            ddlPropiedad.DataBind();
            ddlPropiedad.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        private void CargarUsuarios()
        {
            var usuarios = usu.SeleccionarUsuariosActivos();

            ddlUsuario.DataSource = usuarios;
            ddlUsuario.DataValueField = "IdUsuario";
            ddlUsuario.DataTextField = "NombreCompleto";
            ddlUsuario.DataBind();
            ddlUsuario.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        private void CargarCitas()
        {
            //var citas = cita.ListarCitasComp();

            //GridView1.DataSource = citas;
            //GridView1.DataBind();
        }

        protected void Limpiar()
        {
            hiddenFieldId.Value = txtFecha.Text = txt_descripcion.Text = "";
            ddlPropiedad.SelectedValue = ddlUsuario.SelectedValue = "0";


            lblErrorDescripcion.Style["display"] = "none";
            lblErrorFecha.Style["display"] = "none";
            lblErrorPropiedad.Style["display"] = "none";
            lblErrorUsuario.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            //if (!ValidarCampos())
            //    return;

            //cita.RegistrarCita(txt_descripcion.Text.Trim(), txtFecha.Text.Trim(), ddlUsuario.SelectedValue, ddlPropiedad.SelectedValue);

            //CargarCitas();
            //Limpiar();
            //lbl_mensaje.Visible = true;
            //lbl_mensaje.Text = "Cita agregada con éxito";
            //lbl_mensaje.Attributes["class"] = "text-success";
            //lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            //if (!ValidarId())
            //    return;

            //if (!ValidarCampos())
            //    return;

            //cita.EditarCita(hiddenFieldId.Value, txt_descripcion.Text.Trim(), txtFecha.Text.Trim(), ddlUsuario.SelectedValue, ddlPropiedad.SelectedValue);

            //CargarCitas();
            //Limpiar();
            //lbl_mensaje.Visible = true;
            //lbl_mensaje.Text = "Cita modificada con éxito";
            //lbl_mensaje.Attributes["class"] = "text-success";
            //lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            //if (!ValidarId())
            //    return;

            //cita.EliminarCita(hiddenFieldId.Value);

            //CargarCitas();
            //Limpiar();
            //lbl_mensaje.Visible = true;
            //lbl_mensaje.Text = "Cita eliminada con éxito";
            //lbl_mensaje.Attributes["class"] = "text-success";
            //lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnSeleccion_Click(object sender, EventArgs e)
        {
            //Limpiar();
            //string id = (sender as Button).CommandArgument;

            //var c = cita.BuscarCitaXId(id).First();

            //hiddenFieldId.Value = c.cit_id.ToString();

            //txtFecha.Text = ((DateTime)c.cit_fecha_cita).ToString("yyyy-MM-dd");
            //txt_descripcion.Text = c.cit_descripcion;
            //ddlPropiedad.SelectedValue = c.pro_id.ToString();
            //ddlUsuario.SelectedValue = c.usu_id.ToString();

            
        }


        // VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarDdl(ddlUsuario.Text))
            {
                lblErrorUsuario.Text = "Debe seleccionar un usuario";
                lblErrorUsuario.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorUsuario.Style["display"] = "none";


            if (!vGen.ValidarDdl(ddlPropiedad.Text))
            {
                lblErrorPropiedad.Text = "Debe seleccionar una propiedad";
                lblErrorPropiedad.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorPropiedad.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txt_descripcion.Text))
            {
                lblErrorDescripcion.Text = "Debe ingresar una descripción";
                lblErrorDescripcion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDescripcion.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txtFecha.Text))
            {
                lblErrorFecha.Text = "Debe ingresar una  fecha";
                lblErrorFecha.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorFecha.Style["display"] = "none";

            if (vGen.ValidarNumeroEnteroPositivo("2"))
            {
                var x = 5;
            }

            if (vGen.ValidarNumeroEnteroPositivo("d"))
            {
                var x = 5;
            }

            if (vGen.ValidarNumeroDecimalPositivo("d"))
            {
                var x = 5;
            }
            if (vGen.ValidarNumeroDecimalPositivo("3"))
            {
                var x = 5;
            }

            return ret;
        }

        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar una propiedad primero";
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