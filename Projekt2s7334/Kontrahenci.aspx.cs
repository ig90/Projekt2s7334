using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt2s7334
{
    public partial class Kontrahenci : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bttnZapisz_Click(object sender, EventArgs e)
        {
               
               string nazwa_kontrahenta = txtNazwa_kontrahenta.Text;
               string miasto = txtMiasto.Text;
               string kodPocztowy = txtKodPocztowy.Text;
               string ulica = txtUlica.Text;
               string nrDomu = txtNrDomu.Text;
               string nrMieszkania = txtNrMieszkania.Text;
               string typ = TypDropDownList.SelectedValue;
               string nrTelefonu = txtNrTelefonu.Text;
               string opis = txtOpis.Text;

            string connectionString = "Data Source=db-mssql.pjwstk.edu.pl;Initial Catalog=s7334;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                using (SqlCommand cmd = new SqlCommand("ins_kontrahent", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                   
                    cmd.Parameters.AddWithValue("@nazwa_kontrahenta", nazwa_kontrahenta);
                    cmd.Parameters.AddWithValue("@miasto", miasto);
                    cmd.Parameters.AddWithValue("@kodPocztowy", kodPocztowy);
                    cmd.Parameters.AddWithValue("@ulica", ulica);
                    cmd.Parameters.AddWithValue("@nrDomu", nrDomu);
                    cmd.Parameters.AddWithValue("@nrMieszkania", nrMieszkania);
                    cmd.Parameters.AddWithValue("@typ", typ);
                    cmd.Parameters.AddWithValue("@nrTelefonu", nrTelefonu);
                    cmd.Parameters.AddWithValue("@opis", opis);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                   
                    
                }
                
            }

           KontrahenciGridView.DataBind();

        }
                
    }
}