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
        
        

        public static SqlConnection ObtenerConexion()
        {
            String connString = "Server=localhost\\SQLSERVER2008; " + "Database=GD2C2014;User Id=gd;Password=gd2014";
            
            if (Conexion.State == ConnectionState.Closed)
            {
                Conexion.ConnectionString = connString;
                Conexion.Open();
            }

            return Conexion;
        }

    }

}
