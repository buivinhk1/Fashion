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

        public ActionResult History()
        {
            if (Session["Taikhoan"] == null)
            {
                return RedirectToAction("Login", "NguoiDung");
            }
            else
            {
                KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
                var type = (from t in db.DONDATHANGs where t.MaKH == kh.MaKH select t).ToList();
                return View(type);
            }
        }
        public ActionResult HistoryDetails(int? id)
        {
            if (Session["Taikhoan"] == null)
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
            if (Session["Taikhoan"] == null)
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