using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PoryectoIntegradorInmogestionPlus
{
    public partial class Avisos : System.Web.UI.Page
    {
        private CnTblPropiedad pro = new CnTblPropiedad();
        private CnTblImagen img = new CnTblImagen();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfilUsuario"] != null)
            {
                if (Session["perfilUsuario"].ToString() != "4")
                {
                    Response.Redirect("Inicio_Sesion_Definitivo.aspx");
                }
                else if (!IsPostBack)
                {
                    CargarPropiedades();
                }
            }
        }

        

        protected void btnArchivos_Click(object sender, ImageClickEventArgs e)
        {

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

        private void CargarPropiedades()
        {
            var propiedades = pro.BuscarPropiedadXIdAgente(Session["idUsuario"].ToString());

            rptPropiedades.DataSource = propiedades;
            rptPropiedades.DataBind();
            lblNumeroPublicaciones.Text = propiedades.Count.ToString();


            if (propiedades.Count == 0)
            {
                pnlSinAvisos.Style["display"] = "block";
                pnlConAvisos.Style["display"] = "none";
            }
            else
            {
                pnlSinAvisos.Style["display"] = "none";
                pnlConAvisos.Style["display"] = "block";
            }

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
            }
        }

        protected void btnEliminarPropiedad_Click(object sender, EventArgs e)
        {
            // El sender es el botón que fue clicado
            Button btn = (Button)sender;

            // Obtener el CommandArgument, que contiene el valor de 'pro_id'
            string propiedadId = btn.CommandArgument;

            pro.EliminarPropiedad(propiedadId);

            CargarPropiedades();
        }

       protected void btnVerPropiedad_Click(object sender, EventArgs e)
        {
            // El sender es el botón que fue clicado
            Button btn = (Button)sender;

            // Obtener el CommandArgument, que contiene el valor de 'pro_id'
            string propiedadId = btn.CommandArgument;

            Session["idPropiedad"] = propiedadId;

            Response.Redirect("Detalle_propiedad.aspx");
        }

        protected void btnEditarPropiedad_Click1(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            // Obtener el CommandArgument, que contiene el valor de 'pro_id'
            string propiedadId = btn.CommandArgument;

            Session["idPropiedad"] = propiedadId;

            Response.Redirect("Publicacion_DefinitivoEdicion.aspx");
        }
    }
}