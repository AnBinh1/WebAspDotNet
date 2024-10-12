using Microsoft.AspNetCore.Mvc;

namespace WebASPDotNet.Controllers
{
	public class CartController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}

}
