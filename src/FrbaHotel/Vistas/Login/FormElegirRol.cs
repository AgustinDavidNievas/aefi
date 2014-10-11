using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Vistas.Login
{
    public partial class FormElegirRol : Form
    {
        int idUsuarioQueMandoElLogIn;
    
        public FormElegirRol()
        {
            InitializeComponent();
            this.idUsuarioQueMandoElLogIn = Program.idUsuario;//en teoria esta variable de clase ya esta asignada cuando se llega a esta linea
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
