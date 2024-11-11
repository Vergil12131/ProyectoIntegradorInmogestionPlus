using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class Vista_Propiedades : System.Web.UI.Page
    {
        private CnTblUsuario usu = new CnTblUsuario();
        private CnTblPropiedad pro = new CnTblPropiedad();
        private CnTblTipoOperacion tope = new CnTblTipoOperacion();
        private CnTblTipoInmueble tinm = new CnTblTipoInmueble();
        private CnTblImagen img = new CnTblImagen();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() == "4" || Session["perfilUsuario"].ToString() == "2")
                {
                    if (!IsPostBack)
                    {
                        CargarMenuHeader();
                        CargarNombreUsuario();
                        CargarPropiedadesDefault();
                        CargarFiltros();
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
                    CargarPropiedadesDefault();
                    CargarFiltros();
                }
            }
        }

        private void AplicarFiltrosHeader()
        {
            string dir = "";
            string ope = "";
            string tip = "";

            if (Session["filtroDireccion"] != null)
                dir = Session["filtroDireccion"].ToString();


            if (Session["filtroAccion"] != null)
                ope = Session["filtroAccion"].ToString();

            if (Session["filtroTipoInmueble"] != null)
                tip = Session["filtroTipoInmueble"].ToString();

            var propiedades = pro.BuscarPropiedadesFiltrosHeader(dir,ope,tip);

            Session.Remove("filtroDireccion");
            Session.Remove("filtroAccion");
            Session.Remove("filtroTipoInmueble");

            rptPropiedades.DataSource = propiedades;
            rptPropiedades.DataBind();
        }

        private void CargarFiltros()
        {
            CargarTiposOperacion();
            CargarTipoInmueble();
            CargarPrecios();
            CargarNumeroHabitaciones();
            CargarNumeroBanos();
            CargarNumeroEstacionamientos();
        }


        private void CargarNumeroBanos()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Value", typeof(string));
            dt.Columns.Add("NumeroBanos", typeof(string));

            var r1 = dt.NewRow();
            var r2 = dt.NewRow();
            var r3 = dt.NewRow();
            var r4 = dt.NewRow();
            var r5 = dt.NewRow();

            r1["Value"] = "1";
            r2["Value"] = "2";
            r3["Value"] = "3";
            r4["Value"] = "4";
            r5["Value"] = "5";

            r1["NumeroBanos"] = "1 Baño";
            r2["NumeroBanos"] = "2 Baños";
            r3["NumeroBanos"] = "3 Baños";
            r4["NumeroBanos"] = "4 Baños";
            r5["NumeroBanos"] = "5+ Baños";


            dt.Rows.Add(r1);
            dt.Rows.Add(r2);
            dt.Rows.Add(r3);
            dt.Rows.Add(r4);
            dt.Rows.Add(r5);

            cblNumeroBanos.DataSource = dt;
            cblNumeroBanos.DataValueField = "Value";
            cblNumeroBanos.DataTextField = "NumeroBanos";
            cblNumeroBanos.DataBind();
        }

        private void CargarNumeroEstacionamientos()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Value", typeof(string));
            dt.Columns.Add("NumeroEstacionamientos", typeof(string));

            var r1 = dt.NewRow();
            var r2 = dt.NewRow();
            var r3 = dt.NewRow();
            var r4 = dt.NewRow();
            var r5 = dt.NewRow();

            r1["Value"] = "1";
            r2["Value"] = "2";
            r3["Value"] = "3";
            r4["Value"] = "4";
            r5["Value"] = "5";

            r1["NumeroEstacionamientos"] = "1 Estacionamiento";
            r2["NumeroEstacionamientos"] = "2 Estacionamientos";
            r3["NumeroEstacionamientos"] = "3 Estacionamientos";
            r4["NumeroEstacionamientos"] = "4 Estacionamientos";
            r5["NumeroEstacionamientos"] = "5+ Estacionamientos";


            dt.Rows.Add(r1);
            dt.Rows.Add(r2);
            dt.Rows.Add(r3);
            dt.Rows.Add(r4);
            dt.Rows.Add(r5);

            cblNumeroEstacionamientos.DataSource = dt;
            cblNumeroEstacionamientos.DataValueField = "Value";
            cblNumeroEstacionamientos.DataTextField = "NumeroEstacionamientos";
            cblNumeroEstacionamientos.DataBind();
        }

        private void CargarNumeroHabitaciones()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Value", typeof(string));
            dt.Columns.Add("NumeroHabitaciones", typeof(string));

            var r1 = dt.NewRow();
            var r2 = dt.NewRow();
            var r3 = dt.NewRow();
            var r4 = dt.NewRow();
            var r5 = dt.NewRow();

            r1["Value"] = "1";
            r2["Value"] = "2";
            r3["Value"] = "3";
            r4["Value"] = "4";
            r5["Value"] = "5";

            r1["NumeroHabitaciones"] = "1 Habitacion";
            r2["NumeroHabitaciones"] = "2 Habitaciones";
            r3["NumeroHabitaciones"] = "3 Habitaciones";
            r4["NumeroHabitaciones"] = "4 Habitaciones";
            r5["NumeroHabitaciones"] = "5+ Habitaciones";


            dt.Rows.Add(r1);
            dt.Rows.Add(r2);
            dt.Rows.Add(r3);
            dt.Rows.Add(r4);
            dt.Rows.Add(r5);

            cblNumeroHabitaciones.DataSource = dt;
            cblNumeroHabitaciones.DataValueField = "Value";
            cblNumeroHabitaciones.DataTextField = "NumeroHabitaciones";
            cblNumeroHabitaciones.DataBind();
        }

        private void CargarPrecios()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Value", typeof(string));
            dt.Columns.Add("Precio", typeof(string));

            var r1 = dt.NewRow();
            var r2 = dt.NewRow();
            var r3 = dt.NewRow();
            var r4 = dt.NewRow();
            var r5 = dt.NewRow();

            r1["Value"] = "1";
            r2["Value"] = "2";
            r3["Value"] = "3";
            r4["Value"] = "4";
            r5["Value"] = "5";

            r1["Precio"] = "Hasta $50,000";
            r2["Precio"] = "$50,000 - $100,000";
            r3["Precio"] = "$100,000 - $150,000";
            r4["Precio"] = "$150,000 - $200,000";
            r5["Precio"] = "$200,000 +";


            dt.Rows.Add(r1);
            dt.Rows.Add(r2);
            dt.Rows.Add(r3);
            dt.Rows.Add(r4);
            dt.Rows.Add(r5);

            rblPrecio.DataSource = dt;
            rblPrecio.DataValueField = "Value";
            rblPrecio.DataTextField = "Precio";
            rblPrecio.DataBind();
        }

        private void CargarTipoInmueble()
        {
            var tiposInmueble = tinm.ListarInmueblees();

            cblTipoInmueble.DataSource = tiposInmueble;
            cblTipoInmueble.DataValueField = "tinm_id";
            cblTipoInmueble.DataTextField = "tinm_nombre";
            cblTipoInmueble.DataBind();
        }

        private void CargarTiposOperacion()
        {
            var tiposOperacion = tope.ListarOperaciones();

            cblAcciones.DataSource = tiposOperacion;
            cblAcciones.DataValueField = "tope_id";
            cblAcciones.DataTextField = "tope_nombre";
            cblAcciones.DataBind();
        }

        private void CargarPropiedadesDefault()
        {
            if (Session["filtroDireccion"] != null || Session["filtroAccion"] != null || Session["filtroTipoInmueble"] != null)
                AplicarFiltrosHeader();
            else
            {
                var propiedades = pro.ListarPropiedades();

                rptPropiedades.DataSource = propiedades;
                rptPropiedades.DataBind();
            }


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

        public string GetPropertyInfo(int habitaciones, int banos, int estacionamientos)
        {
            List<string> parts = new List<string>();

            if (habitaciones > 0)
                parts.Add($"{habitaciones} " + (habitaciones == 1 ? "habitación" : "habitaciones"));
            if (banos > 0)
                parts.Add($"{banos} " + (banos == 1 ? "baño" : "baños"));
            if (estacionamientos > 0)
                parts.Add($"{estacionamientos} " + (estacionamientos == 1 ? "estacionamiento" : "estacionamientos"));

            return string.Join(". ", parts) + ".";
        }



        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            var filtroTipoOperacion = GetSelectedValues(cblAcciones);
            var filtroTipoInmueble = GetSelectedValues(cblTipoInmueble);
            var filtroNumeroHabitaciones = GetSelectedValues(cblNumeroHabitaciones);
            var filtroNumeroBanos = GetSelectedValues(cblNumeroBanos);
            var filtroNumeroEstacionamientos = GetSelectedValues(cblNumeroEstacionamientos);
            var filtroDireccion = txtDireccion.Text;

            string filtroPrecio;

            if (!string.IsNullOrEmpty(rblPrecio.SelectedValue))
                filtroPrecio = rblPrecio.SelectedValue;
            else
                filtroPrecio = null;

            var propiedades = pro.BuscarPropiedadesFiltros(filtroTipoOperacion, filtroTipoInmueble, filtroPrecio, filtroNumeroHabitaciones, filtroNumeroBanos, filtroNumeroEstacionamientos, filtroDireccion);

            rptPropiedades.DataSource = propiedades;
            rptPropiedades.DataBind();
        }


        private List<string> GetSelectedValues(CheckBoxList checkBoxList)
        {
            List<string> selectedValues = new List<string>();

            foreach (ListItem item in checkBoxList.Items)
            {
                if (item.Selected)
                {
                    selectedValues.Add(item.Value);
                }
            }

            return selectedValues;
        }


        protected void btnLimpiarAccion_Click(object sender, EventArgs e)
        {
            cblAcciones.ClearSelection();
        }

        protected void btnLimpiarTipoInmueble_Click(object sender, EventArgs e)
        {
            cblTipoInmueble.ClearSelection();
        }

        protected void btnLimpiarPrecio_Click(object sender, EventArgs e)
        {
            rblPrecio.ClearSelection();
        }

        protected void btnLimpiarNumeroHabitaciones_Click(object sender, EventArgs e)
        {
            cblNumeroHabitaciones.ClearSelection();
        }

        protected void btnLimpiarNumeroBanos_Click(object sender, EventArgs e)
        {
            cblNumeroBanos.ClearSelection();
        }

        protected void btnLimpiarNumeroEstacionamientos_Click(object sender, EventArgs e)
        {
            cblNumeroEstacionamientos.ClearSelection();
        }

        protected void rptPropiedades_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Encontrar el HiddenField y el Repeater anidado
                HiddenField hfParentId = (HiddenField)e.Item.FindControl("hfPropiedadId");


                var imgPropiedad = (Image)e.Item.FindControl("imgPropiedad");


                string url = img.BuscarImagenXPropiedad(hfParentId.Value).First().img_url;

                imgPropiedad.ImageUrl = url;


                //Repeater rptChild = (Repeater)e.Item.FindControl("rptImagen");

                //// Obtener el parentId del HiddenField
                //string parentId = hfParentId.Value;

                //// Enlazar datos al Repeater anidado
                //var imagenes = img.BuscarImagenXId(parentId);


                //if (imagenes.Count > 0)
                //{
                //    for (int i = 0; i < imagenes.Count(); i++)
                //    {
                //        if (i == 0)
                //            continue;
                //        else
                //            imagenes.RemoveAt(i);
                //    }
                //}



                //rptChild.DataSource = imagenes;
                //rptChild.DataBind();


            }
        }

        protected void btnMisCitas_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerCitasCliente.aspx");
        }

        protected void btnVerMas_Click(object sender, EventArgs e)
        {
            // El sender es el botón que fue clicado
            Button btn = (Button)sender;

            // Obtener el CommandArgument, que contiene el valor de 'pro_id'
            string propiedadId = btn.CommandArgument;

            Session["idPropiedad"] = propiedadId;

            string x = "";

            if (Session["idPropiedad"] != null)
                x = Session["idPropiedad"].ToString();


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

    }
}
