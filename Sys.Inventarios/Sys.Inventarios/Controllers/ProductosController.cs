using Model;
using PagedList;
using Repository;
using Sys.Inventarios.Attributes;
using Sys.Inventarios.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sys.Inventarios.Controllers
{
    [Autenticado]
    public class ProductosController : Controller
    {
        // GET: Productos
        public ActionResult Index()
        {
            ViewBag.Page = "Productos";
            return View();
        }

        public ActionResult ListaProductos(string val, string valSearch, int? page)
        {
            ViewBag.CurrentSort = val;
            ViewBag.Buscar = valSearch;
            IRepository repository = new Model.Repository();
            List<Productos> objProduct = new List<Productos>();
            if (string.IsNullOrEmpty(valSearch))
                objProduct = repository.FindEntitySet<Productos>(c => c.Estatus == true).OrderBy(c => c.Nombre).ToList();
            else
                objProduct = repository.FindEntitySet<Productos>(c => c.Estatus == true && (c.Nombre.Contains(valSearch) || c.Codigo.Contains(valSearch))).OrderBy(c => c.Nombre).ToList();

            if (val == "Id" || string.IsNullOrEmpty(val))
            {
                val = "Id";
                objProduct = objProduct.OrderBy(c => c.Id).ToList();
            }
            else if (val == "IdDesc")
                objProduct = objProduct.OrderByDescending(c => c.Id).ToList();
            else if (val == "Nombre")
                objProduct = objProduct.OrderBy(c => c.Nombre).ToList();
            else if (val == "NombreDesc")
                objProduct = objProduct.OrderByDescending(c => c.Nombre).ToList();
            else if (val == "Codigo")
                objProduct = objProduct.OrderBy(c => c.Codigo).ToList();
            else if (val == "CodigoDesc")
                objProduct = objProduct.OrderByDescending(c => c.Codigo).ToList();
            else if (val == "Marca")
                objProduct = objProduct.OrderBy(c => c.Marca).ToList();
            else if (val == "MarcaDesc")
                objProduct = objProduct.OrderByDescending(c => c.Marca).ToList();
            else if (val == "Costo")
                objProduct = objProduct.OrderBy(c => c.Costo).ToList();
            else if (val == "CostoDesc")
                objProduct = objProduct.OrderByDescending(c => c.Costo).ToList();
            else if (val == "PrecioVenta")
                objProduct = objProduct.OrderBy(c => c.PrecioVenta).ToList();
            else if (val == "PrecioVentaDesc")
                objProduct = objProduct.OrderByDescending(c => c.PrecioVenta).ToList();
            else if (val == "Utilidad")
                objProduct = objProduct.OrderBy(c => c.Utilidad).ToList();
            else if (val == "UtilidadDesc")
                objProduct = objProduct.OrderByDescending(c => c.Utilidad).ToList();
            else if (val == "Stock")
                objProduct = objProduct.OrderBy(c => c.Stock).ToList();
            else if (val == "StockDesc")
                objProduct = objProduct.OrderByDescending(c => c.Stock).ToList();
            ViewBag.Order = val;
            int pageSize = 5;
            int pageNumber = page ?? 1;


            return PartialView(objProduct.ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        public ActionResult Eliminar(int Id)
        {
            string strMensaje = "No se encontro el producto que desea eliminar";
            bool okResult = false;
            IRepository repository = new Model.Repository();
            var objProd = repository.FindEntity<Productos>(c => c.Id == Id);
            if (objProd != null)
            {
                objProd.Estatus = false;
                repository.Update(objProd);
                strMensaje = "Se elimino el producto correctamente";
                okResult = true;
            }
            return Json(new Response { IsSuccess = okResult, Message = strMensaje, Id = Id }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]

        public ActionResult Get(int Id)
        {
            string strMensaje = "No se encontro el producto que desea editar";
            IRepository repository = new Model.Repository();
            var objProd = repository.FindEntity<Productos>(c => c.Id == Id);
            if (objProd != null)
            {
                Producto producto = new Producto
                {
                    archivos = "",
                    Codigo = objProd.Codigo,
                    Costo = objProd.Costo,
                    Descripcion = objProd.Descripcion,
                    Estatus = objProd.Estatus,
                    FechaActivo = objProd.FechaActivo,
                    FechaRegistro = objProd.FechaRegistro,
                    Id = objProd.Id,
                    Marca = objProd.Marca,
                    Modelo = objProd.Modelo,
                    Nombre = objProd.Nombre,
                    PrecioVenta = objProd.PrecioVenta,
                    Stock = objProd.Stock,
                    UnidadMedida = objProd.UnidadMedida,
                    Utilidad = objProd.Utilidad
                };

                var objArchivos = repository.FindEntitySet<Anexos>(c => c.Producto_Id == Id && c.Estatus == true);
                foreach (var item in objArchivos)
                {
                    producto.archivos += item.Archivo + "|";
                }
                return Json(new Response { IsSuccess = true, Id = Id, Result = producto }, JsonRequestBehavior.AllowGet);
            }
            return Json(new Response { IsSuccess = false, Message = strMensaje, Id = Id }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Add(Producto objProd)
        {
            IRepository repository = new Model.Repository();
            int id = 0;
            string strMensaje = "No se pudo actualizar la información, intentelo más tarde";
            bool okResult = false;
            decimal? uti = objProd.PrecioVenta - objProd.Costo;
            int valorUtilidad = 0;
            int.TryParse(uti.ToString(), out valorUtilidad);
            objProd.Utilidad = valorUtilidad;
            if (objProd.Id > 0)
            {
                id = objProd.Id;
                Productos objUpdateProd = repository.FindEntity<Productos>(c => c.Id == objProd.Id);
                if (objUpdateProd != null)
                {
                    //objUpdateProd.Codigo = objProd.Codigo;
                    objUpdateProd.Costo = objProd.Costo;
                    objUpdateProd.Descripcion = objProd.Descripcion;
                    objUpdateProd.Estatus = true;                   
                    objUpdateProd.Marca = objProd.Marca;
                    objUpdateProd.Modelo = objProd.Modelo;
                    objUpdateProd.Nombre = objProd.Nombre;
                    objUpdateProd.PrecioVenta = objProd.PrecioVenta;
                    objUpdateProd.Stock = objProd.Stock;
                    objUpdateProd.UnidadMedida = objProd.UnidadMedida;
                    objUpdateProd.Utilidad = objProd.Utilidad;
                }
                //Productos objUpdateProd = (Productos)objProd;
                repository.Update(objUpdateProd);
                strMensaje = "Se actualizo el producto";
                addAnexos(objProd.archivos, id);
                okResult = true;
            }
            else
            {
                
                string strGui = Guid.NewGuid().ToString();
                var objResultado = repository.Create(new Productos
                {
                    Codigo = strGui,
                    Costo = objProd.Costo,
                    Descripcion = objProd.Descripcion,
                    Estatus = true,
                    FechaActivo = DateTime.Now,
                    FechaRegistro = DateTime.Now,
                    Marca = objProd.Marca,
                    Modelo = objProd.Modelo,
                    Nombre = objProd.Nombre,
                    PrecioVenta = objProd.PrecioVenta,
                    Stock = objProd.Stock,
                    UnidadMedida = objProd.UnidadMedida,
                    Utilidad = objProd.Utilidad

                });
                id = objResultado.Id;
                if (objResultado != null)
                {
                    okResult = true;
                    strMensaje = "Se agrego el producto correctamente";
                    addAnexos(objProd.archivos, id);
                }

            }
            return Json(new Response { IsSuccess = okResult, Message = strMensaje, Id = id }, JsonRequestBehavior.AllowGet);
        }

        private void addAnexos(string strArchivos, int id)
        {
            IRepository repository = new Model.Repository();
            string[] strAnexos = strArchivos != null ? strArchivos.Split('|') : "".Split('|');
            var objAnexosB = repository.FindEntitySet<Anexos>(c => c.Estatus == true && c.Producto_Id == id);
            foreach(var item in objAnexosB)
            {
                item.Estatus = false;
                repository.Update(item);
            }
            for (int i = 0; i < strAnexos.Length; i++)
            {
                if (strAnexos[i].ToString().Trim() != "")
                {
                    var objAnexos = repository.Create(new Anexos
                    {
                        Archivo = strAnexos[i],
                        Estatus = true,
                        Producto_Id = id
                    });
                }
            }
        }

        [HttpPost]
        public ActionResult FileUpload(HttpPostedFileBase[] file)
        {
            string fName = "";
            try
            {
                foreach (var item in file)
                {
                    string path = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    fName = "Prod_" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + DateTime.Now.Millisecond;
                    fName += Path.GetExtension(item.FileName);
                    item.SaveAs(path + fName);
                }

            }
            catch (Exception exception)
            {
                return Json(new
                {
                    success = false,
                    response = exception.Message
                });
            }

            return Json(new
            {
                success = true,
                response = fName
            });
        }
    }
}