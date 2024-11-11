using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_imagen : System.Web.UI.Page
    {
        private CnTblImagen img = new CnTblImagen();
        private CnTblPropiedad pro = new CnTblPropiedad();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarImagenes();
                CargarPropiedades();
            }
        }

        protected void CargarImagenes()
        {
            var imagenes = img.ListarImagenesComp();

            GridView1.DataSource = imagenes;
            GridView1.DataBind();
        }

        protected void CargarPropiedades()
        {
            var listPerf = pro.ListarPropiedadesSimple();

            ddlpropiedad.DataSource = listPerf;
            ddlpropiedad.DataValueField = "pro_id";
            ddlpropiedad.DataTextField = "pro_titulo";
            ddlpropiedad.DataBind();
            ddlpropiedad.Items.Insert(0, new ListItem("-- Seleccione --", "0"));

        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())
                return;

            string path;

            if (Session["pathImagen"] != null)
                path = Session["pathImagen"].ToString();
            else
                return;

            img.RegistrarImagen(path, ddlpropiedad.SelectedValue);

            CargarImagenes();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Imagen agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";

        }

        public void Limpiar()
        {
            hiddenFieldId.Value = "";
            ddlpropiedad.SelectedValue = "0";
            Session.Remove("pathImagen");
            Image1.ImageUrl = "~/source/images/mantenimiento/Imagenes/Camaara.jpg";

            lblErrorPropiedad.Style["display"] = "none";
            lblErrorUpload.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            var imagen = img.BuscarImagenXId(hiddenFieldId.Value).First();
            string path = Session["pathImagen"].ToString();

            EliminarArchivo(imagen.img_url);

            img.EditarImagen(hiddenFieldId.Value, path, ddlpropiedad.SelectedValue);

            CargarImagenes();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Imagen modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";

            Response.Redirect("~/ADM_imagen.aspx");
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            
            img.EliminarImagen(hiddenFieldId.Value);

            CargarImagenes();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Imagen eliminada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnSeleccionUsuario_Click(object sender, EventArgs e)
        {
            string id = (sender as Button).CommandArgument;

            var imagen = img.BuscarImagenXId(id).First();

            hiddenFieldId.Value = imagen.img_id.ToString();

            Session["pathImagen"] = imagen.img_url;
            Image1.ImageUrl = imagen.img_url;
            ddlpropiedad.SelectedValue = imagen.pro_id.ToString();
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
                    Session["pathImagen"] = relativePath;

                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir
                    lblErrorUpload.Text = "Se ha producido un error al guardar la imagen: " + ex.Message;
                    lblErrorUpload.Style["display"] = "block";
                }

                //if (string.IsNullOrEmpty(hiddenFieldId.Value))
                //{

                //    // Crear la ruta completa del archivo
                //    string filePath = folderPath + fileName;

                //    // Guardar el archivo en la ruta especificada
                //    FileUpload1.SaveAs(filePath);

                //    // Obtener la ruta relativa del archivo
                //    string relativePath = "~/uploads/imagenes/" + fileName;

                //    // Ahora puedes trabajar con la variable relativePath
                //    Image1.ImageUrl = relativePath;
                //    Session["pathImagen"] = relativePath;
                //}
                //else
                //{
                //    var imagen = img.BuscarImagenXId(hiddenFieldId.Value).First();

                //    string rel = "~/uploads/imagenes/";
                //    fileName = (imagen.img_url).Substring(rel.Length);

                //    // Crear la ruta completa del archivo
                //    string filePath = folderPath + fileName;

                //    // Guardar el archivo en la ruta especificada
                //    FileUpload1.SaveAs(filePath);

                //    // Obtener la ruta relativa del archivo
                //    string relativePath = "~/uploads/imagenes/" + fileName;

                //    // Ahora puedes trabajar con la variable relativePath
                //    Image1.ImageUrl = relativePath;
                //    Session["pathImagen"] = relativePath;
                //}

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

        // VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarDdl(ddlpropiedad.Text))
            {
                lblErrorPropiedad.Text = "Debe seleccionar una propiedad";
                lblErrorPropiedad.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorPropiedad.Style["display"] = "none";

            if (Session["pathImagen"] == null)
            {
                lblErrorUpload.Text = "Debe cargar una imagen";
                lblErrorUpload.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorUpload.Style["display"] = "none";

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