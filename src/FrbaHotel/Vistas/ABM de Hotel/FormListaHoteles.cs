using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Servicios;
using System.Data.SqlClient;
using FrbaHotel.Menu;

namespace FrbaHotel.Vistas.ABM_de_Hotel
{
    public partial class FormListaDeHoteles : Form
    {
        SqlConnection conexion = BaseDeDatos.ObtenerConexion();

        public FormListaDeHoteles()
        {
            InitializeComponent();
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            FormMenu menu = new FormMenu();
            this.Hide();
            menu.ShowDialog();
            this.Close();
        }

        private void dgvHoteles_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {

        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {

        }
        /*
        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            conexion.Open();


            string consulta = "SELECT h.Cantidad_Estrellas, h.Ciudad, h.Pais" +
              "FROM AEFI.TL_Hotel h";
            



            if (!String.IsNullOrEmpty(tbCantEstrellas.Text))
            {
                String aux = Utilidades.agregarApostrofos(tbCantEstrellas.Text);
                consulta = consulta + " AND h.Cantidad_Estrellas = " + aux;
            }
            if (!String.IsNullOrEmpty(tbCiudad.Text))
            {
                String aux = Utilidades.agregarApostrofos("%" + tbCiudad.Text + "%");
                consulta = consulta + " AND h.Ciudad LIKE " + aux;
            }

            SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);
            DataTable tabla = new DataTable();
            adapter.Fill(tabla);
            dgvHoteles.DataSource = tabla;
            conexion.Close();

        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            dgvHoteles.DataSource = null;
            tbNombre.Clear();
            tbCantEstrellas.Clear();
            tbCiudad.Clear();
            tbPais.Clear();
        
        }*/
    }
}
