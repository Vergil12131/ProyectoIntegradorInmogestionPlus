using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class publicacion4_definitivoEdicion : System.Web.UI.Page
    {
        private static List<string> imageUrls = new List<string>();
        private static List<string> planoUrls = new List<string>();
        private static List<string> videoUrls = new List<string>();
        private CnTblPropiedad pro = new CnTblPropiedad();
        private CnTblImagen timg = new CnTblImagen();
        private CnTblPlano tplano = new CnTblPlano();
        private CnTblVideo tvideo = new CnTblVideo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idPropiedad"] == null)
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");

            if (!IsPostBack)
            {
                EliminarListas();
                BindRepeaterImagen();
                BindRepeaterPlano();
                BindRepeaterVideo();
                LimpiarSession();
                CargarDatosEdicion();
            }
        }

        private void CargarDatosEdicion()
        {
            string idPropiedad = Session["idPropiedad"].ToString();


            var propiedad = pro.BuscarPropiedadXId(idPropiedad).First();
            var imagenes = timg.BuscarImagenXPropiedad(idPropiedad);
            var planos = tplano.BuscarPlanoXPropiedad(idPropiedad);
            var videos = tvideo.BuscarVideoXPropiedad(idPropiedad);

            foreach (var i in imagenes)
            {
                imageUrls.Add(i.img_url);
            }

            foreach (var i in planos)
            {
                planoUrls.Add(i.pla_url);
            }

            foreach (var i in videos)
            {
                videoUrls.Add(i.vid_url);
            }

            BindRepeaterImagen();
            BindRepeaterPlano();
            BindRepeaterVideo();
        }

        private void EliminarListas()
        {
            imageUrls.Clear();
            planoUrls.Clear();
            videoUrls.Clear();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (!ValidarFormulario())
                return;

            LimpiarSession();

            GuardarSessionImagen();
            GuardarSessionPlano();
            GuardarSessionVideo();

            Response.Redirect("publicacion5_definitivoEdicion.aspx");
        }

        private void BindRepeaterImagen()
        {
            rptImages.DataSource = imageUrls;
            rptImages.DataBind();
        }

        private void BindRepeaterPlano()
        {
            rptPlano.DataSource = planoUrls;
            rptPlano.DataBind();
        }

        private void BindRepeaterVideo()
        {
            rptVideo.DataSource = videoUrls;
            rptVideo.DataBind();
        }

        protected void btnUploadImagen_Click(object sender, EventArgs e)
        {
            if (imageUrls.Count >= 5)
            {
                lblErrorUploadImagen.Text = "Ha alcanzado el máximo número de imágenes";
                lblErrorUploadImagen.Style["display"] = "block";
                return;
            }
            else
                lblErrorUploadImagen.Style["display"] = "none";

            if (fuImagen.HasFile)
            {


                string extensiones = System.IO.Path.GetExtension(fuImagen.FileName).ToLower();
                string[] varext = { ".jpg", ".jpeg", ".png" };


                if (!varext.Contains(extensiones))
                {
                    lblErrorUploadImagen.Text = "Debe seleccionar una imagen (formatos .jpg, .jpeg, .png) con un tamaño máximo de 50Mb";
                    lblErrorUploadImagen.Style["display"] = "block";
                    return;
                }

                if (fuImagen.PostedFile.ContentLength > 52428800)
                {
                    lblErrorUploadImagen.Text = "Debe seleccionar una imagen (formatos .jpg, .jpeg, .png) con un tamaño máximo de 50Mb";
                    lblErrorUploadImagen.Style["display"] = "block";
                    return;
                }

                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(fuImagen.FileName).ToLower();

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
                    fuImagen.SaveAs(filePath);

                    // Obtener la ruta relativa del archivo
                    string relativePath = "/uploads/imagenes/" + uniqueFileName;

                    // Ahora puedes trabajar con la variable relativePath
                    imageUrls.Add(relativePath);

                    BindRepeaterImagen();
                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir
                    lblErrorUploadImagen.Text = "Se ha producido un error al guardar la imagen: " + ex.Message;
                    lblErrorUploadImagen.Style["display"] = "block";
                }
            }
        }

        protected void btnUploadPlano_Click(object sender, EventArgs e)
        {
            if (planoUrls.Count >= 3)
            {
                lblErrorUploadPlano.Text = "Ha alcanzado el máximo número de planos";
                lblErrorUploadPlano.Style["display"] = "block";
                return;
            }
            else
                lblErrorUploadPlano.Style["display"] = "none";


            if (fuPlano.HasFile)
            {


                string extensiones = System.IO.Path.GetExtension(fuPlano.FileName).ToLower();
                string[] varext = { ".jpg", ".jpeg", ".png" };


                if (!varext.Contains(extensiones))
                {
                    lblErrorUploadPlano.Text = "Debe seleccionar una imagen (formatos .jpg, .jpeg, .png) con un tamaño máximo de 50Mb";
                    lblErrorUploadPlano.Style["display"] = "block";
                    return;
                }

                if (fuPlano.PostedFile.ContentLength > 52428800)
                {
                    lblErrorUploadPlano.Text = "Debe seleccionar una imagen (formatos .jpg, .jpeg, .png) con un tamaño máximo de 50Mb";
                    lblErrorUploadPlano.Style["display"] = "block";
                    return;
                }

                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(fuPlano.FileName).ToLower();

                // Generar un nombre de archivo único
                string uniqueFileName = Guid.NewGuid().ToString() + extension;

                // Obtener la ruta física de la carpeta donde se guardará la imagen
                string folderPath = Server.MapPath("~/uploads/planos/");

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
                    fuPlano.SaveAs(filePath);

                    // Obtener la ruta relativa del archivo
                    string relativePath = "/uploads/planos/" + uniqueFileName;

                    // Ahora puedes trabajar con la variable relativePath
                    planoUrls.Add(relativePath);

                    BindRepeaterPlano();
                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir
                    lblErrorUploadPlano.Text = "Se ha producido un error al guardar el plano: " + ex.Message;
                    lblErrorUploadPlano.Style["display"] = "block";
                }
            }
        }

        protected void btnUploadVideo_Click(object sender, EventArgs e)
        {
            if (videoUrls.Count >= 2)
            {
                lblErrorUploadVideo.Text = "Ha alcanzado el máximo número de videos";
                lblErrorUploadVideo.Style["display"] = "block";
                return;
            }
            else
                lblErrorUploadVideo.Style["display"] = "none";


            if (fuVideo.HasFile)
            {


                string extensiones = System.IO.Path.GetExtension(fuVideo.FileName).ToLower();
                string[] varext = { ".mp4" };


                if (!varext.Contains(extensiones))
                {
                    lblErrorUploadVideo.Text = "Debe seleccionar una video (formatos .mp4) con un tamaño máximo de 1GB";
                    lblErrorUploadVideo.Style["display"] = "block";
                    return;
                }

                if (fuVideo.PostedFile.ContentLength > 524288000)
                {
                    lblErrorUploadVideo.Text = "Debe seleccionar un video (formatos .mp4, .avi, .mov, .wmv) con un tamaño máximo de 1GB";
                    lblErrorUploadVideo.Style["display"] = "block";
                    return;
                }

                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(fuVideo.FileName).ToLower();

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
                    fuVideo.SaveAs(filePath);

                    // Obtener la ruta relativa del archivo
                    string relativePath = "/uploads/videos/" + uniqueFileName;

                    // Ahora puedes trabajar con la variable relativePath
                    videoUrls.Add(relativePath);

                    BindRepeaterVideo();
                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir
                    lblErrorUploadVideo.Text = "Se ha producido un error al guardar el video: " + ex.Message;
                    lblErrorUploadVideo.Style["display"] = "block";
                }

            }
        }

        protected void GuardarSessionImagen()
        {
            for (int i = 0; i < imageUrls.Count; i++)
            {
                string sessionKey = "pathImagen" + (i + 1);
                Session[sessionKey] = imageUrls[i];
            }
        }

        protected void GuardarSessionPlano()
        {
            for (int i = 0; i < planoUrls.Count; i++)
            {
                string sessionKey = "pathPlano" + (i + 1);
                Session[sessionKey] = planoUrls[i];
            }
        }

        protected void GuardarSessionVideo()
        {
            for (int i = 0; i < videoUrls.Count; i++)
            {
                string sessionKey = "pathVideo" + (i + 1);
                Session[sessionKey] = videoUrls[i];
            }
        }


        protected void LimpiarSession()
        {
            //Limpiar imagenes, planos, videos
            for (int i = 0; i < 20; i++)
            {
                string sessionKeyImg = "pathImagen" + (i + 1);
                string sessionKeyPlano = "pathPlano" + (i + 1);
                string sessionKeyVideo = "pathVideo" + (i + 1);


                Session.Remove(sessionKeyImg);
                Session.Remove(sessionKeyPlano);
                Session.Remove(sessionKeyVideo);
            }
        }

        protected void rptImages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string urlToDelete = e.CommandArgument.ToString();
                imageUrls.Remove(urlToDelete);
                EliminarArchivo("~" + urlToDelete);
                BindRepeaterImagen();
            }
        }

        protected void rptPlano_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string urlToDelete = e.CommandArgument.ToString();
                planoUrls.Remove(urlToDelete);
                EliminarArchivo("~" + urlToDelete);
                BindRepeaterPlano();
            }
        }

        protected void rptVideo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string urlToDelete = e.CommandArgument.ToString();
                videoUrls.Remove(urlToDelete);
                EliminarArchivo("~" + urlToDelete);
                BindRepeaterVideo();
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

        protected bool ValidarFormulario()
        {
            bool ret = true;

            if (imageUrls.Count() < 3)
            {
                lblErrorUploadImagen.Text = "Debe subir al menos 3 imágenes";
                lblErrorUploadImagen.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorUploadImagen.Style["display"] = "none";



            return ret;
        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("publicacion3_definitivoEdicion.aspx");
        }
    }
}