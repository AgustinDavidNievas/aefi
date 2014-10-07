using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel
{
    public static class ManagerDeSesion
    {
        
        //Usuario logueado
        public static Usuario CurrentUser { get; set; }

        //Rol con el que decidio loguearse (en caso que posea mas de uno). Sino es el unico que tiene
        public static Rol CurrentRol { get; set; }

        //Fecha de acceso del usuario
        public static DateTime CurrentLoginDate { get; set; }

        public static void ClearCurrentSession()
        {
            //Borro los datos del ultimo acceso
            ManagerDeSesion.CurrentRol = null;
            ManagerDeSesion.CurrentUser = null;
            ManagerDeSesion.CurrentLoginDate = new DateTime();
        }
    }
}

