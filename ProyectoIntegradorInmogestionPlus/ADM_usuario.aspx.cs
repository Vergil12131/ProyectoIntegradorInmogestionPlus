using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_usuario : System.Web.UI.Page
    {
        private CnTblPerfil perf = new CnTblPerfil();
        private CnTblUsuario usu = new CnTblUsuario();
        private CnTblInmueble inm = new CnTblInmueble();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();
        private ValidacionesUsuario vUsu = new ValidacionesUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
                CargarPerfiles();
                CargarFecha();
                CargarInmobiliarias();
            }
        }

        protected void CargarPerfiles()
        {
            var listPerf = perf.ListarPerfiles();

            ddlPerfil.DataSource = listPerf;
            ddlPerfil.DataValueField = "perf_id";
            ddlPerfil.DataTextField = "perf_nombre";
            ddlPerfil.DataBind();
            ddlPerfil.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        public void CargarUsuarios()
        {
            var usuarios = usu.SeleccionarUsuariosActivos();

            GridView1.DataSource = usuarios;
            GridView1.DataBind();
        }

        public void CargarInmobiliarias()
        {
            var inmobiliarias = inm.ListarInmuebles();

            ddlInmobiliaria.DataSource = inmobiliarias;
            ddlInmobiliaria.DataValueField = "inm_id";
            ddlInmobiliaria.DataTextField = "inm_nombre";
            ddlInmobiliaria.DataBind();
            ddlInmobiliaria.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
            ddlInmobiliaria.Items.Insert(1, new ListItem("Sin Inmobiliaria (Cliente/Administrador)", "-1"));
        }

        protected void CargarFecha()
        {
            DateTime fechaMax = DateTime.Now.AddYears(-18);
            txt_fecha_nacimiento.Attributes["min"] = "1900-01-01";
            txt_fecha_nacimiento.Attributes["max"] = fechaMax.ToString("yyyy-MM-dd");
        }



        protected void LimpiarUsuario()
        {
            txt_nombres.Text = txt_apellidos.Text = txt_cedula.Text = txt_email.Text = txt_direccion.Text = txt_fecha_nacimiento.Text = txt_password.Text = txt_telefono.Text = hiddenFieldId.Value = "";
            ddlPerfil.SelectedValue = "0";
            ddlInmobiliaria.SelectedValue = "0";

            lblErrorNombres.Style["display"] = "none";
            lblErrorApellidos.Style["display"] = "none";
            lblErrorCedula.Style["display"] = "none";
            lblErrorCorreo.Style["display"] = "none";
            lblErrorDireccion.Style["display"] = "none";
            lblErrorFechaNacimiento.Style["display"] = "none";
            lblErrorPass.Style["display"] = "none";
            lblErrorTelefono.Style["display"] = "none";
            lblErrorPerfil.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (!ValidarRegistro())
                return;

            usu.RegistrarUsuario(txt_nombres.Text.Trim(), txt_apellidos.Text.Trim(), txt_cedula.Text.Trim(), txt_email.Text.Trim(), txt_direccion.Text.Trim(), txt_fecha_nacimiento.Text, txt_password.Text, txt_telefono.Text.Trim(), ddlPerfil.SelectedValue, ddlInmobiliaria.SelectedValue);

            CargarUsuarios();
            LimpiarUsuario();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Usuario agregado con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarEditar()) 
                return;

            string inmobiliaria;

            if (ddlInmobiliaria.SelectedValue == "-1")
                inmobiliaria = "null";
            else
                inmobiliaria = ddlInmobiliaria.SelectedValue;


            usu.EditarUsuarioMant(
                hiddenFieldId.Value,
                txt_nombres.Text.Trim(), 
                txt_apellidos.Text.Trim(), 
                txt_cedula.Text.Trim(), 
                txt_email.Text.Trim(), 
                txt_direccion.Text.Trim(), 
                txt_fecha_nacimiento.Text, 
                txt_telefono.Text.Trim(), 
                ddlPerfil.SelectedValue,
                inmobiliaria);

            CargarUsuarios();
            LimpiarUsuario();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Usuario editado con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarEliminar())
                return;

            usu.EliminarUsuario(hiddenFieldId.Value);

            CargarUsuarios();
            LimpiarUsuario();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Usuario eliminado con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            LimpiarUsuario();
        }

        protected void btnSeleccionUsuario_Click(object sender, EventArgs e)
        {
            LimpiarUsuario();
            string id = (sender as Button).CommandArgument;

            var usuario = usu.BuscarUsuarioXId(id).First();

            hiddenFieldId.Value = usuario.usu_id.ToString();
            txt_nombres.Text = usuario.usu_primer_nombre + " " + usuario.usu_segundo_nombre;
            txt_apellidos.Text = usuario.usu_primer_apellido + " " + usuario.usu_segundo_apellido;
            txt_cedula.Text = usuario.usu_cedula;
            txt_email.Text = usuario.usu_correo;
            txt_telefono.Text = usuario.usu_telefono;
            txt_direccion.Text = usuario.usu_direccion;
            txt_fecha_nacimiento.Text = ((DateTime)usuario.usu_fecha_nacimiento).ToString("yyyy-MM-dd");
            ddlPerfil.SelectedValue = usuario.perf_id.ToString();

            if (usuario.inm_id != null)
                ddlInmobiliaria.SelectedValue = usuario.inm_id.ToString();
            else
                ddlInmobiliaria.SelectedValue = "-1";
        }



        ////VALIDACIONES

        public bool ValidarRegistro()
        {
            bool ret = true;
            var verCed = usu.BuscarUsuarioXCedula(txt_cedula.Text);
            var verCorreo = usu.BuscarUsuarioXCorreo(txt_email.Text);

            if (!vUsu.ValidarNombreApellido(txt_nombres.Text))
            {
                lblErrorNombres.Text = "Debe insertar ambos nombres";
                lblErrorNombres.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorNombres.Style["display"] = "none";


            if (!vUsu.ValidarNombreApellido(txt_apellidos.Text))
            {
                lblErrorApellidos.Text = "Debe insertar ambos apellidos";
                lblErrorApellidos.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorApellidos.Style["display"] = "none";


            if (!vGen.ValidarNumeroEnteroPositivo(txt_cedula.Text))
            {
                lblErrorCedula.Text = "Debe ingresar una cédula válida (logitud 10 números)";
                lblErrorCedula.Style["display"] = "block";
                ret = false;
            }
            else if (!vUsu.ValidarCedula(txt_cedula.Text))
            {
                lblErrorCedula.Text = "Debe ingresar una cédula válida (logitud 10 números)";
                lblErrorCedula.Style["display"] = "block";
                ret = false;
            }
            else if (verCed.Count() > 0)
            {
                lblErrorCedula.Text = "Ya existe un usuario registrado con esa cédula";
                lblErrorCedula.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCedula.Style["display"] = "none";


            if (!vUsu.ValidarCorreo(txt_email.Text))
            {
                lblErrorCorreo.Text = "Debe ingresar un correo válido";
                lblErrorCorreo.Style["display"] = "block";
                ret = false;
            }
            else if (verCorreo.Count() > 0)
            {
                lblErrorCorreo.Text = "Ya existe un usuario registrado con ese correo";
                lblErrorCorreo.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCorreo.Style["display"] = "none";



            if (!vGen.ValidarCadenaNula(txt_telefono.Text))
            {
                lblErrorTelefono.Text = "Debe ingresar un teléfono válido";
                lblErrorTelefono.Style["display"] = "block";
                ret = false;
            }
            else if (!vGen.ValidarNumeroEnteroPositivo(txt_telefono.Text))
            {
                lblErrorTelefono.Text = "Debe ingresar un teléfono válido";
                lblErrorTelefono.Style["display"] = "block";
                ret = false;
            }
            else if (!vGen.IsInteger(txt_telefono.Text))
            {
                lblErrorTelefono.Text = "Debe ingresar un teléfono válido";
                lblErrorTelefono.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorTelefono.Style["display"] = "none";



            if (!vGen.ValidarCadenaNula(txt_direccion.Text))
            {
                lblErrorDireccion.Text = "Debe ingresar una dirección";
                lblErrorDireccion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDireccion.Style["display"] = "none";



            if (!vGen.ValidarCadenaNula(txt_fecha_nacimiento.Text))
            {
                lblErrorFechaNacimiento.Text = "Debe seleccionar una fecha de nacimiento";
                lblErrorFechaNacimiento.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorFechaNacimiento.Style["display"] = "none";




            if (!vGen.ValidarDdl(ddlPerfil.SelectedValue))
            {
                lblErrorPerfil.Text = "Debe seleccionar un perfil";
                lblErrorPerfil.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorPerfil.Style["display"] = "none";



            if (!vUsu.ValidarPassword(txt_password.Text))
            {
                lblErrorPass.Text = "Debe ingresar una contraseña con al menos 8 caracteres compuesta de una mezcla de máyúsculas, minúsculas, números y caracteres especiales";
                lblErrorPass.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorPass.Style["display"] = "none";


            return ret;
        }

        public bool ValidarEditar()
        {
            bool ret = true;
            var verCed = usu.BuscarUsuarioXCedula(txt_cedula.Text);
            var verCorreo = usu.BuscarUsuarioXCorreo(txt_email.Text);

            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar un usuario primero";
                lbl_mensaje.Style["display"] = "block";
                lbl_mensaje.Attributes["class"] = "text-danger";
                return false;
            }
            else
                lbl_mensaje.Style["display"] = "none";

            if (!vUsu.ValidarNombreApellido(txt_nombres.Text))
            {
                lblErrorNombres.Text = "Debe insertar ambos nombres";
                lblErrorNombres.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorNombres.Style["display"] = "none";


            if (!vUsu.ValidarNombreApellido(txt_apellidos.Text))
            {
                lblErrorApellidos.Text = "Debe insertar ambos apellidos";
                lblErrorApellidos.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorApellidos.Style["display"] = "none";


            if (!vGen.ValidarNumeroEnteroPositivo(txt_cedula.Text))
            {
                lblErrorCedula.Text = "Debe ingresar una cédula válida (logitud 10 números)";
                lblErrorCedula.Style["display"] = "block";
                ret = false;
            }
            else if (!vUsu.ValidarCedula(txt_cedula.Text))
            {
                lblErrorCedula.Text = "Debe ingresar una cédula válida (logitud 10 números)";
                lblErrorCedula.Style["display"] = "block";
                ret = false;
            }
            else if (verCed.Count() > 1)
            {
                lblErrorCedula.Text = "Ya existe un usuario registrado con esa cédula";
                lblErrorCedula.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCedula.Style["display"] = "none";


            if (!vUsu.ValidarCorreo(txt_email.Text))
            {
                lblErrorCorreo.Text = "Debe ingresar un correo válido";
                lblErrorCorreo.Style["display"] = "block";
                ret = false;
            }
            else if (verCorreo.Count() > 1)
            {
                lblErrorCorreo.Text = "Ya existe un usuario registrado con ese correo";
                lblErrorCorreo.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCorreo.Style["display"] = "none";



            if (!vGen.ValidarCadenaNula(txt_telefono.Text))
            {
                lblErrorTelefono.Text = "Debe ingresar un teléfono válido";
                lblErrorTelefono.Style["display"] = "block";
                ret = false;
            }
            else if (!vGen.ValidarNumeroEnteroPositivo(txt_telefono.Text))
            {
                lblErrorTelefono.Text = "Debe ingresar un teléfono válido";
                lblErrorTelefono.Style["display"] = "block";
                ret = false;
            }
            else if (!vGen.IsInteger(txt_telefono.Text))
            {
                lblErrorTelefono.Text = "Debe ingresar un teléfono válido";
                lblErrorTelefono.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorTelefono.Style["display"] = "none";



            if (!vGen.ValidarCadenaNula(txt_direccion.Text))
            {
                lblErrorDireccion.Text = "Debe ingresar una dirección";
                lblErrorDireccion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDireccion.Style["display"] = "none";



            if (!vGen.ValidarCadenaNula(txt_fecha_nacimiento.Text))
            {
                lblErrorFechaNacimiento.Text = "Debe seleccionar una fecha de nacimiento";
                lblErrorFechaNacimiento.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorFechaNacimiento.Style["display"] = "none";



            if (!vGen.ValidarDdl(ddlPerfil.SelectedValue))
            {
                lblErrorPerfil.Text = "Debe seleccionar un perfil";
                lblErrorPerfil.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorPerfil.Style["display"] = "none";




            return ret;
        }

        protected bool ValidarEliminar()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar un usuario primero";
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