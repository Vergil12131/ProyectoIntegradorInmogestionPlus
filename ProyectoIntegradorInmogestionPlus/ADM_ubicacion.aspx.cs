using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{

    public partial class ADM_ubicacion : System.Web.UI.Page
    {
        private CnTblUbicacion ubi = new CnTblUbicacion();

        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        private readonly Dictionary<string, List<ListItem>> cantonesPorProvincia = new Dictionary<string, List<ListItem>>()
        {
            { "Azuay", new List<ListItem>
                {
                    new ListItem("Cuenca", "Cuenca"),
                    new ListItem("Girón", "Girón"),
                    new ListItem("Gualaceo", "Gualaceo"),
                    new ListItem("Paute", "Paute"),
                    // Agrega los demás cantones de Azuay aquí
                }
            },
            { "Bolívar", new List<ListItem>
                {
                    new ListItem("Guaranda", "Guaranda"),
                    new ListItem("Chillanes", "Chillanes"),
                    new ListItem("San Miguel", "San Miguel"),
                    // Agrega los demás cantones de Bolívar aquí
                }
            },
            { "Cañar", new List<ListItem>
                {
                    new ListItem("Azogues", "Azogues"),
                    new ListItem("Cañar", "Cañar"),
                    new ListItem("Biblián", "Biblián"),
                    // Agrega los demás cantones de Cañar aquí
                }
            },
            { "Carchi", new List<ListItem>
                {
                    new ListItem("Tulcán", "Tulcán"),
                    new ListItem("Espejo", "Espejo"),
                    new ListItem("Panamá", "Panamá"),
                    // Agrega los demás cantones de Carchi aquí
                }
            },
            { "Chimborazo", new List<ListItem>
                {
                    new ListItem("Riobamba", "Riobamba"),
                    new ListItem("Chambo", "Chambo"),
                    new ListItem("Guano", "Guano"),
                    // Agrega los demás cantones de Chimborazo aquí
                }
            },
            { "Cotopaxi", new List<ListItem>
                {
                    new ListItem("Latacunga", "Latacunga"),
                    new ListItem("Salcedo", "Salcedo"),
                    new ListItem("Pujilí", "Pujilí"),
                    // Agrega los demás cantones de Cotopaxi aquí
                }
            },
            { "El Oro", new List<ListItem>
                {
                    new ListItem("Machala", "Machala"),
                    new ListItem("Zaruma", "Zaruma"),
                    new ListItem("Huaquillas", "Huaquillas"),
                    // Agrega los demás cantones de El Oro aquí
                }
            },
            { "Esmeraldas", new List<ListItem>
                {
                    new ListItem("Esmeraldas", "Esmeraldas"),
                    new ListItem("Atacames", "Atacames"),
                    new ListItem("Río Verde", "Río Verde"),
                    // Agrega los demás cantones de Esmeraldas aquí
                }
            },
            { "Galápagos", new List<ListItem>
                {
                    new ListItem("San Cristóbal", "San Cristóbal"),
                    new ListItem("Santa Cruz", "Santa Cruz"),
                    new ListItem("Isabela", "Isabela"),
                    // Agrega los demás cantones de Galápagos aquí
                }
            },
            { "Guayas", new List<ListItem>
                {
                    new ListItem("Guayaquil", "Guayaquil"),
                    new ListItem("Durán", "Durán"),
                    new ListItem("Samborondón", "Samborondón"),
                    // Agrega los demás cantones de Guayas aquí
                }
            },
            { "Imbabura", new List<ListItem>
                {
                    new ListItem("Ibarra", "Ibarra"),
                    new ListItem("Otavalo", "Otavalo"),
                    new ListItem("Antonio Ante", "Antonio Ante"),
                    // Agrega los demás cantones de Imbabura aquí
                }
            },
            { "Loja", new List<ListItem>
                {
                    new ListItem("Loja", "Loja"),
                    new ListItem("Catamayo", "Catamayo"),
                    new ListItem("Zamora", "Zamora"),
                    // Agrega los demás cantones de Loja aquí
                }
            },
            { "Los Ríos", new List<ListItem>
                {
                    new ListItem("Babahoyo", "Babahoyo"),
                    new ListItem("Montalvo", "Montalvo"),
                    new ListItem("Quevedo", "Quevedo"),
                    // Agrega los demás cantones de Los Ríos aquí
                }
            },
            { "Manabí", new List<ListItem>
                {
                    new ListItem("Portoviejo", "Portoviejo"),
                    new ListItem("Manta", "Manta"),
                    new ListItem("Chone", "Chone"),
                    // Agrega los demás cantones de Manabí aquí
                }
            },
            { "Morona Santiago", new List<ListItem>
                {
                    new ListItem("Macas", "Macas"),
                    new ListItem("Santiago", "Santiago"),
                    new ListItem("Morona", "Morona"),
                    // Agrega los demás cantones de Morona Santiago aquí
                }
            },
            { "Napo", new List<ListItem>
                {
                    new ListItem("Tena", "Tena"),
                    new ListItem("Archidona", "Archidona"),
                    new ListItem("Carlos Julio Arosemena Tola", "Carlos Julio Arosemena Tola"),
                    // Agrega los demás cantones de Napo aquí
                }
            },
            { "Orellana", new List<ListItem>
                {
                    new ListItem("Francisco de Orellana", "Francisco de Orellana"),
                    new ListItem("Joya de los Sachas", "Joya de los Sachas"),
                    new ListItem("Coca", "Coca"),
                    // Agrega los demás cantones de Orellana aquí
                }
            },
            { "Pastaza", new List<ListItem>
                {
                    new ListItem("Puyo", "Puyo"),
                    new ListItem("Mera", "Mera"),
                    new ListItem("Arajuno", "Arajuno"),
                    // Agrega los demás cantones de Pastaza aquí
                }
            },
            { "Pichincha", new List<ListItem>
                {
                    new ListItem("Quito", "Quito"),
                    new ListItem("Rumiñahui", "Rumiñahui"),
                    new ListItem("Cayambe", "Cayambe"),
                    // Agrega los demás cantones de Pichincha aquí
                }
            },
            { "Santa Elena", new List<ListItem>
                {
                    new ListItem("Santa Elena", "Santa Elena"),
                    new ListItem("La Libertad", "La Libertad"),
                    new ListItem("Salinas", "Salinas"),
                    // Agrega los demás cantones de Santa Elena aquí
                }
            },
            { "Santo Domingo de los Tsáchilas", new List<ListItem>
                {
                    new ListItem("Santo Domingo", "Santo Domingo"),
                    new ListItem("La Concordia", "La Concordia"),
                    new ListItem("Valdez", "Valdez"),
                    // Agrega los demás cantones de Santo Domingo de los Tsáchilas aquí
                }
            },
            { "Sucumbíos", new List<ListItem>
                {
                    new ListItem("Tulcán", "Tulcán"),
                    new ListItem("Cárdenas", "Cárdenas"),
                    new ListItem("Luis Cordero", "Luis Cordero"),
                    // Agrega los demás cantones de Sucumbíos aquí
                }
            },
            { "Tungurahua", new List<ListItem>
                {
                    new ListItem("Ambato", "Ambato"),
                    new ListItem("Baños de Agua Santa", "Baños de Agua Santa"),
                    new ListItem("Patate", "Patate"),
                    // Agrega los demás cantones de Tungurahua aquí
                }
            },
            { "Zamora-Chinchipe", new List<ListItem>
                {
                    new ListItem("Zamora", "Zamora"),
                    new ListItem("Chinchipe", "Chinchipe"),
                    new ListItem("Yantzaza", "Yantzaza"),
                    // Agrega los demás cantones de Zamora-Chinchipe aquí
                }
            }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUbicaciones();
            }
        }

        private void CargarUbicaciones()
        {
            var ubicacion = ubi.ListarUbicaciones();

            GridView1.DataSource = ubicacion;
            GridView1.DataBind();
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarCanton();   
        }

        protected void ActualizarCanton()
        {
            string provinciaSeleccionada = ddlProvincia.SelectedValue;

            // Limpiar los cantones
            ddlCanton.Items.Clear();
            ddlCanton.Items.Add(new ListItem("Seleccione un cantón", "0"));

            // Cargar los cantones basados en la provincia seleccionada
            if (cantonesPorProvincia.ContainsKey(provinciaSeleccionada))
            {
                ddlCanton.Items.AddRange(cantonesPorProvincia[provinciaSeleccionada].ToArray());
            }
        }

        protected void ddlProvincia_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }


        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())
                return;

            ubi.RegistrarUbicacion(ddlProvincia.SelectedValue,
                ddlCanton.SelectedValue,
                txtSector.Text.Trim(),
                txtDireccion.Text.Trim());

            CargarUbicaciones();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Tipo de operación agregada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            if (!ValidarCampos())
                return;

            ubi.EditarUbicacion(hiddenFieldId.Value
                ,ddlProvincia.SelectedValue,
                ddlCanton.SelectedValue,
                txtSector.Text.Trim(),
                txtDireccion.Text.Trim());

            CargarUbicaciones();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Ubicación modificada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (!ValidarId())
                return;

            ubi.EliminarUbicacion(hiddenFieldId.Value);

            CargarUbicaciones();
            Limpiar();
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = "Ubicación eliminada con éxito";
            lbl_mensaje.Attributes["class"] = "text-success";
            lbl_mensaje.Style["display"] = "block";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnSeleccion_Click(object sender, EventArgs e)
        {
            Limpiar();
            string id = (sender as Button).CommandArgument;

            var ubicacion = ubi.BuscarUbicacionXId(id).First();

            hiddenFieldId.Value = ubicacion.ubi_id.ToString();
            ddlProvincia.SelectedValue = ubicacion.ubi_provincia;
            ActualizarCanton();
            ddlCanton.SelectedValue = ubicacion.ubi_canton;
            txtDireccion.Text = ubicacion.ubi_direccion;
            txtSector.Text = ubicacion.ubi_sector;
        }

        protected void Limpiar()
        {
            hiddenFieldId.Value = txtDireccion.Text =  txtSector.Text = "";
            ddlProvincia.SelectedValue = "0";
            ActualizarCanton();
            lblErrorCanton.Style["display"] = "none";
            lblErrorDireccion.Style["display"] = "none";
            lblErrorProvincia.Style["display"] = "none";
            lblErrorSector.Style["display"] = "none";
            lbl_mensaje.Style["display"] = "none";
        }


        // VALIDACIONES

        protected bool ValidarCampos()
        {
            bool ret = true;

            if (!vGen.ValidarCadenaNula(txtSector.Text))
            {
                lblErrorSector.Text = "Debe ingresar un sector";
                lblErrorSector.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorSector.Style["display"] = "none";

            if (!vGen.ValidarCadenaNula(txtDireccion.Text))
            {
                lblErrorDireccion.Text = "Debe ingresar una dirección";
                lblErrorDireccion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDireccion.Style["display"] = "none";


            if (!vGen.ValidarDdl(ddlCanton.SelectedValue))
            {
                lblErrorCanton.Text = "Debe seleccionar un cantón";
                lblErrorCanton.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCanton.Style["display"] = "none";


            if (!vGen.ValidarDdl(ddlProvincia.SelectedValue))
            {
                lblErrorProvincia.Text = "Debe seleccionar una provincia";
                lblErrorProvincia.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorProvincia.Style["display"] = "none";


            return ret;
        }

        protected bool ValidarId()
        {
            if (string.IsNullOrEmpty(hiddenFieldId.Value))
            {
                lbl_mensaje.Text = "Error. Debe seleccionar una ubicación primero";
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