using System;
using System.Data.SqlClient;

namespace AgendaWebApp
{
    public partial class Contatos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInserir_Click(object sender, EventArgs e)
        {
            try
            {
                if (tbEmail.Text != "" && tbNome.Text != "" && tbTelefone.Text != "")
                {
                    //capturar a 'connectionstring'
                    System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/AgendaWebApp");
                    System.Configuration.ConnectionStringSettings connString;
                    connString = rootWebConfig.ConnectionStrings.ConnectionStrings[2];
                    //cria um objeto de conexão
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = connString.ToString();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "Insert INTO Contato (nome, email, telefone) values (@nome, @email, @telefone)";
                    cmd.Parameters.AddWithValue("nome", tbNome.Text);
                    cmd.Parameters.AddWithValue("email", tbEmail.Text);
                    cmd.Parameters.AddWithValue("telefone", tbTelefone.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    gvContato.DataBind();

                    tbNome.Text = "";
                    tbEmail.Text = "";
                    tbTelefone.Text = "";
                }
                else
                {
                    throw new Exception("Campos em branco!!!");
                }

            }catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }
    }
}