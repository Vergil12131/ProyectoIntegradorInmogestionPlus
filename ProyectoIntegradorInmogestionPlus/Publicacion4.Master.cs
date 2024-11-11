using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIntegradorInmogestionPlus
{
    public partial class Publicacion4 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            Response.Redirect("publicacion5_definitivo.aspx");
        }
    }
}