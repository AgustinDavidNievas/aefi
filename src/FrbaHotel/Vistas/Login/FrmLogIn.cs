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
        int contador = 3;
        string usuarioVerificar = null;
    
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
                                     "FROM AEFI.TL_Usuario " +
                                     "WHERE username = @username";

            try
            {
                conexion.Open(); //me parece que esto esta de mas aca o esta bien aca y la BaseDeDatos lo hace de mas :P
                SqlCommand comando = new SqlCommand(consultaUsuario, conexion);
                comando.Parameters.Add(new SqlParameter("@usuario", txbUsuario.Text));
                SqlDataReader reader = comando.ExecuteReader();

                // chequeo que exista el usuario ingresado
                if (!reader.HasRows)
                {
                    throw new Excepciones("Usuario inexistente");
                }

                else
                {
                    reader.Read();
                    int idUsuario = Convert.ToInt32(reader["id_usuario"]);
                    bool primerIngreso = (bool)reader["pass_temporal"];
                    bool habilitado = (bool)reader["habilitado"];
                    string usuario = reader["username"].ToString();
                    string contrasena = reader["password"].ToString();
                    reader.Close();

                    if (!contrasena.Equals(Utilidades.cifrar256(txbContrasena.Text)))
                    {
                        if (usuarioVerificar == null || usuarioVerificar == usuario)
                        {
                            contador--;
                        }
                        else
                        {
                            contador = 2;
                        }

                        usuarioVerificar = usuario;
                        throw new Excepciones("Contraseña incorrecta");
                    }

                    if (!habilitado)
                    {
                        throw new Excepciones("Usuario inhabilitado");
                    }

                    if (primerIngreso)
                    {
                        //CambioContrasena ingreso = new CambioContrasena(usuario);
                        //ingreso.ShowDialog();
                    }

                    txbContrasena.Enabled = false;

                    // se cargan las variables globales del sistema
                    Program.idUsuario = idUsuario;
                    Program.usuario = usuario;
                }

                MessageBox.Show("Eliga un Rol", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Form formElegirRol = new FormElegirRol();
                this.Hide();
                formElegirRol.ShowDialog(); //o Show()?
                this.Close();
                
            }
            catch (Excepciones exc)
            {
                MessageBox.Show(exc.Message, "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                // si ocurrieron 3 intentos fallidos en ingresar la contraseña se inhabilita al usuario
                if (contador == 0)
                {
                    string consultaInhabilitar = "UPDATE AEFI.TL_Usuario" +
                        "SET habilitado = 0 " +
                        "WHERE username = @username";
                    SqlCommand comandoInhabilitar = new SqlCommand(consultaInhabilitar, conexion);
                    comandoInhabilitar.Parameters.Add(new SqlParameter("@usuario", txbUsuario.Text));
                    comandoInhabilitar.ExecuteNonQuery();
                    MessageBox.Show("El usuario ha sido inhabilitado por ingresos invalidos", "",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (SqlException exc)
            {
                MessageBox.Show(exc.Message, "", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }

            finally
            {
                conexion.Close();
            }
            
           
        }

        private void txbUsuario_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
