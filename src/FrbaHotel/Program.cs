using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using FrbaHotel.Login;
using FrbaHotel.Vistas.Login;
using System.Configuration;
using FrbaHotel.Menu;

namespace FrbaHotel
{
    static class Program
    {
        public static int? idUsuario = 0;
        public static string usuario = "";
        public static int? codigoRol = 0;
        //public static string fecha = ConfigurationSettings.AppSettings["fecha"];
        //public static string conexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new FrmLogIn());
            //Application.Run(new FormElegirRol());
            Application.Run(new FormMenu());
            

        }
    }
}
