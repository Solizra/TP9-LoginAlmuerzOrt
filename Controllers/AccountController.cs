using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_Login_Sasson_Izraelewicz.Models;

namespace TP_Login_Sasson_Izraelewicz.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;

    public AccountController(ILogger<AccountController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult IniciarSesion(){
        return View();
    }

    public IActionResult Registrarse(){
        return View();
    }

    [HttpPost]
    public IActionResult GuardarRegistro(Usuario user){ //HACER VALIDACION DE QUE NO EXISTA EL USUARIO EN LA BASE DE DATOS (REHACER BASE DE DATOS, ES CORTITA)
        if(BD.UsuarioValido(user)) {
            BD.GuardarRegistro(user);
            return View("PostLogin");
        }
        else{
            ViewBag.mensajeError = "ERROR! El usuario ya existe";
            return View("Registrarse");
        }
        
    }
}