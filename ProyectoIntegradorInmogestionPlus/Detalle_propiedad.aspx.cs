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
    public partial class Detalle_propiedad : System.Web.UI.Page
    {
        private CnTblUsuario usu = new CnTblUsuario();
        private CnTblImagen img = new CnTblImagen();
        private CnTblPropiedad pro = new CnTblPropiedad();
        private CnTblUbicacion ubi = new CnTblUbicacion();
        private CnTblAntiguedad ant = new CnTblAntiguedad();
        private CnTblCaracteristicas car = new CnTblCaracteristicas();
        private CnTblPlano pla = new CnTblPlano();
        private CnTblVideo vid = new CnTblVideo();
        private CnTblInmueble inm = new CnTblInmueble();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idPropiedad"] == null)
                Response.Redirect("Vista_Propiedades.aspx");

            
            if (Session["perfilUsuario"] != null)
            {

                if (Session["perfilUsuario"].ToString() == "4" || Session["perfilUsuario"].ToString() == "2")
                {
                    if (!IsPostBack)
                    {

                        CargarMenuHeader();
                        CargarNombreUsuario();
                        CargarPropiedad();
                    }
                }
                else
                    Response.Redirect("Inicio_Sesion_Definitivo.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    CargarMenuHeader();
                    CargarPropiedad();
                }
            }
        }
        private void BindBlueprints()
        {
            var blueprints = pla.BuscarPlanoXPropiedad(Session["idPropiedad"].ToString());
            

            if (blueprints.Count > 0)
            {
                rptBlueprints.DataSource = blueprints;
                rptBlueprints.DataBind();
                pnlNoBlueprints.Visible = false;
            }
            else
            {
                pnlNoBlueprints.Visible = true;
            }
        }

        private void CargarPropiedad()
        {
            var propiedad = pro.BuscarPropiedadXId(Session["idPropiedad"].ToString()).First();
            var ubicacion = ubi.BuscarUbicacionXId(propiedad.ubi_id.ToString()).First();
            var antiguedad = ant.BuscarAntiguedadXId(propiedad.ant_id.ToString()).First();
            var caracteristicas = car.BuscarCaracteristicaXId(propiedad.car_id.ToString()).First();
            var agente = usu.BuscarUsuarioXId(propiedad.inm_id.ToString()).First();
            var inmobiliaria = inm.BuscarInmuebleXId(agente.inm_id.ToString()).First();

            string provincia = ubicacion.ubi_provincia;
            string canton = ubicacion.ubi_canton;
            string parroquia = ubicacion.ubi_sector;


            //Usado en la carga del mapa
            hfCoordenadas.Value = propiedad.pro_coordenadas;
            hfNombreUbicacion.Value = propiedad.pro_titulo;

            //Carga de imágenes, planos, videos
            BindThumbnails();
            BindBlueprints();
            BindVideos();


            //Detalles derecha de imagen
            lblDescripcion.Text = propiedad.pro_descripcion;
            lblPrecio.Text = $"${propiedad.pro_precio}";
            lblTitulo.Text = propiedad.pro_titulo;

            //Detalles agente
            lblInmobiliariaAgente.Text = $"{inmobiliaria.inm_nombre}";
            lblNombreAgente.Text = $"{agente.usu_primer_nombre} {agente.usu_primer_apellido}";
            lblTelefonoAgente.Text = $"{agente.usu_telefono}";
            lblEmailAgente.Text = $"{agente.usu_correo}";
            
            //Detalles debajo propiedad
            lblUbicacion.Text = $"{parroquia},  {canton},  {provincia}";
            lblPrecioDetalles.Text = $"${propiedad.pro_precio}";
            lblAreaConstruida.Text = $"{propiedad.pro_are_construida}  m²";
            lblAreaTotal.Text = $"{propiedad.pro_area_total}  m²";
            lblAntiguedad.Text = $"{antiguedad.ant_nombre}";
            lblHabitaciones.Text = $"{caracteristicas.car_habitaciones}";
            lblBano.Text = $"{caracteristicas.car_banos}";
            lblEstacionamiento.Text = $"{caracteristicas.car_estacionamineto}";
            lblDireccion.Text = ubicacion.ubi_direccion;

            //Cargar recomendaciones
            BindRecomendaciones();
        }

        private void BindThumbnails()
        {
            var thumbnails = img.BuscarImagenXPropiedad(Session["idPropiedad"].ToString());
            var mImg = thumbnails.First();

            mainImage.ImageUrl = mImg.img_url;


            rptThumbnails.DataSource = thumbnails;
            rptThumbnails.DataBind();
        }

        private void BindVideos()
        {
            var videos = vid.BuscarVideoXPropiedad(Session["idPropiedad"].ToString());
            
            rptVideos.DataSource = videos;
            rptVideos.DataBind();
        }

        private void CargarMenuHeader()
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "4")
                {
                    pnlAgente.Style["display"] = "block";
                    pnlCliente.Style["display"] = "none";
                    pnlLoggedOut.Style["display"] = "none";
                }
                else if (Session["perfilUsuario"].ToString() == "2")
                {
                    pnlAgente.Style["display"] = "none";
                    pnlCliente.Style["display"] = "block";
                    pnlLoggedOut.Style["display"] = "none";
                }
            }
            else
            {
                pnlAgente.Style["display"] = "none";
                pnlCliente.Style["display"] = "none";
                pnlLoggedOut.Style["display"] = "block";
            }
        }


        private void CargarNombreUsuario()
        {

            if (Session["idUsuario"] != null)
            {
                var usuario = usu.BuscarUsuarioXId(Session["idUsuario"].ToString()).First();
                string nombre = usuario.usu_primer_nombre;


                lblUsuarioAgente.Text = nombre;
                lblUsuarioCliente.Text = nombre;
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("pagina_principal.aspx");
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio_Sesion_Definitivo.aspx");
        }

        protected void btnCitas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Citas.aspx");
        }

        protected void btnAvisos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Avisos.aspx");
        }

        protected void btnPublicarPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("Publicacion_Definitivo.aspx");

        }
        protected void btnAgendarCita_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgendarCitas.aspx");
        }

        protected void rptPropiedades_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hfParentId = (HiddenField)e.Item.FindControl("hfPropiedadId");

                var imgPropiedad = (Image)e.Item.FindControl("imgRecomendaciones");

                string url = img.BuscarImagenXPropiedad(hfParentId.Value).First().img_url;

                imgPropiedad.ImageUrl = url;
            }
        }

        protected void BindRecomendaciones()
        {
            var propiedad = pro.ListarPropiedadesExcluyendoXId(Session["idPropiedad"].ToString());

            propiedad = propiedad.OrderBy(x => Guid.NewGuid()).ToList();
            propiedad = propiedad.Take(3).ToList();

            rptPropiedadesRecomendadas.DataSource = propiedad;
            rptPropiedadesRecomendadas.DataBind();
        }

        protected void btnRecomendaciones_Click(object sender, EventArgs e)
        {
            // El sender es el botón que fue clicado
            Button btn = (Button)sender;

            // Obtener el CommandArgument, que contiene el valor de 'pro_id'
            string propiedadId = btn.CommandArgument;

            Session["idPropiedad"] = propiedadId;

            Response.Redirect("Detalle_propiedad.aspx");
        }


        protected void hlComprarCasa_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Comprar";
            Session["filtroTipoInmueble"] = "Casa";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void hlComprarDepartamento_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Comprar";
            Session["filtroTipoInmueble"] = "Departamento";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void hlComprarSuite_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Comprar";
            Session["filtroTipoInmueble"] = "Suite";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void hlComprarUrbanizacion_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Comprar";
            Session["filtroTipoInmueble"] = "Urbanizacion";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbAlquilarCasa_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Alquilar";
            Session["filtroTipoInmueble"] = "Casa";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbAlquilarDepartamento_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Alquilar";
            Session["filtroTipoInmueble"] = "Departamento";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbAlquilarSuite_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Alquilar";
            Session["filtroTipoInmueble"] = "Suite";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbAlquilarUrbanizacion_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Alquilar";
            Session["filtroTipoInmueble"] = "Urbanizacion";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbTemporalCasa_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Temporal";
            Session["filtroTipoInmueble"] = "Casa";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbTemporalDepartamento_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Temporal";
            Session["filtroTipoInmueble"] = "Departamento";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbTemporalSuite_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Temporal";
            Session["filtroTipoInmueble"] = "Suite";
            Response.Redirect("Vista_Propiedades.aspx");
        }

        protected void lbTemporalUrbanizacion_Click(object sender, EventArgs e)
        {
            Session["filtroDireccion"] = "";
            Session["filtroAccion"] = "Temporal";
            Session["filtroTipoInmueble"] = "Urbanizacion";
            Response.Redirect("Vista_Propiedades.aspx");
        }


        protected void btnMisCitas_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerCitasCliente.aspx");
        }
    }
}