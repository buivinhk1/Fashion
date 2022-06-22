using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fashion.Models;
using PagedList;

namespace Fashion.Controllers
{
    public class HistoryController : Controller
    {
        QLBanQuanAoDataContext db = new QLBanQuanAoDataContext();
        // GET: History
        private List<DONDATHANG> don (int count)
        {
            return db.DONDATHANGs.OrderByDescending(s => s.MaKH).Take(count).ToList();
        }
        [HttpGet]
        public ActionResult History(int? page)
        {
            int pagesize = 10;
            int pageNum = (page ?? 1);
            var list = db.DONDATHANGs.OrderByDescending(s => s.MaKH).ToList();
            return View(list.ToPagedList(pageNum, pagesize));
        }
        [HttpPost]
        public ActionResult History(int page)
        {
            if (Session["User"] == null)
            {
                return RedirectToAction("Login", "NguoiDung");
            }
            else
            {
                DONDATHANG type = db.DONDATHANGs.SingleOrDefault(n => n.MaKH == page);
                if (type == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(type);
            }
        }
        public ActionResult HistoryDetails(int? id)
        {
            if (Session["User"] == null)
            {
                return RedirectToAction("Login", "NguoiDung");
            }
            if (id == null)
            {
                return HttpNotFound();
            }
            var list = db.CHITIETDONTHANGs.Where(s => s.MaDonHang == id).OrderByDescending(s => s.MaSP).ToList();
            return View(list);
        }
        [HttpPost]
        public ActionResult DeleteProductType(int id)
        {
            if (Session["User"] == null)
            {
                return RedirectToAction("Login", "NguoiDung");
            }
            else
            {
                DONDATHANG type = db.DONDATHANGs.SingleOrDefault(n => n.MaKH == id);
                if (type == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(type);
            }
        }

    }
}