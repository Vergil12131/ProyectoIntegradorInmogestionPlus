using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class publicacion2_definitivo : System.Web.UI.Page
    {
        private ValidacionesGenerales vGen = new ValidacionesGenerales();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ScriptManager.RegisterStartupScript(this, GetType(), "initializeMap", "initializeMap();", true);
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            if (!ValidarFormulario())
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "initializeMap", "initializeMap();", true);
            }
            else
            {
                Session["Direccion"] = txt_ubicacion.Text;
                Session["Provincia"] = ddlProvincia.SelectedValue;
                //Session["Ciudad"] = ddlCiudad.SelectedValue;
                Session["Parroquia"] = ddlParroquia.SelectedValue;
                Session["Canton"] = ddlCanton.SelectedValue;
                Session["Coordenadas"] = hfCoordenadas.Value;

                Response.Redirect("publicacion3_definitivo.aspx");
            }

        }


        // VALIDACIONES

        protected bool ValidarFormulario()
        {
            bool ret = true;

            if (!vGen.ValidarLongitudMinima(txt_ubicacion.Text, 10))
            {
                lblErrorDireccion.Text = "Ingrese una dirección con al menos 10 caracteres de longitud";
                lblErrorDireccion.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorDireccion.Style["display"] = "none";


            if (String.IsNullOrEmpty(hfCoordenadas.Value))
            {
                lblErrorCoordenadas.Text = "Debe seleccionar una direccion en el mapa";
                lblErrorCoordenadas.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCoordenadas.Style["display"] = "none";


            if (!vGen.ValidarDdl(ddlProvincia.SelectedValue))
            {
                lblErrorProvincia.Text = "Debe seleccionar una provincia";
                lblErrorProvincia.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorProvincia.Style["display"] = "none";


            if (!vGen.ValidarDdl(ddlParroquia.SelectedValue))
            {
                lblErrorParroquia.Text = "Debe seleccionar una parroquia";
                lblErrorParroquia.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorParroquia.Style["display"] = "none";


            if (!vGen.ValidarDdl(ddlCanton.SelectedValue))
            {
                lblErrorCanton.Text = "Debe seleccionar un cantón";
                lblErrorCanton.Style["display"] = "block";
                ret = false;
            }
            else
                lblErrorCanton.Style["display"] = "none";


            //if (!vGen.ValidarDdl(ddlCiudad.SelectedValue))
            //if (!vGen.ValidarDdl(ddlParroquia.SelectedValue))
            //{
            //    lblErrorCiudad.Text = "Debe seleccionar una parroquia";
            //    lblErrorCiudad.Style["display"] = "block";
            //    ret = false;
            //}
            //else
            //    lblErrorCiudad.Style["display"] = "none";

            return ret;
        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Publicacion_Definitivo.aspx");
        }


        // DDL

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


        private readonly Dictionary<string, List<ListItem>> parroquiasPorCanton = new Dictionary<string, List<ListItem>>()
{
    { "Cuenca", new List<ListItem>
        {
            new ListItem("El Sagrario", "El Sagrario"),
            new ListItem("El Vecino", "El Vecino"),
            new ListItem("San Sebastián", "San Sebastián"),
            new ListItem("Tomebamba", "Tomebamba"),
            new ListItem("Sagrada Familia", "Sagrada Familia")
        }
    },
    { "Girón", new List<ListItem>
        {
            new ListItem("Girón", "Girón"),
            new ListItem("San Juan", "San Juan"),
            new ListItem("Santa Ana", "Santa Ana"),
            new ListItem("San Miguel", "San Miguel"),
            new ListItem("El Tambo", "El Tambo")
        }
    },
    { "Azogues", new List<ListItem>
        {
            new ListItem("Azogues", "Azogues"),
            new ListItem("Biblían", "Biblián"),
            new ListItem("Cañar", "Cañar"),
            new ListItem("La Troncal", "La Troncal"),
            new ListItem("El Tambo", "El Tambo")
        }
    },
    { "Tulcán", new List<ListItem>
        {
            new ListItem("Tulcán", "Tulcán"),
            new ListItem("Carchi", "Carchi"),
            new ListItem("Mira", "Mira"),
            new ListItem("Espejo", "Espejo"),
            new ListItem("Maldonado", "Maldonado")
        }
    },
    { "San Pedro de Huaca", new List<ListItem>
        {
            new ListItem("San Pedro de Huaca", "San Pedro de Huaca"),
            new ListItem("San Rafael", "San Rafael")
        }
    },
    { "Guayaquil", new List<ListItem>
        {
            new ListItem("Guayaquil", "Guayaquil"),
            new ListItem("Duran", "Duran"),
            new ListItem("Samborondón", "Samborondón"),
            new ListItem("Yaguachi", "Yaguachi"),
            new ListItem("Playas", "Playas")
        }
    },
    { "Balao", new List<ListItem>
        {
            new ListItem("Balao", "Balao"),
            new ListItem("El Triunfo", "El Triunfo"),
            new ListItem("Huaquillas", "Huaquillas")
        }
    },
    { "Quito", new List<ListItem>
        {
            new ListItem("Quito", "Quito"),
            new ListItem("Cumbayá", "Cumbayá"),
            new ListItem("La Armenia", "La Armenia"),
            new ListItem("Guayllabamba", "Guayllabamba"),
            new ListItem("Pomasqui", "Pomasqui")
        }
    },

    { "Rumiñahui", new List<ListItem>
        {
            new ListItem("Rumiñahui", "Rumiñahui"),
            new ListItem("Sangolquí", "Sangolquí"),
            new ListItem("Santo Domingo", "Santo Domingo"),
            new ListItem("Cumbayá", "Cumbayá")
        }
    },
    { "Ibarra", new List<ListItem>
       {
            new ListItem("Ibarra", "Ibarra"),
            new ListItem("Otavalo", "Otavalo"),
            new ListItem("Cotacachi", "Cotacachi"),
            new ListItem("Urcuquí", "Urcuquí"),
            new ListItem("Antonio Ante", "Antonio Ante")
       }
    },
    { "Loja", new List<ListItem>
       {
            new ListItem("Loja", "Loja"),
            new ListItem("Zapotillo", "Zapotillo"),
            new ListItem("Catamayo", "Catamayo"),
            new ListItem("Macará", "Macará"),
            new ListItem("Paltas", "Paltas")
       }
    },
    { "Portoviejo", new List<ListItem>
       {
            new ListItem("Portoviejo", "Portoviejo"),
            new ListItem("Manta", "Manta"),
            new ListItem("Chone", "Chone"),
            new ListItem("Jipijapa", "Jipijapa"),
            new ListItem("Rocafuerte", "Rocafuerte")
       }
    },
    { "Machala", new List<ListItem>
       {
            new ListItem("Machala", "Machala"),
            new ListItem("Zaruma", "Zaruma"),
            new ListItem("Balsas", "Balsas"),
            new ListItem("Huaquillas", "Huaquillas"),
            new ListItem("Santa Rosa", "Santa Rosa")
       }
    },
    { "Ambato", new List<ListItem>
       {
            new ListItem("Ambato", "Ambato"),
            new ListItem("Baños de Agua Santa", "Baños de Agua Santa"),
            new ListItem("Patate", "Patate"),
            new ListItem("Cevallos", "Cevallos"),
            new ListItem("Píllaro", "Píllaro")
       }
    },
    { "Esmeraldas", new List<ListItem>
       {
            new ListItem("Esmeraldas", "Esmeraldas"),
            new ListItem("Atacames", "Atacames"),
            new ListItem("Río Verde", "Río Verde"),
            new ListItem("Muisne", "Muisne"),
            new ListItem("Same", "Same")
       }
    },
    { "Santa Elena", new List<ListItem>
       {
            new ListItem("Santa Elena", "Santa Elena"),
            new ListItem("La Libertad", "La Libertad"),
            new ListItem("Salinas", "Salinas")
       }
    },
    { "Santa Domingo", new List<ListItem>
       {
            new ListItem("Santo Domingo", "Santo Domingo"),
            new ListItem("La Concordia", "La Concordia"),
            new ListItem("Bucay", "Bucay"),
            new ListItem("Quevedo", "Quevedo")
       }
    },
    { "Puyo", new List<ListItem>
       {
            new ListItem("Puyo", "Puyo"),
            new ListItem("Mera", "Mera"),
            new ListItem("Santa Clara", "Santa Clara"),
            new ListItem("Canelos", "Canelos")
       }
    },
    { "Macas", new List<ListItem>
       {
            new ListItem("Macas", "Macas"),
            new ListItem("Santiago", "Santiago"),
            new ListItem("Pablo Sexto", "Pablo Sexto"),
            new ListItem("Gualaquiza", "Gualaquiza")
       }
    },
    { "Zamora", new List<ListItem>
       {
            new ListItem("Zamora", "Zamora"),
            new ListItem("Yantzaza", "Yantzaza"),
            new ListItem("Centinela del Cóndor", "Centinela del Cóndor"),
            new ListItem("Zumba", "Zumba")
       }
    },

};





        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            string provinciaSeleccionada = ddlProvincia.SelectedValue;

            // Limpiar los cantones
            ddlCanton.Items.Clear();
            ddlCanton.Items.Add(new ListItem("Seleccione un cantón", ""));

            // Cargar los cantones basados en la provincia seleccionada
            if (cantonesPorProvincia.ContainsKey(provinciaSeleccionada))
            {
                ddlCanton.Items.AddRange(cantonesPorProvincia[provinciaSeleccionada].ToArray());
            }

            // Limpiar las parroquias
            ddlParroquia.Items.Clear();
            ddlParroquia.Items.Add(new ListItem("Seleccione una parroquia", ""));
            ActualizarCanton();

        }


        protected void ddlCanton_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cantonSeleccionado = ddlCanton.SelectedValue;

            // Limpiar las parroquias
            ddlParroquia.Items.Clear();
            ddlParroquia.Items.Add(new ListItem("Seleccione una parroquia", ""));

            // Cargar las parroquias basadas en el cantón seleccionado
            if (parroquiasPorCanton.ContainsKey(cantonSeleccionado))
            {
                ddlParroquia.Items.AddRange(parroquiasPorCanton[cantonSeleccionado].ToArray());
            }
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

    }
}