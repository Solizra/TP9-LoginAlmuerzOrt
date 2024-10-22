using System.Data.SqlClient;
using Dapper;

static class BD{
    private static string _ConnectionString = @"Server=localhost; DataBase=AlmuerzORT; Trusted_Connection=True";
    
    public static bool UsuarioValido(Usuario user){
        string SQL = "SELECT COUNT(*) FROM Usuario WHERE dni = @pdni";
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            db.Execute(SQL,new{pdni = user.dni});
        }

        if(SQL == "1") return false; //esto esta mal, porque SQL vale la consulta, y no cambia. Prgeuntar.
        else return true;

    }
    public static void GuardarRegistro(Usuario user){
        string SQL = "INSERT INTO Usuario(nombre, apellido, mail, usuario, contraseña, dni, descripcion) VALUES(@pnombre, @papellido, @pmail, @pusuario, @pcontraseña, @pdni, @pdescripcion)";
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            db.Execute(SQL,new{pnombre = user.nombre, papellido = user.apellido, pmail=user.mail, pusuario=user.usuario, pcontraseña = user.contraseña, pdni = user.dni, pdescripcion=user.descripcion});
        }
    }
}
