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
    public partial class Transakcje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bttnZapiszTransakcje_Click(object sender, EventArgs e)
        {
            
            int id_towaru = int.Parse(TowaryDropDownList.SelectedValue);
            Decimal cena = decimal.Parse(txtCena.Text);
            int ilosc = int.Parse(txtIlosc.Text);
            Decimal wartosc = decimal.Parse(txtWartosc.Text);
            int id_pracownika = int.Parse(PracownikDropDownList.SelectedValue);
            int id_kontrahenta = int.Parse(KontrahentDropDownList.SelectedValue);
            DateTime data_operacji = Convert.ToDateTime(txtData.Text);
            string typ = TypDropDownList.SelectedValue;


            string connectionString = "Data Source=db-mssql.pjwstk.edu.pl;Initial Catalog=s7334;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                using (SqlCommand cmd = new SqlCommand("dodaj_transakcje", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@id_towaru", id_towaru);
                    cmd.Parameters.AddWithValue("@cena", cena);
                    cmd.Parameters.AddWithValue("@ilosc", ilosc);
                    cmd.Parameters.AddWithValue("@wartosc", wartosc);
                    cmd.Parameters.AddWithValue("@id_pracownika", id_pracownika);
                    cmd.Parameters.AddWithValue("@id_kontrahenta", id_kontrahenta);
                    cmd.Parameters.AddWithValue("@data_operacji", data_operacji);
                    cmd.Parameters.AddWithValue("@typ", typ);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                }
            }
            transakcjeGridView.DataBind();
             
        }

        protected void TowaryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connectionString = "Data Source=db-mssql.pjwstk.edu.pl;Initial Catalog=s7334;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT cena FROM Towary WHERE id_towaru = @id_towaru", conn))
                {
                    //   cmd.CommandType = CommandType.StoredProcedure;
                    //  SqlCommand cmd = new SqlCommand("SELECT OrderID FROM Orders WHERE OrderId = @OrderId", con);
                    cmd.Parameters.AddWithValue("@id_towaru", TowaryDropDownList.SelectedItem.Value);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
          
                        if (reader.Read())
                        {
                            txtCena.Text = reader["cena"].ToString();
                            txtCena.DataBind();
                        }         
                }
            }
        }
        /*
        protected void txtIlosc_TextChanged(object sender, EventArgs e)
        {
            int val1 = Int32.Parse(txtCena.Text);
            int val2 = Int32.Parse(txtIlosc.Text);
            int result = val1 * val2;
            txtWartosc.Text = result.ToString();
            txtWartosc.DataBind();
        }                  
         */
    }
}