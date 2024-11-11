using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class simuladorDefinitivo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSimular_Click(object sender, EventArgs e)
        {
            // Inicializar las variables de tasa de interés y validaciones
            decimal tasaInteresAnual = 0;
            decimal tasaInteresMensual = 0;
            int numeroPagos;
            bool esValido = true;

            // Validar campos vacíos
            if (string.IsNullOrWhiteSpace(txtPrecioVivienda.Text) || string.IsNullOrWhiteSpace(txtMontoPrestamo.Text) || string.IsNullOrWhiteSpace(txtPlazoAnios.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Todos los campos deben ser llenados.');", true);
                return;
            }

            // Obtener los valores ingresados por el usuario
            decimal precioVivienda = Convert.ToDecimal(txtPrecioVivienda.Text);
            decimal montoPrestamo = Convert.ToDecimal(txtMontoPrestamo.Text);
            int plazoAnios = Convert.ToInt32(txtPlazoAnios.Text);

            // Verificar si la vivienda es de interés público y social
            if (rbtnInteresPublico.Checked)
            {
                // Validaciones específicas para Vivienda de Interés Público y Social
                if (precioVivienda < 26483 || precioVivienda > 105340)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('El valor de la vivienda debe estar entre $26.483 y $105.340.');", true);
                    esValido = false;
                }

                if (plazoAnios < 20 || plazoAnios > 25)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('El plazo de pago debe estar entre 20 y 25 años.');", true);
                    esValido = false;
                }

                if (!esValido)
                    return;

                // Tasa de interés específica para Vivienda de Interés Público y Social
                tasaInteresAnual = 4.87m / 100;
            }
            else
            {
                // Para Vivienda Nueva o Usada, usar una tasa de interés general
                if (precioVivienda < 15000)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('El valor mínimo de la vivienda debe ser $15.000.');", true);
                    esValido = false;
                }

                if (montoPrestamo < 3000)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('El monto mínimo del préstamo debe ser $3.000.');", true);
                    esValido = false;
                }

                if (plazoAnios < 3 || plazoAnios > 20)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('El plazo de pago debe estar entre 3 y 20 años.');", true);
                    esValido = false;
                }

                if (!esValido)
                    return;

                // Tasa de interés general para Vivienda Nueva o Usada
                tasaInteresAnual = 10.86m / 100;
            }

            tasaInteresMensual = tasaInteresAnual / 12;
            numeroPagos = plazoAnios * 12;

            // Calcular la cuota mensual según el sistema de amortización francés
            decimal cuotaMensual = (montoPrestamo * tasaInteresMensual) /
                                   (1 - (decimal)Math.Pow(1 + (double)tasaInteresMensual, -numeroPagos));

            // Calcular costos adicionales
            decimal seguroDesgravamen = precioVivienda * 0.0015m; // 0.15% del valor de la vivienda
            decimal seguroIncendios = precioVivienda * 0.0025m;   // 0.25% del valor de la vivienda

            // Preparar los resultados para la tabla
            var resultados = new List<Resultado>
            {
                new Resultado { Descripcion = "Cuota mensual (incluyendo gastos adicionales)", Valor = (cuotaMensual + seguroDesgravamen + seguroIncendios).ToString("C2", new CultureInfo("en-US")) },
                new Resultado { Descripcion = "Costo de seguro de desgravamen", Valor = seguroDesgravamen.ToString("C2", new CultureInfo("en-US")) },
                new Resultado { Descripcion = "Costo de seguro contra incendios", Valor = seguroIncendios.ToString("C2", new CultureInfo("en-US")) }
            };

            // Mostrar los resultados en el GridView
            gvResultados.DataSource = resultados;
            gvResultados.DataBind();
            gvResultados.Visible = true;
            lblResultadosTitulo.Visible = true;
            btnVolverCalcular.Visible = true;
            btnComenzarAhora.Visible = true;

        }

        private decimal CalcularGastosAdicionales(decimal precioVivienda)
        {
            // Calculamos los gastos adicionales sumando los gastos de avalúo, contribución SOLCA, etc.
            decimal gastosAdicionales = precioVivienda * 0.05m;
            return gastosAdicionales;
        }

        // Clase para representar los resultados
        public class Resultado
        {
            public string Descripcion { get; set; }
            public string Valor { get; set; }
        }

        protected void btnVolverCalcular_Click(object sender, EventArgs e)
        {
            gvResultados.Visible = false;
            lblResultadosTitulo.Visible = false;

            // Limpiar los campos del formulario
            txtPrecioVivienda.Text = "";
            txtMontoPrestamo.Text = "";
            txtPlazoAnios.Text = "";
            rbtnNuevaUsada.Checked = true;
            rbtnFrancesa.Checked = true;
            btnVolverCalcular.Visible = false;
            btnComenzarAhora.Visible = false;
        }

        protected void btnComenzarAhora_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "openWindow", "window.open('https://creditohipotecario.pichincha.com/login', '_blank');", true);

            //Response.Redirect("https://creditohipotecario.pichincha.com/login");
        }

        protected void btnComoObtenerCredito_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "openWindow", "window.open('https://creditohipotecario.pichincha.com/guia_hipotecaria', '_blank');", true);
        }
    }
}