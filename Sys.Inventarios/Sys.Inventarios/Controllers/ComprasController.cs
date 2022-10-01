using Model;
using PagedList;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sys.Inventarios.Controllers
{
    public class ComprasController : Controller
    {
        // GET: Compras
        public ActionResult Index()
        {
            ViewBag.Page = "Compras";
            return View();
        }

        public ActionResult ListaCompras(string val, string valSearch, int? page)
        {
            ViewBag.CurrentSort = val;
            ViewBag.Buscar = valSearch;
            IRepository repository = new Model.Repository();
            List<vCompras> objCompras = new List<vCompras>();
            if (string.IsNullOrEmpty(valSearch))
                objCompras = repository.FindEntitySet<vCompras>(c => c.Activo == true).OrderByDescending(c => c.Fecha).ToList();
            else
                objCompras = repository.FindEntitySet<vCompras>(c => c.Activo == true && (c.Compra.Contains(valSearch) || c.NombreEmpresa.Contains(valSearch) 
                || c.Nombres.Contains(valSearch) || c.Id.ToString().Contains(valSearch))).OrderByDescending(c => c.Fecha).ToList();

            if (val == "Id" || string.IsNullOrEmpty(val))
            {
                val = "Id";
                objCompras = objCompras.OrderBy(c => c.Id).ToList();
            }
            else if (val == "IdDesc")
                objCompras = objCompras.OrderByDescending(c => c.Id).ToList();
            else if (val == "Nombre")
                objCompras = objCompras.OrderBy(c => c.Nombres).ToList();
            else if (val == "NombreDesc")
                objCompras = objCompras.OrderByDescending(c => c.Nombres).ToList();
            else if (val == "Compra")
                objCompras = objCompras.OrderBy(c => c.Compra).ToList();
            else if (val == "CompraDesc")
                objCompras = objCompras.OrderByDescending(c => c.Compra).ToList();
            else if (val == "NombreEmpresa")
                objCompras = objCompras.OrderBy(c => c.NombreEmpresa).ToList();
            else if (val == "NombreEmpresaDesc")
                objCompras = objCompras.OrderByDescending(c => c.NombreEmpresa).ToList();
            else if (val == "Fecha")
                objCompras = objCompras.OrderBy(c => c.Fecha).ToList();
            else if (val == "FechaDesc")
                objCompras = objCompras.OrderByDescending(c => c.Fecha).ToList();
            ViewBag.Order = val;
            int pageSize = 5;
            int pageNumber = page ?? 1;


            return PartialView(objCompras.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult NewCompra()
        {
            IRepository repository = new Model.Repository();
            var prov = repository.FindEntitySet<Empresas>(c => c.Tipo_Id == 2 && c.Estatus==true).OrderBy(c => c.NombreEmpresa).ToList();
            ViewBag.Proveedores = prov;
            return PartialView();
        }

    }
}