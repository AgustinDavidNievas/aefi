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
        static SqlConnection Conexion = new SqlConnection();
        public static String connString = @"Server=localhost\SQLEXPRESS2008;Database=GD2C2014;User Id=gd;Password=gd2014;";
        //public static String connString = "";

        public static SqlConnection ObtenerConexion()
        {
            if (Conexion.State == ConnectionState.Closed)
            {
                Conexion.ConnectionString = connString;
                Conexion.Open();
            }

            return Conexion;
        }

        public static SqlConnection ObtenerConexion(bool ObtenerBaseNueva)
        {
            if (ObtenerBaseNueva == false)
            {
                return ObtenerConexion();
            }
            else
            {
                SqlConnection Conexion = new SqlConnection();
                Conexion.ConnectionString = connString;
                Conexion.Open();
                return Conexion;
            }
        }

    }

}
