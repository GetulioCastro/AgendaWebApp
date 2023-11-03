using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaWebApp
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListView1.DataBind(); // Use o nome correto do seu ListView
            }
        }

        public void limparCampo()
        {
            lMensg.Text = string.Empty;
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            limparCampo();
        }

        protected void SqlDataSourceU_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Response.Write("<script>alert('Inserindo registro duplicado ou campo em branco!')</script>");
                //lMensg.Text = "Inserindo registro duplicado ou campo em branco!";
                e.ExceptionHandled = true;
            }

        }

        protected void SqlDataSourceU_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Response.Write("<script>alert('Alterando um registro ou faltando informar campo!')</script>");
                //lMensg.Text = "Alterando um registro ou faltando informar campo!";
                e.ExceptionHandled = true;
            }
        }
    }
}