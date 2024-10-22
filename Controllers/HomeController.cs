using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_Login_Sasson_Izraelewicz.Models;

namespace TP_Login_Sasson_Izraelewicz.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
}
