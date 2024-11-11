using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CnTblImagen
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_imagen> ListarImagenes()
        {
            var imagenes = (from ima in dc.tbl_imagen where ima.img_estado == 'A' select ima).ToList();

            return imagenes;
        }

        public List<ImagenComp> ListarImagenesComp()
        {
            var imagenes = (from ima in dc.tbl_imagen 
                            join pro in dc.tbl_propiedad on ima.pro_id
                            equals pro.pro_id
                            where ima.img_estado == 'A'
                            select new ImagenComp
                            {
                                Imagen = ima,
                                Propiedad = pro
                            }).ToList();

            return imagenes;
        }


        public void RegistrarImagen(string path, string proId)
        {
            int idPro = Convert.ToInt32(proId);
            dc.registrar_imagen(path, idPro);
        }

        public void EditarImagen(string id, string path, string proId)
        {
            int idIma = Convert.ToInt32(id);
            int idPro = Convert.ToInt32(proId);

            dc.editar_imagen(idIma, path, idPro);
        }

        public void EliminarImagen(string id)
        {
            int idIma = Convert.ToInt32(id);
            dc.eliminar_imagen(idIma);
        }

        public List<tbl_imagen> BuscarImagenXId(string id)
        {
            int idIma = Convert.ToInt32(id);

            var imagenes = (from ima in dc.tbl_imagen
                            where ima.img_estado == 'A' && ima.img_id == idIma
                            select ima).ToList();

            return imagenes;
        }


        public List<tbl_imagen> BuscarImagenXPropiedad(string id)
        {
            int idIma = Convert.ToInt32(id);

            var imagenes = (from ima in dc.tbl_imagen
                            where ima.img_estado == 'A' && ima.pro_id == idIma
                            select ima).ToList();

            return imagenes;
        }
    }




    public class ImagenComp
    {
        public tbl_imagen Imagen { get; set; }
        public tbl_propiedad Propiedad { get; set; }
    }
}
