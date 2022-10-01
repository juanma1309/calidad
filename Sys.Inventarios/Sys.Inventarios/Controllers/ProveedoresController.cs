using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using PagedList;
using Repository;
using Sys.Inventarios.Models;

namespace Sys.Inventarios.Controllers
{
    public class ProveedoresController : Controller
    {
        // GET: Proveedores
        public ActionResult Index()
        {
            IRepository repository = new Model.Repository();
            ViewBag.ZonasHorarias = repository.FindEntitySet<Catalogos>(c => c.Activo == true && c.Catalogo == "Zona Horaria");
            ViewBag.Moneda = repository.FindEntitySet<Catalogos>(c => c.Activo == true && c.Catalogo == "Moneda").OrderBy(c=>c.Valor);
            ViewBag.Page = "Proveedores";
            return View();
        }

        public ActionResult ListaProveedores(string val, string valSearch, int? page)
        {
            ViewBag.CurrentSort = val;
            ViewBag.Buscar = valSearch;
            IRepository repository = new Model.Repository();
            List<Empresas> objEmpresas = new List<Empresas>();
            if (string.IsNullOrEmpty(valSearch))
                objEmpresas = repository.FindEntitySet<Empresas>(c => c.Estatus==true && c.Tipo_Id == 2).OrderBy(c => c.NombreEmpresa).ToList();
            else
                objEmpresas = repository.FindEntitySet<Empresas>(c => c.Estatus == true && c.Tipo_Id == 2 && (
                c.NombreEmpresa.Contains(valSearch) || c.CorreoElectronico.Contains(valSearch) || c.Id.ToString().Contains(valSearch))).OrderBy(c => c.NombreEmpresa).ToList();

            if (val == "Id" || string.IsNullOrEmpty(val))
            {
                val = "Id";
                objEmpresas = objEmpresas.OrderBy(c => c.Id).ToList();
            }
            else if (val == "NombreEmpresaDesc")
                objEmpresas = objEmpresas.OrderByDescending(c => c.NombreEmpresa).ToList();
            else if (val == "NombreEmpresa")
                objEmpresas = objEmpresas.OrderBy(c => c.NombreEmpresa).ToList();
            else if (val == "CorreoElectronicoDesc")
                objEmpresas = objEmpresas.OrderByDescending(c => c.CorreoElectronico).ToList();
            else if (val == "CorreoElectronico")
                objEmpresas = objEmpresas.OrderBy(c => c.CorreoElectronico).ToList();
            else if (val == "TelefonoDesc")
                objEmpresas = objEmpresas.OrderByDescending(c => c.Telefono).ToList();
            else if (val == "Telefono")
                objEmpresas = objEmpresas.OrderBy(c => c.Telefono).ToList();
            ViewBag.Order = val;
            int pageSize = 5;
            int pageNumber = page ?? 1;


            return PartialView(objEmpresas.ToPagedList(pageNumber, pageSize));
        }


        [HttpPost]
        public ActionResult Add(Empresas objEmpresa)
        {
            IRepository repository = new Model.Repository();
            int id = 0;
            string strMensaje = "No se pudo actualizar la información, intentelo más tarde";
            bool okResult = false;
            if (objEmpresa.Id > 0)
            {
                id = objEmpresa.Id;
                Empresas objUpdateEmp = repository.FindEntity<Empresas>(c => c.Id == objEmpresa.Id);
                if (objUpdateEmp != null)
                {
                    objUpdateEmp.CorreoElectronico = objEmpresa.CorreoElectronico;
                    objUpdateEmp.Direccion = objEmpresa.Direccion;
                    objUpdateEmp.Logo = objEmpresa.Logo;
                    objUpdateEmp.NombreEmpresa = objEmpresa.NombreEmpresa;
                    objUpdateEmp.Telefono = objEmpresa.Telefono;
                    objUpdateEmp.Moneda = objEmpresa.Moneda;
                    objUpdateEmp.ZonaHoraria_Id = objEmpresa.ZonaHoraria_Id;
                    repository.Update(objUpdateEmp);
                    strMensaje = "Se actualizo el proveedor";
                    okResult = true;
                }                                
            }
            else
            {
                string strGui = Guid.NewGuid().ToString();
                objEmpresa.Tipo_Id = 2;
                objEmpresa.Estatus = true;
                var objResultado = repository.Create(objEmpresa);                
                if (objResultado != null)
                {
                    id = objResultado.Id;
                    okResult = true;
                    strMensaje = "Se agrego el proveedor correctamente";
                }

            }
            return Json(new Response { IsSuccess = okResult, Message = strMensaje, Id = id }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult FileUpload(HttpPostedFileBase file)
        {
            string fName = "";
            try
            {
                if (file != null  && file.ContentLength > 0)
                {
                    string path = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    fName = "Proveed_" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + DateTime.Now.Millisecond;
                    fName += Path.GetExtension(file.FileName);
                    file.SaveAs(path + fName);
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


        [HttpPost]
        public ActionResult Eliminar(int Id)
        {
            string strMensaje = "No se encontro el proveedor que desea eliminar";
            bool okResult = false;
            IRepository repository = new Model.Repository();
            var objEmp = repository.FindEntity<Empresas>(c => c.Id == Id);
            if (objEmp != null)
            {
                objEmp.Estatus = false;
                repository.Update(objEmp);
                strMensaje = "Se elimino el proveedor correctamente";
                okResult = true;
            }
            return Json(new Response { IsSuccess = okResult, Message = strMensaje, Id = Id }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]

        public ActionResult Get(int Id)
        {
            string strMensaje = "No se encontro el proveedor que desea editar";
            IRepository repository = new Model.Repository();
            var objEmpresa = repository.FindEntity<Empresas>(c => c.Id == Id);
            if (objEmpresa != null)
            {
                objEmpresa.Logo = string.IsNullOrEmpty(objEmpresa.Logo) ? "Default.png" : objEmpresa.Logo;
                return Json(new Response { IsSuccess = true, Id = Id, Result = objEmpresa }, JsonRequestBehavior.AllowGet);
            }
            return Json(new Response { IsSuccess = false, Message = strMensaje, Id = Id }, JsonRequestBehavior.AllowGet);
        }


    }
}