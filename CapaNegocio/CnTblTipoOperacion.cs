using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblTipoOperacion
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_tipo_operacion> ListarOperaciones()
        {
            var operaciones = (from ope in dc.tbl_tipo_operacion where ope.tope_estado == 'A' select ope).ToList();

            return operaciones;
        }

        public void RegistrarOperacion(string nom)
        {
            dc.registrar_tipo_operacion(0,nom);
        }

        public void EditarOperacion(string id, string nom)
        {
            int idOpe = Convert.ToInt32(id);
            dc.editar_tipo_operacion(idOpe, nom);
        }

        public void EliminarOperacion(string id)
        {
            int idOpe = Convert.ToInt32(id);
            dc.eliminar_tipo_operacion(idOpe);
        }

        public List<tbl_tipo_operacion> BuscarOperacionXId(string id)
        {
            int idOpe = Convert.ToInt32(id);

            var operaciones = (from ope in dc.tbl_tipo_operacion
                            where ope.tope_estado == 'A' && ope.tope_id == idOpe
                            select ope).ToList();

            return operaciones;
        }

        public tbl_tipo_operacion ObtenerUltimoRegistro()
        {
            var registro = (from r in dc.tbl_tipo_operacion
                            orderby r.tope_id descending
                            select r).ToList().First();

            return registro;
        }
    }
}
