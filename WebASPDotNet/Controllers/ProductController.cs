﻿using Microsoft.AspNetCore.Mvc;

namespace WebASPDotNet.Controllers
{
	public class ProductController:Controller
	{
		public IActionResult Index()
		{
			return View();
		}
		public IActionResult Details()
		{
			return View();
		}
	}
}