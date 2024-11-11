using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblPerfil
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_perfil> ListarPerfiles()
        {
            var perfiles = (from perf in dc.tbl_perfil where perf.perf_estado == 'A' select perf).ToList();

            return perfiles;
        }

        public void RegistrarPerfil(string nom, string desc)
        {
            dc.registrar_perfil(nom, desc);
        }

        public void EditarPerfil(string id, string nom, string desc)
        {
            int idPerf = Convert.ToInt32(id);
            dc.editar_perfil(idPerf, nom, desc);
        }

        public void EliminarPerfil(string id)
        {
            int idPerf = Convert.ToInt32(id);
            dc.eliminar_perfil(idPerf);
        }

        public List<tbl_perfil> BuscarPerfilXId(string id)
        {
            int idPerf = Convert.ToInt32(id);

            var perfiles = (from perf in dc.tbl_perfil 
                            where perf.perf_estado == 'A' && perf.perf_id == idPerf
                            select perf).ToList();

            return perfiles;
        }
    }
}
