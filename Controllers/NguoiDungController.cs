using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Fashion.Models;
using NPOI.POIFS.Crypt;

namespace Fashion.Controllers
{
    public class NguoiDungController : Controller
    {
        QLBanQuanAoDataContext data = new QLBanQuanAoDataContext();
        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
        [HttpGet]
        public ActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(FormCollection collection, KHACHHANG kh)
        {
            //
            var hoten = collection["HOTEN"];
            var TK = collection["TaiKhoan"];
            var MK = collection["Pass"];
            var ConfirmMK = collection["ConfirmPass"];

            string Email = collection["Email"];
            string Address = collection["Address"];
            string SDT = collection["SDT"];
            string Date = String.Format("{0:MM/dd/yyyy}", collection["Date"]);
            if (MK.Equals(ConfirmMK))
            {
                if (hoten == null || TK == null || MK == null || Email == null || hoten == null || hoten == null || hoten == null)
                {
                    return HttpNotFound();
                }
                else
                {
                    //MD5 md5 = new MD5CryptoServiceProvider();

                    //md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(ConfirmMK));

                    //byte[] bytedata = md5.Hash;

                    //StringBuilder builder = new StringBuilder();
                    //for (int i = 0; i < bytedata.Length; i++)
                    //{

                    //    builder.Append(bytedata[i].ToString("x2"));
                    //}

                    //string MaHoa = builder.ToString();

                    kh.HoTen = hoten;
                    kh.Taikhoan = TK;
                    kh.Matkhau = MD5Hash(ConfirmMK); //Mahoa
                    kh.Email = Email;
                    kh.DiachiKH = Address;
                    kh.DienthoaiKH = SDT;
                    kh.Ngaysinh = DateTime.Parse(Date);
                    data.KHACHHANGs.InsertOnSubmit(kh);
                   
                    data.SubmitChanges();

                    //sentmail
                    string subject = "VTA Shop";
                    string mess = "Chào mừng "+kh.HoTen+ " đến với The VTA Shop";
                    SendEmail(kh.Email,subject,mess);
                    return RedirectToAction("Login", "NguoiDung");
                }
            }
            else
            {
                @ViewData["error"] = "Mật Khẩu Không Trùng Khớp";
                return this.SignUp();
            }

        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            string TK = collection["TaiKhoan"];
            string MK = collection["Password"];

            //MD5 md5 = new MD5CryptoServiceProvider();

            //md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(MK));

            //byte[] bytedata = md5.Hash;

            //StringBuilder builder = new StringBuilder();
            //for (int i = 0; i < bytedata.Length; i++)
            //{

            //    builder.Append(bytedata[i].ToString("x2"));
            //}

            //string MaHoa = builder.ToString();

            KHACHHANG kh = data.KHACHHANGs.SingleOrDefault(a => a.Taikhoan == TK && a.Matkhau == MD5Hash(MK)); //MaHoa
            if (kh != null)
            {
                Session["User"] = kh.HoTen;
                Session["Taikhoan"] = kh;
                return RedirectToAction("Index","Fashion");
            }
            else
            {
                ViewBag.Thongbao = "Tên Tài Khoản Hoặc Mật Khẩu Không Đúng";
            }

            return View();
        }
        
        public ActionResult LogOut()
        {
            Session["User"] = null;
            Session["Taikhoan"] = null;
            return RedirectToAction("Index","Fashion");
        }
        //Gửi mail
        public static void SendEmail(string address, string subject, string message)
        {
            if (new EmailAddressAttribute().IsValid(address)) // check có đúng mail khách hàng
            {
                string email = "buivanty15@gmail.com";
                var senderEmail = new MailAddress(email, "VTA Shop (tin nhắn tự động)");
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
        [HttpGet]
        public ActionResult ChangePassword()
        {
            if (Session["User"] == null)
            {
                return RedirectToAction("Login", "NguoiDung");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(FormCollection collection)
        {
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
           // KHACHHANG kh = data.KHACHHANGs.SingleOrDefault(a => a.Matkhau == MD5Hash(MK)); //MaHoa

           // var user = data.KHACHHANGs.SingleOrDefault(p => p.MaKH == p.MaKH);
            var po = collection["passold"];
            var pn = collection["passnew"];
            var pa = collection["passagain"];
            if (String.IsNullOrEmpty(po) || String.IsNullOrEmpty(pn) || String.IsNullOrEmpty(pa))
            {
                ViewData["1"] = "Thông tin không được để trống";
            }
            else if (String.IsNullOrEmpty(po) && String.IsNullOrEmpty(pn) && !String.IsNullOrEmpty(pa))
            {
                ViewData["3"] = "Vui lòng nhập mật khẩu mới!";
                return this.ChangePassword();
            }
            else if (!String.IsNullOrEmpty(po) && !String.IsNullOrEmpty(pn) && !String.IsNullOrEmpty(pa))
            {
                if (!String.Equals(MD5Hash(po), kh.Matkhau))
                {
                    ViewData["1"] = "Mật khẩu không đúng!";
                    return this.ChangePassword();
                }
                else if (!String.Equals(pn, pa))
                {
                    ViewData["3"] = "Mật khẩu mới và mật khẩu cũ không trùng khớp!";
                    return this.ChangePassword();
                }
                else
                {
                    kh.Matkhau = MD5Hash(pn);
                    Session["User"] = kh.HoTen;
                    data.SubmitChanges();
                    ViewData["3"] = "Cập nhật thành công!";
                    return RedirectToAction("Index", "Fashion");
                }
            }
            return this.ChangePassword();
        }
    }
}