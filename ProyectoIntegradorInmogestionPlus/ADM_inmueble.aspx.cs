using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_inmueble : System.Web.UI.Page
    {
        private CnTblInmueble inm = new CnTblInmueble();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();
        private ValidacionesUsuario vUsu = new ValidacionesUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarInm();
            }
        }

        private void CargarInm()
        {
            var inmuebles = inm.ListarInmuebles();

            GridView1.DataSource = inmuebles;
            GridView1.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Limpiar();
            string id = (sender as Button).CommandArgument;

            var inmobiliaria = inm.BuscarInmuebleXId(id).First();

            Session["pathImagen"] = inmobiliaria.inm_imagen;
            HiddenFieldId.Value = id;
            txtNombre.Text = inmobiliaria.inm_nombre;
            txtCorreo.Text = inmobiliaria.inm_correo;
            txtDireccion.Text = inmobiliaria.inm_direccion;
            txtRazonSocial.Text = inmobiliaria.inm_razon_social;
            txtRUC.Text = inmobiliaria.inm_ruc;
            txtTelefono.Text = inmobiliaria.inm_telefono;
            Image1.ImageUrl = inmobiliaria.inm_imagen;
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())
                return;

            string path;

            if (Session["pathImagenInm"] != null)
                path = Session["pathImagenInm"].ToString();
            else
                return;

            inm.RegistrarInmueble(
                txtNombre.Text,
                txtDireccion.Text,
                txtRUC.Text,
                txtRazonSocial.Text,
                txtTelefono.Text,
                txtCorreo.Text,
                path);

            CargarInm();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Inmobiliaria agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            var inmobiliaria = inm.BuscarInmuebleXId(HiddenFieldId.Value).First();
            string path = Session["pathImagenInm"].ToString();

            EliminarArchivo(inmobiliaria.inm_imagen);

            inm.EditarInmuebleMant(
                HiddenFieldId.Value,
                txtNombre.Text,
                txtDireccion.Text,
                txtRUC.Text,
                txtRazonSocial.Text,
                txtTelefono.Text,
                txtCorreo.Text,
                path);

            CargarInm();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Inmobiliaria modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";

            Response.Redirect("~/ADM_inmueble.aspx");
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            inm.EliminarInmueble(
                HiddenFieldId.Value
                );

            CargarInm();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Inmobiliaria eliminada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_visualizar_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {


                string extensiones = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string[] varext = { ".jpg", ".jpeg", ".png" };


                if (!varext.Contains(extensiones))
                {
                    lblErrorUpload.Text = "Debe seleccionar una imagen (formatos .jpg, .jpeg, .png) con un tamaño máximo de 1GB";
                    lblErrorUpload.Style["display"] = "block";
                    return;
                }

                if (FileUpload1.PostedFile.ContentLength > 1000000)
                {
                    lblErrorUpload.Text = "Debe seleccionar una imagen (formatos .jpg, .jpeg, .png) con un tamaño máximo de 1GB";
                    lblErrorUpload.Style["display"] = "block";
                    return;
                }

                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                // Generar un nombre de archivo único
                string uniqueFileName = Guid.NewGuid().ToString() + extension;

                // Obtener la ruta física de la carpeta donde se guardará la imagen
                string folderPath = Server.MapPath("~/uploads/imagenes/");

                // Crear la carpeta si no existe
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                // Crear la ruta completa del archivo
                string filePath = System.IO.Path.Combine(folderPath, uniqueFileName);

                try
                {
                    // Guardar el archivo en la ruta especificada
                    FileUpload1.SaveAs(filePath);

                    // Obtener la ruta relativa del archivo
                    string relativePath = "~/uploads/imagenes/" + uniqueFileName;

                    // Ahora puedes trabajar con la variable relativePath
                    Image1.ImageUrl = relativePath;
                    Session["pathImagenInm"] = relativePath;

                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir
                    lblErrorUpload.Text = "Se ha producido un error al guardar la imagen: " + ex.Message;
                    lblErrorUpload.Style["display"] = "block";
                }

            }
        }

        protected void EliminarArchivo(string relativePath)
        {
            string physicalPath = Server.MapPath(relativePath);

            try
            {
                // Verificar si el archivo existe
                if (System.IO.File.Exists(physicalPath))
                {
                    // Eliminar el archivo
                    System.IO.File.Delete(physicalPath);
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        public void Limpiar()
        {
            HiddenFieldId.Value = txtCorreo.Text = txtDireccion.Text = txtNombre.Text = txtRazonSocial.Text = txtRUC.Text = txtTelefono.Text = "";

            lblErrorCorreo.Style["display"] = "none";
            lblErrorDireccion.Style["display"] = "none";
            lblErrorNombres.Style["display"] = "none";
            lblErrorRazonSocial.Style["display"] = "none";
            lblErrorRUC.Style["display"] = "none";
            lblErrorTelefono.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";

            Session.Remove("pathImagenInm");
        }

        /// VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarCadenaNula(txtNombre.Text))
            {
                lblErrorNombres.Text = "Debe ingresar un nombre";
                lblErrorNombres.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorNombres.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txtDireccion.Text))
            {
                lblErrorDireccion.Text = "Debe ingresar una dirección";
                lblErrorDireccion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDireccion.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txtDireccion.Text))
            {
                lblErrorDireccion.Text = "Debe ingresar una dirección";
                lblErrorDireccion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDireccion.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txtDireccion.Text))
            {
                lblErrorRazonSocial.Text = "Debe ingresar una razón social";
                lblErrorRazonSocial.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorRazonSocial.Style["display"] = "none";


            if (!vGen.ValidarNumeroEnteroPositivo(txtRUC.Text))
            {
                lblErrorRUC.Text = "Debe ingresar un valor válido";
                lblErrorRUC.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorRUC.Style["display"] = "none";


            if (!vGen.ValidarNumeroEnteroPositivo(txtTelefono.Text))
            {
                lblErrorTelefono.Text = "Debe ingresar un teléfono válido";
                lblErrorTelefono.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorTelefono.Style["display"] = "none";


            if (!vUsu.ValidarCorreo(txtCorreo.Text))
            {
                lblErrorCorreo.Text = "Debe ingresar un correo válido";
                lblErrorCorreo.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCorreo.Style["display"] = "none";



            return ret;
        }

        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(HiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar una inmobiliaria primero";
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