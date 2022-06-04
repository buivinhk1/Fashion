USE [master]
GO
/****** Object:  Database [QLBanQuanAo]    Script Date: 03/06/2022 23:19:14 ******/
CREATE DATABASE [QLBanQuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanQuanAo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBanQuanAo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBanQuanAo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBanQuanAo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLBanQuanAo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanQuanAo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanQuanAo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBanQuanAo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanQuanAo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBanQuanAo] SET  MULTI_USER 
GO
ALTER DATABASE [QLBanQuanAo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBanQuanAo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanQuanAo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBanQuanAo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBanQuanAo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLBanQuanAo] SET QUERY_STORE = OFF
GO
USE [QLBanQuanAo]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassAdmin] [varchar](30) NOT NULL,
	[Hoten] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[IDChitTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHITIETDONTHANG] PRIMARY KEY CLUSTERED 
(
	[IDChitTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NULL,
	[MaKH] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK__DONDATHA__129584AD9D54BFEE] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoTro]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoTro](
	[MaKH] [int] NOT NULL,
	[Email] [varchar](100) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[LyDo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_HoTro] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loaisanpham]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loaisanpham](
	[MaloaiSP] [int] IDENTITY(1,1) NOT NULL,
	[Tensanpham] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaloaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCC]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCC](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](100) NULL,
	[Dienthoai] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 03/06/2022 23:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Mota] [nvarchar](max) NULL,
	[Anhbia] [nvarchar](50) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MaloaiSP] [int] NULL,
	[MaNCC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'admin', N'123', N'Bùi Đức Vinh')
GO
SET IDENTITY_INSERT [dbo].[CHITIETDONTHANG] ON 
GO
INSERT [dbo].[CHITIETDONTHANG] ([IDChitTiet], [MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien]) VALUES (6, 15, 25, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([IDChitTiet], [MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien]) VALUES (7, 16, 25, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([IDChitTiet], [MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien]) VALUES (8, 16, 22, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[CHITIETDONTHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien]) VALUES (11, 0, 0, CAST(N'2022-05-30T22:43:47.753' AS DateTime), CAST(N'2022-06-01T00:00:00.000' AS DateTime), 1, CAST(198000 AS Decimal(18, 0)))
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien]) VALUES (12, 0, 0, CAST(N'2022-05-31T10:37:00.160' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), 3, CAST(99000 AS Decimal(18, 0)))
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien]) VALUES (15, 0, 0, CAST(N'2022-06-01T23:38:57.073' AS DateTime), CAST(N'2022-06-03T00:00:00.000' AS DateTime), 1, CAST(99000 AS Decimal(18, 0)))
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien]) VALUES (16, 0, 0, CAST(N'2022-06-03T23:15:15.200' AS DateTime), NULL, 3, CAST(198000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'Bùi Đức Vinh', N'vinhdz', N'123', N'vanhuynhthanh98@gmail.com', N'Việt Nam', N'0396108981', CAST(N'2021-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (3, N'Nguyễn Tấn Chọn', N'chondz', N'123', N'vinhducbui16@gmail.com', N'Giao ở đâu thì giao', N'0396108981', CAST(N'2022-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (5, N'Nguyen van A', N'anv', N'1234', N'sdfsdf@gmail.com', N'Cát Tân, Phù Cát, Binh Đinh', N'0396108981', CAST(N'2022-06-02T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[Loaisanpham] ON 
GO
INSERT [dbo].[Loaisanpham] ([MaloaiSP], [Tensanpham]) VALUES (1, N'Quần')
GO
INSERT [dbo].[Loaisanpham] ([MaloaiSP], [Tensanpham]) VALUES (2, N'Áo')
GO
INSERT [dbo].[Loaisanpham] ([MaloaiSP], [Tensanpham]) VALUES (3, N'Đồng Hồ')
GO
INSERT [dbo].[Loaisanpham] ([MaloaiSP], [Tensanpham]) VALUES (4, N'Giày')
GO
INSERT [dbo].[Loaisanpham] ([MaloaiSP], [Tensanpham]) VALUES (5, N'Nón')
GO
INSERT [dbo].[Loaisanpham] ([MaloaiSP], [Tensanpham]) VALUES (7, N'Tất')
GO
SET IDENTITY_INSERT [dbo].[Loaisanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[NCC] ON 
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (1, N'BaoHanStore', N'Ràng', N'1250336879')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (2, N'Navidas', N'Ràng', N'1250336879')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (3, N'Nai', N'Ràng', N'1250336879')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (4, N'Black Pink', N'Ràng', N'1250336879')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (5, N'Hades', N'Bình Thạnh', N'113')
GO
SET IDENTITY_INSERT [dbo].[NCC] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (1, N'Giày Nai', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Nai.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (2, N'Giày Nai', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Nai.png', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 30, 4, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (3, N'Giày Nai', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Nai.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (4, N'Giày Navidas', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Giày navidas.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (5, N'Giày Navidas', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Giày navidas.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (6, N'Giày Navidas', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Giày navidas.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (7, N'Áo Sói Cô Đơn', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Áo Sói Cô Đơn.jpg', CAST(N'2022-05-26T00:00:00.000' AS DateTime), 30, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (8, N'Áo Sói Cô Đơn', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Áo Sói Cô Đơn.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (9, N'Áo Sói Cô Đơn', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Áo Sói Cô Đơn.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (10, N'Áo Black vine', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Áo Black vine.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (11, N'Áo Black vine', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Áo Black vine.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (12, N'Áo Black vine', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Áo Black vine.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (13, N'Nón Đen Cá Tính', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Nón Đen Cá Tính.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (14, N'Nón Đen Mạnh Mẽ', CAST(99000 AS Decimal(18, 0)), N'Đẹp Xuất SẮc', N'Nón Đen Mạnh Mẽ.jpg', CAST(N'2022-05-23T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (15, N'Nón Trắng Mộng Mơ', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Nón Trắng Mộng Mơ.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (16, N'Nón vàng Nhạt xinh đẹp', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Nón vàng Nhạt xinh đẹp.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (17, N'Đồng Hồ Bạc', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Đồng Hồ Bạc.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (18, N'Đồng Hồ Bạc', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Đồng Hồ Bạc.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (19, N'Đồng Hồ Bạc', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Đồng Hồ Bạc.jpg', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (20, N'Quần Jogger', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Quần Jogger.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (21, N'Quần Jogger', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Quần Jogger.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (22, N'Quần Jogger', CAST(99000 AS Decimal(18, 0)), N'Đây Là 1 Đồi Giày Đẹp Và Rất Được Ưa chuộng Vì Tính Năng Ưu Việt Của Nó, Cụ Thể Là Tính Năng Gì Thì Shop Không Biết ', N'Giày navidas.jpg', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 30, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (25, N'Áo bầu', CAST(99000 AS Decimal(18, 0)), N'cxvfg', N'Áo Sói Cô Đơn.jpg', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 2, 2, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (26, N'Áo bầu', CAST(99000 AS Decimal(18, 0)), N'đẹp', N'Nón Trắng Mộng Mơ.jpg', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 2, 2, 5)
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64FD7679FC8]    Script Date: 03/06/2022 23:19:14 ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__A9D1053408D3D1C6]    Script Date: 03/06/2022 23:19:14 ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_Donhang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_Donhang]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_MASP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_MASP]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[HoTro]  WITH CHECK ADD  CONSTRAINT [FK_HoTro_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[HoTro] CHECK CONSTRAINT [FK_HoTro_KHACHHANG]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_Loaisanpham] FOREIGN KEY([MaloaiSP])
REFERENCES [dbo].[Loaisanpham] ([MaloaiSP])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_Loaisanpham]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_NCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NCC] ([MaNCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_NCC]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDO__Dongi__36B12243] CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CK__CHITIETDO__Dongi__36B12243]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDO__Soluo__35BCFE0A] CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CK__CHITIETDO__Soluo__35BCFE0A]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDO__Thanh__37A5467C] CHECK  (([ThanhTien]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CK__CHITIETDO__Thanh__37A5467C]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([Giaban]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [QLBanQuanAo] SET  READ_WRITE 
GO
