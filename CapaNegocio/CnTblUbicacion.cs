using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblUbicacion
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_ubicacion> ListarUbicaciones()
        {
            var ubicaciones = (from ant in dc.tbl_ubicacion where ant.ubi_estado == 'A' select ant).ToList();

            return ubicaciones;
        }

        public void RegistrarUbicacion(string provincia, string canton, string sector,  string direccion)
        {
            dc.registrar_ubicacion(provincia,canton,sector,direccion);
        }

        public void EditarUbicacion(string id, string provincia, string canton, string sector, string direccion)
        {
            int idUbi = Convert.ToInt32(id);
            dc.editar_ubicacion(idUbi,provincia,canton,sector,direccion);
        }

        public void EliminarUbicacion(string id)
        {
            int idUbi = Convert.ToInt32(id);
            dc.eliminar_ubicacion(idUbi);
        }

        public List<tbl_ubicacion> BuscarUbicacionXId(string id)
        {
            int idUbi = Convert.ToInt32(id);

            var ubicaciones = (from ant in dc.tbl_ubicacion
                               where ant.ubi_estado == 'A' && ant.ubi_id == idUbi
                               select ant).ToList();

            return ubicaciones;
        }

        public tbl_ubicacion ObtenerUltimoRegistro()
        {
            var registro = (from r in dc.tbl_ubicacion
                            orderby r.ubi_id descending
                            select r).ToList().First();

            return registro;
        }
    }
}
