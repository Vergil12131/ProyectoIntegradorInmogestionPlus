using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_perfil : System.Web.UI.Page
    {
        private CnTblPerfil perf = new CnTblPerfil();
        
        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPerfiles();
            }
        }


        protected void CargarPerfiles()
        {
            var perfiles = perf.ListarPerfiles();

            GridView1.DataSource = perfiles;
            GridView1.DataBind();

        }


        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if(!ValidacionRegistrar())
                return;

            perf.RegistrarPerfil(txtNombre.Text.Trim(), txtDescripcion.Text.Trim());

            CargarPerfiles();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Perfil agregado con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidacionEditar())
                return;

            perf.EditarPerfil(hiddenFieldId.Value,txtNombre.Text.Trim(), txtDescripcion.Text.Trim());

            CargarPerfiles();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Perfil editado con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarEliminar())
                return;

            perf.EliminarPerfil(hiddenFieldId.Value);

            CargarPerfiles();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Perfil eliminado con éxito";
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

            var perfil = perf.BuscarPerfilXId(id).First();

            hiddenFieldId.Value = perfil.perf_id.ToString();
            txtNombre.Text = perfil.perf_nombre;
            txtDescripcion.Text = perfil.perf_descripcion;
        }

        public void Limpiar()
        {
            txtDescripcion.Text = txtNombre.Text = hiddenFieldId.Value = "";

            lblErrorADescripcion.Style["display"] = "none";
            lblErrorNombres.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }


        ////VALIDACIONES
        
        public bool ValidacionRegistrar()
        {
            bool ret = true;

            if (!vGen.ValidarCadenaNula(txtDescripcion.Text))
            {
                lblErrorADescripcion.Text = "Debe ingresar una descripción";
                lblErrorADescripcion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorADescripcion.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txtNombre.Text))
            {
                lblErrorNombres.Text = "Debe ingresar un nombre";
                lblErrorNombres.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorNombres.Style["display"] = "none";

            return ret;
        }

        public bool ValidacionEditar()
        {
            bool ret = true;

            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar un perfil primero";
                lbl_mensaje.Style["display"] = "block";
                lbl_mensaje.Attributes["class"] = "text-danger";
                return false;
            }
            else
                lbl_mensaje.Style["display"] = "none";

            if (!vGen.ValidarCadenaNula(txtDescripcion.Text))
            {
                lblErrorADescripcion.Text = "Debe ingresar una descripción";
                lblErrorADescripcion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorADescripcion.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txtNombre.Text))
            {
                lblErrorNombres.Text = "Debe ingresar un nombre";
                lblErrorNombres.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorNombres.Style["display"] = "none";

            return ret;
        }

        protected bool ValidarEliminar()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar un perfil primero";
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