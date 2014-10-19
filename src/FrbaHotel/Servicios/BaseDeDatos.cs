using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;
using System.Configuration;
using System.Security.Cryptography;

namespace FrbaHotel.Servicios
{
    class BaseDeDatos
    {

        /*public static SqlConnection ObtenerConexion()
        {
        SqlConnection Conexion = new SqlConnection("Server=localhost\\SQLSERVER2008; " + "Database=GD2C2014;User Id=gd;Password=gd2014");
        Conexion.Open();

        return Conexion;
        }*/

       

        public static SqlConnection ObtenerConexion()
        {

            String connetionString = "Data Source=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User Id=gd;Password=gd2014";
            SqlConnection conexion = new SqlConnection(connetionString);

            /*SqlConnection Conexion = new SqlConnection();

            String connString = "Server=localhost\\SQLSERVER2008; " + "Database=GD2C2014;User Id=gd;Password=gd2014";
            
            if (Conexion.State == ConnectionState.Closed)
            {
                Conexion.ConnectionString = connString;
                Conexion.Open();
            }*/

            return conexion;
        }

        /*
         public static SqlConnection conectar()
      {
          string connectionString = Program.conexion;
          return new SqlConnection(connectionString);
      }*/

        public static string agregarApostrofos(string palabra)
        {
            return "'" + palabra + "'";
        }

        public static string agregarPorcentajes(string palabra)
        {
            return "%" + palabra + "%";
        }
         


    }

}
