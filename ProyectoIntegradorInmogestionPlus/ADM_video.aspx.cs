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
    public partial class ADM_video : System.Web.UI.Page
    {
        private CnTblVideo vid = new CnTblVideo();
        private CnTblPropiedad pro = new CnTblPropiedad();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarVideos();
                CargarPropiedades();
            }
        }

        protected void CargarVideos()
        {
            var videos = vid.ListarVideosComp();

            GridView1.DataSource = videos;
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

            if (Session["pathVideo"] != null)
                path = Session["pathVideo"].ToString();
            else
                return;

            vid.RegistrarVideo(path, ddlpropiedad.SelectedValue);

            CargarVideos();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Video agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";

        }

        public void Limpiar()
        {
            hiddenFieldId.Value = "";
            ddlpropiedad.SelectedValue = "0";
            Session.Remove("pathVideo");
            videoPreview.Text = "";

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

            var video = vid.BuscarVideoXId(hiddenFieldId.Value).First();
            string path = Session["pathVideo"].ToString();

            EliminarArchivo(video.vid_url);

            vid.EditarVideo(hiddenFieldId.Value, path, ddlpropiedad.SelectedValue);

            CargarVideos();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Video modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";

            Response.Redirect("~/ADM_video.aspx");
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;


            vid.EliminarVideo(hiddenFieldId.Value);

            CargarVideos();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Video eliminada con éxito";
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

            var video = vid.BuscarVideoXId(id).First();

            hiddenFieldId.Value = video.vid_id.ToString();

            Session["pathVideo"] = video.vid_url;
            videoPreview.Text= GenerarStringVideo(video.vid_url);
            ddlpropiedad.SelectedValue = video.pro_id.ToString();
        }

        protected void btn_visualizar_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {


                string extensiones = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string[] varext = { ".mp4"};


                if (!varext.Contains(extensiones))
                {
                    lblErrorUpload.Text = "Debe seleccionar una video (formatos .mp4) con un tamaño máximo de 1GB";
                    lblErrorUpload.Style["display"] = "block";
                    return;
                }

                if (FileUpload1.PostedFile.ContentLength > 524288000)
                {
                    lblErrorUpload.Text = "Debe seleccionar un video (formatos .mp4, .avi, .mov, .wmv) con un tamaño máximo de 1GB";
                    lblErrorUpload.Style["display"] = "block";
                    return;
                }

                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                // Generar un nombre de archivo único
                string uniqueFileName = Guid.NewGuid().ToString() + extension;

                // Obtener la ruta física de la carpeta donde se guardará la video
                string folderPath = Server.MapPath("~/uploads/videos/");

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
                    string relativePath = "~/uploads/videos/" + uniqueFileName;

                    // Ahora puedes trabajar con la variable relativePath
                    
                    videoPreview.Text = GenerarStringVideo(relativePath);
                    Session["pathVideo"] = relativePath;

                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir
                    lblErrorUpload.Text = "Se ha producido un error al guardar la video: " + ex.Message;
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

        public string GenerarStringVideo(string rel)
        {
            string b = rel.Substring(1);
            string videoTag = $"<video id=\"myVideo\" class=\"video-preview\" controls><source src=\"{b}\" type=\"video/mp4\"></video>";
            return videoTag;
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

            if (Session["pathVideo"] == null)
            {
                lblErrorUpload.Text = "Debe cargar una video";
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