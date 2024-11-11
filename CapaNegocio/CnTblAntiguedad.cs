using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblAntiguedad
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_antiguedad> ListarAntiguedades()
        {
            var operaciones = (from ant in dc.tbl_antiguedad where ant.ant_estado == 'A' select ant).ToList();

            return operaciones;
        }

        public void RegistrarAntiguedad(string nom)
        {
            dc.registrar_antiguedad(0, nom);
        }

        public void EditarAntiguedad(string id, string nom)
        {
            int idAnt = Convert.ToInt32(id);
            dc.editar_antiguedad(idAnt, nom);
        }

        public void EliminarAntiguedad(string id)
        {
            int idAnt = Convert.ToInt32(id);
            dc.eliminar_antiguedad(idAnt);
        }

        public List<tbl_antiguedad> BuscarAntiguedadXId(string id)
        {
            int idAnt = Convert.ToInt32(id);

            var operaciones = (from ant in dc.tbl_antiguedad
                               where ant.ant_estado == 'A' && ant.ant_id == idAnt
                               select ant).ToList();

            return operaciones;
        }

        public tbl_antiguedad ObtenerUltimoRegistro()
        {
            var registro = (from r in dc.tbl_antiguedad
                            orderby r.ant_id descending
                            select r).ToList().First();

            return registro;
        }
    }
}
