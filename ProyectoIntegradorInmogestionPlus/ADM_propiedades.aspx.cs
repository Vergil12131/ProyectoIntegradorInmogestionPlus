using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class ADM_propiedades : System.Web.UI.Page
    {
        private CnTblPropiedad pro = new CnTblPropiedad();
        private CnTblAntiguedad ant = new CnTblAntiguedad();
        private CnTblCaracteristicas car = new CnTblCaracteristicas();
        private CnTblTipoInmueble tInm = new CnTblTipoInmueble();
        private CnTblTipoOperacion tOpe = new CnTblTipoOperacion();
        private CnTblUsuario usu = new CnTblUsuario();
        private CnTblUbicacion ubi = new CnTblUbicacion();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPropiedades();
                CargarAntiguedad();
                CargarCaracteristicas();
                CargarTInmueble();
                CargarTOperacion();
                CargarVend();
                CargarComp();
                CargarUbi();
            }
        }

        private void CargarPropiedades()
        {
            var perfiles = pro.ListarPropiedades();

            GridView1.DataSource = perfiles;
            GridView1.DataBind();
        }

        private void CargarAntiguedad()
        {
            var list = ant.ListarAntiguedades();

            ddlAntiguedad.DataSource = list;
            ddlAntiguedad.DataValueField = "ant_id";
            ddlAntiguedad.DataTextField = "ant_nombre";
            ddlAntiguedad.DataBind();
            ddlAntiguedad.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        private void CargarCaracteristicas()
        {
            var list = car.ListarCaracteristicas();

            ddlCaracteristicas.DataSource = list;
            ddlCaracteristicas.DataValueField = "car_id";
            ddlCaracteristicas.DataTextField = "car_id";
            ddlCaracteristicas.DataBind();
            ddlCaracteristicas.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        private void CargarTInmueble()
        {
            var list = tInm.ListarInmueblees();

            ddlTinmueble.DataSource = list;
            ddlTinmueble.DataValueField = "tinm_id";
            ddlTinmueble.DataTextField = "tinm_nombre";
            ddlTinmueble.DataBind();
            ddlTinmueble.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        private void CargarTOperacion()
        {
            var list = tOpe.ListarOperaciones();

            ddlToperacion.DataSource = list;
            ddlToperacion.DataValueField = "tope_id";
            ddlToperacion.DataTextField = "tope_nombre";
            ddlToperacion.DataBind();
            ddlToperacion.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }
        private void CargarVend()
        {
            var list = usu.SeleccionarUsuariosActivos();


            ddlVendedor.DataSource = list;
            ddlVendedor.DataValueField = "IdUsuario";
            ddlVendedor.DataTextField = "NombreCompleto";
            ddlVendedor.DataBind();
            ddlVendedor.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        private void CargarComp()
        {
            var list = usu.SeleccionarUsuariosActivos();

            ddlComprador.DataSource = list;
            ddlComprador.DataValueField = "IdUsuario";
            ddlComprador.DataTextField = "NombreCompleto";
            ddlComprador.DataBind();
            ddlComprador.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
            ddlComprador.Items.Insert(1, new ListItem("Sin Comprador", "-1"));
        }

        private void CargarUbi()
        {
            var list = ubi.ListarUbicaciones();

            ddlUbicacion.DataSource = list;
            ddlUbicacion.DataValueField = "ubi_id";
            ddlUbicacion.DataTextField = "ubi_id";
            ddlUbicacion.DataBind();
            ddlUbicacion.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if(!ValidarCampos()) 
                return;

            string comp;

            if (ddlComprador.SelectedValue == "-1")
                comp = "null";
            else
                comp = ddlComprador.SelectedValue;


            pro.RegistrarPropiedad(
                txt_Título.Text.Trim(),
                txt_precio.Text.Trim(),
                txt_superficieTotal.Text.Trim(),
                txt_superficieConstruida.Text.Trim(),
                txt_alicouta.Text.Trim(),
                txt_descripcion.Text.Trim(),
                ddlCaracteristicas.SelectedValue,
                ddlToperacion.SelectedValue,
                ddlTinmueble.SelectedValue,
                ddlAntiguedad.SelectedValue,
                ddlVendedor.SelectedValue,
                comp,
                ddlUbicacion.SelectedValue,
                ""
                );

            CargarPropiedades();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Propiedad agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {

            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            string comp;

            if (ddlComprador.SelectedValue == "-1")
                comp = "null";
            else
                comp = ddlComprador.SelectedValue;

            pro.EditarPropiedad(
                hiddenFieldId.Value,
                txt_Título.Text.Trim(),
                txt_precio.Text.Trim(),
                txt_superficieTotal.Text.Trim(),
                txt_superficieConstruida.Text.Trim(),
                txt_alicouta.Text.Trim(),
                txt_descripcion.Text.Trim(),
                ddlCaracteristicas.SelectedValue,
                ddlToperacion.SelectedValue,
                ddlTinmueble.SelectedValue,
                ddlAntiguedad.SelectedValue,
                ddlVendedor.SelectedValue,
                comp,
                ddlUbicacion.SelectedValue
                );

            CargarPropiedades();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Propiedad modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            pro.EliminarPropiedad(hiddenFieldId.Value);

            CargarPropiedades();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Propiedad eliminada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnSeleccion_Click(object sender, EventArgs e)
        {
            string id = (sender as Button).CommandArgument;

            var propiedad = pro.BuscarPropiedadXId(id).First();

            hiddenFieldId.Value = propiedad.pro_id.ToString();
            txt_Título.Text = propiedad.pro_titulo;
            txt_precio.Text = propiedad.pro_precio.ToString();
            
                txt_superficieTotal.Text = propiedad.pro_area_total.ToString();
                txt_superficieConstruida.Text = propiedad.pro_are_construida.ToString();
                txt_alicouta.Text = propiedad.pro_alicuota.ToString();
                txt_descripcion.Text = propiedad.pro_descripcion;
                ddlCaracteristicas.SelectedValue = propiedad.car_id.ToString();
                ddlToperacion.SelectedValue = propiedad.tope_id.ToString();
                ddlTinmueble.SelectedValue = propiedad.tinm_id.ToString();
                ddlAntiguedad.SelectedValue = propiedad.ant_id.ToString();
                ddlVendedor.SelectedValue = propiedad.inm_id.ToString();
                ddlUbicacion.SelectedValue = propiedad.ubi_id.ToString();

                if(propiedad.usu_comp_id != null)
                    ddlComprador.SelectedValue = propiedad.usu_comp_id.ToString();
                else
                    ddlComprador.SelectedValue = "-1";
        }

        public void Limpiar()
        {
            hiddenFieldId.Value = txt_Título.Text = txt_superficieConstruida.Text = txt_superficieTotal.Text = txt_precio.Text = txt_alicouta.Text = txt_descripcion.Text = "";

            ddlTinmueble.SelectedValue = ddlToperacion.SelectedValue = ddlAntiguedad.SelectedValue = ddlCaracteristicas.SelectedValue = ddlVendedor.SelectedValue = ddlComprador.SelectedValue = ddlUbicacion.SelectedValue = "0";

            lblErrorNombres.Style["display"] = "none";
            lblErrorSuperficieConstruida.Style["display"] = "none";
            lblErrorSuperficieTotal.Style["display"] = "none";
            lblErrorPrecio.Style["display"] = "none";
            lblErrorAlicouta.Style["display"] = "none";
            lblErrorDescripcion.Style["display"] = "none";
            lblErrorTinmueble.Style["display"] = "none";
            lblErrorOperacion.Style["display"] = "none";
            lblErrorAntiguedad.Style["display"] = "none";
            lblErrorCaracteristica.Style["display"] = "none";
            lblErrorVendedor.Style["display"] = "none";
            lblErrorComprador.Style["display"] = "none";
            lblErrorUbicacion.Style["display"] = "none";

            lbl_mensaje.Style["display"] = "none";
        }

        // VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarCadenaNula(txt_Título.Text))
            {
                lblErrorNombres.Text = "Debe ingresar un título";
                lblErrorNombres.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorNombres.Style["display"] = "none";


            if (!vGen.ValidarCadenaNula(txt_descripcion.Text))
            {
                lblErrorDescripcion.Text = "Debe ingresar una descripción";
                lblErrorDescripcion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDescripcion.Style["display"] = "none";


            if (!vGen.ValidarNumeroEnteroPositivo(txt_superficieConstruida.Text))
            {
                lblErrorSuperficieConstruida.Text = "Debe ingresar un valor válido";
                lblErrorSuperficieConstruida.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorSuperficieConstruida.Style["display"] = "none";


            if (!vGen.ValidarNumeroEnteroPositivo(txt_superficieTotal.Text))
            {
                lblErrorSuperficieConstruida.Text = "Debe ingresar un valor válido";
                lblErrorSuperficieConstruida.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorSuperficieConstruida.Style["display"] = "none";

            if (!vGen.ValidarNumeroDecimalPositivo(txt_precio.Text))
            {
                lblErrorPrecio.Text = "Debe ingresar un valor válido";
                lblErrorPrecio.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorPrecio.Style["display"] = "none";

            if (!vGen.ValidarNumeroDecimalPositivo(txt_alicouta.Text))
            {
                lblErrorAlicouta.Text = "Debe ingresar un valor válido";
                lblErrorAlicouta.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorAlicouta.Style["display"] = "none";


            if (!vGen.ValidarDdl(ddlAntiguedad.SelectedValue))
            {
                lblErrorAntiguedad.Text = "Debe seleccionar una antiguedad";
                lblErrorAntiguedad.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorAntiguedad.Style["display"] = "none";

            if (!vGen.ValidarDdl(ddlCaracteristicas.SelectedValue))
            {
                lblErrorCaracteristica.Text = "Debe seleccionar una caracteristica";
                lblErrorCaracteristica.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCaracteristica.Style["display"] = "none";

            if (!vGen.ValidarDdl(ddlComprador.SelectedValue))
            {
                lblErrorComprador.Text = "Debe seleccionar un comprador";
                lblErrorComprador.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorComprador.Style["display"] = "none";

            if (!vGen.ValidarDdl(ddlTinmueble.SelectedValue))
            {
                lblErrorTinmueble.Text = "Debe seleccionar un tipo de inmueble";
                lblErrorTinmueble.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorTinmueble.Style["display"] = "none";

            if (!vGen.ValidarDdl(ddlToperacion.SelectedValue))
            {
                lblErrorOperacion.Text = "Debe seleccionar un tipo de operación";
                lblErrorOperacion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorOperacion.Style["display"] = "none";

            if (!vGen.ValidarDdl(ddlUbicacion.SelectedValue))
            {
                lblErrorUbicacion.Text = "Debe seleccionar una ubicación";
                lblErrorUbicacion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorUbicacion.Style["display"] = "none";

            if (!vGen.ValidarDdl(ddlVendedor.SelectedValue))
            {
                lblErrorVendedor.Text = "Debe seleccionar un vendedor";
                lblErrorVendedor.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorVendedor.Style["display"] = "none";


            return ret;
        }

        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar una propiedad primero";
                lbl_mensaje.Style["display"] = "block";
                lbl_mensaje.Attributes["class"] = "text-danger";
                return false;
            }
            else
                lbl_mensaje.Style["display"] = "none";
            return true;
        }
    }
}