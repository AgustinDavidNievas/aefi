using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.Modelo
{
    class Rol
    {
    
        //nombre es la desc
        public string Descripcion { get; set; }
        public Rol(){}
        public Rol(string desc)
        {
            this.Descripcion=desc;
        }
    }
}
