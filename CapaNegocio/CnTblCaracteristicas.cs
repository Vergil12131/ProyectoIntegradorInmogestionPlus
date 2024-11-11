using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblCaracteristicas
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_caracteristicas> ListarCaracteristicas()
        {
            var caracteristicaes = (from car in dc.tbl_caracteristicas where car.car_estado == 'A' select car).ToList();

            return caracteristicaes;
        }

        public void RegistrarCaracteristica(string habitaciones, string banos, string estacionamientos)
        {
            int intHabitaciones = Convert.ToInt32(habitaciones);
            int intBanos = Convert.ToInt32(banos);
            int intEstacionamientos = Convert.ToInt32(estacionamientos);

            dc.registrar_caracteristicas(intHabitaciones,intBanos,intEstacionamientos);
        }

        public void EditarCaracteristica(string id, string habitaciones, string banos, string estacionamientos)
        {
            int idCar = Convert.ToInt32(id);
            int intHabitaciones = Convert.ToInt32(habitaciones);
            int intBanos = Convert.ToInt32(banos);
            int intEstacionamientos = Convert.ToInt32(estacionamientos);

            dc.editar_caracteristicas(idCar, intHabitaciones, intBanos, intEstacionamientos);
        }

        public void EliminarCaracteristica(string id)
        {
            int idCar = Convert.ToInt32(id);
            dc.eliminar_caracteristicas(idCar);
        }

        public List<tbl_caracteristicas> BuscarCaracteristicaXId(string id)
        {
            int idCar = Convert.ToInt32(id);

            var caracteristicaes = (from car in dc.tbl_caracteristicas
                            where car.car_estado == 'A' && car.car_id == idCar
                            select car).ToList();

            return caracteristicaes;
        }

        public tbl_caracteristicas ObtenerUltimoRegistro()
        {
            var registro = (from r in dc.tbl_caracteristicas
                            orderby r.car_id descending
                            select r).ToList().First();

            return registro;
        }
    }
}
