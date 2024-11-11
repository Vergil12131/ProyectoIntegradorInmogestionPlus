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
    public partial class publicacion3_definitivo : System.Web.UI.Page
    {
        private CnTblAntiguedad ant = new CnTblAntiguedad();
        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarAntiguedad();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (!ValidarFormulario())
                return;

            Session["Habitaciones"] = hfHabitaciones.Value;
            Session["Banos"] = hfBanos.Value;
            Session["Estacionamiento"] = hfEstacionamiento.Value;
            Session["SuperficieTotal"] = txt_superficie_total.Text;
            Session["SuperficieConstruida"] = txt_superficie_construida.Text;
            Session["Antiguedad"] = rblAntiguedad.SelectedValue;
            Session["Precio"] = txt_precio.Text;
            Session["Alicuota"] = txt_alicuota.Text;
            Session["Titulo"] = txt_titulo.Text;
            Session["Descripcion"] = txt_descripcion.Text;


            Response.Redirect("publicacion4_definitivo.aspx");
        }

        protected void CargarAntiguedad()
        {
            var antiguedad = ant.ListarAntiguedades();

            rblAntiguedad.DataSource = antiguedad;
            rblAntiguedad.DataValueField = "ant_id";
            rblAntiguedad.DataTextField = "ant_nombre";
            rblAntiguedad.DataBind();
        }




        // VALIDACIONES


        protected bool ValidarFormulario()
        {
            bool ret = true;

            if (!vGen.ValidarNumeroEnteroPositivo(txt_superficie_construida.Text))
            {
                lblErrorSuperficieConstruida.Text = "Ingrese un número entero positivo";
                lblErrorSuperficieConstruida.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorSuperficieConstruida.Style["display"] = "none";

            if (!vGen.ValidarNumeroEnteroPositivo(txt_superficie_total.Text))
            {
                lblErrorSuperficieTotal.Text = "Ingrese un número entero positivo";
                lblErrorSuperficieTotal.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorSuperficieTotal.Style["display"] = "none";


            if (!vGen.ValidarNumeroDecimalPositivo(txt_precio.Text))
            {
                lblErrorPrecio.Text = "Ingrese un número positivo";
                lblErrorPrecio.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorPrecio.Style["display"] = "none";



            if (decimal.TryParse(txt_alicuota.Text, out decimal number))
            {
                if (number >= 0)
                    lblErrorAlicuota.Style["display"] = "none";
                else
                {
                    lblErrorAlicuota.Text = "Ingrese un número igual o mayor a 0";
                    lblErrorAlicuota.Style["display"] = "block";
                    ret = false;
                }
            }
            else
            {
                lblErrorAlicuota.Text = "Ingrese un número igual o mayor a 0";
                lblErrorAlicuota.Style["display"] = "block";
                ret = false;
            }


            if (!vGen.ValidarLongitudMinima(txt_titulo.Text, 10))
            {
                lblErrorTitulo.Text = "El título debe contener al menos 10 caracteres de longitud";
                lblErrorTitulo.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorTitulo.Style["display"] = "none";


            if (!vGen.ValidarLongitudMinima(txt_descripcion.Text, 10))
            {
                lblErrorDescripcion.Text = "La descripción debe contener al menos 150 caracteres de longitud";
                lblErrorDescripcion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDescripcion.Style["display"] = "none";


            if (!vGen.ValidarDdl(rblAntiguedad.SelectedValue))
            {
                lblErrorAntiguedad.Text = "Debe seleccionar una antiguedad";
                lblErrorAntiguedad.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorAntiguedad.Style["display"] = "none";


            return ret;
        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("publicacion2_definitivo.aspx");
        }
    }
}