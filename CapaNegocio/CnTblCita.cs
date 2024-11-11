using CapaDatos;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblCita
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();
        private static List<tbl_cita> citas = new List<tbl_cita>();

        public List<tbl_cita> ObtenerCitasPorFecha(DateTime fecha)
        {
            List<tbl_cita> citasDelDia = new List<tbl_cita>();

            string fechaStr = fecha.ToString("yyyy-MM-dd");

            var propiedadesActivas = (from p in dc.tbl_propiedad
                                      where p.pro_estado == 'A'
                                      select p.pro_id).ToList();

            foreach (tbl_cita c in citas)
            {
                if (c.cit_fecha_cita == fechaStr && propiedadesActivas.Contains(c.pro_id))
                {
                    citasDelDia.Add(c);
                }
            }

            return citasDelDia;
        }


        public List<tbl_cita> ObtenerTodasLasCitas()
        {
            var usuariosActivos = (from usu in dc.tbl_usuario
                                   where usu.usu_estado == 'A'
                                   select new
                                   {
                                       usu.usu_id,
                                       NombreCompleto = usu.usu_primer_nombre + " " +
                                                        usu.usu_segundo_nombre + " " +
                                                        usu.usu_primer_apellido + " " +
                                                        usu.usu_segundo_apellido
                                   }).ToDictionary(u => u.usu_id, u => u.NombreCompleto);

            var propiedades = (from p in dc.tbl_propiedad
                               where p.pro_estado == 'A'
                               select new
                               {
                                   p.pro_id,
                                   p.pro_titulo
                               }).ToDictionary(p => p.pro_id, p => p.pro_titulo);
            // Obtén todas las citas desde la base de datos
            //var citasDatos = (from c in dc.tbl_cita
            //                  select new tbl_cita
            //                  {
            //                      cit_id = c.cit_id,
            //                      cit_estado = c.cit_estado,
            //                      cit_descripcion = c.cit_descripcion,
            //                      cit_fecha_cita = c.cit_fecha_cita.HasValue ? c.cit_fecha_cita.Value.ToString("yyyy-MM-dd") : null,
            //                      cit_hora = c.cit_hora_cita.HasValue ? c.cit_hora_cita.Value.ToString(@"hh\:mm") : null,
            //                      NombreUsuario = usuariosActivos.ContainsKey(c.usu_id.HasValue ? c.usu_id.Value : 0)
            //        ? usuariosActivos[c.usu_id.Value]
            //        : "Desconocido",
            //                      NombrePropiedad = propiedades.ContainsKey(c.pro_id.HasValue ? c.pro_id.Value : 0)
            //        ? propiedades[c.pro_id.Value]
            //        : "Desconocido"
            //                  }).ToList();

            var citasDatos = (from c in dc.tbl_cita
                              where c.cit_estado != "I"
                              select new
                              {
                                  c.cit_id,
                                  c.cit_estado,
                                  c.cit_descripcion,
                                  c.cit_fecha_cita,
                                  c.cit_hora_cita,
                                  c.usu_id,
                                  c.pro_id
                              }).AsEnumerable() // Trae los datos a memoria
                  .Select(c => new tbl_cita
                  {
                      cit_id = c.cit_id,
                      cit_estado = c.cit_estado,
                      cit_descripcion = c.cit_descripcion,
                      cit_fecha_cita = c.cit_fecha_cita.HasValue ? c.cit_fecha_cita.Value.ToString("yyyy-MM-dd") : null,
                      cit_hora = c.cit_hora_cita.HasValue ? c.cit_hora_cita.Value.ToString(@"hh\:mm") : null,
                      NombreUsuario = usuariosActivos.ContainsKey(c.usu_id.HasValue ? c.usu_id.Value : 0)
                          ? usuariosActivos[c.usu_id.Value]
                          : "Desconocido",
                      NombrePropiedad = propiedades.ContainsKey(c.pro_id.HasValue ? c.pro_id.Value : 0)
                          ? propiedades[c.pro_id.Value]
                          : "Desconocido",
                      usu_id = Convert.ToInt32(c.usu_id),
                      pro_id = Convert.ToInt32(c.pro_id)
                     
                  }).ToList();



            // Devuelve la lista de citas
            return citasDatos;
        }


        public List<tbl_cita> ObtenerCitasXAgente(string idAgente)
        {
            var usuariosActivos = (from usu in dc.tbl_usuario
                                   where usu.usu_estado == 'A'
                                   select new
                                   {
                                       usu.usu_id,
                                       NombreCompleto = usu.usu_primer_nombre + " " +
                                                        usu.usu_segundo_nombre + " " +
                                                        usu.usu_primer_apellido + " " +
                                                        usu.usu_segundo_apellido
                                   }).ToDictionary(u => u.usu_id, u => u.NombreCompleto);

            var propiedades = (from p in dc.tbl_propiedad
                               where p.pro_estado == 'A'
                               select new
                               {
                                   p.pro_id,
                                   p.pro_titulo
                               }).ToDictionary(p => p.pro_id, p => p.pro_titulo);
            // Obtén todas las citas desde la base de datos
            //var citasDatos = (from c in dc.tbl_cita
            //                  select new tbl_cita
            //                  {
            //                      cit_id = c.cit_id,
            //                      cit_estado = c.cit_estado,
            //                      cit_descripcion = c.cit_descripcion,
            //                      cit_fecha_cita = c.cit_fecha_cita.HasValue ? c.cit_fecha_cita.Value.ToString("yyyy-MM-dd") : null,
            //                      cit_hora = c.cit_hora_cita.HasValue ? c.cit_hora_cita.Value.ToString(@"hh\:mm") : null,
            //                      NombreUsuario = usuariosActivos.ContainsKey(c.usu_id.HasValue ? c.usu_id.Value : 0)
            //        ? usuariosActivos[c.usu_id.Value]
            //        : "Desconocido",
            //                      NombrePropiedad = propiedades.ContainsKey(c.pro_id.HasValue ? c.pro_id.Value : 0)
            //        ? propiedades[c.pro_id.Value]
            //        : "Desconocido"
            //                  }).ToList();

            var citasDatos = (from c in dc.tbl_cita join
                              p in dc.tbl_propiedad on c.pro_id equals p.pro_id
                              where p.inm_id == Convert.ToInt32(idAgente)
                              && c.cit_estado != "I"
                              select new
                              {
                                  c.cit_id,
                                  c.cit_estado,
                                  c.cit_descripcion,
                                  c.cit_fecha_cita,
                                  c.cit_hora_cita,
                                  c.usu_id,
                                  c.pro_id
                              }).AsEnumerable() // Trae los datos a memoria
                  .Select(c => new tbl_cita
                  {
                      cit_id = c.cit_id,
                      cit_estado = c.cit_estado,
                      cit_descripcion = c.cit_descripcion,
                      cit_fecha_cita = c.cit_fecha_cita.HasValue ? c.cit_fecha_cita.Value.ToString("yyyy-MM-dd") : null,
                      cit_hora = c.cit_hora_cita.HasValue ? c.cit_hora_cita.Value.ToString(@"hh\:mm") : null,
                      NombreUsuario = usuariosActivos.ContainsKey(c.usu_id.HasValue ? c.usu_id.Value : 0)
                          ? usuariosActivos[c.usu_id.Value]
                          : "Desconocido",
                      NombrePropiedad = propiedades.ContainsKey(c.pro_id.HasValue ? c.pro_id.Value : 0)
                          ? propiedades[c.pro_id.Value]
                          : "Desconocido"
                  }).ToList();



            // Devuelve la lista de citas
            return citasDatos;
        }


        public List<tbl_cita> ObtenerCitasPorUsuario(int idUsuario)
        {
            // Obtén todas las citas
            var todasLasCitas = ObtenerTodasLasCitas();

            // Lista para almacenar las citas del usuario
            List<tbl_cita> citasUsuario = new List<tbl_cita>();

            // Filtra las citas por el ID del usuario usando un bucle foreach
            foreach (var cita in todasLasCitas)
            {
                if (cita.usu_id == idUsuario)
                {
                    citasUsuario.Add(cita);
                }
            }

            return citasUsuario;
        }

        public tbl_usuario ObtenerUsuarioPorId(int usuarioId)
        {
            return (from usu in dc.tbl_usuario
                    where usu.usu_id == usuarioId
                    select new tbl_usuario
                    {
                        IdUsuario = usu.usu_id,
                        NombreCompleto = usu.usu_primer_nombre + " " +
                                         usu.usu_segundo_nombre + " " +
                                         usu.usu_primer_apellido + " " +
                                         usu.usu_segundo_apellido
                    }).FirstOrDefault();
        }


        public void AgregarCita(string comentarioAgente, string descripcion, string hora, DateTime fecha, string estado, int usuarioId, int propiedadId)
        {
            dc.registrar_cita(comentarioAgente, descripcion, TimeSpan.Parse(hora), fecha, estado, usuarioId, propiedadId);
            citas = ObtenerCitasPorFecha(fecha);
        }

        public void EditarCita(string comentarioAgente, string id, string descripcion, string hora, DateTime fecha, string estado, int usuarioId, int propiedadId)
        {
            int idCita = Convert.ToInt32(id);
            dc.editar_cita(idCita, comentarioAgente, descripcion, TimeSpan.Parse(hora), fecha, estado, usuarioId, propiedadId);
            citas = ObtenerCitasPorFecha(fecha);
        }

        public List<tbl_cita> ObtenerCitasFinalizadasPorUsuario(int usuarioId)
        {
            // Obtén los datos necesarios de la base de datos en memoria
            var usuariosActivos = (from usu in dc.tbl_usuario
                                   where usu.usu_estado == 'A'
                                   select new
                                   {
                                       usu.usu_id,
                                       NombreCompleto = usu.usu_primer_nombre + " " +
                                                        usu.usu_segundo_nombre + " " +
                                                        usu.usu_primer_apellido + " " +
                                                        usu.usu_segundo_apellido
                                   }).ToDictionary(u => u.usu_id, u => u.NombreCompleto);

            var propiedades = (from p in dc.tbl_propiedad
                               where p.pro_estado == 'A'
                               select new
                               {
                                   p.pro_id,
                                   p.pro_titulo
                               }).ToDictionary(p => p.pro_id, p => p.pro_titulo);

            // Obtén las citas finalizadas para el usuario específico
            var citas = (from c in dc.tbl_cita
                         where c.cit_estado == "Finalizada"
                         && c.cit_descripcion == ""
                         && c.usu_id == usuarioId
                         select c).ToList();

            // Luego realiza la conversión en memoria
            var citasFinalizadas = citas.Select(c => new tbl_cita
            {
                cit_id = c.cit_id,
                cit_fecha_cita = c.cit_fecha_cita.HasValue ? c.cit_fecha_cita.Value.ToString("yyyy-MM-dd") : null,
                cit_hora = c.cit_hora_cita.HasValue ? c.cit_hora_cita.Value.ToString(@"hh\:mm") : null,
                cit_descripcion = c.cit_descripcion,
                cit_estado = c.cit_estado,
                NombreUsuario = usuariosActivos.ContainsKey(c.usu_id.HasValue ? c.usu_id.Value : 0)
                    ? usuariosActivos[c.usu_id.Value]
                    : "Desconocido",
                NombrePropiedad = propiedades.ContainsKey(c.pro_id.HasValue ? c.pro_id.Value : 0)
                    ? propiedades[c.pro_id.Value]
                    : "Desconocido"
            }).ToList();

            return citasFinalizadas;
        }

        // Capa de Negocio
        public void GuardarResena(int citaId, string resena)
        {
            using (var dc = new CdInmogestionPlusDataContext())
            {
                var cita = (from c in dc.tbl_cita
                            where c.cit_id == citaId
                            select c).FirstOrDefault();

                if (cita != null)
                {
                    cita.cit_descripcion = resena;
                    dc.SubmitChanges();
                }
                else
                {
                    //throw new Exception("Cita no encontrada.");
                }
            }
        }


        public void CancelarReserva(int citaId)
        {
            var cita = (from c in dc.tbl_cita
                        where c.cit_id == citaId
                        select c).FirstOrDefault();

            if (cita != null)
            {
                cita.cit_estado = "Cancelada";
                dc.SubmitChanges();
            }
            else
            {
                //throw new Exception("Cita no encontrada.");
            }
        }


        public List<tbl_cita> ObtenerCitasPorUsuarioYFecha(int usuarioId, DateTime fecha)
        {
            var citasDatos = dc.tbl_cita
                .Where(c => c.usu_id == usuarioId && c.cit_fecha_cita.HasValue && c.cit_fecha_cita.Value.Date == fecha.Date)
                .ToList();

            var usuariosActivos = (from usu in dc.tbl_usuario
                                   where usu.usu_estado == 'A'
                                   select new
                                   {
                                       usu.usu_id,
                                       NombreCompleto = usu.usu_primer_nombre + " " +
                                                        usu.usu_segundo_nombre + " " +
                                                        usu.usu_primer_apellido + " " +
                                                        usu.usu_segundo_apellido
                                   }).ToDictionary(u => u.usu_id, u => u.NombreCompleto);

            var propiedades = (from p in dc.tbl_propiedad
                               where p.pro_estado == 'A'
                               select new
                               {
                                   p.pro_id,
                                   p.pro_titulo
                               }).ToDictionary(p => p.pro_id, p => p.pro_titulo);

            var citasNegocio = citasDatos
                .Where(c => c.pro_id.HasValue && propiedades.ContainsKey(c.pro_id.Value))
                .Select(c => new tbl_cita
                {
                    cit_id = c.cit_id,
                    cit_estado = c.cit_estado,
                    cit_descripcion = c.cit_descripcion,
                    cit_fecha_cita = c.cit_fecha_cita.HasValue ? c.cit_fecha_cita.Value.ToString("yyyy-MM-dd") : null,
                    cit_hora = c.cit_hora_cita.HasValue ? c.cit_hora_cita.Value.ToString(@"hh\:mm") : null,
                    usu_id = c.usu_id.HasValue ? c.usu_id.Value : 0,
                    pro_id = c.pro_id.HasValue ? c.pro_id.Value : 0,
                    NombreUsuario = usuariosActivos.ContainsKey(c.usu_id.HasValue ? c.usu_id.Value : 0)
                                ? usuariosActivos[c.usu_id.Value]
                                : "Desconocido",
                    NombrePropiedad = propiedades.ContainsKey(c.pro_id.HasValue ? c.pro_id.Value : 0)
                                  ? propiedades[c.pro_id.Value]
                                  : "Desconocido"
                }).ToList();

            return citasNegocio;
        }


        public List<tbl_propiedad> ListarInmuebles()
        {
            var inmuebles = (from pro in dc.tbl_propiedad
                             where pro.pro_estado == 'A'
                             select pro).ToList();

            return inmuebles;
        }

        public CnTblCita.tbl_cita ObtenerCitaPorId(int citId)
        {
            var query = (from p in dc.tbl_cita
                         where p.cit_id == citId
                         select p).FirstOrDefault();

            if (query != null)
            {
                return new CnTblCita.tbl_cita
                {
                    cit_id = query.cit_id,
                    cit_descripcion = query.cit_descripcion,
                    cit_fecha_cita = query.cit_fecha_cita.HasValue ? query.cit_fecha_cita.Value.ToString("yyyy-MM-dd") : null,
                    cit_hora = query.cit_hora_cita.HasValue ? query.cit_hora_cita.Value.ToString(@"hh\:mm") : null,
                    cit_estado = query.cit_estado,
                    usu_id = query.usu_id.HasValue ? query.usu_id.Value : 0,
                    pro_id = query.pro_id.HasValue ? query.pro_id.Value : 0,

                };
            }
            else
            {
                return null;
            }
        }

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

        public class tbl_cita
        {
            public int cit_id { get; set; }
            public string cit_descripcion { get; set; }
            public string cit_fecha_cita { get; set; }
            public string cit_hora { get; set; }
            public string cit_estado { get; set; }

            public int usu_id { get; set; }
            public int pro_id { get; set; }

            public string NombrePropiedad { get; set; }
            public string NombreUsuario { get; set; }
        }
        public class tbl_usuario
        {
            public int IdUsuario { get; set; }
            public string NombreCompleto { get; set; }
        }
    }
}