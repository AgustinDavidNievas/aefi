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
using FrbaHotel.Vistas.Login;

namespace FrbaHotel.Login
{
    public partial class FrmLogIn : Form
    {
        SqlConnection conexion = BaseDeDatos.ObtenerConexion();
    
        public FrmLogIn()
        {
            InitializeComponent();
        }

        private void FrmLogIn_Load(object sender, EventArgs e)
        {
            SqlConnection conexion = BaseDeDatos.ObtenerConexion();

        }

        private void cmbRoles_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lblElegirRol_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void entrarBtn_Click(object sender, EventArgs e)
        {
            String consultaUsuario = "SELECT id_usuario, username, password, intentos_fallidos" +
               "FROM AEFI.tl_usuario " +
               "WHERE username = @username";

            Form formElegirRol = new FormElegirRol();//por ahora esta asi, pero aca se le tiene que mandar el id_usuario
            formElegirRol.Show();
            this.Hide();
        }

        private void txbUsuario_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
