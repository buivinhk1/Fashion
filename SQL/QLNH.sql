USE [master]
GO
/****** Object:  Database [QLBanQuanAo]    Script Date: 16/06/2022 19:07:10 ******/
CREATE DATABASE [QLBanQuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanQuanAo_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBanQuanAo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBanQuanAo_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBanQuanAo.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Admin]    Script Date: 16/06/2022 19:07:10 ******/
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
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 16/06/2022 19:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[DonViVanChuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETDONTHANG_1] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 16/06/2022 19:07:10 ******/
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
	[DiaChi] [nvarchar](200) NULL,
	[MaVC] [int] NULL,
 CONSTRAINT [PK__DONDATHA__129584AD9D54BFEE] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoTro]    Script Date: 16/06/2022 19:07:10 ******/
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
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 16/06/2022 19:07:10 ******/
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
/****** Object:  Table [dbo].[Loaisanpham]    Script Date: 16/06/2022 19:07:10 ******/
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
/****** Object:  Table [dbo].[NCC]    Script Date: 16/06/2022 19:07:10 ******/
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
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 16/06/2022 19:07:10 ******/
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
/****** Object:  Table [dbo].[VANCHUYEN]    Script Date: 16/06/2022 19:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VANCHUYEN](
	[MaVC] [int] NOT NULL,
	[TenVanChuyen] [nvarchar](128) NULL,
 CONSTRAINT [PK_VANCHUYEN] PRIMARY KEY CLUSTERED 
(
	[MaVC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'admin', N'123', N'Bùi Đức Vinh')
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (15, 25, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (16, 22, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (16, 25, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (17, 4, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (17, 10, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (17, 20, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (18, 1, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (18, 13, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (19, 1, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (19, 20, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (20, 5, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (20, 16, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (20, 17, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (21, 1, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (22, 1, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (22, 4, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (22, 7, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (22, 17, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (25, 22, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (25, 25, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (28, 26, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (28, 27, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (29, 1, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (29, 25, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (34, 1, 2, CAST(99000 AS Decimal(18, 0)), CAST(198000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (34, 2, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (34, 3, 1, CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (35, 29, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (36, 29, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (37, 29, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (39, 28, 2, CAST(109000 AS Decimal(18, 0)), CAST(218000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (45, 28, 3, CAST(109000 AS Decimal(18, 0)), CAST(327000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (48, 27, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (49, 28, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (50, 28, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia], [ThanhTien], [DonViVanChuyen]) VALUES (51, 27, 1, CAST(109000 AS Decimal(18, 0)), CAST(109000 AS Decimal(18, 0)), NULL)
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (11, 0, 0, CAST(N'2022-05-30T22:43:47.753' AS DateTime), CAST(N'2022-06-01T00:00:00.000' AS DateTime), 1, CAST(198000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (12, 0, 0, CAST(N'2022-05-31T10:37:00.160' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), 3, CAST(99000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (15, 0, 0, CAST(N'2022-06-01T23:38:57.073' AS DateTime), CAST(N'2022-06-03T00:00:00.000' AS DateTime), 1, CAST(99000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (16, 0, 0, CAST(N'2022-06-03T23:15:15.200' AS DateTime), NULL, 3, CAST(198000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (17, 0, 0, CAST(N'2022-06-04T20:22:45.150' AS DateTime), NULL, 1, CAST(297000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (18, 0, 0, CAST(N'2022-06-04T20:24:02.980' AS DateTime), NULL, 1, CAST(198000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (19, 0, 0, CAST(N'2022-06-04T20:26:44.543' AS DateTime), NULL, 1, CAST(198000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (20, 0, 0, CAST(N'2022-06-04T20:38:17.827' AS DateTime), NULL, 6, CAST(297000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (21, 0, 0, CAST(N'2022-06-04T21:26:16.097' AS DateTime), NULL, 6, CAST(99000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (22, 0, 0, CAST(N'2022-06-04T21:27:22.460' AS DateTime), NULL, 6, CAST(396000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (25, 0, 0, CAST(N'2022-06-04T21:54:02.970' AS DateTime), NULL, 1, CAST(198000 AS Decimal(18, 0)), N'Ở đâu cũng được', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (28, 1, 1, CAST(N'2022-06-07T20:58:14.550' AS DateTime), CAST(N'2022-06-08T00:00:00.000' AS DateTime), 7, CAST(208000 AS Decimal(18, 0)), N'việt nam', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (29, 0, 0, CAST(N'2022-06-07T21:03:23.983' AS DateTime), CAST(N'2022-06-08T00:00:00.000' AS DateTime), 7, CAST(198000 AS Decimal(18, 0)), N'Việt NAm', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (34, 0, 0, CAST(N'2022-06-10T10:20:41.077' AS DateTime), NULL, 3, CAST(396000 AS Decimal(18, 0)), N'123', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (35, 0, 0, CAST(N'2022-06-10T11:29:21.470' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), N'123', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (36, 0, 0, CAST(N'2022-06-10T11:31:08.017' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), N'435', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (37, 0, 0, CAST(N'2022-06-10T11:34:36.213' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), N'678', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (38, 0, 0, CAST(N'2022-06-10T11:36:13.500' AS DateTime), NULL, 3, CAST(0 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (39, 0, 0, CAST(N'2022-06-10T11:37:08.397' AS DateTime), NULL, 3, CAST(218000 AS Decimal(18, 0)), N'dfg', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (43, 0, 0, CAST(N'2022-06-11T13:52:01.830' AS DateTime), NULL, 3, CAST(327000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (45, 0, 0, CAST(N'2022-06-11T16:53:16.937' AS DateTime), NULL, 3, CAST(327000 AS Decimal(18, 0)), N'asddfs', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (46, 0, 0, CAST(N'2022-06-12T19:58:02.340' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (47, 0, 0, CAST(N'2022-06-12T20:00:53.317' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (48, 0, 0, CAST(N'2022-06-12T21:09:12.640' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), N'fdyhfg', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (49, 0, 0, CAST(N'2022-06-12T21:10:10.937' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), N'ghj', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (50, 0, 0, CAST(N'2022-06-12T21:21:28.680' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), N'ghjk', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [TongTien], [DiaChi], [MaVC]) VALUES (51, 0, 0, CAST(N'2022-06-12T21:22:37.297' AS DateTime), NULL, 3, CAST(109000 AS Decimal(18, 0)), N'my house', NULL)
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'Bùi Đức Vinh', N'vinhdz', N'123', N'vanhuynhthanh98@gmail.com', N'Việt Nam', N'0396108981', CAST(N'2021-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (3, N'VTA Shop', N'anhbdz', N'123', N'vinhducbui16@gmail.com', N'Giao ở đâu thì giao', N'0396108981', CAST(N'2022-06-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (6, N'Đào Hồ Anh', N'daohoanh', N'123', N'daohoanh01637788488@gmail.com', N'HCM', N'0337788488', CAST(N'2001-07-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (7, N'Dao Ho Anh', N'anhdz', N'123', N'buiducvjnk@gmail.com', N'Hutech', N'1234567890', CAST(N'2001-09-04T00:00:00.000' AS DateTime))
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
INSERT [dbo].[Loaisanpham] ([MaloaiSP], [Tensanpham]) VALUES (10, N'Túi Xách')
GO
SET IDENTITY_INSERT [dbo].[Loaisanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[NCC] ON 
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (1, N'BadHabit', N'Quận 1', N'12345678')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (2, N'LEVENTS', N'Bình Thạnh', N'12345678')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (3, N'Nike', N'Gò Vấp', N'12345678')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (4, N'Outerity', N'Shope', N'12345678')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (5, N'Hades', N'Bình Thạnh', N'113')
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (6, N'Chuột Trắng.', N'Quận Nhất', N'1234567890')
GO
SET IDENTITY_INSERT [dbo].[NCC] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (1, N'AirForc 1', CAST(99000 AS Decimal(18, 0)), N'Giày Rất Là Đẹp Thích hợp đi chơi', N'giay2.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (2, N'Giày Sneaker', CAST(99000 AS Decimal(18, 0)), N'giày ưu việt chạy là mê', N'giayny.png', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 30, 4, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (3, N'Giày Đúp', CAST(99000 AS Decimal(18, 0)), N'giày gì cũng k biết', N'giay1.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (4, N'Dép Nike', CAST(99000 AS Decimal(18, 0)), N'Dép đẹp đi tán gái', N'dep1.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (5, N'Giày Boston', CAST(99000 AS Decimal(18, 0)), N'Giày Đẹp lắm đó', N'giayboston.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (6, N'Giày MLB', CAST(99000 AS Decimal(18, 0)), N'Giày rất là đẹp đó hhihi', N'giaymlb.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 4, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (7, N'Áo Hades', CAST(99000 AS Decimal(18, 0)), N'Áo đẹp mặt vào gái mê như điếu đổ', N'ao1.png', CAST(N'2022-05-26T00:00:00.000' AS DateTime), 30, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (8, N'Áo Hades', CAST(99000 AS Decimal(18, 0)), N'Áo rất là cháy như lửa', N'ao2.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (9, N'Áo Hades', CAST(99000 AS Decimal(18, 0)), N'Áo bốc lửa mặt vào là gái phải mê phù hợp cho mấy anh trai đi tán gái', N'ao3.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (10, N'Áo Outerity', CAST(99000 AS Decimal(18, 0)), N'Áo bốc lửa mặt vào là gái phải mê phù hợp cho mấy anh trai đi tán gái', N'ao4.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (11, N'Áo Outerity', CAST(99000 AS Decimal(18, 0)), N'Áo bốc lửa mặt vào là gái phải mê phù hợp cho mấy anh trai đi tán gái', N'ao5.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (12, N'Áo Outerity', CAST(99000 AS Decimal(18, 0)), N'Áo bốc lửa mặt vào là gái phải mê phù hợp cho mấy anh trai đi tán gái', N'ao6.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 2, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (13, N'Nón Lá Việt Nam', CAST(99000 AS Decimal(18, 0)), N'Nón thần đội vào chống được sấm sét tia lửa điện kkkkkkkkkk', N'hat4.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (14, N'Nón Cối', CAST(99000 AS Decimal(18, 0)), N'Đẹp Xuất SẮc', N'hat2.png', CAST(N'2022-05-23T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (15, N'Nón Sơn', CAST(99000 AS Decimal(18, 0)), N'Nón thần đội vào chống được sấm sét tia lửa điện kkkkkkkkkk', N'hat3.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (16, N'Nón Bảo Hiểm', CAST(99000 AS Decimal(18, 0)), N'Nón thần đội vào chống được sấm sét tia lửa điện kkkkkkkkkk', N'hat1.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 5, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (17, N'Đồng Hồ Rolex', CAST(99000 AS Decimal(18, 0)), N'Đồng hồ sang quý phải của cánh đàn ông ai đeo vào cũng đẹp', N'watch1.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (18, N'Đồng Hồ WD', CAST(99000 AS Decimal(18, 0)), N'Đồng hồ sang quý phải của cánh đàn ông ai đeo vào cũng đẹp', N'watch2.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (19, N'Đồng Hồ Đẹp', CAST(99000 AS Decimal(18, 0)), N'Đồng hồ sang quý phải của cánh đàn ông ai đeo vào cũng đẹp', N'watch3.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (20, N'Quần Jogger', CAST(99000 AS Decimal(18, 0)), N'quần co dãn mặt như không mặt nên không ai biết là bạn đang mặt hay là mắjt', N'quan3.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (21, N'Quần Jean', CAST(99000 AS Decimal(18, 0)), N'quần co dãn mặt như không mặt nên không ai biết là bạn đang mặt hay là mắjt', N'quan1.png', CAST(N'2021-06-25T00:00:00.000' AS DateTime), 30, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (22, N'Quần Tây', CAST(99000 AS Decimal(18, 0)), N'quần co dãn mặt như không mặt nên không ai biết là bạn đang mặt hay là mắjt', N'quan2.png', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 30, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (25, N'Áo Đầm', CAST(99000 AS Decimal(18, 0)), N'sjkahfjsdfksdjfkdsf', N'ao7.png', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 30, 2, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (26, N'Áo Dạ Hội', CAST(99000 AS Decimal(18, 0)), N'rất là đepjjjjjjj', N'ao8.png', CAST(N'2022-05-31T00:00:00.000' AS DateTime), 30, 2, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (27, N'Tất 7 màu', CAST(109000 AS Decimal(18, 0)), N'Tất 7 màu cho người 7 màu', N'tat1.png', CAST(N'2022-06-07T00:00:00.000' AS DateTime), 30, 7, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (28, N'Tất đen', CAST(109000 AS Decimal(18, 0)), N'Tất Đen cho người da đen', N'tat2.png', CAST(N'2022-06-07T00:00:00.000' AS DateTime), 30, 7, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaloaiSP], [MaNCC]) VALUES (29, N'Tất Xanh', CAST(109000 AS Decimal(18, 0)), N'Tất Xanh cho người gia Xanh', N'tat3.png', CAST(N'2022-06-07T00:00:00.000' AS DateTime), 30, 7, 1)
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
INSERT [dbo].[VANCHUYEN] ([MaVC], [TenVanChuyen]) VALUES (1, N'Grap')
GO
INSERT [dbo].[VANCHUYEN] ([MaVC], [TenVanChuyen]) VALUES (2, N'Gojeck')
GO
INSERT [dbo].[VANCHUYEN] ([MaVC], [TenVanChuyen]) VALUES (3, N'Uber')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64F6FC2782D]    Script Date: 16/06/2022 19:07:10 ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__A9D105346ADB0CF8]    Script Date: 16/06/2022 19:07:10 ******/
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
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_VANCHUYEN] FOREIGN KEY([MaVC])
REFERENCES [dbo].[VANCHUYEN] ([MaVC])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_VANCHUYEN]
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
