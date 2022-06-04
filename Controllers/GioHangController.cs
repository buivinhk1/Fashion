﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Fashion.Models;

namespace Fashion.Controllers
{
    public class GioHangController : Controller
    {
        QLBanQuanAoDataContext data = new QLBanQuanAoDataContext();

        public ActionResult Index()
        {
            return View();
        }

        public List<GioHang> LayGioHang()
        {
            List<GioHang> list = Session["GioHang"] as List<GioHang>;
            if (list == null)
            {
                list = new List<GioHang>();
                Session["GioHang"] = list;
            }
            return list; 
        }

        public ActionResult ThemGioHang(int masp, string strUrl)
        {

            List<GioHang> gioHangs = LayGioHang();

            GioHang sp = gioHangs.Find(n => n.masp == masp);
            if (sp == null)
            {
                sp = new GioHang(masp);
                gioHangs.Add(sp);
                return Redirect(strUrl);
            }
            else
            {
                sp.soluong++;
                return Redirect(strUrl);
            }
        }

        private int TongSoLuong()
        {
            int Tongsoluong = 0;
            List<GioHang> gioHangs = Session["GioHang"] as List<GioHang>;
            if (gioHangs != null)
            {
                Tongsoluong = gioHangs.Sum(n => n.soluong);
            }
            Session["TongSoLuong"] = Tongsoluong;
            return Tongsoluong;
        }

        private double TongTien()
        {
            double tongtien = 0;
            List<GioHang> gioHangs = Session["GioHang"] as List<GioHang>;
            if (gioHangs != null)
            {
                tongtien = gioHangs.Sum(n => n.thanhtien);
            }
            return tongtien;
        }

        public ActionResult Giohang()
        {
            List<GioHang> gioHangs = LayGioHang();
            if (gioHangs.Count == 0)
            {
                return RedirectToAction("Index", "Fashion");
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(gioHangs);
        }

        public ActionResult SoLuongGioHang()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }

        public ActionResult XoaGioHang(int id)
        {
            List<GioHang> gioHangs = LayGioHang();
            GioHang sessiongiohang = gioHangs.SingleOrDefault(n => n.masp == id);
            if (sessiongiohang != null)
            {
                gioHangs.RemoveAll(n => n.masp == id);
                return RedirectToAction("GioHang");
            }
            if (gioHangs.Count == 0)
            {
                return RedirectToAction("Index", "Fashion");
            }
            return RedirectToAction("GioHang");
        }

        public ActionResult CapNhatGioHang(int id, FormCollection f)
        {
            List<GioHang> gioHangs = LayGioHang();
            GioHang sessiongiohang = gioHangs.SingleOrDefault(n => n.masp == id);
            if (sessiongiohang != null)
            {
                sessiongiohang.soluong = int.Parse(f["Soluong"].ToString());

            }
            return RedirectToAction("Giohang");
        }

        public ActionResult RemoveAll()
        {
            List<GioHang> gioHangs = LayGioHang();
            gioHangs.Clear();
            return RedirectToAction("Index", "Fashion");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Login", "NguoiDung");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Fashion");
            }
            List<GioHang> gioHangs = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();

            return View(gioHangs);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            DONDATHANG dONDATHANG = new DONDATHANG();
            CHITIETDONTHANG CTDH = new CHITIETDONTHANG();
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            List<GioHang> gioHangs = LayGioHang();
            dONDATHANG.MaKH = kh.MaKH;
            dONDATHANG.Ngaydat = DateTime.Now;
            string DiaChi = collection["DiaChi"];
            //dONDATHANG.Ngaygiao = DateTime.Parse(ngaygiao);
            dONDATHANG.TongTien = Decimal.Parse(TongTien().ToString());
            dONDATHANG.Tinhtranggiaohang = false;
            dONDATHANG.Dathanhtoan = false;
            data.DONDATHANGs.InsertOnSubmit(dONDATHANG);
            data.SubmitChanges();
            foreach (var item in gioHangs)
            {
                CHITIETDONTHANG CT = new CHITIETDONTHANG();
                //DONDATHANG dONDATHANG = new DONDATHANG();
                CT.MaDonHang = dONDATHANG.MaDonHang;
                CT.MaSP = item.masp;
                CT.Soluong = item.soluong;
                CT.Dongia = (decimal)item.dongia;
                CT.ThanhTien = (decimal)item.thanhtien;
                dONDATHANG.DiaChi = DiaChi;
                data.CHITIETDONTHANGs.InsertOnSubmit(CT);
            }
            data.SubmitChanges();

            //Mail xác nhận đặt hàng
            string subject = "Biên nhận";
            string mess = "Cảm ơn " + kh.HoTen + " đã đặt hàng!\n" +
                            "Mã đơn hàng: " + dONDATHANG.MaDonHang + "\n" +
                            "Ngày đặt hàng: " + String.Format("{0:dd/MM/yyyy}", dONDATHANG.Ngaydat) + "\n" +
                            //"Ngày giao: " + String.Format("{0:dd/MM/yyyy}", dONDATHANG.Ngaygiao) + "\n" +
                            "Tổng tiền: " + String.Format("{0:0,0}", dONDATHANG.TongTien) + " vnđ" + "\n" +
                            "Dia chi: " + dONDATHANG.DiaChi + "\n";



            SendEmail(kh.Email,subject,mess);


            Session["GioHang"] = null;
            return RedirectToAction("XacNhanDonHang","GioHang");
        }
        //sent mail xac nhạn đặt hàng
        //Gửi mail


        public static void SendEmail(string address, string subject, string message)
        {
            if (new EmailAddressAttribute().IsValid(address)) // check có đúng mail khách hàng
            {
                string email = "buivanty15@gmail.com";
                var senderEmail = new MailAddress(email, "The VTA Shop (tin nhắn tự động)");
                var receiverEmail = new MailAddress(address, "Receiver");
                var password = "dpukaghhwhgrokpo";
                var sub = subject;
                var body = message;
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(senderEmail.Address, password)
                };
                using (var mess = new MailMessage(senderEmail, receiverEmail)
                {
                    Subject = sub,
                    Body = body
                })
                {
                    smtp.Send(mess);
                }
            }
        }


        public ActionResult XacNhanDonHang()
        {
            return View();
        }
    }
}