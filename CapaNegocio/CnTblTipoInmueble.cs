using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblTipoInmueble
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_tipo_inmueble> ListarInmueblees()
        {
            var inmuebles = (from inm in dc.tbl_tipo_inmueble where inm.tinm_estado == 'A' select inm).ToList();

            return inmuebles;
        }

        public void RegistrarInmueble(string nom)
        {
            dc.registrar_tipo_inmueble(0, nom);
        }

        public void EditarInmueble(string id, string nom)
        {
            int idInm = Convert.ToInt32(id);
            dc.editar_tipo_inmueble(idInm, nom);
        }

        public void EliminarInmueble(string id)
        {
            int idInm = Convert.ToInt32(id);
            dc.eliminar_tipo_inmueble(idInm);
        }

        public List<tbl_tipo_inmueble> BuscarInmuebleXId(string id)
        {
            int idInm = Convert.ToInt32(id);

            var inmuebles = (from inm in dc.tbl_tipo_inmueble
                               where inm.tinm_estado == 'A' && inm.tinm_id == idInm
                               select inm).ToList();

            return inmuebles;
        }

        public tbl_tipo_inmueble ObtenerUltimoRegistro()
        {
            var registro = (from r in dc.tbl_tipo_inmueble
                            orderby r.tinm_id descending
                            select r).ToList().First();

            return registro;
        }
    }
}
