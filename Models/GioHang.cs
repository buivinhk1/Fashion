using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fashion.Controllers;
using Fashion.Models;

namespace Fashion.Models
{
    public class GioHang
    {
        QLBanQuanAoDataContext context = new QLBanQuanAoDataContext();

        public int masp { set; get; }
        public string tensp { set; get; }
        public string mota { set; get; }
        public double dongia { set; get; }
        public string anhbia { set; get; }
        public int soluong { set; get; }
        public int soluongton { set; get; }
        public double thanhtien { get { return dongia * soluong; } }
        public string diachi { set; get; }

        public string tenvc { set; get; }

        public GioHang(int MaSP)
        {
            masp = MaSP;
            SANPHAM sp = context.SANPHAMs.Single(s => s.MaSP == masp);
           // VANCHUYEN vc = context.VANCHUYENs.Single(s => s.MaVC == mavc);
            mota = sp.Mota;
            tensp = sp.TenSP;
            anhbia = sp.Anhbia;
            dongia = double.Parse(sp.Giaban.ToString());
            soluong = 1;
            //tenvanchuyen = vc.TenVanChuyen;
            //soluongton = int.Parse(sp.Soluongton.ToString());
        }
    }
}