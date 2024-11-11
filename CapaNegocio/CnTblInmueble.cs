using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblInmueble
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();


        public List<tbl_inmobiliaria> ListarInmuebles()
        {
            var inmuebles = (from inm in dc.tbl_inmobiliaria where inm.inm_estado == 'A' select inm).ToList();

            return inmuebles;
        }

        public void RegistrarInmueble(string nombre, string direccion, string ruc, string razonSocial, string telefono, string correo, string img)
        {
            dc.registrar_inmobiliaria(nombre, direccion, ruc, razonSocial, telefono, correo, img);
        }


        public void EditarInmuebleMant(string id, string nombre, string direccion, string ruc, string razonSocial, string telefono, string correo, string img)
        {

            dc.editar_inmobiliaria(Convert.ToInt32(id), nombre, direccion, ruc, razonSocial, telefono, correo, img);
        }
        public void EliminarInmueble(string id)
        {
            int idInm = Convert.ToInt32(id);
            dc.eliminar_inmobiliaria(idInm);
        }

        public List<tbl_inmobiliaria> BuscarInmuebleXId(string id)
        {
            int usuId = Convert.ToInt32(id);

            var inmueble = (from i in dc.tbl_inmobiliaria
                           where i.inm_estado == 'A' && i.inm_id == usuId
                           select i).ToList();


            return inmueble;
        }
    }
}
