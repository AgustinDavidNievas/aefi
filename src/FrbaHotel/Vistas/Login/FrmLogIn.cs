﻿using System;
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
        int? contador = 3;
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

        private void entrarBtn_Click(object sender, EventArgs e)
        {
            int rolSeleccionado;

            try
            {
                //conexion.Open();
                String consulta = "SELECT ID_Rol " +
                                  "FROM AEFI.TL_Rol " +
                                  "WHERE Descripcion = @Descripcion " +
                                  "AND Activo = 1";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.Add(new SqlParameter("@Descripcion", cxbRol.SelectedItem.ToString()));
                SqlDataReader reader = comando.ExecuteReader();
                reader.Read();
                rolSeleccionado = Convert.ToInt32(reader["ID_Rol"]);
                reader.Close();

                // cargo el rol en la variable global del sistema
                Program.codigoRol = rolSeleccionado;

                MessageBox.Show("Bienvenido al sistema", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //new de la ventana que se tiene que abrir
                this.Hide();
                //ShowDialog()
                this.Close();
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

        private void validarBtn_Click(object sender, EventArgs e)
        {
            String consultaUsuario = "SELECT ID_Usuario, Username, Password, Intentos_Fallidos" +
                                     "FROM AEFI.TL_Usuario " +
                                     "WHERE Username = @Username";

            String consultaRoles = "SELECT Descripcion " +
                                    "FROM AEFI.TL_Rol r " +
                                    "JOIN AEFI.TL_Usuario_Por_Rol x ON (x.ID_Rol = r.ID_Rol) " +
                                    "JOIN AEFI.TL_Usuario u ON (u.ID_Usuario = x.ID_usuario) " +
                                    "WHERE Username = @Username AND r.Activo = 1";

            try
            {
                //conexion.Open(); //me parece que esto esta de mas aca o esta bien aca y la BaseDeDatos lo hace de mas :P
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

                    cxbRol.Enabled = true;
                    entrarBtn.Enabled = true;

                    // cargo los roles del usuario logeado que puede elegir
                    comando = new SqlCommand(consultaRoles, conexion);
                    comando.Parameters.Add(new SqlParameter("@usuario", usuario));
                    reader = comando.ExecuteReader();
                    cxbRol.Items.Clear();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            cxbRol.Items.Add(reader["Descripcion"].ToString());
                        }
                        reader.Close();
                        cxbRol.SelectedIndex = 0;
                    }
                    else
                    {
                        reader.Close();
                        MessageBox.Show("No tiene roles asignados", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        this.Close();
                    }
                }




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

        private void cxbRol_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
