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
    public partial class ADM_plano : System.Web.UI.Page
    {
        private CnTblPlano img = new CnTblPlano();
        private CnTblPropiedad pro = new CnTblPropiedad();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarPlanos();
                CargarPropiedades();
            }
        }

        protected void CargarPlanos()
        {
            var planos = img.ListarPlanosComp();

            GridView1.DataSource = planos;
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

            if (Session["pathPlano"] != null)
                path = Session["pathPlano"].ToString();
            else
                return;

            img.RegistrarPlano(path, ddlpropiedad.SelectedValue);

            CargarPlanos();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Plano agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";

        }

        public void Limpiar()
        {
            hiddenFieldId.Value = "";
            ddlpropiedad.SelectedValue = "0";
            Session.Remove("pathPlano");
            Image1.ImageUrl = "~/source/images/mantenimiento/Planos/Camaara.jpg";

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

            var plano = img.BuscarPlanoXId(hiddenFieldId.Value).First();
            string path = Session["pathPlano"].ToString();

            EliminarArchivo(plano.pla_url);

            img.EditarPlano(hiddenFieldId.Value, path, ddlpropiedad.SelectedValue);

            CargarPlanos();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Plano modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";

            Response.Redirect("~/ADM_plano.aspx");
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;


            img.EliminarPlano(hiddenFieldId.Value);

            CargarPlanos();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Plano eliminada con éxito";
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

            var plano = img.BuscarPlanoXId(id).First();

            hiddenFieldId.Value = plano.pla_id.ToString();

            Session["pathPlano"] = plano.pla_url;
            Image1.ImageUrl = plano.pla_url;
            ddlpropiedad.SelectedValue = plano.pro_id.ToString();
        }

        protected void btn_visualizar_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {


                string extensiones = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string[] varext = { ".jpg", ".jpeg", ".png" };


                if (!varext.Contains(extensiones))
                {
                    lblErrorUpload.Text = "Debe seleccionar una plano (formatos .jpg, .jpeg, .png) con un tamaño máximo de 1GB";
                    lblErrorUpload.Style["display"] = "block";
                    return;
                }

                if (FileUpload1.PostedFile.ContentLength > 1000000)
                {
                    lblErrorUpload.Text = "Debe seleccionar una plano (formatos .jpg, .jpeg, .png) con un tamaño máximo de 1GB";
                    lblErrorUpload.Style["display"] = "block";
                    return;
                }

                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                // Generar un nombre de archivo único
                string uniqueFileName = Guid.NewGuid().ToString() + extension;

                // Obtener la ruta física de la carpeta donde se guardará la plano
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
                    FileUpload1.SaveAs(filePath);

                    // Obtener la ruta relativa del archivo
                    string relativePath = "~/uploads/planos/" + uniqueFileName;

                    // Ahora puedes trabajar con la variable relativePath
                    Image1.ImageUrl = relativePath;
                    Session["pathPlano"] = relativePath;

                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir
                    lblErrorUpload.Text = "Se ha producido un error al guardar la plano: " + ex.Message;
                    lblErrorUpload.Style["display"] = "block";
                }

                //if (string.IsNullOrEmpty(hiddenFieldId.Value))
                //{

                //    // Crear la ruta completa del archivo
                //    string filePath = folderPath + fileName;

                //    // Guardar el archivo en la ruta especificada
                //    FileUpload1.SaveAs(filePath);

                //    // Obtener la ruta relativa del archivo
                //    string relativePath = "~/uploads/planos/" + fileName;

                //    // Ahora puedes trabajar con la variable relativePath
                //    Image1.ImageUrl = relativePath;
                //    Session["pathPlano"] = relativePath;
                //}
                //else
                //{
                //    var plano = img.BuscarPlanoXId(hiddenFieldId.Value).First();

                //    string rel = "~/uploads/planos/";
                //    fileName = (plano.pla_url).Substring(rel.Length);

                //    // Crear la ruta completa del archivo
                //    string filePath = folderPath + fileName;

                //    // Guardar el archivo en la ruta especificada
                //    FileUpload1.SaveAs(filePath);

                //    // Obtener la ruta relativa del archivo
                //    string relativePath = "~/uploads/planos/" + fileName;

                //    // Ahora puedes trabajar con la variable relativePath
                //    Image1.ImageUrl = relativePath;
                //    Session["pathPlano"] = relativePath;
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

            if (Session["pathPlano"] == null)
            {
                lblErrorUpload.Text = "Debe cargar una plano";
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