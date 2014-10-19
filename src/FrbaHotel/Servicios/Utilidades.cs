using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace FrbaHotel.Servicios
{
    class Utilidades
    {
      
       

        public static string cifrar256(string texto)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(texto);
            SHA256Managed provider = new SHA256Managed();
            byte[] hash = provider.ComputeHash(bytes);
            string textoHash = string.Empty;
            foreach (byte x in hash)
            {
                textoHash += String.Format("{0:X2}", x);
            }
            return textoHash;
        }
    }
}
