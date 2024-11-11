using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblPropiedad
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_propiedad> ListarPropiedadesSimple()
        {
            var propiedades = (from pro in dc.tbl_propiedad where pro.pro_estado == 'A' select pro).ToList();

            return propiedades;
        }

        public List<SelectPropiedad> ListarPropiedades()
        {
            var propiedades = (from pro in dc.tbl_propiedad
                               join ant in dc.tbl_antiguedad on pro.ant_id equals ant.ant_id
                               join car in dc.tbl_caracteristicas on pro.car_id equals car.car_id
                               join tope in dc.tbl_tipo_operacion on pro.tope_id equals tope.tope_id
                               join tinm in dc.tbl_tipo_inmueble on pro.tinm_id equals tinm.tinm_id
                               join ubi in dc.tbl_ubicacion on pro.ubi_id equals ubi.ubi_id
                               where pro.pro_estado == 'A'

                               select new SelectPropiedad
                               {
                                   Propiedad = pro,
                                   Antiguedad = ant,
                                   Caracteristicas = car,
                                   Tipo_Inmueble = tinm,
                                   Tipo_Operacion = tope,
                                   Ubicacion = ubi
                               }).ToList();

            return propiedades;
        }

        public List<SelectPropiedad> ListarPropiedadesExcluyendoXId(string id)
        {
            var propiedades = (from pro in dc.tbl_propiedad
                               join ant in dc.tbl_antiguedad on pro.ant_id equals ant.ant_id
                               join car in dc.tbl_caracteristicas on pro.car_id equals car.car_id
                               join tope in dc.tbl_tipo_operacion on pro.tope_id equals tope.tope_id
                               join tinm in dc.tbl_tipo_inmueble on pro.tinm_id equals tinm.tinm_id
                               join ubi in dc.tbl_ubicacion on pro.ubi_id equals ubi.ubi_id
                               where pro.pro_estado == 'A' && pro.pro_id != Convert.ToInt32(id)

                               select new SelectPropiedad
                               {
                                   Propiedad = pro,
                                   Antiguedad = ant,
                                   Caracteristicas = car,
                                   Tipo_Inmueble = tinm,
                                   Tipo_Operacion = tope,
                                   Ubicacion = ubi
                               }).ToList();

            return propiedades;
        }

        public void RegistrarPropiedad(string titulo, string precio, string areaTot, string areaCons, string alicuota, string desc, string caractId, string tOpeId, string tInmId, string antiguedadID, string vendId, string compId, string ubiId, string coordenadas)
        {



            decimal decAlicuota = Convert.ToDecimal(alicuota);
            decimal decPrecio = Convert.ToDecimal(precio);
            int intareaT = Convert.ToInt32(areaTot);
            int intareaC = Convert.ToInt32(areaCons);
            int intCarId = Convert.ToInt32(caractId);
            int intTOpeId = Convert.ToInt32(tOpeId);
            int intTInmId = Convert.ToInt32(tInmId);
            int intAntId = Convert.ToInt32(antiguedadID);
            int intVend = Convert.ToInt32(vendId);
            int intUbi = Convert.ToInt32(ubiId);

            if (!(compId == "null"))
            {
                int intComp = Convert.ToInt32(compId);

                dc.registrar_propiedad(titulo, decPrecio, intareaT, intareaC, decAlicuota, desc, coordenadas, intCarId, intTOpeId, intTInmId, intAntId, intVend, intComp, intUbi);
            }
            else
            {
                dc.registrar_propiedad(titulo, decPrecio, intareaT, intareaC, decAlicuota, desc, coordenadas, intCarId, intTOpeId, intTInmId, intAntId, intVend, null, intUbi);
            }
        }

        public void EditarPropiedad(string id, string titulo, string precio, string areaTot, string areaCons, string alicuota, string desc, string caractId, string tOpeId, string tInmId, string antiguedadID, string vendId, string compId, string ubiId)
        {
            decimal decAlicuota = Convert.ToDecimal(alicuota);
            decimal decPrecio = Convert.ToDecimal(precio);
            int intareaT = Convert.ToInt32(areaTot);
            int intareaC = Convert.ToInt32(areaCons);
            int intCarId = Convert.ToInt32(caractId);
            int intTOpeId = Convert.ToInt32(tOpeId);
            int intTInmId = Convert.ToInt32(tInmId);
            int intAntId = Convert.ToInt32(antiguedadID);
            int intVend = Convert.ToInt32(vendId);
            int intUbi = Convert.ToInt32(ubiId);
            int idPro = Convert.ToInt32(id);

            if (!(compId == "null"))
            {
                int intComp = Convert.ToInt32(compId);

                dc.editar_propiedad(idPro, titulo, decPrecio, intareaT, intareaC, decAlicuota, desc, "", intCarId, intTOpeId, intTInmId, intAntId, intVend, intComp, intUbi);
            }
            else
                dc.editar_propiedad(idPro, titulo, decPrecio, intareaT, intareaC, decAlicuota, desc, "", intCarId, intTOpeId, intTInmId, intAntId, intVend, null, intUbi);
        }

        public void EliminarPropiedad(string id)
        {
            int idPro = Convert.ToInt32(id);
            dc.eliminar_propiedad(idPro);
        }

        public List<tbl_propiedad> BuscarPropiedadXId(string id)
        {
            int idPro = Convert.ToInt32(id);

            var propiedades = (from pro in dc.tbl_propiedad
                               where pro.pro_estado == 'A' && pro.pro_id == idPro
                               select pro).ToList();

            return propiedades;
        }

        public List<SelectPropiedad> BuscarPropiedadXIdAgente(string id)
        {
            var propiedades = (from pro in dc.tbl_propiedad
                               join ant in dc.tbl_antiguedad on pro.ant_id equals ant.ant_id
                               join car in dc.tbl_caracteristicas on pro.car_id equals car.car_id
                               join tope in dc.tbl_tipo_operacion on pro.tope_id equals tope.tope_id
                               join tinm in dc.tbl_tipo_inmueble on pro.tinm_id equals tinm.tinm_id
                               join ubi in dc.tbl_ubicacion on pro.ubi_id equals ubi.ubi_id
                               where pro.pro_estado == 'A' && pro.inm_id == Convert.ToInt32(id)

                               select new SelectPropiedad
                               {
                                   Propiedad = pro,
                                   Antiguedad = ant,
                                   Caracteristicas = car,
                                   Tipo_Inmueble = tinm,
                                   Tipo_Operacion = tope,
                                   Ubicacion = ubi
                               }).ToList();

            return propiedades;
        }

        public tbl_propiedad ObtenerUltimoRegistro()
        {
            var registro = (from r in dc.tbl_propiedad
                            orderby r.pro_id descending
                            select r).ToList().First();

            return registro;
        }

        public List<SelectPropiedad> BuscarPropiedadesFiltros(List<string> accion, List<string> tipoInmueble, string precio, List<string> numeroHabitaciones, List<string> numeroBanos, List<string> numeroEstacionamientos, string direccion)
        {
            var propiedades = from pro in dc.tbl_propiedad
                              join ant in dc.tbl_antiguedad on pro.ant_id equals ant.ant_id
                              join car in dc.tbl_caracteristicas on pro.car_id equals car.car_id
                              join tope in dc.tbl_tipo_operacion on pro.tope_id equals tope.tope_id
                              join tinm in dc.tbl_tipo_inmueble on pro.tinm_id equals tinm.tinm_id
                              join ubi in dc.tbl_ubicacion on pro.ubi_id equals ubi.ubi_id
                              where pro.pro_estado == 'A'

                              select new SelectPropiedad
                              {
                                  Propiedad = pro,
                                  Antiguedad = ant,
                                  Caracteristicas = car,
                                  Tipo_Inmueble = tinm,
                                  Tipo_Operacion = tope,
                                  Ubicacion = ubi
                              };


            if (accion.Count() > 0)
            {
                propiedades = propiedades.Where(p => accion.Contains(p.Tipo_Operacion.tope_id.ToString()));
            }

            if (tipoInmueble.Count() > 0)
            {
                propiedades = propiedades.Where(p => tipoInmueble.Contains(p.Tipo_Inmueble.tinm_id.ToString()));
            }

            if (!string.IsNullOrEmpty(precio))
            {
                if (precio == "1")
                    propiedades = propiedades.Where(p => p.Propiedad.pro_precio <= 50000);
                else if (precio == "2")
                    propiedades = propiedades.Where(p => p.Propiedad.pro_precio >= 50000 && p.Propiedad.pro_precio <= 100000);
                else if (precio == "3")
                    propiedades = propiedades.Where(p => p.Propiedad.pro_precio >= 100000 && p.Propiedad.pro_precio <= 150000);
                else if (precio == "4")
                    propiedades = propiedades.Where(p => p.Propiedad.pro_precio >= 150000 && p.Propiedad.pro_precio <= 200000);
                else if (precio == "5")
                    propiedades = propiedades.Where(p => p.Propiedad.pro_precio >= 200000);
            }



            if (numeroHabitaciones.Count() > 0)
            {
                if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2);
                }
                else if (!numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 3);
                }
                else if (!numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 4);
                }
                else if (!numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2);
                }
                else if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 3);
                }
                else if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 4);
                }
                else if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 4);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (!numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4);
                }
                else if (!numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (!numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 4);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4);
                }
                else if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (!numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && !numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && !numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && !numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && !numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (!numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
                else if (numeroHabitaciones.Contains("1") && numeroHabitaciones.Contains("2") && numeroHabitaciones.Contains("3") && numeroHabitaciones.Contains("4") && numeroHabitaciones.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_habitaciones == 1 || p.Caracteristicas.car_habitaciones == 2 || p.Caracteristicas.car_habitaciones == 3 || p.Caracteristicas.car_habitaciones == 4 || p.Caracteristicas.car_habitaciones >= 5);
                }
            }


            if (numeroEstacionamientos.Count() > 0)
            {
                if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2);
                }
                else if (!numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 3);
                }
                else if (!numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (!numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2);
                }
                else if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 3);
                }
                else if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (!numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (!numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (!numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (!numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && !numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && !numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && !numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && !numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (!numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
                else if (numeroEstacionamientos.Contains("1") && numeroEstacionamientos.Contains("2") && numeroEstacionamientos.Contains("3") && numeroEstacionamientos.Contains("4") && numeroEstacionamientos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_estacionamineto == 1 || p.Caracteristicas.car_estacionamineto == 2 || p.Caracteristicas.car_estacionamineto == 3 || p.Caracteristicas.car_estacionamineto == 4 || p.Caracteristicas.car_estacionamineto >= 5);
                }
            }


            if (numeroBanos.Count() > 0)
            {
                if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && !numeroBanos.Contains("3") && !numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && !numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2);
                }
                else if (!numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 3);
                }
                else if (!numeroBanos.Contains("1") && !numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 4);
                }
                else if (!numeroBanos.Contains("1") && !numeroBanos.Contains("2") && !numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && !numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2);
                }
                else if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 3);
                }
                else if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 4);
                }
                else if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && !numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos >= 5);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 4);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos >= 5);
                }
                else if (!numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4);
                }
                else if (!numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos >= 5);
                }
                else if (!numeroBanos.Contains("1") && !numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 4);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4);
                }
                else if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos >= 5);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
                else if (!numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && !numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && !numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && !numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && !numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
                else if (!numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
                else if (numeroBanos.Contains("1") && numeroBanos.Contains("2") && numeroBanos.Contains("3") && numeroBanos.Contains("4") && numeroBanos.Contains("5"))
                {
                    propiedades = propiedades.Where(p => p.Caracteristicas.car_banos == 1 || p.Caracteristicas.car_banos == 2 || p.Caracteristicas.car_banos == 3 || p.Caracteristicas.car_banos == 4 || p.Caracteristicas.car_banos >= 5);
                }
            }


            if (!string.IsNullOrEmpty(direccion))
            {
                propiedades = propiedades.Where(p =>
                p.Ubicacion.ubi_provincia.Contains(direccion) ||
                p.Ubicacion.ubi_canton.Contains(direccion) ||
                p.Ubicacion.ubi_sector.Contains(direccion) ||
                p.Ubicacion.ubi_direccion.Contains(direccion));
            }


            var propiedadesList = propiedades.ToList();

            return propiedadesList;

        }

        public List<SelectPropiedad> BuscarPropiedadesFiltrosHeader(string direccion, string accion, string tipoInmueble)
        {
            var propiedades = from pro in dc.tbl_propiedad
                              join ant in dc.tbl_antiguedad on pro.ant_id equals ant.ant_id
                              join car in dc.tbl_caracteristicas on pro.car_id equals car.car_id
                              join tope in dc.tbl_tipo_operacion on pro.tope_id equals tope.tope_id
                              join tinm in dc.tbl_tipo_inmueble on pro.tinm_id equals tinm.tinm_id
                              join ubi in dc.tbl_ubicacion on pro.ubi_id equals ubi.ubi_id
                              where pro.pro_estado == 'A'

                              select new SelectPropiedad
                              {
                                  Propiedad = pro,
                                  Antiguedad = ant,
                                  Caracteristicas = car,
                                  Tipo_Inmueble = tinm,
                                  Tipo_Operacion = tope,
                                  Ubicacion = ubi
                              };


            if (!string.IsNullOrEmpty(accion))
            {
                if (accion == "Comprar")
                    propiedades = propiedades.Where(p => p.Tipo_Operacion.tope_id == 1);
                else if (accion == "Alquilar")
                    propiedades = propiedades.Where(p => p.Tipo_Operacion.tope_id == 2);
                else if (accion == "Temporal")
                    propiedades = propiedades.Where(p => p.Tipo_Operacion.tope_id == 3);
            }


            if (!string.IsNullOrEmpty(tipoInmueble))
            {
                if (tipoInmueble == "Casa")
                    propiedades = propiedades.Where(p => p.Tipo_Inmueble.tinm_id == 1);
                else if (tipoInmueble == "Departamento")
                    propiedades = propiedades.Where(p => p.Tipo_Inmueble.tinm_id == 2);
                else if (tipoInmueble == "Suite")
                    propiedades = propiedades.Where(p => p.Tipo_Inmueble.tinm_id == 3);
                else if (tipoInmueble == "Urbanizacion")
                    propiedades = propiedades.Where(p => p.Tipo_Inmueble.tinm_id == 4);
            }


            if (!string.IsNullOrEmpty(direccion))
            {
                propiedades = propiedades.Where(p =>
                p.Ubicacion.ubi_provincia.Contains(direccion) ||
                p.Ubicacion.ubi_canton.Contains(direccion) ||
                p.Ubicacion.ubi_sector.Contains(direccion) ||
                p.Ubicacion.ubi_direccion.Contains(direccion));
            }


            var propiedadesList = propiedades.ToList();

            return propiedadesList;

        }



        //public List<SelectPropiedad> BuscarPropiedadXId(string id)
        //{
        //    int idPro = Convert.ToInt32(id);

        //    var propiedades = (from pro in dc.tbl_propiedad
        //                       join ant in dc.tbl_antiguedad on pro.ant_id equals ant.ant_id
        //                       join car in dc.tbl_caracteristicas on pro.car_id equals car.car_id
        //                       join tope in dc.tbl_tipo_operacion on pro.tope_id equals tope.tope_id
        //                       join tinm in dc.tbl_tipo_inmueble on pro.tinm_id equals tinm.tinm_id
        //                       where pro.pro_estado == 'A' && pro.pro_id == idPro

        //                       select new SelectPropiedad
        //                       {
        //                           Propiedad = pro,
        //                           Antiguedad = ant,
        //                           Caracteristicas = car,
        //                           Tipo_Inmueble = tinm,
        //                           Tipo_Operacion = tope
        //                       }).ToList();

        //    return propiedades;
        //}
    }

    public class SelectPropiedad
    {
        public tbl_propiedad Propiedad { get; set; }
        public tbl_antiguedad Antiguedad { get; set; }
        public tbl_caracteristicas Caracteristicas { get; set; }
        public tbl_tipo_inmueble Tipo_Inmueble { get; set; }
        public tbl_tipo_operacion Tipo_Operacion { get; set; }
        public tbl_ubicacion Ubicacion { get; set; }
    }
}
