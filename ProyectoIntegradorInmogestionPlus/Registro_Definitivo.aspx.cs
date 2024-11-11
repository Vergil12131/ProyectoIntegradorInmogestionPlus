using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class Registro_Definitivo : System.Web.UI.Page
    {
        private CnTblUsuario usu = new CnTblUsuario();
        private ValidacionesUsuario varU = new ValidacionesUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "1")
                    Response.Redirect("~/ADM_usuario.aspx");
                else
                    Response.Redirect("~/pagina_principal.aspx");
            }
            else if (!IsPostBack)
            {
                CargarFecha();
            }
        }

        protected void CargarFecha()
        {
            DateTime fechaMax = DateTime.Now.AddYears(-18);
            txt_fecha_nacimiento.Attributes["min"] = "1900-01-01";
            txt_fecha_nacimiento.Attributes["max"] = fechaMax.ToString("yyyy-MM-dd");
        }

        protected void btn_volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio_Sesion_Definitivo.aspx");
        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            // Limpiar mensajes de error
            lbl_nombres.Text = "";
            lbl_apellidos.Text = "";
            lbl_cedula.Text = "";
            lbl_email.Text = "";
            lbl_direccion.Text = "";
            lbl_fecha_nacimiento.Text = "";
            lbl_telefono.Text = "";
            lbl_contra.Text = "";
            lbl_confirmar_contra.Text = "";
            lbl_chekbox.Text = "";

            bool isValid = true;

            var verCed = usu.BuscarUsuarioXCedula(txt_cedula.Text);
            var verCorreo = usu.BuscarUsuarioXCorreo(txt_email.Text);

            // Validar nombres
            string nombres = txt_nombres.Text.Trim();
            string[] nombreParts = nombres.Split(' ');
            if (nombreParts.Length != 2 || nombreParts.Any(part => !Regex.IsMatch(part, @"^[a-zA-Z]+$")))
            {
                lbl_nombres.Text = "Ingrese dos nombres válidos separados por un espacio.";
                isValid = false;
            }
            string pnombre = nombreParts.Length > 0 ? nombreParts[0] : "";
            string snombre = nombreParts.Length > 1 ? nombreParts[1] : "";

            // Validar apellidos
            string apellidos = txt_apellidos.Text.Trim();
            string[] apellidoParts = apellidos.Split(' ');
            if (apellidoParts.Length != 2 || apellidoParts.Any(part => !Regex.IsMatch(part, @"^[a-zA-Z]+$")))
            {
                lbl_apellidos.Text = "Ingrese dos apellidos válidos separados por un espacio.";
                isValid = false;
            }
            string papellido = apellidoParts.Length > 0 ? apellidoParts[0] : "";
            string sapellido = apellidoParts.Length > 1 ? apellidoParts[1] : "";

            // Validar cédula
            string cedula = txt_cedula.Text.Trim();
            //if (cedula.Length != 10 || !Regex.IsMatch(cedula, @"^\d{10}$"))
            //{
            //    lbl_cedula.Text = "Ingrese una cédula válida de 10 dígitos.";
            //    isValid = false;
            if (!varU.ValidarCedula(cedula))
            {
                lbl_cedula.Text = "Ingrese una cédula válida de 10 dígitos.";
                isValid = false;
            }
            else if (verCed.Count() > 0)
            {
                lbl_cedula.Text = "Ya existe un usuario registrado con esa cédula";
            }

            // Validar email
            string correo = txt_email.Text.Trim();
            if (!Regex.IsMatch(correo, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                lbl_email.Text = "Ingrese un email válido.";
                isValid = false;
            }
            else if (verCorreo.Count() > 0)
            {
                lbl_email.Text = "Ya existe un usuario registrado con ese correo";
                lbl_email.Style["display"] = "block";
            }

            // Validar dirección
            string direccion = txt_direccion.Text.Trim();
            if (string.IsNullOrWhiteSpace(direccion))
            {
                lbl_direccion.Text = "Ingrese una dirección válida.";
                isValid = false;
            }

            // Validar fecha de nacimiento
            DateTime fechaNac;
            if (!DateTime.TryParse(txt_fecha_nacimiento.Text, out fechaNac))
            {
                lbl_fecha_nacimiento.Text = "Ingrese una fecha de nacimiento válida.";
                isValid = false;
            }

            // Validar teléfono
            string telefono = txt_telefono.Text.Trim();
            if (telefono.Length != 10 || !Regex.IsMatch(telefono, @"^\d{10}$"))
            {
                lbl_telefono.Text = "Ingrese un teléfono válido de 10 dígitos.";
                isValid = false;
            }

            // Validar contraseña
            string password = txt_contraseña.Text.Trim();
            string confirmarPassword = TextBox1.Text.Trim();
            if (password != confirmarPassword)
            {
                lbl_contra.Text = "Las contraseñas no coinciden.";
                lbl_confirmar_contra.Text = "Las contraseñas no coinciden.";
                isValid = false;
            }
            else if (!Regex.IsMatch(password, @"^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}:;<>,.?~]).{8,}$"))
            {
                lbl_confirmar_contra.Text = "La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial.";
                isValid = false;
            }

            // Validar CheckBoxes
            if (!CheckBox1.Checked || !CheckBox2.Checked)
            {
                // Mostrar mensaje de error (puedes añadir un Label para mostrar este mensaje si lo prefieres)
                lbl_chekbox.Text = "Debe aceptar los términos y condiciones y la politica de privacidad";
                isValid = false;
            }

            if (!isValid)
            {
                // Si hay errores, no continuar con el registro
                return;
            }

            //// Si todas las validaciones pasan, proceder con el registro
            //tbl_usuario usuario = new tbl_usuario();

            int perfil = 2;

            bool resultado = usu.RegistrarUsuario(pnombre, snombre, papellido, sapellido, correo, cedula, direccion, fechaNac, password, telefono, perfil);

            if (resultado)
            {
                // Registro exitoso
                lbl_succes.Text = "Usuario registrado exitosamente";
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");
            }
            else
            {
                // Error en el registro
                lbl_succes.Text = "Hubo un error al registrar el usuario";
            }


        }

    }
}