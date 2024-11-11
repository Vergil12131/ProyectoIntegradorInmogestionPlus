using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class ValidacionesUsuario
    {
        

        public bool ValidarNombreApellido(string text)
        {
            if (string.IsNullOrEmpty(text))
            {
                return false;
            }

            string[] palabras = text.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            if (palabras.Length == 2)
                return true;
            else
                return false;
        }

        public bool ValidarCedula(string cedula)
        {
            char[] validarCedula;
            int aux = 0, par = 0, impar = 0, verifi;
            //Validar string
            if (cedula.Length != 10 || cedula == "4444444444")
            {
                return false;
            }
            else
            {
                //Convertir string a array para usar en el resto del método
                validarCedula = cedula.ToCharArray();
            }
            for (int i = 0; i < 9; i += 2)
            {
                aux = 2 * int.Parse(validarCedula[i].ToString());
                if (aux > 9)
                    aux -= 9;
                par += aux;
            }
            for (int i = 1; i < 9; i += 2)
            {
                impar += int.Parse(validarCedula[i].ToString());
            }

            aux = par + impar;
            if (aux % 10 != 0)
            {
                verifi = 10 - (aux % 10);
            }
            else
                verifi = 0;
            if (verifi == int.Parse(validarCedula[9].ToString()))
                return true;
            else
                return false;
        }


        public bool ValidarCorreo(string correo)
        {
            try
            {
                var mail = new MailAddress(correo);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        

        public bool ValidarPassword(string password)
        {
            // Verifica que la contraseña tenga al menos 8 caracteres
            if (password.Length < 8)
            {
                return false;
            }

            // Verifica si hay al menos una mayúscula, una minúscula, un número y un carácter especial en la contraseña
            bool hasUpperCase = password.Any(char.IsUpper);
            bool hasLowerCase = password.Any(char.IsLower);
            bool hasDigit = password.Any(char.IsDigit);
            bool hasSpecialChar = password.Any(c => !char.IsLetterOrDigit(c));

            // Retorna true si cumple con todos los criterios, de lo contrario, retorna false
            return hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar;
        }

        public bool ValidarPassConfirm(string pass, string passConfirm)
        {
            return pass == passConfirm;
        }
    }
}
