using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class ValidacionesGenerales
    {
        public bool ValidarDdl(string value)
        {
            if (string.IsNullOrEmpty(value) || value == "0")
                return false;
            else
                return true;
        }

        public bool ValidarCadenaNula(string cadena)
        {
            if (string.IsNullOrEmpty(cadena))
            {
                return false;
            }
            return true;
        }

        public bool ValidarNumeroDecimalPositivo(string input)
        {
            if (decimal.TryParse(input, out decimal number))
            {
                return number > 0;
            }
            return false;
        }

        public bool ValidarNumeroEnteroPositivo(string input)
        {
            if (int.TryParse(input, out int number))
            {
                return number > 0;
            }
            
            return false;
        }

        public bool IsInteger(string input)
        {
            return int.TryParse(input, out _);
        }


        public bool ValidarLongitudMinima(string cadena, int longitud)
        {
            if (cadena == null)
            {
                return false;
            }

            return cadena.Length >= longitud;
        }
    }
}
