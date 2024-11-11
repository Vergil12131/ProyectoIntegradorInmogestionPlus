using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class publicacion5_definitivoEdicion : System.Web.UI.Page
    {
        private CnTblPropiedad pro = new CnTblPropiedad();
        private CnTblUbicacion ubi = new CnTblUbicacion();
        private CnTblCaracteristicas car = new CnTblCaracteristicas();
        private CnTblImagen img = new CnTblImagen();
        private CnTblPlano plano = new CnTblPlano();
        private CnTblVideo vid = new CnTblVideo();
        private CnTblUsuario usu = new CnTblUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idPropiedad"] == null)
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");

            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() != "4")
                    Response.Redirect("Inicio_Sesion_Definitivo.aspx");
            }
            else
                Response.Redirect("Inicio_Sesion_Definitivo.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            //Eliminar propiedad previa
            pro.EliminarPropiedad(Session["idPropiedad"].ToString());


            //Set Sesiones 1
            // Propiedad
            string operacion = Session["Operacion"].ToString();
            string tipoInmueble = Session["TipoInmueble"].ToString();
             
            
            // Set Sesiones 2
            // Ubicacion
            string direccion = Session["Direccion"].ToString();
            string provincia = Session["Provincia"].ToString();
            //string ciudad = Session["Ciudad"].ToString();
            string ciudad = Session["Parroquia"].ToString();
            string canton = Session["Canton"].ToString();
            // Propiedad
            string coordenadas = Session["Coordenadas"].ToString();
             
            
            // SET SESIONES 3
            // Caracteristicas
            string habitaciones = Session["Habitaciones"].ToString();
            string banos = Session["Banos"].ToString();
            string estacionamientos = Session["Estacionamiento"].ToString();
            // Propiedad
            string superficieTotal = Session["SuperficieTotal"].ToString();
            string superficieConstruida = Session["SuperficieConstruida"].ToString();
            string antiguedad = Session["Antiguedad"].ToString();
            string precio = Session["Precio"].ToString();
            string alicuota = Session["Alicuota"].ToString();
            string titulo = Session["Titulo"].ToString();
            string descripcion = Session["Descripcion"].ToString();



            

            





            // INSERTAR UBICACION
            ubi.RegistrarUbicacion(provincia, canton, ciudad, direccion);

            // INSERTAR CARACTERISTICAS
            car.RegistrarCaracteristica(habitaciones, banos, estacionamientos);

            // INSERTAR PROPIEDAD
            var ubiId = ubi.ObtenerUltimoRegistro().ubi_id.ToString();
            var carId = car.ObtenerUltimoRegistro().car_id.ToString();
            //var inmId = usu.BuscarUsuarioXId(Session["idUsuario"].ToString()).First().inm_id.ToString();
            var inmId = Session["idUsuario"].ToString();

            pro.RegistrarPropiedad(titulo, precio, superficieTotal, superficieConstruida, alicuota, descripcion, carId, operacion, tipoInmueble, antiguedad, inmId, "null", ubiId, coordenadas);


            var proId = pro.ObtenerUltimoRegistro().pro_id.ToString();

            //Sesiones imagen

            for (int i = 0; i < 20; i++)
            {
                string sessionKey = "pathImagen" + (i + 1);
                var sessionValue = Session[sessionKey];

                if (sessionValue == null)
                {
                    break;
                }

                // Trabaja con la sesión
                // Por ejemplo, puedes imprimir el valor de la sesión o realizar alguna operación
                img.RegistrarImagen(sessionValue.ToString(), proId);


            }


            //Sesiones plano

            for (int i = 0; i < 10; i++)
            {
                string sessionKey = "pathPlano" + (i + 1);
                var sessionValue = Session[sessionKey];

                if (sessionValue == null)
                {
                    break;
                }

                // Trabaja con la sesión
                // Por ejemplo, puedes imprimir el valor de la sesión o realizar alguna operación
                plano.RegistrarPlano(sessionValue.ToString(), proId);


            }


            //Sesiones video

            for (int i = 0; i < 5; i++)
            {
                string sessionKey = "pathVideo" + (i + 1);
                var sessionValue = Session[sessionKey];

                if (sessionValue == null)
                {
                    break;
                }

                // Trabaja con la sesión
                // Por ejemplo, puedes imprimir el valor de la sesión o realizar alguna operación
                vid.RegistrarVideo(sessionValue.ToString(), proId);


            }


            //ClearSessionsExcept("perfilUsuario", "idUsuario");


            Response.Redirect("Avisos.aspx");
        }


        public void ClearSessionsExcept(params string[] sessionsToKeep)
        {
            // Paso 1: Guardar las sesiones que deseas mantener
            Dictionary<string, object> tempSessions = new Dictionary<string, object>();

            foreach (string key in sessionsToKeep)
            {
                if (Session[key] != null)
                {
                    tempSessions[key] = Session[key];
                }
            }

            // Paso 2: Limpiar todas las sesiones
            Session.Clear();

            // Paso 3: Restaurar las sesiones que deseas mantener
            foreach (var kvp in tempSessions)
            {
                Session[kvp.Key] = kvp.Value;
            }
        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("publicacion4_definitivoEdicion.aspx");
        }
    }
}