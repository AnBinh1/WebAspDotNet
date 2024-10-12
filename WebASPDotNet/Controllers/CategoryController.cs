using Microsoft.AspNetCore.Mvc;

namespace WebASPDotNet.Controllers
{
	public class CategoryController:Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
