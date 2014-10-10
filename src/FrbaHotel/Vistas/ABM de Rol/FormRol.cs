using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using FrbaHotel.Servicios;

namespace FrbaHotel.ABM_de_Rol
{
    public partial class FormRol : Form //No me deja ponerle FormRol, se rompe el InitializeComponent u.u
    {
        SqlConnection conexion = BaseDeDatos.ObtenerConexion();

        public FormRol()
        {
            InitializeComponent();
        }

        private void FormRol_Load(object sender, EventArgs e)
        {
          SqlConnection conexion = BaseDeDatos.ObtenerConexion();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*Agus se la come, Lucas se la da :O */
        }
    }
}
