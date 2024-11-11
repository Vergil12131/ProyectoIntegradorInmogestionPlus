using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CnTblVideo
    {
        private CdInmogestionPlusDataContext dc = new CdInmogestionPlusDataContext();

        public List<tbl_video> ListarVideos()
        {
            var videos = (from vid in dc.tbl_video where vid.vid_estado == 'A' select vid).ToList();

            return videos;
        }

        public List<VideoComp> ListarVideosComp()
        {
            var imagenes = (from vid in dc.tbl_video
                            join pro in dc.tbl_propiedad on vid.pro_id
                            equals pro.pro_id
                            where vid.vid_estado == 'A'
                            select new VideoComp
                            {
                                Video = vid,
                                Propiedad = pro
                            }).ToList();

            return imagenes;
        }

        public void RegistrarVideo(string path, string proId)
        {
            int idPro = Convert.ToInt32(proId);
            dc.registrar_video(path, idPro);
        }

        public void EditarVideo(string id, string path, string proId)
        {
            int idVid = Convert.ToInt32(id);
            int idPro = Convert.ToInt32(proId);

            dc.editar_video(idVid, path, idPro);
        }

        public void EliminarVideo(string id)
        {
            int idIma = Convert.ToInt32(id);
            dc.eliminar_video(idIma);
        }

        public List<tbl_video> BuscarVideoXId(string id)
        {
            int idIma = Convert.ToInt32(id);

            var videos = (from vid in dc.tbl_video
                            where vid.vid_estado == 'A' && vid.vid_id == idIma
                            select vid).ToList();

            return videos;
        }

        public List<tbl_video> BuscarVideoXPropiedad(string id)
        {
            int idIma = Convert.ToInt32(id);

            var videos = (from vid in dc.tbl_video
                          where vid.vid_estado == 'A' && vid.pro_id == idIma
                          select vid).ToList();

            return videos;
        }
    }

    public class VideoComp
    {
        public tbl_video Video { get; set; }
        public tbl_propiedad Propiedad { get; set; }
    }
}
