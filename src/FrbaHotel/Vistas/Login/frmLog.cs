using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Vistas.Reserva;
using FrbaHotel.Login;

namespace FrbaHotel.Vistas.Login
{
    public partial class frmLog : Form
    {
        public frmLog()
        {
            InitializeComponent();
        }

        private void cmbTipoUser_SelectedIndexChanged(object sender, EventArgs e)
        {



        }

        private void frmLog_Load(object sender, EventArgs e)
        {
            this.cmbTipoUser.Items.Add("Administrador");
            this.cmbTipoUser.Items.Add("Recepcionista");
            this.cmbTipoUser.Items.Add("Invitado");

        }

        private void btnSalir_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if ((this.cmbTipoUser.SelectedItem as string) == "Administrador")
            {
                Form frmLogIn = new frmLogIn();
                frmLogIn.Show();
                this.Hide();

            }
            if ((this.cmbTipoUser.SelectedItem as String) == "Recepcionista")
            {
                Form frmLogIn = new frmLogIn();
                frmLogIn.Show();
                this.Hide();
            }
            if ((this.cmbTipoUser.SelectedItem as String) == "Invitado")
            {
                Form frmReserva = new frmReserva();
                frmReserva.Show();
                this.Hide();

            }
        }
    }
}