using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblPlano
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_plano> ListarPlanos()
        {
            var videos = (from plan in dc.tbl_plano where plan.pla_estado == 'A' select plan).ToList();

            return videos;
        }

        public List<PlanoComp> ListarPlanosComp()
        {
            var planos = (from plan in dc.tbl_plano
                            join pro in dc.tbl_propiedad on plan.pro_id
                            equals pro.pro_id
                            where plan.pla_estado == 'A'
                            select new PlanoComp
                            {
                                Plano = plan,
                                Propiedad = pro
                            }).ToList();

            return planos;
        }
        public void RegistrarPlano(string path, string proId)
        {
            int idPro = Convert.ToInt32(proId);
            dc.registrar_plano(path, idPro);
        }

        public void EditarPlano(string id, string path, string proId)
        {
            int idPlan = Convert.ToInt32(id);
            int idPro = Convert.ToInt32(proId);

            dc.editar_plano(idPlan, path, idPro);
        }

        public void EliminarPlano(string id)
        {
            int idPlan = Convert.ToInt32(id);
            dc.eliminar_plano(idPlan);
        }

        public List<tbl_plano> BuscarPlanoXId(string id)
        {
            int idPlan = Convert.ToInt32(id);

            var videos = (from plan in dc.tbl_plano
                          where plan.pla_estado == 'A' && plan.pla_id == idPlan
                          select plan).ToList();

            return videos;
        }

        public List<tbl_plano> BuscarPlanoXPropiedad(string id)
        {
            int idPro = Convert.ToInt32(id);

            var videos = (from plan in dc.tbl_plano
                          where plan.pla_estado == 'A' && plan.pro_id == idPro
                          select plan).ToList();

            return videos;
        }
    }
    public class PlanoComp
    {
        public tbl_plano Plano { get; set; }
        public tbl_propiedad Propiedad { get; set; }
    }
}
