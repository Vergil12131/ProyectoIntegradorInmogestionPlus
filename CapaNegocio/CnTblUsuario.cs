using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class JoinUsuarioPerfil
    {
        public tbl_usuario Usuario { get; set; }
        public tbl_perfil Perfil { get; set; }
        public string NombreCompleto { get; set; }
        public int IdUsuario { get; set; }
    }

    public class CnTblUsuario
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<JoinUsuarioPerfil> SeleccionarUsuariosActivos()
        {
            var usuarios = (from usu in dc.tbl_usuario
                            join perf in dc.tbl_perfil on usu.perf_id equals perf.perf_id
                            where usu.usu_estado == 'A'
                            select new JoinUsuarioPerfil
                            {
                                Usuario = usu,
                                Perfil = perf,
                                NombreCompleto = (usu.usu_primer_nombre + " " + usu.usu_segundo_nombre + " " + usu.usu_primer_apellido + " " + usu.usu_segundo_apellido),
                                IdUsuario = usu.usu_id
                            }).ToList();

            return usuarios;
        }

        public void RegistrarUsuario(string nombres, string apellidos, string cedula, string correo, string direccion, string fechaNac, string pass, string telefono, string perfil, string inmobiliaria)
        {
            string[] nomArray = nombres.Split(' ');
            string[] apeArray = apellidos.Split(' ');

            if (int.TryParse(inmobiliaria, out int inmId))
            {
                if (inmId >= 1)
                {
                    dc.registrar_usuario(nomArray[0], nomArray[1], apeArray[0], apeArray[1], correo, cedula, direccion, DateTime.Parse(fechaNac), pass, telefono, Convert.ToInt32(perfil), Convert.ToInt32(inmobiliaria));
                }
                else
                {
                    dc.registrar_usuario(nomArray[0], nomArray[1], apeArray[0], apeArray[1], correo, cedula, direccion, DateTime.Parse(fechaNac), pass, telefono, Convert.ToInt32(perfil), null);
                }
            }
            else
            {
                dc.registrar_usuario(nomArray[0], nomArray[1], apeArray[0], apeArray[1], correo, cedula, direccion, DateTime.Parse(fechaNac), pass, telefono, Convert.ToInt32(perfil), null);
            }


        }

        public void EditarUsuarioMant(string id, string nombres, string apellidos, string cedula, string correo, string direccion, string fechaNac, string telefono, string perfil, string inmobiliaria)
        {
            int idUsu = Convert.ToInt32(id);
            string[] nomArray = nombres.Split(' ');
            string[] apeArray = apellidos.Split(' ');

            dc.editar_usuario_mant(idUsu, nomArray[0], nomArray[1], apeArray[0], apeArray[1], correo, cedula, direccion, DateTime.Parse(fechaNac), telefono, Convert.ToInt32(perfil), Convert.ToInt32(inmobiliaria));
        }

        public void EliminarUsuario(string id)
        {
            int idUsu = Convert.ToInt32(id);
            dc.eliminar_usuario(idUsu);
        }

        public List<tbl_usuario> BuscarUsuarioXCorreo(string mail)
        {
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_estado == 'A' && usu.usu_correo == mail
                           select usu).ToList();

            return usuario;
        }

        public List<tbl_usuario> BuscarUsuarioXId(string id)
        {
            int usuId = Convert.ToInt32(id);

            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_estado == 'A' && usu.usu_id == usuId
                           select usu).ToList();

            return usuario;
        }

        public List<tbl_usuario> BuscarUsuarioXCorreoYPass(string mail, string pass)
        {
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_estado == 'A' && usu.usu_correo == mail && usu.usu_contra == dc.hashearPass(pass)
                           select usu).ToList();

            return usuario;
        }

        public List<CapaDatos.tbl_usuario> BuscarUsuarioXCedula(string ced)
        {
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_estado == 'A' && usu.usu_cedula == ced
                           select usu).ToList();

            return usuario;
        }

        public int RetornarIntentos(int id)
        {
            return (int)dc.recibir_intentos(id);
        }

        public void RestaurarIntentos(int id)
        {
            dc.restaurar_intentos(id);
        }

        public void RestarIntentos(int id)
        {
            dc.restar_intentos(id);
        }

        ///////////////////////////RECUPERAR CONTRA///////////////////////////
        ///
        public bool EnviarCodigoRecuperacion(string correo, out string codigo)
        {

            var usuario = (from u in dc.tbl_usuario
                           where u.usu_correo == correo
                           select u).FirstOrDefault();

            if (usuario != null)
            {
                codigo = GenerarCodigoRecuperacion();

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.Port = 587;
                client.Credentials = new NetworkCredential("na0miprosan@gmail.com", "xqocyxqhahanueqq");
                client.EnableSsl = true;

                MailMessage message = new MailMessage();
                message.From = new MailAddress("na0miprosan@gmail.com");
                message.To.Add(correo);
                message.Subject = "Código de recuperación de contraseña";
                message.Body = $"Tu código de recuperación es: {codigo}";

                try
                {
                    client.Send(message);
                    return true;
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error enviando correo: {ex.Message}");
                    codigo = null;
                    return false;
                }
            }

            codigo = null;
            return false;
        }

        public bool CambiarContraseña(string nuevaContraseña, string correo)
        {
            var usuario = (from u in dc.tbl_usuario
                           where u.usu_estado == 'A'
                           && u.usu_correo == u.usu_correo
                           select u).FirstOrDefault();

            if (usuario != null)
            {
                usuario.usu_contra = dc.hashearPass(nuevaContraseña);
                dc.SubmitChanges();
                return true;
            }

            return false;
        }

        private string GenerarCodigoRecuperacion()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        public bool VerificarCodigoRecuperacion(string correo, string codigo)
        {
            var usuario = (from u in dc.tbl_usuario
                           where u.usu_correo == correo
                           select u).FirstOrDefault();

            if (usuario != null && codigo == GenerarCodigoRecuperacion())
            {
                return true;
            }

            return false;
        }

        public bool RegistrarUsuario(
            string pnombre,
            string snombre,
            string papellido,
            string sapellido,
            string correo,
            string cedula,
            string direccion,
            DateTime fechaNac,
            string password,
            string telefono,
            int perfil)
        {
            try
            {
                dc.registrar_usuario(
                    pnombre,
                    snombre,
                    papellido,
                    sapellido,
                    correo,
                    cedula,
                    direccion,
                    fechaNac,
                    password,
                    telefono,
                    perfil,
                    null);
                return true;
            }
            catch (Exception ex)
            {
                // Aquí puedes manejar el error de acuerdo a tus necesidades, como loguearlo
                return false;
            }

        }
    }
}
