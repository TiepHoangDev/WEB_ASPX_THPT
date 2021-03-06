USE [master]
GO
/****** Object:  Database [HighSchool]    Script Date: 9/11/2017 12:51:10 AM ******/
CREATE DATABASE [HighSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HighSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HighSchool.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HighSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HighSchool_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HighSchool] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HighSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HighSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HighSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HighSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HighSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HighSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [HighSchool] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HighSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HighSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HighSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HighSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HighSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HighSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HighSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HighSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HighSchool] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HighSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HighSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HighSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HighSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HighSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HighSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HighSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HighSchool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HighSchool] SET  MULTI_USER 
GO
ALTER DATABASE [HighSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HighSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HighSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HighSchool] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HighSchool]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenAlbum] [nvarchar](200) NULL,
	[Anh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NULL,
	[TaiKhoan] [nvarchar](100) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBV] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](150) NULL,
	[TomTat] [nvarchar](300) NULL,
	[NoiDung] [ntext] NULL,
	[NoiBat] [bit] NULL,
	[TrangThai] [bit] NULL,
	[Anh] [nvarchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
	[MaLoai] [int] NULL,
	[TaiKhoan] [nvarchar](100) NULL,
 CONSTRAINT [PK_BaiViet] PRIMARY KEY CLUSTERED 
(
	[MaBV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BoMon]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoMon](
	[MaBM] [int] IDENTITY(1,1) NOT NULL,
	[TenBM] [nvarchar](150) NULL,
	[MoTa] [ntext] NULL,
	[TrangThai] [bit] NULL,
	[TaiKhoan] [nvarchar](100) NULL,
 CONSTRAINT [PK_BoMon] PRIMARY KEY CLUSTERED 
(
	[MaBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AnhNho] [nvarchar](50) NULL,
	[AnhLon] [nvarchar](50) NULL,
	[IDAlbum] [int] NULL,
 CONSTRAINT [PK_HinhAnh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NguoiGui] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[DienThoai] [nvarchar](100) NULL,
	[TieuDe] [nvarchar](150) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[NgayGui] [datetime] NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](50) NULL,
	[MenuCha] [int] NULL,
	[TrangThai] [bit] NULL,
	[URL] [nvarchar](100) NULL,
	[MaLoai] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TaiKhoan] [nvarchar](100) NOT NULL,
	[MatKhau] [nvarchar](300) NULL,
	[HoTen] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](150) NULL,
	[MoTa] [nvarchar](300) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrangLienKet]    Script Date: 9/11/2017 12:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangLienKet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenSite] [nvarchar](150) NULL,
	[URL] [nvarchar](200) NULL,
	[Target] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[TaiKhoan] [nvarchar](100) NULL,
 CONSTRAINT [PK_TrangLienKet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([ID], [TenAlbum], [Anh], [MoTa], [NgayCapNhat], [TaiKhoan]) VALUES (1, N'Khai giảng năm học 2015-2016', N'khaigiang.jpg', NULL, CAST(N'2015-09-25 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Album] ([ID], [TenAlbum], [Anh], [MoTa], [NgayCapNhat], [TaiKhoan]) VALUES (2, N'Phát động an toàn giao thông', N'giaothong.jpg', NULL, CAST(N'2015-09-25 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Album] ([ID], [TenAlbum], [Anh], [MoTa], [NgayCapNhat], [TaiKhoan]) VALUES (3, N'Hội trại 26/3', N'hoitrai.jpg', NULL, CAST(N'2015-06-20 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Album] ([ID], [TenAlbum], [Anh], [MoTa], [NgayCapNhat], [TaiKhoan]) VALUES (4, N'Lễ trao học bổng', N'hocbong.jpg', NULL, CAST(N'2015-07-02 00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Album] OFF
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (1, N'Những học sinh đầu tiên thi “kỳ thi quốc gia” nói gì?', N'Học sinh lớp 12 - thế hệ đầu tiên tham dự kỳ thi quốc gia chung chia sẻ nhiều tâm trạng khác nhau trước phương án tổ chức thi mà Bộ GD&ĐT công bố.', N'&amp;lt;p&amp;gt;Ngay khi Bộ Gi&amp;amp;aacute;o dục &amp;amp;amp; Đ&amp;amp;agrave;o tạo c&amp;amp;ocirc;ng bố&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://giaoduc.net.vn/GDVN/Thong-tin-chi-tiet-phuong-an-thi-quoc-gia-tu-nam-2015-post149654.gd&amp;quot;&amp;gt;Phương &amp;amp;aacute;n tổ chức Kỳ thi trung học phổ th&amp;amp;ocirc;ng quốc gia từ năm 2015&amp;lt;/a&amp;gt;&amp;amp;nbsp;sau một thời gian lấy &amp;amp;yacute; kiến từ x&amp;amp;atilde; hội, giới chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n, c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o..., c&amp;amp;aacute;c em học sinh lớp 12 &amp;amp;ndash; những học sinh đầu ti&amp;amp;ecirc;n tham dự kỳ thi quốc gia chung kh&amp;amp;ocirc;ng khỏi c&amp;amp;oacute; nhiều băn khoăn, lo lắng.&amp;amp;nbsp; C&amp;amp;ugrave;ng nghe tiếng n&amp;amp;oacute;i của người trong cuộc xem c&amp;amp;aacute;c em nghĩ g&amp;amp;igrave; về phương &amp;amp;aacute;n kỳ thi quốc gia.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Khối D thoải m&amp;amp;aacute;i, c&amp;amp;aacute;c khối kh&amp;amp;aacute;c lo lắng&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;L&amp;amp;agrave; một học sinh lớp 12 Trường THPT Lương Văn Can, em Nguyễn Ngọc Linh cho biết: &amp;amp;ldquo;Năm nay em thi khối D n&amp;amp;ecirc;n cũng kh&amp;amp;ocirc;ng qu&amp;amp;aacute; lo lắng với ba m&amp;amp;ocirc;n thi bắt buộc l&amp;amp;agrave; To&amp;amp;aacute;n, Văn, Ngoại ngữ. Đấy l&amp;amp;agrave; với những bạn thi khối D như em, c&amp;amp;ograve;n c&amp;amp;aacute;c bạn đ&amp;amp;atilde; x&amp;amp;aacute;c định học khối C, khối A c&amp;amp;oacute; lẽ cũng gặp nhiều kh&amp;amp;oacute; khăn trong h&amp;amp;igrave;nh thức thi 2 trong 1 n&amp;amp;agrave;y&amp;amp;rdquo;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Học c&amp;amp;ugrave;ng trường với Linh, cậu học sinh lớp 12 Trần Đức Anh cũng kh&amp;amp;ocirc;ng khỏi lo lắng về k&amp;amp;igrave; thi sắp tới. Đức Anh chia sẻ: &amp;amp;ldquo;Em dự định thi khối A v&amp;amp;agrave;o Trường đại học Ph&amp;amp;ograve;ng ch&amp;amp;aacute;y chữa ch&amp;amp;aacute;y, nhưng với k&amp;amp;igrave; thi 2 trong 1 của Bộ GD&amp;amp;amp;ĐT th&amp;amp;igrave; em gặp kh&amp;amp;oacute; khăn nhất bởi m&amp;amp;ocirc;n Văn. Em chưa biết với c&amp;amp;aacute;ch thức mới n&amp;amp;agrave;y th&amp;amp;igrave; h&amp;amp;igrave;nh thức ra đề của c&amp;amp;aacute;c m&amp;amp;ocirc;n sẽ như thế n&amp;amp;agrave;o&amp;amp;rdquo;.&amp;lt;/p&amp;gt;
', 1, 1, N'1.1.jpg', CAST(N'2015-09-23 20:46:33.860' AS DateTime), 4, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (2, N'TP HCM tạm thời chưa tăng học phí', N'UBND TP HCM vừa có quyết định thực hiện tạm thu học phí năm học 2015-2016 bằng với mức thu năm trước.', N'&amp;lt;p&amp;gt;Theo đ&amp;amp;oacute;, mức thu n&amp;amp;agrave;y sẽ được chia th&amp;amp;agrave;nh hai nh&amp;amp;oacute;m cho c&amp;amp;aacute;c trường c&amp;amp;ocirc;ng lập. Nội th&amp;amp;agrave;nh mức thu sẽ cao hơn so với ngoại th&amp;amp;agrave;nh (gồm huyện Cần Giờ, B&amp;amp;igrave;nh Ch&amp;amp;aacute;nh, H&amp;amp;oacute;c M&amp;amp;ocirc;n, Củ Chi v&amp;amp;agrave; Nh&amp;amp;agrave; B&amp;amp;egrave;) từ 20.000 đến 60.000 đồng mỗi khoản.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Cụ thể mức thu như sau:&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot; cellpadding=&amp;quot;0&amp;quot; cellspacing=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td rowspan=&amp;quot;2&amp;quot;&amp;gt;
			&amp;lt;p&amp;gt;Cấp học&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td colspan=&amp;quot;2&amp;quot;&amp;gt;
			&amp;lt;p&amp;gt;ĐVT: đồng/HS/th&amp;amp;aacute;ng&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Nh&amp;amp;oacute;m 1 (c&amp;amp;aacute;c quận nội th&amp;amp;agrave;nh)&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Nh&amp;amp;oacute;m 2 (5 huyện ngoại th&amp;amp;agrave;nh)&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Nh&amp;amp;agrave; trẻ&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;200.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;140.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Mẫu gi&amp;amp;aacute;o&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;160.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;100.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Tiểu học&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td colspan=&amp;quot;2&amp;quot;&amp;gt;
			&amp;lt;p&amp;gt;Kh&amp;amp;ocirc;ng thu&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Trung học cơ sở&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;100.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;85.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Bổ t&amp;amp;uacute;c trung học cơ sở&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;150.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;130.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Trung học phổ th&amp;amp;ocirc;ng&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;120.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;100.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Bổ t&amp;amp;uacute;c trung học phổ th&amp;amp;ocirc;ng&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;180.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;150.000&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;

&amp;lt;p&amp;gt;Việc thu học ph&amp;amp;iacute; n&amp;amp;agrave;y được x&amp;amp;acirc;y dựng theo Nghị định 49 của Ch&amp;amp;iacute;nh phủ (về thu, sử dụng học ph&amp;amp;iacute; từ năm học 2010-2011 đến 2014-2015). Đến nay Nghị định đ&amp;amp;atilde; hết hiệu lực nhưng chưa c&amp;amp;oacute; Nghị định mới, do vậy UBND TPHCM phải ra th&amp;amp;ocirc;ng b&amp;amp;aacute;o tạm thời thu như năm trước.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Trong đ&amp;amp;oacute;, đối với học sinh c&amp;amp;aacute;c lớp chuy&amp;amp;ecirc;n kh&amp;amp;ocirc;ng phải đ&amp;amp;oacute;ng học ph&amp;amp;iacute;, c&amp;amp;ograve;n học sinh lớp thường trong c&amp;amp;aacute;c trường chuy&amp;amp;ecirc;n vẫn phải đ&amp;amp;oacute;ng theo mức học ph&amp;amp;iacute; phổ th&amp;amp;ocirc;ng c&amp;amp;ugrave;ng cấp.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Nguyễn Loan&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'img02691400852468660x0-1442977588_180x108.jpg', CAST(N'2015-09-23 20:24:15.000' AS DateTime), 4, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (3, N'Thông báo tuyển sinh vào lớp 10 năm học 2014-2015', N'Đối tượng tuyển sinh của hệ Trung học phổ thông FPT (THPT FPT) là toàn bộ học sinh Việt Nam có đủ sức khỏe, đã hoặc sẽ tốt nghiệp THCS trong năm 2015 đồng thời có kết quả học tập và xếp loại hạnh kiểm năm lớp 9 đạt từ loại Khá trở lên.', N'&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;I. Đối tượng tuyển sinh&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Đối tượng tuyển sinh của hệ Trung học phổ th&amp;amp;ocirc;ng FPT (THPT FPT) l&amp;amp;agrave; to&amp;amp;agrave;n bộ học sinh Việt Nam c&amp;amp;oacute; đủ sức khỏe, đ&amp;amp;atilde; hoặc sẽ tốt nghiệp THCS trong năm 2015 đồng thời c&amp;amp;oacute; kết quả học tập v&amp;amp;agrave; xếp loại hạnh kiểm năm lớp 9 đạt từ loại Kh&amp;amp;aacute; trở l&amp;amp;ecirc;n.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;II. Chỉ ti&amp;amp;ecirc;u tuyển sinh:&amp;lt;/strong&amp;gt;&amp;amp;nbsp;100 học sinh.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;III. Phương thức tuyển sinh&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ul&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c th&amp;amp;iacute; sinh phải tham dự kỳ thi sơ tuyển của trường.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;&amp;lt;strong&amp;gt;Thời gian:&amp;amp;nbsp;&amp;lt;/strong&amp;gt;8h30 &amp;amp;ndash; 11h00 ng&amp;amp;agrave;y 02/7/2015.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;&amp;lt;strong&amp;gt;Địa điểm tổ chức thi sơ tuyển:&amp;amp;nbsp;&amp;lt;/strong&amp;gt;Trường Cao đẳng thực h&amp;amp;agrave;nh FPT Polytechnic, T&amp;amp;ograve;a nh&amp;amp;agrave; FPT Polytechnic (nh&amp;amp;agrave; H), H&amp;amp;agrave;m Nghi, Mỹ Đ&amp;amp;igrave;nh, Từ Li&amp;amp;ecirc;m, H&amp;amp;agrave; Nội.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Tham khảo t&amp;amp;agrave;i liệu Hướng dẫn l&amp;amp;agrave;m b&amp;amp;agrave;i tại địa chỉ:&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/index.php/huong-dan-lam-bai-kiem-tra-nang-luc-tu-duy/&amp;quot;&amp;gt;http://thpt.fpt.edu.vn/index.php/huong-dan-lam-bai-kiem-tra-nang-luc-tu-duy/.&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;
&amp;lt;/ul&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;IV. Quy tr&amp;amp;igrave;nh đăng k&amp;amp;yacute; dự thi&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ol&amp;gt;
	&amp;lt;li&amp;gt;&amp;lt;em&amp;gt;Đăng k&amp;amp;yacute; trực tuyến v&amp;amp;agrave; gửi hồ sơ qua bưu điện&amp;lt;/em&amp;gt;: C&amp;amp;aacute;c học sinh ở xa c&amp;amp;oacute; thể đăng k&amp;amp;yacute; trực tuyến tại địa chỉ&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/index.php/dang-ki-tuyen-sinh-truc-tuyen&amp;quot;&amp;gt;http://thpt.fpt.edu.vn/index.php/dang-ki-tuyen-sinh-truc-tuyen&amp;lt;/a&amp;gt;. Học sinh cần điền đầy đủ v&amp;amp;agrave; ch&amp;amp;iacute;nh x&amp;amp;aacute;c th&amp;amp;ocirc;ng tin li&amp;amp;ecirc;n lạc để Trường Trung học phổ th&amp;amp;ocirc;ng FPT c&amp;amp;oacute; thể cung cấp những th&amp;amp;ocirc;ng tin cần thiết. Sau khi đăng k&amp;amp;yacute;, th&amp;amp;iacute; sinh c&amp;amp;oacute; thể tải mẫu&amp;amp;nbsp;&amp;lt;em&amp;gt;Phiếu đăng k&amp;amp;yacute; dự thi&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/wp-content/uploads/2015/03/Phieu-dang-ky-du-thi-dot-2_nam-hoc-2015-2016.pdf&amp;quot;&amp;gt;tại đ&amp;amp;acirc;y&amp;lt;/a&amp;gt;&amp;lt;/em&amp;gt;, in ra v&amp;amp;agrave; điền đầy đủ th&amp;amp;ocirc;ng tin. Th&amp;amp;iacute; sinh gửi&amp;amp;nbsp;&amp;lt;em&amp;gt;Phiếu đăng k&amp;amp;yacute; dự thi&amp;lt;/em&amp;gt;&amp;amp;nbsp;n&amp;amp;agrave;y c&amp;amp;ugrave;ng với c&amp;amp;aacute;c giấy tờ cần thiết kh&amp;amp;aacute;c qua dịch vụ chuyển ph&amp;amp;aacute;t nhanh đảm bảo của bưu điện tới văn ph&amp;amp;ograve;ng của Trường Trung học phổ th&amp;amp;ocirc;ng FPT.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c th&amp;amp;iacute; sinh cũng c&amp;amp;oacute; thể đến đăng k&amp;amp;yacute; dự thi sơ tuyển trực tiếp tại văn ph&amp;amp;ograve;ng của Trường Trung học phổ th&amp;amp;ocirc;ng FPT. Trường khuyến kh&amp;amp;iacute;ch c&amp;amp;aacute;c học sinh đăng k&amp;amp;yacute; trực tiếp để được tư vấn v&amp;amp;agrave; giải đ&amp;amp;aacute;p c&amp;amp;aacute;c thắc mắc chi tiết v&amp;amp;agrave; ch&amp;amp;iacute;nh x&amp;amp;aacute;c hơn.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Tất cả c&amp;amp;aacute;c học sinh đăng k&amp;amp;yacute; trực tiếp sẽ được nhận&amp;amp;nbsp;&amp;lt;em&amp;gt;Giấy b&amp;amp;aacute;o thi&amp;lt;/em&amp;gt;&amp;amp;nbsp;c&amp;amp;oacute; đầy đủ th&amp;amp;ocirc;ng tin về kỳ thi. C&amp;amp;aacute;c học sinh đăng k&amp;amp;yacute; trực tiếp cần nộp lệ ph&amp;amp;iacute; thi ngay tại thời điểm đăng k&amp;amp;yacute;.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Tất cả c&amp;amp;aacute;c th&amp;amp;iacute; sinh đ&amp;amp;atilde; đăng k&amp;amp;yacute; dự thi sơ tuyển (trực tiếp hoặc qua bưu điện) cần xem th&amp;amp;ocirc;ng tin về số b&amp;amp;aacute;o danh, ph&amp;amp;ograve;ng thi v&amp;amp;agrave; địa điểm thi của m&amp;amp;igrave;nh tại website của Trường theo địa chỉ&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/&amp;quot;&amp;gt;http://thpt.fpt.edu.vn&amp;lt;/a&amp;gt;.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c th&amp;amp;iacute; sinh đăng k&amp;amp;yacute; qua bưu điện sẽ nộp lệ ph&amp;amp;iacute; thi v&amp;amp;agrave; nhận&amp;amp;nbsp;&amp;lt;em&amp;gt;Giấy b&amp;amp;aacute;o thi&amp;lt;/em&amp;gt;&amp;amp;nbsp;từ 08h00&amp;amp;rsquo; đến 08h30&amp;amp;rsquo; ng&amp;amp;agrave;y 02/7/2015 tại địa điểm tổ chức thi. Tất cả c&amp;amp;aacute;c đăng k&amp;amp;yacute; chỉ ch&amp;amp;iacute;nh thức hợp lệ v&amp;amp;agrave; th&amp;amp;iacute; sinh chỉ được ph&amp;amp;eacute;p v&amp;amp;agrave;o ph&amp;amp;ograve;ng thi sau khi đ&amp;amp;atilde; nộp lệ ph&amp;amp;iacute; thi.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Kết quả kỳ thi sơ tuyển sẽ được c&amp;amp;ocirc;ng bố tr&amp;amp;ecirc;n website của Trường trong v&amp;amp;ograve;ng 3 ng&amp;amp;agrave;y sau khi thi. Th&amp;amp;iacute; sinh cũng c&amp;amp;oacute; thể hỏi th&amp;amp;ocirc;ng tin tr&amp;amp;uacute;ng tuyển qua điện thoại. Th&amp;amp;ocirc;ng b&amp;amp;aacute;o ch&amp;amp;iacute;nh thức sẽ được gửi qua bưu điện cho gia đ&amp;amp;igrave;nh của th&amp;amp;iacute; sinh.&amp;lt;/li&amp;gt;
&amp;lt;/ol&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;V. Hồ sơ đăng k&amp;amp;yacute; dự thi sơ tuyển&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ul&amp;gt;
	&amp;lt;li&amp;gt;01 Phiếu đăng k&amp;amp;yacute; dự thi theo mẫu của Trường THPT FPT. (C&amp;amp;oacute; thể tải về&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/wp-content/uploads/2015/03/Phieu-dang-ky-du-thi-dot-2_nam-hoc-2015-2016.pdf&amp;quot;&amp;gt;&amp;lt;strong&amp;gt;tại đ&amp;amp;acirc;y&amp;lt;/strong&amp;gt;&amp;lt;/a&amp;gt;)&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;02 ảnh 3&amp;amp;times;4 (bỏ v&amp;amp;agrave;o phong b&amp;amp;igrave; nhỏ, ghi r&amp;amp;otilde; họ t&amp;amp;ecirc;n v&amp;amp;agrave; ng&amp;amp;agrave;y th&amp;amp;aacute;ng năm sinh ra b&amp;amp;ecirc;n ngo&amp;amp;agrave;i phong b&amp;amp;igrave; v&amp;amp;agrave; đằng sau ảnh).&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Lệ ph&amp;amp;iacute; dự thi: 100.000 VNĐ.&amp;lt;/li&amp;gt;
&amp;lt;/ul&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;em&amp;gt;Lưu &amp;amp;yacute;:&amp;lt;/em&amp;gt;&amp;lt;/strong&amp;gt;&amp;amp;nbsp;C&amp;amp;aacute;c th&amp;amp;iacute; sinh ở xa c&amp;amp;oacute; thể gửi chuyển ph&amp;amp;aacute;t nhanh hồ sơ theo đường bưu điện trước 17h00&amp;amp;rsquo; ng&amp;amp;agrave;y 28/6/2015 v&amp;amp;agrave; nộp lệ ph&amp;amp;iacute; thi tại buổi sơ tuyển ng&amp;amp;agrave;y 02/7/2015&amp;lt;strong&amp;gt;.&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
', 1, 1, N'timthumb.jpg', CAST(N'2015-09-23 20:33:28.183' AS DateTime), 7, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (4, N'Hướng dẫn đăng ký xét tuyển vào lớp 10', N'Để giúp các thí sinh có thể dễ dàng hoàn tất các thủ tục đăng ký dự tuyển chúng tôi xin được hướng dẫn chi tiết theo các bước ở dưới đây. Mong các quý vị phụ huynh và thí sinh đọc kỹ và thực hiện chính xác các hướng dẫn này. Nếu có điều gì chưa rõ, xin quý vị vui lòng gọi điện hay trực tiếp đến Văn ', N'&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;I. Đăng k&amp;amp;yacute; tham gia kiểm tra năng lực v&amp;amp;agrave; x&amp;amp;eacute;t tuyển&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ol&amp;gt;
	&amp;lt;li&amp;gt;Đọc kỹ&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/index.php/thong-bao-tuyen-sinh-vao-lop-10-truong-thpt-fpt-nam-hoc-2015-2016/&amp;quot;&amp;gt;Th&amp;amp;ocirc;ng tin tuyển sinh&amp;lt;/a&amp;gt;&amp;amp;nbsp;để c&amp;amp;oacute; những h&amp;amp;igrave;nh dung cơ bản về điều kiện v&amp;amp;agrave; c&amp;amp;aacute;c ch&amp;amp;iacute;nh s&amp;amp;aacute;ch tuyển sinh của nh&amp;amp;agrave; trường. T&amp;amp;igrave;m hiểu kỹ xem m&amp;amp;igrave;nh thuộc diện đối tượng n&amp;amp;agrave;o của kỳ tuyển sinh v&amp;amp;agrave; l&amp;amp;agrave;m thủ tục đăng k&amp;amp;yacute; dự tuyển theo c&amp;amp;aacute;c bước sau đ&amp;amp;acirc;y.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Đăng k&amp;amp;yacute; x&amp;amp;eacute;t tuyển online tr&amp;amp;ecirc;n trang web của nh&amp;amp;agrave; trường&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/index.php/dang-ki-tuyen-sinh-truc-tuyen/&amp;quot; target=&amp;quot;_blank&amp;quot;&amp;gt;tại đ&amp;amp;acirc;y&amp;lt;/a&amp;gt;&amp;amp;nbsp;để được ghi nhận v&amp;amp;agrave;o hệ thống v&amp;amp;agrave; cung cấp c&amp;amp;aacute;c th&amp;amp;ocirc;ng tin cần thiết.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c th&amp;amp;iacute; sinh ở H&amp;amp;agrave; Nội cần chuẩn bị hồ sơ theo quy định trong mục V của&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/index.php/thong-bao-tuyen-sinh-vao-lop-10-truong-thpt-fpt-nam-hoc-2015-2016/&amp;quot; target=&amp;quot;_blank&amp;quot;&amp;gt;Th&amp;amp;ocirc;ng b&amp;amp;aacute;o tuyển sinh v&amp;amp;agrave;o lớp 10 năm học 2015&amp;amp;ndash; 201&amp;lt;/a&amp;gt;6&amp;amp;nbsp;v&amp;amp;agrave; nộp c&amp;amp;ugrave;ng lệ ph&amp;amp;iacute; kiểm tra năng lực tại Văn ph&amp;amp;ograve;ng trước 17h00 ng&amp;amp;agrave;y&amp;amp;nbsp;22/05/2015&amp;amp;nbsp;.&amp;amp;nbsp;&amp;lt;em&amp;gt;Phiếu đăng k&amp;amp;yacute; dự tuyển&amp;lt;/em&amp;gt;&amp;amp;nbsp;c&amp;amp;oacute; thể tải về&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/wp-content/uploads/2015/01/Phieu-dang-ky-du-thi-nam-hoc-2015-2016.pdf&amp;quot;&amp;gt;tại đ&amp;amp;acirc;y&amp;lt;/a&amp;gt;&amp;amp;nbsp;hoặc lấy v&amp;amp;agrave; điền trực tiếp tại c&amp;amp;aacute;c Văn ph&amp;amp;ograve;ng tuyển sinh. C&amp;amp;aacute;c th&amp;amp;iacute; sinh đăng k&amp;amp;yacute; sẽ được nhận&amp;amp;nbsp;&amp;lt;em&amp;gt;Giấy b&amp;amp;aacute;o tham dự b&amp;amp;agrave;i kiểm tra năng lực x&amp;amp;eacute;t tuyển đầu v&amp;amp;agrave;o&amp;lt;/em&amp;gt;&amp;amp;nbsp;c&amp;amp;oacute; d&amp;amp;aacute;n ảnh v&amp;amp;agrave; đ&amp;amp;oacute;ng dấu của Trường trực tiếp ngay sau khi nộp hồ sơ.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c th&amp;amp;iacute; sinh ngoại tỉnh cần chuẩn bị hồ sơ theo quy định trong mục V của&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/index.php/thong-bao-tuyen-sinh-vao-lop-10-truong-thpt-fpt-nam-hoc-2015-2016/&amp;quot; target=&amp;quot;_blank&amp;quot;&amp;gt;Th&amp;amp;ocirc;ng b&amp;amp;aacute;o tuyển sinh v&amp;amp;agrave;o lớp 10 năm học 2015 &amp;amp;ndash; 2016&amp;lt;/a&amp;gt;&amp;amp;nbsp;v&amp;amp;agrave; gửi qua bưu điện về địa chỉ Văn ph&amp;amp;ograve;ng tư vấn tuyển sinh trước&amp;amp;nbsp;17h00&amp;amp;rsquo; ng&amp;amp;agrave;y 18/05/2015.&amp;amp;nbsp;&amp;lt;em&amp;gt;Phiếu đăng k&amp;amp;yacute; dự tuyển&amp;lt;/em&amp;gt;&amp;amp;nbsp;c&amp;amp;oacute; thể tải về&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/wp-content/uploads/2015/01/Phieu-dang-ky-du-thi-nam-hoc-2015-2016.pdf&amp;quot; target=&amp;quot;_blank&amp;quot;&amp;gt;tại đ&amp;amp;acirc;y&amp;lt;/a&amp;gt;. C&amp;amp;aacute;c th&amp;amp;iacute; sinh đ&amp;amp;atilde; gửi hồ sơ đăng k&amp;amp;yacute; qua bưu điện sẽ nhận được điện thoại x&amp;amp;aacute;c nhận của Trường v&amp;amp;agrave; hướng dẫn c&amp;amp;aacute;c bước tiếp theo. Th&amp;amp;iacute; sinh sẽ nộp lệ ph&amp;amp;iacute; kiểm tra năng lực trước khi v&amp;amp;agrave;o ph&amp;amp;ograve;ng thi s&amp;amp;aacute;ng ng&amp;amp;agrave;y 24/5/2015.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c th&amp;amp;iacute; sinh đ&amp;amp;atilde; đăng k&amp;amp;yacute; trực tiếp hoặc gửi hồ sơ qua bưu điện sẽ c&amp;amp;oacute; t&amp;amp;ecirc;n trong danh s&amp;amp;aacute;ch dự tuyển kiểm tra năng lực x&amp;amp;eacute;t tuyển đầu v&amp;amp;agrave;o được c&amp;amp;ocirc;ng bố&amp;amp;nbsp;tr&amp;amp;ecirc;n website v&amp;amp;agrave; tại c&amp;amp;aacute;c Văn ph&amp;amp;ograve;ng tuyển sinh c&amp;amp;ugrave;ng với số b&amp;amp;aacute;o danh, ph&amp;amp;ograve;ng thi v&amp;amp;agrave; địa điểm dự thi.&amp;lt;/li&amp;gt;
&amp;lt;/ol&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;II. Đăng k&amp;amp;yacute; x&amp;amp;eacute;t tuyển thẳng&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ol&amp;gt;
	&amp;lt;li&amp;gt;Đọc kỹ Th&amp;amp;ocirc;ng b&amp;amp;aacute;o tuyển sinh để c&amp;amp;oacute; những h&amp;amp;igrave;nh dung cơ bản về điều kiện v&amp;amp;agrave; c&amp;amp;aacute;c ch&amp;amp;iacute;nh s&amp;amp;aacute;ch của nh&amp;amp;agrave; trường. T&amp;amp;igrave;m hiểu kỹ xem m&amp;amp;igrave;nh thuộc diện đối tượng n&amp;amp;agrave;o của quy định tuyển thẳng v&amp;amp;agrave; l&amp;amp;agrave;m thủ tục đăng k&amp;amp;yacute; tuyển thẳng theo c&amp;amp;aacute;c bước sau đ&amp;amp;acirc;y.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Chuẩn bị hồ sơ theo hướng dẫn trong mục V của&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/index.php/thong-bao-tuyen-sinh-vao-lop-10-truong-thpt-fpt-nam-hoc-2015-2016/&amp;quot; target=&amp;quot;_blank&amp;quot;&amp;gt;Th&amp;amp;ocirc;ng b&amp;amp;aacute;o tuyển sinh v&amp;amp;agrave;o lớp 10 năm học 2015 &amp;amp;ndash; 201&amp;lt;/a&amp;gt;6&amp;amp;nbsp;v&amp;amp;agrave; nộp trực tiếp hoặc gửi qua bưu điện về địa chỉ Văn ph&amp;amp;ograve;ng tư vấn tuyển sinh trước 17h00&amp;amp;#39; ng&amp;amp;agrave;y 20/5/2015.&amp;amp;nbsp;&amp;lt;em&amp;gt;Phiếu đăng k&amp;amp;yacute; tuyển thẳng&amp;amp;nbsp;&amp;lt;/em&amp;gt;c&amp;amp;oacute; thể tải về&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://thpt.fpt.edu.vn/wp-content/uploads/2015/01/Phieu-dang-ky-tuyen-thang-nam-hoc-2015-20161.pdf&amp;quot;&amp;gt;tại đ&amp;amp;acirc;y&amp;lt;/a&amp;gt;.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;L&amp;amp;agrave;m thủ tục nhập học đợt 1 dự kiến từ ng&amp;amp;agrave;y 2/6/2015 đến&amp;amp;nbsp;ng&amp;amp;agrave;y 6/6/2015.&amp;lt;/li&amp;gt;
&amp;lt;/ol&amp;gt;
', 1, 1, N'article.jpg', CAST(N'2015-09-23 20:37:10.790' AS DateTime), 7, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (10, N'Mẫu giáo - Thời điểm thích hợp để trẻ học tiếng Anh', N'Phương pháp "Phonics" giúp trẻ mẫu giáo đọc và viết tiếng Anh như người bản ngữ, bằng cách đánh vần từng âm rồi ghép lại với nhau.', N'&amp;lt;p&amp;gt;Hi&amp;amp;ecirc;̉u được t&amp;amp;acirc;̀m quan trọng của ti&amp;amp;ecirc;́ng Anh đối với tương lai, nhi&amp;amp;ecirc;̀u phụ huynh sẵn lòng đ&amp;amp;acirc;̀u tư, tạo đi&amp;amp;ecirc;̀u ki&amp;amp;ecirc;̣n để con học ngoại ngữ trong m&amp;amp;ocirc;i trường tốt nhất. Tuy nhi&amp;amp;ecirc;n, kh&amp;amp;ocirc;ng &amp;amp;iacute;t cha mẹ băn khoăn thời đi&amp;amp;ecirc;̉m ph&amp;amp;ugrave; hợp cho trẻ bắt đ&amp;amp;acirc;̀u. Một số cho rằng&amp;amp;nbsp;học ti&amp;amp;ecirc;́ng Anh từ m&amp;amp;acirc;̃u giáo l&amp;amp;agrave; quá sớm, sẽ khiến trẻ có cảm giác nh&amp;amp;ocirc;̀i nhét v&amp;amp;agrave; sợ học, loạn ng&amp;amp;ocirc;n ngữ mẹ đẻ.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Tr&amp;amp;ecirc;n thực tế, nhiều nghi&amp;amp;ecirc;n cứu chỉ ra rằng, học ngoại ngữ c&amp;amp;oacute; hiệu quả v&amp;amp;agrave; kh&amp;amp;ocirc;ng ảnh hưởng đến tiếng mẹ đẻ khi trẻ l&amp;amp;ecirc;n 4 tuổi. Nghi&amp;amp;ecirc;n cứu Đại học Harvard (Mỹ) cho th&amp;amp;acirc;́y, trẻ càng nhỏ thì khả năng bắt chước phát &amp;amp;acirc;m và ngữ đi&amp;amp;ecirc;̣u càng t&amp;amp;ocirc;́t. Trong giai đoạn này, n&amp;amp;atilde;o sẵn sàng đón nh&amp;amp;acirc;̣n những &amp;amp;acirc;m thanh mới. Nếu được l&amp;amp;agrave;m quen với &amp;amp;acirc;m điệu v&amp;amp;agrave; ngữ điệu chuẩn từ sớm bằng phương ph&amp;amp;aacute;p học Phonics (đ&amp;amp;aacute;nh vần), trẻ c&amp;amp;oacute; khả năng n&amp;amp;oacute;i tiếng Anh như người bản ngữ.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Lợi &amp;amp;iacute;ch của phương ph&amp;amp;aacute;p Phonics l&amp;amp;agrave; trẻ học đọc v&amp;amp;agrave; viết một c&amp;amp;aacute;ch nhanh v&amp;amp;agrave; ch&amp;amp;iacute;nh x&amp;amp;aacute;c. Trẻ c&amp;amp;oacute; thể đ&amp;amp;aacute;nh vần từng &amp;amp;acirc;m rồi gh&amp;amp;eacute;p lại với nhau để đọc cả một từ giống như tiếng Việt. Nhờ vậy, trẻ nhận biết từ tốt hơn. Tương tự như vậy, phương ph&amp;amp;aacute;p Phonics gi&amp;amp;uacute;p trẻ học vi&amp;amp;ecirc;́t biết cách so sánh h&amp;amp;ecirc;̣ th&amp;amp;ocirc;́ng chữ c&amp;amp;aacute;i của hai ng&amp;amp;ocirc;n ngữ, m&amp;amp;agrave; kh&amp;amp;ocirc;ng bị lẫn lộn như nhiều người lầm tưởng.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;N&amp;amp;ecirc;́u phụ huynh và th&amp;amp;acirc;̀y c&amp;amp;ocirc; ép học nhi&amp;amp;ecirc;̀u trong thời gian ngắn hoặc đặt mục ti&amp;amp;ecirc;u cao, trẻ sẽ cảm th&amp;amp;acirc;́y áp lực t&amp;amp;acirc;m lý. Khác với người lớn, trẻ nhỏ học ngoại ngữ m&amp;amp;ocirc;̣t cách tự nhi&amp;amp;ecirc;n giống như tiếng mẹ đẻ, kh&amp;amp;ocirc;ng n&amp;amp;ecirc;n c&amp;amp;ocirc;́ gắng hay gò ép.&amp;amp;nbsp;Cách t&amp;amp;ocirc;́t nh&amp;amp;acirc;́t đ&amp;amp;ecirc;̉ trẻ tiếp thu ti&amp;amp;ecirc;́ng Anh hi&amp;amp;ecirc;̣u quả là th&amp;amp;ocirc;ng qua các hoạt đ&amp;amp;ocirc;̣ng học mà chơi, chơi mà học. Giờ học ti&amp;amp;ecirc;́ng Anh n&amp;amp;ecirc;n t&amp;amp;ocirc;̉ chức nhiều trò chơi, hoạt đ&amp;amp;ocirc;̣ng giao ti&amp;amp;ecirc;́p, &amp;amp;acirc;m nhạc, k&amp;amp;ecirc;̉ chuy&amp;amp;ecirc;̣n... để tạo cho trẻ m&amp;amp;ocirc;i trường thoải mái v&amp;amp;agrave; tự tin. Ở đ&amp;amp;ocirc;̣ tu&amp;amp;ocirc;̉i này, trẻ chưa có ý thức s&amp;amp;acirc;u sắc v&amp;amp;ecirc;̀ bản th&amp;amp;acirc;n. V&amp;amp;igrave; vậy, các em sẵn sàng ti&amp;amp;ecirc;́p thu và sử dụng ng&amp;amp;ocirc;n ngữ mới mà kh&amp;amp;ocirc;ng sợ mắc l&amp;amp;ocirc;̃i hay cảm th&amp;amp;acirc;́y ngượng ngừng như anh chị lớn.&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot; cellpadding=&amp;quot;3&amp;quot; cellspacing=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;img alt=&amp;quot;polyad&amp;quot; src=&amp;quot;http://m.f29.img.vnecdn.net/2015/09/17/17-9-201531-1811-1442475755.jpg&amp;quot; /&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Trẻ học bằng phương ph&amp;amp;aacute;p Phonics.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;Ocirc;ng Gavan Iacono - Tổng gi&amp;amp;aacute;m đốc tổ chức gi&amp;amp;aacute;o dục&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://www.llv.edu.vn/&amp;quot; target=&amp;quot;_blank&amp;quot;&amp;gt;Language Link Việt Nam&amp;lt;/a&amp;gt;, đơn vị giảng dạy tiếng Anh cho trẻ mẫu gi&amp;amp;aacute;o theo phương ph&amp;amp;aacute;p Phonics cho biết: &amp;amp;quot;Học tiếng Anh từ sớm gi&amp;amp;uacute;p trẻ tiếp thu ng&amp;amp;ocirc;n ngữ mới nhanh v&amp;amp;agrave; dễ d&amp;amp;agrave;ng. Đ&amp;amp;acirc;y l&amp;amp;agrave; giai đoạn đầu đời quan trọng v&amp;amp;agrave; tiềm năng nhất của con trẻ m&amp;amp;agrave; cha mẹ kh&amp;amp;ocirc;ng n&amp;amp;ecirc;n bỏ qu&amp;amp;ecirc;n. Nếu sống trong m&amp;amp;ocirc;i trường sử dụng nhiều tiếng Anh, n&amp;amp;atilde;o bộ sẽ được k&amp;amp;iacute;ch th&amp;amp;iacute;ch ph&amp;amp;aacute;t triển, gi&amp;amp;uacute;p trẻ tiếp thu ng&amp;amp;ocirc;n ngữ theo bản năng v&amp;amp;agrave; n&amp;amp;oacute;i tiếng Anh tự nhi&amp;amp;ecirc;n&amp;amp;quot;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Đại diện Language Link cũng chia sẻ, học ngoại ngữ sớm kh&amp;amp;ocirc;ng chỉ mang lại lợi ích v&amp;amp;ecirc;̀ mặt ng&amp;amp;ocirc;n ngữ mà cả tư duy phản bi&amp;amp;ecirc;̣n, khả năng sáng tạo và linh hoạt ở não. Những học sinh bi&amp;amp;ecirc;́t ngoại ngữ thường có đi&amp;amp;ecirc;̉m toán và ng&amp;amp;ocirc;n ngữ cao hơn các bạn kh&amp;amp;ocirc;ng học. Nghi&amp;amp;ecirc;n cứu của Đại học Cornell cũng cho th&amp;amp;acirc;́y, trẻ bi&amp;amp;ecirc;́t ngoại ngữ có khả năng t&amp;amp;acirc;̣p trung t&amp;amp;ocirc;́t hơn, d&amp;amp;ecirc;̃ cảm th&amp;amp;ocirc;ng với người khác, bi&amp;amp;ecirc;́t tr&amp;amp;acirc;n trọng và cởi mở đón nh&amp;amp;acirc;̣n những giá trị mới. Não b&amp;amp;ocirc;̣ gi&amp;amp;ocirc;́ng như những cơ bắp khác trong cơ th&amp;amp;ecirc;̉, sẽ hoạt đ&amp;amp;ocirc;̣ng t&amp;amp;ocirc;́t hơn n&amp;amp;ecirc;́u luy&amp;amp;ecirc;̣n t&amp;amp;acirc;̣p thường xuy&amp;amp;ecirc;n. Khi học ngoại ngữ, trẻ phải li&amp;amp;ecirc;n tục ghi nhớ các quy tắc ngữ ph&amp;amp;aacute;p và từ vựng, giúp cơ não phát tri&amp;amp;ecirc;̉n.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;An San&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'17-9-201522-356087519-8294-1442475755.jpg', CAST(N'2015-09-23 21:02:46.000' AS DateTime), 4, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (11, N'Đề xuất quy trình tuyển sinh đại học nhanh gọn', N'Độc giả Nguyễn Đức Hạnh đã nghiên cứu kỹ kỳ thi THPT quốc gia 2015 và đề xuất một quy trình tuyển sinh hoàn thiện, từ khâu chuẩn bị, công bố điểm thi đến xét tuyển và xử lý kết quả xét tuyển.', N'&amp;lt;p&amp;gt;T&amp;amp;ocirc;i ủng hộ ho&amp;amp;agrave;n to&amp;amp;agrave;n việc gộp hai kỳ thi. Bộ Gi&amp;amp;aacute;o dục v&amp;amp;agrave; Đ&amp;amp;agrave;o tạo đ&amp;amp;atilde; c&amp;amp;oacute; khả năng tổ chức tốt một kỳ thi thống nhất tr&amp;amp;ecirc;n to&amp;amp;agrave;n quốc một c&amp;amp;aacute;ch nghi&amp;amp;ecirc;m t&amp;amp;uacute;c, nhưng việc x&amp;amp;eacute;t tuyển th&amp;amp;igrave; qu&amp;amp;aacute; dở.&amp;amp;nbsp;Nếu biết c&amp;amp;aacute;ch &amp;amp;aacute;p dụng c&amp;amp;ocirc;ng nghệ th&amp;amp;ocirc;ng tin v&amp;amp;agrave;o c&amp;amp;ocirc;ng t&amp;amp;aacute;c tuyển sinh th&amp;amp;igrave; kỳ tuyển sinh 2015 th&amp;amp;agrave;nh c&amp;amp;ocirc;ng tốt đẹp, để lại dấu ấn trong lịch sử gi&amp;amp;aacute;o dục Việt Nam.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Bộ Gi&amp;amp;aacute;o dục v&amp;amp;agrave; Đ&amp;amp;agrave;o tạo đ&amp;amp;atilde; tổ chức c&amp;amp;aacute;c hội thảo khoa học t&amp;amp;igrave;m phương &amp;amp;aacute;n cải tiến tuyển sinh, nhưng c&amp;amp;aacute;c phương &amp;amp;aacute;n đưa ra như &amp;amp;quot;d&amp;amp;ugrave;ng dao mổ tr&amp;amp;acirc;u m&amp;amp;agrave; đi mổ g&amp;amp;agrave;&amp;amp;quot;, cuối c&amp;amp;ugrave;ng con g&amp;amp;agrave; n&amp;amp;aacute;t.&amp;amp;nbsp;Bộ phận x&amp;amp;acirc;y dựng phần mềm kh&amp;amp;ocirc;ng c&amp;amp;oacute; kinh nghiệm về tuyển sinh, phần mềm kh&amp;amp;ocirc;ng được kiểm chứng v&amp;amp;agrave; điều chỉnh chu đ&amp;amp;aacute;o trước kỳ thi.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Việc đ&amp;amp;aacute;nh gi&amp;amp;aacute; th&amp;amp;iacute; sinh dựa v&amp;amp;agrave;o b&amp;amp;agrave;i thi kiểm tra kiến thức l&amp;amp;agrave; rất đ&amp;amp;uacute;ng. Nguyện vọng của c&amp;amp;aacute;c th&amp;amp;iacute; sinh n&amp;amp;ecirc;n coi trọng nhưng hợp l&amp;amp;yacute;, kh&amp;amp;ocirc;ng v&amp;amp;igrave; điểm số m&amp;amp;agrave; coi thường nguyện vọng của m&amp;amp;igrave;nh, v&amp;amp;agrave;o đại học bằng mọi c&amp;amp;aacute;ch, kh&amp;amp;ocirc;ng cần biết l&amp;amp;agrave; v&amp;amp;agrave;o trường n&amp;amp;agrave;o, v&amp;amp;agrave;o ng&amp;amp;agrave;nh n&amp;amp;agrave;o, c&amp;amp;oacute; ph&amp;amp;ugrave; hợp với bản th&amp;amp;acirc;n hay kh&amp;amp;ocirc;ng, l&amp;amp;agrave;m mất cơ hội cho c&amp;amp;aacute;c th&amp;amp;iacute; sinh kh&amp;amp;aacute;c. Điều n&amp;amp;agrave;y kh&amp;amp;ocirc;ng được đảm bảo trong kỳ x&amp;amp;eacute;t tuyển vừa qua.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Thật ra việc n&amp;amp;agrave;y theo t&amp;amp;ocirc;i kh&amp;amp;ocirc;ng phức tạp như vậy.&amp;amp;nbsp;Ti&amp;amp;ecirc;u ch&amp;amp;iacute; tuyển sinh n&amp;amp;ecirc;n l&amp;amp;agrave;:&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Đối với th&amp;amp;iacute; sinh: Giả sử trong n ng&amp;amp;agrave;nh th&amp;amp;iacute;ch m&amp;amp;agrave; th&amp;amp;iacute; sinh tr&amp;amp;uacute;ng tuyển m ng&amp;amp;agrave;nh th&amp;amp;igrave; tuyển v&amp;amp;agrave;o ng&amp;amp;agrave;nh th&amp;amp;iacute;ch nhất trong m ng&amp;amp;agrave;nh đ&amp;amp;oacute;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Đối với c&amp;amp;aacute;c ng&amp;amp;agrave;nh: Trong tất cả th&amp;amp;iacute; sinh th&amp;amp;iacute;ch v&amp;amp;agrave;o ng&amp;amp;agrave;nh m&amp;amp;igrave;nh nhất, tuyển hết từ cao xuống thấp, khi n&amp;amp;agrave;o đủ chỉ ti&amp;amp;ecirc;u hoặc kh&amp;amp;ocirc;ng c&amp;amp;ograve;n th&amp;amp;iacute; sinh đủ ti&amp;amp;ecirc;u chuẩn.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;TS Lương Ho&amp;amp;agrave;i Nam đề xuất thuật to&amp;amp;aacute;n tuyển sinh dựa tr&amp;amp;ecirc;n thuật to&amp;amp;aacute;n &amp;amp;quot;H&amp;amp;ocirc;n nh&amp;amp;acirc;n ổn định&amp;amp;quot; (Stable Marriage) do Gale v&amp;amp;agrave; Shapley (Mỹ) đưa ra v&amp;amp;agrave;o năm 1962. Nhưng t&amp;amp;ocirc;i c&amp;amp;oacute; thuật to&amp;amp;aacute;n m&amp;amp;agrave; t&amp;amp;ocirc;i nghĩ l&amp;amp;agrave; đơn giản hơn, sẽ tr&amp;amp;igrave;nh b&amp;amp;agrave;y dưới đ&amp;amp;acirc;y để mọi người đ&amp;amp;aacute;nh gi&amp;amp;aacute;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Trước kỳ thi THPT quốc gia được Bộ Gi&amp;amp;aacute;o dục v&amp;amp;agrave; Đ&amp;amp;agrave;o tạo tổ chức h&amp;amp;agrave;ng năm cần tiến h&amp;amp;agrave;nh những bước sau:&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;1. C&amp;amp;aacute;c ng&amp;amp;agrave;nh đưa ra y&amp;amp;ecirc;u cầu v&amp;amp;agrave; chỉ ti&amp;amp;ecirc;u của m&amp;amp;igrave;nh (tổ hợp x&amp;amp;eacute;t tuyển, năng khiếu, khống chế, ưu ti&amp;amp;ecirc;n, đặc c&amp;amp;aacute;ch, số lượng...) tr&amp;amp;ecirc;n phương tiện th&amp;amp;ocirc;ng tin đại ch&amp;amp;uacute;ng. Ng&amp;amp;agrave;nh n&amp;amp;agrave;o c&amp;amp;oacute; 2, 3 tổ hợp x&amp;amp;eacute;t tuyển th&amp;amp;igrave; ph&amp;amp;acirc;n ra 2, 3 ng&amp;amp;agrave;nh ri&amp;amp;ecirc;ng để cho dễ x&amp;amp;eacute;t tuyển. Sẽ c&amp;amp;oacute; khoảng 2.000 ng&amp;amp;agrave;nh v&amp;amp;agrave; 50 tổ hợp x&amp;amp;eacute;t tuyển.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;2. Tổ chức thi c&amp;amp;aacute;c m&amp;amp;ocirc;n năng khiếu, sơ tuyển... v&amp;amp;agrave; gửi kết quả cho c&amp;amp;aacute;c th&amp;amp;iacute; sinh dự thi cũng như c&amp;amp;aacute;c Sở Gi&amp;amp;aacute;o dục địa phương, sau đ&amp;amp;oacute; gửi l&amp;amp;ecirc;n Bộ Gi&amp;amp;aacute;o dục v&amp;amp;agrave; v&amp;amp;agrave;o bảng thống k&amp;amp;ecirc;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;3. Bộ Gi&amp;amp;aacute;o dục c&amp;amp;ocirc;ng bố điểm ưu ti&amp;amp;ecirc;n cho c&amp;amp;aacute;c th&amp;amp;iacute; sinh ch&amp;amp;iacute;nh s&amp;amp;aacute;ch v&amp;amp;agrave; khu vực. Theo t&amp;amp;ocirc;i chỉ n&amp;amp;ecirc;n cộng th&amp;amp;ecirc;m bốn mức: 0,25; 0,50; 0,75 v&amp;amp;agrave; cao nhất l&amp;amp;agrave; 1 điểm. C&amp;amp;aacute;c Sở Gi&amp;amp;aacute;o dục gửi l&amp;amp;ecirc;n Bộ v&amp;amp;agrave; v&amp;amp;agrave;o bảng thống k&amp;amp;ecirc;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;4. Bộ Gi&amp;amp;aacute;o dục c&amp;amp;ocirc;ng bố x&amp;amp;eacute;t đặc c&amp;amp;aacute;ch. C&amp;amp;aacute;c Sở Gi&amp;amp;aacute;o dục gửi l&amp;amp;ecirc;n Bộ v&amp;amp;agrave; v&amp;amp;agrave;o bảng thống k&amp;amp;ecirc;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;5. C&amp;amp;aacute;c Sở thống k&amp;amp;ecirc; điểm học bạ v&amp;amp;agrave; hạnh kiểm ba năm THPT v&amp;amp;agrave; gửi l&amp;amp;ecirc;n Bộ. Để ph&amp;amp;acirc;n biệt c&amp;amp;aacute;c th&amp;amp;iacute; sinh c&amp;amp;ugrave;ng điểm số, sẽ d&amp;amp;ugrave;ng điểm học bạ v&amp;amp;agrave; hạnh kiểm l&amp;amp;agrave;m chỉ số phụ.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;6. C&amp;amp;aacute;c th&amp;amp;iacute; sinh gửi số điện thoại v&amp;amp;agrave; E-Mail.&amp;lt;/p&amp;gt;
', 1, 1, N'2.2(2).jpg', CAST(N'2015-09-23 21:04:24.000' AS DateTime), 4, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (12, N'Lệ phí tuyển sinh', N'Bên dưới là thông tin chi tiết về lệ phí tuyển sinh', N'&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;I. Lệ ph&amp;amp;iacute; ban đầu&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ul&amp;gt;
	&amp;lt;li&amp;gt;Lệ ph&amp;amp;iacute; tham dự k&amp;amp;igrave; kiểm tra năng lực đầu v&amp;amp;agrave;o: 100.000 VNĐ&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Lệ ph&amp;amp;iacute; đăng k&amp;amp;yacute; nhập học: 2.000.000 VNĐ&amp;lt;/li&amp;gt;
&amp;lt;/ul&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;II. Học ph&amp;amp;iacute; v&amp;amp;agrave; c&amp;amp;aacute;c chi ph&amp;amp;iacute; li&amp;amp;ecirc;n quan:&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ul&amp;gt;
	&amp;lt;li&amp;gt;Học ph&amp;amp;iacute; lớp 10: 4.000.000VNĐ/th&amp;amp;aacute;ng&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Học ph&amp;amp;iacute; lớp 11: 5.000.000VNĐ/th&amp;amp;aacute;ng&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Học ph&amp;amp;iacute; lớp 12: 6.000.000VNĐ/th&amp;amp;aacute;ng&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Ph&amp;amp;iacute; hoạt động ngoại kh&amp;amp;oacute;a v&amp;amp;agrave; quản l&amp;amp;yacute; nội tr&amp;amp;uacute;: 1.500.000VNĐ/ th&amp;amp;aacute;ng&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Ph&amp;amp;iacute; ph&amp;amp;ograve;ng ở KTX: 900.000 VNĐ/th&amp;amp;aacute;ng (đ&amp;amp;atilde; bao gồm chi ph&amp;amp;iacute; điện, nước)&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Tiền ăn: 80.000 VNĐ/ng&amp;amp;agrave;y (3 bữa)&amp;lt;/li&amp;gt;
&amp;lt;/ul&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Lưu &amp;amp;yacute;:&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;ul&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c khoản ph&amp;amp;iacute; đ&amp;amp;oacute;ng theo học kỳ (5 th&amp;amp;aacute;ng/ học kỳ, một năm học c&amp;amp;oacute; 2 học kỳ), tiền ăn được hạch to&amp;amp;aacute;n ch&amp;amp;iacute;nh x&amp;amp;aacute;c v&amp;amp;agrave;o cuối học kỳ theo bữa ăn thực tế của học sinh.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c khoản ph&amp;amp;iacute; tr&amp;amp;ecirc;n đ&amp;amp;acirc;y đ&amp;amp;atilde; bao gồm to&amp;amp;agrave;n bộ c&amp;amp;aacute;c chi ph&amp;amp;iacute; li&amp;amp;ecirc;n quan đến qu&amp;amp;aacute; tr&amp;amp;igrave;nh học tập bắt buộc (bao gồm ch&amp;amp;iacute;nh kh&amp;amp;oacute;a, học bổ trợ v&amp;amp;agrave; n&amp;amp;acirc;ng cao c&amp;amp;aacute;c m&amp;amp;ocirc;n văn h&amp;amp;oacute;a, tiếng Anh v&amp;amp;agrave; CNTT, c&amp;amp;aacute;c hoạt động ngoại kh&amp;amp;oacute;a, hướng nghiệp, c&amp;amp;aacute;c lớp học nghệ thuật, thể thao, &amp;amp;hellip;), kh&amp;amp;ocirc;ng bao gồm c&amp;amp;aacute;c kh&amp;amp;oacute;a học n&amp;amp;acirc;ng cao t&amp;amp;ugrave;y chọn theo nhu cầu học sinh du học như luyện thi SAT, TOEFL, IELTS&amp;amp;hellip;&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c khoản ph&amp;amp;iacute; tr&amp;amp;ecirc;n đ&amp;amp;acirc;y kh&amp;amp;ocirc;ng bao gồm chi ph&amp;amp;iacute; bảo hiểm y tế, s&amp;amp;aacute;ch gi&amp;amp;aacute;o khoa. C&amp;amp;aacute;c chi ph&amp;amp;iacute; n&amp;amp;agrave;y thực hiện theo đ&amp;amp;uacute;ng quy định nh&amp;amp;agrave; nước.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;C&amp;amp;aacute;c khoản ph&amp;amp;iacute; tr&amp;amp;ecirc;n đ&amp;amp;acirc;y cũng kh&amp;amp;ocirc;ng bao gồm c&amp;amp;aacute;c chi ph&amp;amp;iacute; vật dụng c&amp;amp;aacute; nh&amp;amp;acirc;n như đồng phục, v&amp;amp;otilde; phục gi&amp;amp;aacute;o dục thể chất, xe đưa đ&amp;amp;oacute;n cuối tuần. C&amp;amp;aacute;c chi ph&amp;amp;iacute; n&amp;amp;agrave;y được t&amp;amp;iacute;nh đ&amp;amp;uacute;ng theo gi&amp;amp;aacute; của nh&amp;amp;agrave; cung cấp l&amp;amp;agrave; b&amp;amp;ecirc;n thứ ba v&amp;amp;agrave; đ&amp;amp;atilde; được THPT FPT lựa chọn tối ưu nhất.&amp;lt;/li&amp;gt;
	&amp;lt;li&amp;gt;Học ph&amp;amp;iacute; c&amp;amp;oacute; thể được điều chỉnh h&amp;amp;agrave;ng năm kh&amp;amp;ocirc;ng qu&amp;amp;aacute; 10%, số lần nộp học ph&amp;amp;iacute; to&amp;amp;agrave;n kho&amp;amp;aacute; học kh&amp;amp;ocirc;ng thay đổi.&amp;lt;/li&amp;gt;
&amp;lt;/ul&amp;gt;
', 0, 1, N'11.jpg', CAST(N'2015-09-23 21:09:59.687' AS DateTime), 7, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (13, N'LỄ KHAI GIẢNG NĂM HỌC 2015-2016', N'Sáng ngày 5-9-2015, cùng với nhiều trường học ở khắp các địa phương trong cả nước, trường THPT Phan Châu Trinh – Đà Nẵng tổ chức lễ khai giảng năm học 2015-2016. Đại biểu đến dự lễ khai giảng của trường THPT Phan Châu Trinh: Ông Phùng Tấn Viết – Phó Chủ tịch UBND thành phố Đà Nẵng; bà Lê Thị Thanh M', N'&amp;lt;p&amp;gt;Chương tr&amp;amp;igrave;nh lễ khai giảng bao gồm c&amp;amp;aacute;c nội dung chủ yếu sau: Đ&amp;amp;oacute;n học sinh khối lớp 10 mới v&amp;amp;agrave;o trường; đọc thư của Chủ tịch nước gửi CB-GV-NV v&amp;amp;agrave; c&amp;amp;aacute;c em học sinh nh&amp;amp;acirc;n ng&amp;amp;agrave;y khai giảng; Diễn văn khai giảng năm học mới; Đ&amp;amp;aacute;nh trống khai trường&amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Trong diễn văn khai giảng năm học mới, &amp;amp;ocirc;ng Trần Văn Quang &amp;amp;ndash; Hiệu trưởng, đ&amp;amp;atilde; tổng kết một c&amp;amp;aacute;ch ngắn gọn v&amp;amp;agrave; s&amp;amp;uacute;c t&amp;amp;iacute;ch về c&amp;amp;aacute;c th&amp;amp;agrave;nh t&amp;amp;iacute;ch đạt được trong năm học 2014-2015, x&amp;amp;aacute;c định phương hướng phấn đấu mới của to&amp;amp;agrave;n trường trong năm học 2015-2016.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;ldquo;C&amp;amp;aacute;c hoạt động gi&amp;amp;aacute;o dục trong năm học qua đ&amp;amp;atilde; được đầu tư một c&amp;amp;aacute;ch to&amp;amp;agrave;n diện, hiệu quả gi&amp;amp;aacute;o dục được n&amp;amp;acirc;ng l&amp;amp;ecirc;n đ&amp;amp;aacute;ng kể, tiếp tục khẳng định truyền thống dạy tốt, học tốt của nh&amp;amp;agrave; trường. Cụ thể, tỷ lệ học sinh kh&amp;amp;aacute; giỏi đạt 93,68%, tỷ lệ đậu tốt nghiệp THPT đạt 99,86%, c&amp;amp;oacute; 01 HS đạt giải ba học sinh giỏi cấp quốc gia, 09 học sinh đạt giải trong k&amp;amp;igrave; thi Olympic 30/4 lần thứ XXI, 111 học sinh đạt giải học sinh giỏi lớp 12 cấp th&amp;amp;agrave;nh phố. Trong kỳ thi Đại học vừa qua, c&amp;amp;oacute; 97,21%, đạt 15 điểm trở l&amp;amp;ecirc;n của tổ hợp m&amp;amp;ocirc;n x&amp;amp;eacute;t tuyển ĐH, nếu t&amp;amp;iacute;nh 20 điểm trở l&amp;amp;ecirc;n th&amp;amp;igrave; đạt 71,99%, c&amp;amp;oacute; 01 HS Trần Ngọc Phước lớp 12/27 c&amp;amp;oacute; điểm thi đại học cao nhất th&amp;amp;agrave;nh phố 28,5đ.&amp;amp;rdquo;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;ldquo;Ngo&amp;amp;agrave;i ra học sinh c&amp;amp;ograve;n đạt nhiều giải cao ở cấp quốc gia, th&amp;amp;agrave;nh phố trong c&amp;amp;aacute;c cuộc thi giải To&amp;amp;aacute;n v&amp;amp;agrave; tiếng Anh qua Internet, s&amp;amp;aacute;ng tạo khoa học, an to&amp;amp;agrave;n giao th&amp;amp;ocirc;ng, Tin học trẻ kh&amp;amp;ocirc;ng chuy&amp;amp;ecirc;n, m&amp;amp;aacute;y t&amp;amp;iacute;nh cầm tay, thể dục thể thao, văn nghệ...&amp;amp;rdquo;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;ldquo;Bước v&amp;amp;agrave;o năm học 2015 - 2016, năm học tiếp tục thực hiện Nghị quyết số 29 của Hội nghị BCHTW 8 (kh&amp;amp;oacute;a XI): &amp;amp;ldquo;Về đổi mới căn bản, to&amp;amp;agrave;n diện gi&amp;amp;aacute;o dục v&amp;amp;agrave; đ&amp;amp;agrave;o tạo&amp;amp;rdquo;, ch&amp;amp;uacute;ng ta cần tiếp tục ph&amp;amp;aacute;t huy những th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong năm học qua, tập trung cho việc đổi mới c&amp;amp;ocirc;ng t&amp;amp;aacute;c quản l&amp;amp;yacute;, ph&amp;amp;aacute;t triển đội ngũ nh&amp;amp;agrave; gi&amp;amp;aacute;o, n&amp;amp;acirc;ng cao hiệu quả ph&amp;amp;aacute;t triển chương tr&amp;amp;igrave;nh nh&amp;amp;agrave; trường, tăng cường đổi mới phương ph&amp;amp;aacute;p dạy học đồng bộ với kiểm tra, đ&amp;amp;aacute;nh gi&amp;amp;aacute; theo định hướng ph&amp;amp;aacute;t triển phẩm chất, năng lực học sinh.&amp;amp;rdquo;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;ldquo;Để thực hiện tốt c&amp;amp;aacute;c nhiệm vụ tr&amp;amp;ecirc;n, ch&amp;amp;uacute;ng ta phải tập trung cải tiến c&amp;amp;ocirc;ng t&amp;amp;aacute;c quản l&amp;amp;yacute; theo hướng tự chủ, tự chịu tr&amp;amp;aacute;ch nhiệm, đề ra những giải ph&amp;amp;aacute;p cụ thể ph&amp;amp;ugrave; hợp với điều kiện thực tiễn v&amp;amp;agrave; y&amp;amp;ecirc;u cầu ph&amp;amp;aacute;t triển của nh&amp;amp;agrave; trường nhằm n&amp;amp;acirc;ng cao hiệu lực, hiệu quả c&amp;amp;ocirc;ng t&amp;amp;aacute;c quản l&amp;amp;yacute;. Kết hợp chặt chẽ giữa nh&amp;amp;agrave; trường, gia đ&amp;amp;igrave;nh v&amp;amp;agrave; x&amp;amp;atilde; hội trong việc gi&amp;amp;aacute;o dục to&amp;amp;agrave;n diện cho học sinh. Tạo điều kiện thuận lợi cho học sinh tham gia c&amp;amp;aacute;c chương tr&amp;amp;igrave;nh giao lưu văn h&amp;amp;oacute;a, tiếp cận c&amp;amp;aacute;c h&amp;amp;igrave;nh thức du học với c&amp;amp;aacute;c nước trong khu vực v&amp;amp;agrave; tr&amp;amp;ecirc;n thế giới. Gắn cuộc vận động &amp;amp;ldquo;Học tập v&amp;amp;agrave; l&amp;amp;agrave;m theo tấm gương đạo đức Hồ Ch&amp;amp;iacute; Minh&amp;amp;rdquo; với cuộc vận động &amp;amp;ldquo;Hai kh&amp;amp;ocirc;ng&amp;amp;rdquo; v&amp;amp;agrave;o c&amp;amp;ocirc;ng t&amp;amp;aacute;c gi&amp;amp;aacute;o dục đạo đức v&amp;amp;agrave; r&amp;amp;egrave;n luyện &amp;amp;yacute; thức học tập cho học sinh, tạo chuyển biến mạnh mẽ trong việc n&amp;amp;acirc;ng cao chất lượng dạy v&amp;amp;agrave; học.&amp;amp;rdquo; &amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Tiếp theo sau diễn văn của Hiệu trưởng, &amp;amp;ocirc;ng Ph&amp;amp;ugrave;ng Tấn Viết &amp;amp;ndash; Ph&amp;amp;oacute; Chủ tịch UBND th&amp;amp;agrave;nh phố Đ&amp;amp;agrave; Nẵng đ&amp;amp;aacute;nh trống, ch&amp;amp;iacute;nh thức khai giảng năm học mới.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Kết th&amp;amp;uacute;c chương tr&amp;amp;igrave;nh l&amp;amp;agrave; c&amp;amp;aacute;c tiết mục văn nghệ ch&amp;amp;agrave;o mừng năm học mới của c&amp;amp;aacute;c em học sinh trong Ban văn nghệ nh&amp;amp;agrave; trường.&amp;lt;/p&amp;gt;
', 1, 1, N'kg1.png', CAST(N'2015-09-23 21:15:48.910' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (14, N'Phát học bổng cho học sinh trong lễ kỷ niệm 31 năm ngày Nhà giáo Việt Nam', N'Trong những năm qua, rất nhiều tổ chức, cơ quan, đơn vị và các cá nhân, nhất là các CHS PCT đã tài trợ học bổng cho các em HS PCT có hoàn cảnh gia đình khó khăn nhưng luôn cố gắng vươn lên trong học tập và rèn luyện đạo đức, tác phong, trở thành những tấm gương về tinh thần vượt khó.', N'&amp;lt;p&amp;gt;Trong những năm qua, rất nhiều tổ chức, cơ quan, đơn vị v&amp;amp;agrave; c&amp;amp;aacute;c c&amp;amp;aacute; nh&amp;amp;acirc;n, nhất l&amp;amp;agrave; c&amp;amp;aacute;c CHS PCT đ&amp;amp;atilde; t&amp;amp;agrave;i trợ học bổng cho c&amp;amp;aacute;c em HS PCT c&amp;amp;oacute; ho&amp;amp;agrave;n cảnh gia đ&amp;amp;igrave;nh kh&amp;amp;oacute; khăn nhưng lu&amp;amp;ocirc;n cố gắng vươn l&amp;amp;ecirc;n trong học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện đạo đức, t&amp;amp;aacute;c phong, trở th&amp;amp;agrave;nh những tấm gương về tinh thần vượt kh&amp;amp;oacute;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;Trong Lễ kỉ niệm 31 năm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o VN được tổ chức tại trường s&amp;amp;aacute;ng ng&amp;amp;agrave;y 20 th&amp;amp;aacute;ng 11 năm 2013, 44 học sinh đ&amp;amp;atilde; được nhận c&amp;amp;aacute;c suất học bổng của Quỹ học bổng Phan Ch&amp;amp;acirc;u Trinh (thuộc Trung ương Hội LHTN Việt Nam tại TP Hồ Ch&amp;amp;iacute; Minh), Ng&amp;amp;acirc;n h&amp;amp;agrave;ng ACB, tập thể CHS lớp 12/8 (Kh&amp;amp;oacute;a 2000 - 2003) v&amp;amp;agrave; gia đ&amp;amp;igrave;nh CHS L&amp;amp;ecirc; Văn Ho&amp;amp;agrave;ng với tổng gi&amp;amp;aacute; trị tiền l&amp;amp;agrave; 44 triệu đồng.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;Tr&amp;amp;acirc;n trọng cảm ơn tấm l&amp;amp;ograve;ng, t&amp;amp;igrave;nh cảm, sự quan t&amp;amp;acirc;m, động vi&amp;amp;ecirc;n, gi&amp;amp;uacute;p đỡ của tổ chức, cơ quan, đơn vị v&amp;amp;agrave; c&amp;amp;aacute;c c&amp;amp;aacute; nh&amp;amp;acirc;n đ&amp;amp;atilde; t&amp;amp;agrave;i trợ học bổng cho c&amp;amp;aacute;c em học sinh Phan Ch&amp;amp;acirc;u Trinh.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;Mong rằng c&amp;amp;aacute;c em học sinh được nhận học bổng đợt n&amp;amp;agrave;y sẽ tiếp tục phấn đấu học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện tốt, xứng đ&amp;amp;aacute;ng với sự quan t&amp;amp;acirc;m, chăm lo hết l&amp;amp;ograve;ng của gia đ&amp;amp;igrave;nh, nh&amp;amp;agrave; trường v&amp;amp;agrave; x&amp;amp;atilde; hội đối với c&amp;amp;aacute;c em để g&amp;amp;oacute;p phần giữ g&amp;amp;igrave;n, ph&amp;amp;aacute;t huy những truyền thống đ&amp;amp;aacute;ng tự h&amp;amp;agrave;o của học sinh Phan Ch&amp;amp;acirc;u Trinh.&amp;lt;/p&amp;gt;
', 1, 1, N'20_11_02.jpg', CAST(N'2015-09-23 21:17:42.587' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (15, N'Lễ phát động “Năm an toàn giao thông 2014”', N'THưởng ứng thực hiện “Năm an toàn giao thông 2012”, trường THPT Phan Châu Trinh đã có những hoạt động ý nghĩa tuyên truyền, giáo dục trong học sinh thực hiện các quy định về trật tự an toàn giao thông.', N'&amp;lt;p&amp;gt;Trong những năm qua, rất nhiều tổ chức, cơ quan, đơn vị v&amp;amp;agrave; c&amp;amp;aacute;c c&amp;amp;aacute; nh&amp;amp;acirc;n, nhất l&amp;amp;agrave; c&amp;amp;aacute;c CHS PCT đ&amp;amp;atilde; t&amp;amp;agrave;i trợ học bổng cho c&amp;amp;aacute;c em HS PCT c&amp;amp;oacute; ho&amp;amp;agrave;n cảnh gia đ&amp;amp;igrave;nh kh&amp;amp;oacute; khăn nhưng lu&amp;amp;ocirc;n cố gắng vươn l&amp;amp;ecirc;n trong học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện đạo đức, t&amp;amp;aacute;c phong, trở th&amp;amp;agrave;nh những tấm gương về tinh thần vượt kh&amp;amp;oacute;.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;Trong Lễ kỉ niệm 31 năm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o VN được tổ chức tại trường s&amp;amp;aacute;ng ng&amp;amp;agrave;y 20 th&amp;amp;aacute;ng 11 năm 2013, 44 học sinh đ&amp;amp;atilde; được nhận c&amp;amp;aacute;c suất học bổng của Quỹ học bổng Phan Ch&amp;amp;acirc;u Trinh (thuộc Trung ương Hội LHTN Việt Nam tại TP Hồ Ch&amp;amp;iacute; Minh), Ng&amp;amp;acirc;n h&amp;amp;agrave;ng ACB, tập thể CHS lớp 12/8 (Kh&amp;amp;oacute;a 2000 - 2003) v&amp;amp;agrave; gia đ&amp;amp;igrave;nh CHS L&amp;amp;ecirc; Văn Ho&amp;amp;agrave;ng với tổng gi&amp;amp;aacute; trị tiền l&amp;amp;agrave; 44 triệu đồng.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;Tr&amp;amp;acirc;n trọng cảm ơn tấm l&amp;amp;ograve;ng, t&amp;amp;igrave;nh cảm, sự quan t&amp;amp;acirc;m, động vi&amp;amp;ecirc;n, gi&amp;amp;uacute;p đỡ của tổ chức, cơ quan, đơn vị v&amp;amp;agrave; c&amp;amp;aacute;c c&amp;amp;aacute; nh&amp;amp;acirc;n đ&amp;amp;atilde; t&amp;amp;agrave;i trợ học bổng cho c&amp;amp;aacute;c em học sinh Phan Ch&amp;amp;acirc;u Trinh.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;Mong rằng c&amp;amp;aacute;c em học sinh được nhận học bổng đợt n&amp;amp;agrave;y sẽ tiếp tục phấn đấu học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện tốt, xứng đ&amp;amp;aacute;ng với sự quan t&amp;amp;acirc;m, chăm lo hết l&amp;amp;ograve;ng của gia đ&amp;amp;igrave;nh, nh&amp;amp;agrave; trường v&amp;amp;agrave; x&amp;amp;atilde; hội đối với c&amp;amp;aacute;c em để g&amp;amp;oacute;p phần giữ g&amp;amp;igrave;n, ph&amp;amp;aacute;t huy những truyền thống đ&amp;amp;aacute;ng tự h&amp;amp;agrave;o của học sinh Phan Ch&amp;amp;acirc;u Trinh.&amp;lt;/p&amp;gt;
', 1, 1, N'an-toan-giao-thong-dip-nghi-le.jpg', CAST(N'2015-09-23 21:21:16.263' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (16, N'"Ngày hội văn hóa dân gian" lần thứ III của trường', N'Nhằm thực hiện Chỉ thị số 40/2008/CT-BGD&ĐT ngày 22/08/2008 của Bộ Giáo dục và Đào tạo về phong trào thi đua: “Xây dựng trường học thân thiện, học sinh tích cực”, ngày 12/01/2011 trường THPT Phan Châu Trinh đã tổ chức “Ngày hội văn hóa dân gian” lần thứ III với sự tham gia của thầy cô và học sinh to', N'&amp;lt;p&amp;gt;Ng&amp;amp;agrave;y hội văn h&amp;amp;oacute;a với nội dung phong ph&amp;amp;uacute;, mang đậm t&amp;amp;iacute;nh d&amp;amp;acirc;n gian:&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;-&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;26 gian h&amp;amp;agrave;ng ẩm thực v&amp;amp;agrave; c&amp;amp;aacute;c sản phẩm d&amp;amp;acirc;n gian, gian h&amp;amp;agrave;ng b&amp;amp;agrave;i ch&amp;amp;ograve;i, gian h&amp;amp;agrave;ng g&amp;amp;acirc;y quỹ từ thiện.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;-&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;C&amp;amp;aacute;c tr&amp;amp;ograve; chơi d&amp;amp;acirc;n gian: nhảy sạp, n&amp;amp;eacute;m c&amp;amp;ograve;n, nhảy d&amp;amp;acirc;y, bịt mắt bắt vịt.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;-&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;Biểu diễn văn nghệ d&amp;amp;acirc;n gian.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;-&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;C&amp;amp;aacute;c cuộc thi:&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;+ L&amp;amp;agrave;m t&amp;amp;ograve; he, nấu ch&amp;amp;egrave;, nấu x&amp;amp;ocirc;i, l&amp;amp;agrave;m mứt&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;+ L&amp;amp;agrave;m tranh d&amp;amp;acirc;n gian, nhảy d&amp;amp;acirc;y&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;+ Thiết kế &amp;amp;aacute;o d&amp;amp;agrave;i hoa&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;+ Nấu b&amp;amp;aacute;nh chưng, b&amp;amp;aacute;nh t&amp;amp;eacute;t&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;Việc tổ chức &amp;amp;ldquo;Ng&amp;amp;agrave;y hội văn h&amp;amp;oacute;a d&amp;amp;acirc;n gian&amp;amp;rdquo; hằng năm đ&amp;amp;atilde; trở th&amp;amp;agrave;nh n&amp;amp;eacute;t đẹp văn h&amp;amp;oacute;a truyền thống của nh&amp;amp;agrave; trường. Ng&amp;amp;agrave;y hội văn h&amp;amp;oacute;a d&amp;amp;acirc;n gian l&amp;amp;agrave; dịp để thầy v&amp;amp;agrave; tr&amp;amp;ograve; &amp;amp;ocirc;n lại những truyền thống văn h&amp;amp;oacute;a d&amp;amp;acirc;n tộc. Th&amp;amp;ocirc;ng qua c&amp;amp;aacute;c hoạt động n&amp;amp;agrave;y, c&amp;amp;aacute;c em học sinh c&amp;amp;oacute; cơ hội học hỏi, trao đổi v&amp;amp;agrave; tăng th&amp;amp;ecirc;m hiểu biết về những gi&amp;amp;aacute; trị văn h&amp;amp;oacute;a, những&amp;amp;nbsp;&amp;amp;nbsp;n&amp;amp;eacute;t đẹp truyền thống của d&amp;amp;acirc;n tộc. Đ&amp;amp;acirc;y l&amp;amp;agrave; dịp tạo cho c&amp;amp;aacute;c em c&amp;amp;oacute; s&amp;amp;acirc;n chơi bổ &amp;amp;iacute;ch, l&amp;amp;agrave;nh mạnh, giao lưu, hợp t&amp;amp;aacute;c v&amp;amp;agrave; x&amp;amp;acirc;y dựng mối quan hệ th&amp;amp;acirc;n t&amp;amp;igrave;nh giữa c&amp;amp;aacute;c th&amp;amp;agrave;nh vi&amp;amp;ecirc;n trong nh&amp;amp;agrave; trường.&amp;lt;/p&amp;gt;
', 1, 1, N'2901SD1.png', CAST(N'2015-09-23 21:26:09.570' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (17, N'Mời họp mặt Thầy Cô giáo và các thế hệ học sinh', N'Thông báo mới họp mặt', N'&amp;lt;p&amp;gt;S&amp;amp;aacute;ng ng&amp;amp;agrave;y 5-9-2015, c&amp;amp;ugrave;ng với nhiều trường học ở khắp c&amp;amp;aacute;c địa phương trong cả nước, trường THPT Phan Ch&amp;amp;acirc;u Trinh &amp;amp;ndash; Đ&amp;amp;agrave; Nẵng tổ chức lễ khai giảng năm học 2015-2016. Đại biểu đến dự lễ khai giảng của trường THPT Phan Ch&amp;amp;acirc;u Trinh: &amp;amp;Ocirc;ng Ph&amp;amp;ugrave;ng Tấn Viết &amp;amp;ndash; Ph&amp;amp;oacute; Chủ tịch UBND th&amp;amp;agrave;nh phố Đ&amp;amp;agrave; Nẵng; b&amp;amp;agrave; L&amp;amp;ecirc; Thị Thanh Minh &amp;amp;ndash; Quận ủy vi&amp;amp;ecirc;n, Ph&amp;amp;oacute; Ban tổ chức Quận ủy quận Hải Ch&amp;amp;acirc;u v&amp;amp;agrave; c&amp;amp;aacute;c vị đại diện Cha mẹ học sinh, Hội cựu gi&amp;amp;aacute;o chức, Ban li&amp;amp;ecirc;n lạc cựu học sinh, Hội khuyến học&amp;amp;hellip;&amp;lt;/p&amp;gt;
', 0, 1, N'thumoikhoacntt2.gif', CAST(N'2015-09-23 21:31:12.690' AS DateTime), 5, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (18, N'Đại hội lần thứ nhất Hội Khuyến học', N'Ngay từ đầu năm học 2013-2014 nhà trường đã phối hợp với đại diện cha mẹ học sinh, cựu học sinh và nhiều nhà hảo tâm thành lập BCH lâm thời Hội Khuyến học để vận động nhiều lực lượng xã hội tham gia công tác khuyến học với nhiều hình thức khác nhau. Bước sang năm học 2014-2015, trường THPT Phan Châu', N'&amp;lt;p&amp;gt;Ngay từ đầu năm học 2013-2014 nh&amp;amp;agrave; trường đ&amp;amp;atilde; phối hợp với đại diện cha mẹ học sinh, cựu học sinh v&amp;amp;agrave; nhiều nh&amp;amp;agrave; hảo t&amp;amp;acirc;m th&amp;amp;agrave;nh lập BCH l&amp;amp;acirc;m thời Hội Khuyến học để vận động nhiều lực lượng x&amp;amp;atilde; hội tham gia c&amp;amp;ocirc;ng t&amp;amp;aacute;c khuyến học với nhiều h&amp;amp;igrave;nh thức kh&amp;amp;aacute;c nhau. Bước sang năm học 2014-2015, trường THPT Phan Ch&amp;amp;acirc;u Trinh đ&amp;amp;atilde; x&amp;amp;uacute;c tiến việc th&amp;amp;agrave;nh lập Hội Khuyến học, hoạt động theo điều lệ của Hội Khuyến học Việt Nam dưới sự chỉ đạo của Hội Khuyến học th&amp;amp;agrave;nh phố.&amp;lt;/p&amp;gt;
', 0, 1, N'HKH1.jpg', CAST(N'2015-09-23 21:32:47.107' AS DateTime), 5, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (19, N'Mit-tinh hưởng ứng tháng "An toàn giao thông" (tháng 9 - 2014)', N'Nhằm tích cực hưởng ứng Tháng ATGT (tháng 9 năm 2014) và thực hiện Kế hoạch công tác đảm bảo TTATGT của nhà trường (Năm học 2014 – 2015), trong giờ chào cờ sáng – chiều thứ Hai, ngày 08 tháng 9 năm 2014 vừa qua, Ban HĐNGLL phối với BCH Đoàn trường và Chi đoàn giáo viên tổ chức Mit-tinh và ngoại khóa', N'&amp;lt;p&amp;gt;Sau b&amp;amp;agrave;i ph&amp;amp;aacute;t biểu của đại diện BGH nh&amp;amp;agrave; trường n&amp;amp;ecirc;u l&amp;amp;ecirc;n tầm quan trọng của việc thực hiện TTATGT, điểm lại c&amp;amp;aacute;c hoạt động tuy&amp;amp;ecirc;n truyền, gi&amp;amp;aacute;o dục về TTATGT m&amp;amp;agrave; thầy tr&amp;amp;ograve; nh&amp;amp;agrave; trường đ&amp;amp;atilde; thực hiện trong thời gian qua cũng như triển khai những hoạt động trong thời gian sắp tới, c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o trong Chi đo&amp;amp;agrave;n GV đ&amp;amp;atilde; tổ chức thi đố vui t&amp;amp;igrave;m hiểu c&amp;amp;aacute;c kiến thức về ATGT. Hầu hết c&amp;amp;aacute;c c&amp;amp;acirc;u hỏi đều xoay quanh những vấn đề cụ thể, thiết thực khi tham gia giao th&amp;amp;ocirc;ng của c&amp;amp;aacute;c bạn HS n&amp;amp;ecirc;n được HS s&amp;amp;ocirc;i nổi hưởng ứng, trả lời rất chất lượng.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;Trong buổi mit-tinh, nh&amp;amp;agrave; trường đ&amp;amp;atilde; th&amp;amp;ocirc;ng b&amp;amp;aacute;o kết quả tham gia cuộc thi &amp;amp;ldquo;An to&amp;amp;agrave;n giao th&amp;amp;ocirc;ng cho nụ cười ng&amp;amp;agrave;y mai&amp;amp;rdquo; năm 2014 do Bộ GD&amp;amp;amp;ĐT phối hợp với UB ATGT quốc gia v&amp;amp;agrave; C.ty Honda Việt Nam tổ chức v&amp;amp;agrave; trao phần thưởng của BTC cuộc thi cho GV v&amp;amp;agrave; HS đạt giải Khuyến kh&amp;amp;iacute;ch cấp quốc gia. Tham gia cuộc thi n&amp;amp;agrave;y, trường THPT Phan Ch&amp;amp;acirc;u Trinh đ&amp;amp;atilde; vinh dự c&amp;amp;oacute; 01 HS l&amp;amp;agrave; em&amp;amp;nbsp;&amp;lt;strong&amp;gt;Văn Thị L&amp;amp;ecirc; Đ&amp;amp;agrave;o&amp;lt;/strong&amp;gt;&amp;amp;nbsp;(HS lớp 10/12, năm nay l&amp;amp;agrave; HS 11/12) đạt giải Nhất cuộc thi cấp quốc gia. Em L&amp;amp;ecirc; Đ&amp;amp;agrave;o đ&amp;amp;atilde; vinh dự được nhận thưởng trong Lễ tổng kết cuộc thi tổ chức tại TP Huế cuối th&amp;amp;aacute;ng 5 năm 2014 vừa qua. Ngo&amp;amp;agrave;i ra c&amp;amp;oacute; 01 GV v&amp;amp;agrave; 03 HS của trường đạt giải Khuyến kh&amp;amp;iacute;ch cấp quốc gia: Đ&amp;amp;oacute; l&amp;amp;agrave; c&amp;amp;ocirc;&amp;amp;nbsp;&amp;lt;strong&amp;gt;Nguyễn Thị Phương Lệ&amp;lt;/strong&amp;gt;&amp;amp;nbsp;(GV tổ GDCD), HS&amp;amp;nbsp;&amp;lt;strong&amp;gt;Đ&amp;amp;agrave;m Long Vĩnh Lộc&amp;amp;nbsp;&amp;lt;/strong&amp;gt;(lớp 10/7, năm nay l&amp;amp;agrave; 11/7), HS&amp;amp;nbsp;&amp;lt;strong&amp;gt;L&amp;amp;ecirc; Thị Phương Thảo&amp;lt;/strong&amp;gt;&amp;amp;nbsp;(lớp 11/1, năm nay l&amp;amp;agrave; 12/1) v&amp;amp;agrave; HS&amp;amp;nbsp;&amp;lt;strong&amp;gt;Hứa Thị &amp;amp;Aacute;nh Nguyệt&amp;lt;/strong&amp;gt;&amp;amp;nbsp;(lớp 11/30, năm nay l&amp;amp;agrave; 12/30).&amp;lt;/p&amp;gt;
', 0, 1, N'ATGT_04.jpg', CAST(N'2015-09-23 21:34:21.513' AS DateTime), 5, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (20, N'Thời khóa biểu áp dụng từ ngày 14/09/2015', N'Thời khóa biểu áp dụng từ ngày 14/09/2015', N'&amp;lt;p&amp;gt;Tải về:&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://www.pct.edu.vn/files/TKB/_TKBChung_140915.xls&amp;quot;&amp;gt;http://www.pct.edu.vn/files/TKB/_TKBChung_140915.xls&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'Lesson_timetable.jpg', CAST(N'2015-09-23 21:38:11.150' AS DateTime), 6, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (21, N'Thông báo nghỉ học (14/9/2015)', N'Thông báo nghỉ học (14/9/2015)', N'&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;- Chiều nay (14/9/2015) học sinh to&amp;amp;agrave;n trường nghỉ học do bảo số 3. Hiệu trưởng&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'1437553840_thongbao.jpg', CAST(N'2015-09-23 21:40:59.783' AS DateTime), 6, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (22, N'Thông báo đầu năm học 2015 - 2016', N'Thông báo đầu năm học 2015 - 2016', N'&amp;lt;p&amp;gt;Tải về:&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://www.pct.edu.vn/files/tintuc/2015-2016/Thongbao_170815-3.doc&amp;quot;&amp;gt;http://www.pct.edu.vn/files/tintuc/2015-2016/Thongbao_170815-3.doc&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'1437553840_thongbao.jpg', CAST(N'2015-09-23 21:41:58.913' AS DateTime), 6, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (23, N'Lịch tập trung các khối năm học 2015 -2016', N'Lịch tập trung các khối năm học 2015 -2016', N'&amp;lt;table border=&amp;quot;1&amp;quot; cellpadding=&amp;quot;0&amp;quot; cellspacing=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thời gian&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Khối lớp&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Địa điểm&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Nội dung c&amp;amp;ocirc;ng việc&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Ghi ch&amp;amp;uacute;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;8 g 00&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;(10/8/2015)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;br /&amp;gt;
			Khối&amp;amp;nbsp;&amp;lt;strong&amp;gt;10&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;-&amp;amp;nbsp;&amp;lt;strong&amp;gt;8g00 đến 8g45&amp;lt;/strong&amp;gt;: HS tập trung tại s&amp;amp;acirc;n trường (Theo sơ đồ ph&amp;amp;acirc;n c&amp;amp;ocirc;ng).&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;-&amp;amp;nbsp;&amp;lt;strong&amp;gt;9g00 đến 10g30&amp;lt;/strong&amp;gt;: Tập trung tại ph&amp;amp;ograve;ng học (Theo sơ đồ ph&amp;amp;ograve;ng học ph&amp;amp;acirc;n c&amp;amp;ocirc;ng).&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;- BGH phổ biến v&amp;amp;agrave; qu&amp;amp;aacute;n triệt nội quy v&amp;amp;agrave; kế hoạch đầu năm học.&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;- GVCN l&amp;amp;agrave;m c&amp;amp;ocirc;ng t&amp;amp;aacute;c tổ chức lớp đầu năm (Theo nội dung BGH phổ biến &amp;amp;ndash; nhận tại c&amp;amp;ocirc; Nga - PHT).&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;- HS mặc đồng phục thể dục.&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;- GVCN nhận danh s&amp;amp;aacute;ch lớp tại thầy Hưng &amp;amp;ndash; PHT.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;8 g 00&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;(11/8/2015)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;br /&amp;gt;
			Khối&amp;amp;nbsp;&amp;lt;strong&amp;gt;11&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Ph&amp;amp;ograve;ng học theo sơ đồ ph&amp;amp;acirc;n c&amp;amp;ocirc;ng.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;GVCN l&amp;amp;agrave;m c&amp;amp;ocirc;ng t&amp;amp;aacute;c tổ chức lớp đầu năm (Theo nội dung BGH phổ biến &amp;amp;ndash; nhận tại c&amp;amp;ocirc; Nga).&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;GVCN nhận danh s&amp;amp;aacute;ch lớp tại thầy Hưng &amp;amp;ndash; PHT.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp;&amp;lt;/strong&amp;gt;&amp;lt;strong&amp;gt;14 g 00&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp;(11/8/2015)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

			&amp;lt;p&amp;gt;Khối&amp;amp;nbsp;&amp;lt;strong&amp;gt;12&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;Ph&amp;amp;ograve;ng học theo sơ đồ ph&amp;amp;acirc;n c&amp;amp;ocirc;ng.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;GVCN l&amp;amp;agrave;m c&amp;amp;ocirc;ng t&amp;amp;aacute;c tổ chức lớp đầu năm (Theo nội dung BGH phổ biến &amp;amp;ndash; nhận tại c&amp;amp;ocirc; Nga).&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;GVCN nhận danh s&amp;amp;aacute;ch&amp;amp;nbsp;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'1226735187.jpg', CAST(N'2015-09-23 21:43:48.567' AS DateTime), 6, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (24, N'Lịch làm việc tuần 5 (từ 21/8/2015 đến 27/9/2015)', N'Lịch làm việc tuần 5 (từ 21/8/2015 đến 27/9/2015)', N'&amp;lt;table border=&amp;quot;1&amp;quot; cellpadding=&amp;quot;0&amp;quot; cellspacing=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td colspan=&amp;quot;3&amp;quot;&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Lịch l&amp;amp;agrave;m việc tuần 5 (từ 21/8/2015 đến 27/9/2015)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ/Ng&amp;amp;agrave;y&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;S&amp;amp;aacute;ng&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chiều&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ hai&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(21/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Văn ph&amp;amp;ograve;ng: Nhập số liệu thống k&amp;amp;ecirc;.&amp;lt;br /&amp;gt;
			- B&amp;amp;aacute;o c&amp;amp;aacute;o triển khai hệ thống phần mềm Quản l&amp;amp;yacute; nh&amp;amp;agrave; trường cho Sở (thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao động trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 14h00: Tiếp đo&amp;amp;agrave;n Văn h&amp;amp;oacute;a Gi&amp;amp;aacute;o dục New Zealand (c&amp;amp;ocirc; Sương -&amp;amp;nbsp;Lớp tham dự: 12/21, 12/22, 12/27).&amp;lt;br /&amp;gt;
			- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ ba&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(22/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh tham dự thi chọn ĐT HSG QG lớp 12 nghỉ học để &amp;amp;ocirc;n tập trong 02 ng&amp;amp;agrave;y: 21 v&amp;amp;agrave; 22/9/2015.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Lao động+trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh)&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ tư&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(23/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00:&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Hiệu trưởng, Kế to&amp;amp;aacute;n, Y tế họp BHYT tại trường Nguyễn Khuyến.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Họp tại Quận Ủy Hải Ch&amp;amp;acirc;u (thầy Hưng, c&amp;amp;ocirc; Sương).&amp;lt;br /&amp;gt;
			- C&amp;amp;aacute;c tổ nộp sản phẩm dự thi thiết kế b&amp;amp;agrave;i giảng E.Learning (nộp cho thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao đ&amp;amp;ocirc;ng+trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h00: Thi chon ĐT dự thi HSGQG lớp 12 (V&amp;amp;ograve;ng 1) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- 14h00: Họp b&amp;amp;agrave;n giao Ng&amp;amp;acirc;n h&amp;amp;agrave;ng đề tại SGD (thầy Hưng).&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ năm&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(24/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h30: Thi chọn ĐT dự thi HSGQG lớp 12 (v&amp;amp;ograve;ng 2) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h30: Họp tổ BV+GT+GV ph&amp;amp;acirc;n c&amp;amp;ocirc;ng trực nề nếp (CĐGV) tại ph&amp;amp;ograve;ng kh&amp;amp;aacute;ch.&amp;lt;br /&amp;gt;
			- 14h00: Họp li&amp;amp;ecirc;n tịch mở rộng.&amp;lt;br /&amp;gt;
			- 14h30: Kiểm tra năng lực Tiếng Anh cho HS du học (ph&amp;amp;ograve;ng Multi 4)&amp;lt;br /&amp;gt;
			- 14h45: Họp x&amp;amp;eacute;t GV hết tập sự (tổ Văn, Sinh).&amp;lt;br /&amp;gt;
			(T/phần: BGH+TTCM+GV hướng dẫn).&amp;lt;br /&amp;gt;
			- 15h00: Họp Chi bộ.&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;Thứ s&amp;amp;aacute;u&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(25/9)&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00: Dự Lễ ph&amp;amp;aacute;t động cuộc thi giải to&amp;amp;aacute;n qua Internet tại trường Nguyễn Khuyến (T/phần: thầy Hưng, thầy Hải - tổ To&amp;amp;aacute;n).&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ bảy&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(26/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h45: Hội nghị CCVC năm học 2015-2016 (T/phần: CB-GV-NV).&amp;lt;br /&amp;gt;
			- 10h00: Hội nghị C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n giữa nhiệm kỳ (T/phần: theo th&amp;amp;ocirc;ng b&amp;amp;aacute;o của C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n).&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh nghỉ học cả ng&amp;amp;agrave;y.&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chủ nhật&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(27/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h00: ĐH Đo&amp;amp;agrave;n trường tại ph&amp;amp;ograve;ng Hội đồng.&amp;lt;br /&amp;gt;
			- 8h30: Edupatle tư vấn du học tại ph&amp;amp;ograve;ng Multi.&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'11233278_image015.jpg', CAST(N'2015-09-23 21:45:48.840' AS DateTime), 9, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (25, N'Lịch làm việc tuần 4 (từ 14/9/2015 đến 20/9/2015)', N'Lịch làm việc tuần 4 (từ 14/9/2015 đến 20/9/2015)', N'&amp;lt;table border=&amp;quot;1&amp;quot; cellpadding=&amp;quot;0&amp;quot; cellspacing=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td colspan=&amp;quot;3&amp;quot;&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Lịch l&amp;amp;agrave;m việc tuần 5 (từ 21/8/2015 đến 27/9/2015)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ/Ng&amp;amp;agrave;y&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;S&amp;amp;aacute;ng&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chiều&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ hai&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(21/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Văn ph&amp;amp;ograve;ng: Nhập số liệu thống k&amp;amp;ecirc;.&amp;lt;br /&amp;gt;
			- B&amp;amp;aacute;o c&amp;amp;aacute;o triển khai hệ thống phần mềm Quản l&amp;amp;yacute; nh&amp;amp;agrave; trường cho Sở (thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao động trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 14h00: Tiếp đo&amp;amp;agrave;n Văn h&amp;amp;oacute;a Gi&amp;amp;aacute;o dục New Zealand (c&amp;amp;ocirc; Sương -&amp;amp;nbsp;Lớp tham dự: 12/21, 12/22, 12/27).&amp;lt;br /&amp;gt;
			- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ ba&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(22/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh tham dự thi chọn ĐT HSG QG lớp 12 nghỉ học để &amp;amp;ocirc;n tập trong 02 ng&amp;amp;agrave;y: 21 v&amp;amp;agrave; 22/9/2015.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Lao động+trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh)&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ tư&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(23/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00:&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Hiệu trưởng, Kế to&amp;amp;aacute;n, Y tế họp BHYT tại trường Nguyễn Khuyến.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Họp tại Quận Ủy Hải Ch&amp;amp;acirc;u (thầy Hưng, c&amp;amp;ocirc; Sương).&amp;lt;br /&amp;gt;
			- C&amp;amp;aacute;c tổ nộp sản phẩm dự thi thiết kế b&amp;amp;agrave;i giảng E.Learning (nộp cho thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao đ&amp;amp;ocirc;ng+trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h00: Thi chon ĐT dự thi HSGQG lớp 12 (V&amp;amp;ograve;ng 1) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- 14h00: Họp b&amp;amp;agrave;n giao Ng&amp;amp;acirc;n h&amp;amp;agrave;ng đề tại SGD (thầy Hưng).&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ năm&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(24/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h30: Thi chọn ĐT dự thi HSGQG lớp 12 (v&amp;amp;ograve;ng 2) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h30: Họp tổ BV+GT+GV ph&amp;amp;acirc;n c&amp;amp;ocirc;ng trực nề nếp (CĐGV) tại ph&amp;amp;ograve;ng kh&amp;amp;aacute;ch.&amp;lt;br /&amp;gt;
			- 14h00: Họp li&amp;amp;ecirc;n tịch mở rộng.&amp;lt;br /&amp;gt;
			- 14h30: Kiểm tra năng lực Tiếng Anh cho HS du học (ph&amp;amp;ograve;ng Multi 4)&amp;lt;br /&amp;gt;
			- 14h45: Họp x&amp;amp;eacute;t GV hết tập sự (tổ Văn, Sinh).&amp;lt;br /&amp;gt;
			(T/phần: BGH+TTCM+GV hướng dẫn).&amp;lt;br /&amp;gt;
			- 15h00: Họp Chi bộ.&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;Thứ s&amp;amp;aacute;u&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(25/9)&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00: Dự Lễ ph&amp;amp;aacute;t động cuộc thi giải to&amp;amp;aacute;n qua Internet tại trường Nguyễn Khuyến (T/phần: thầy Hưng, thầy Hải - tổ To&amp;amp;aacute;n).&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ bảy&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(26/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h45: Hội nghị CCVC năm học 2015-2016 (T/phần: CB-GV-NV).&amp;lt;br /&amp;gt;
			- 10h00: Hội nghị C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n giữa nhiệm kỳ (T/phần: theo th&amp;amp;ocirc;ng b&amp;amp;aacute;o của C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n).&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh nghỉ học cả ng&amp;amp;agrave;y.&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chủ nhật&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(27/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h00: ĐH Đo&amp;amp;agrave;n trường tại ph&amp;amp;ograve;ng Hội đồng.&amp;lt;br /&amp;gt;
			- 8h30: Edupatle tư vấn du học tại ph&amp;amp;ograve;ng Multi.&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'11233278_image015.jpg', CAST(N'2015-09-23 21:46:15.983' AS DateTime), 9, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (26, N'Lịch làm việc tuần 3 (từ 7/8/2015 đến 13/9/2015)', N'Lịch làm việc tuần 3 (từ 7/8/2015 đến 13/9/2015)', N'&amp;lt;table border=&amp;quot;1&amp;quot; cellpadding=&amp;quot;0&amp;quot; cellspacing=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td colspan=&amp;quot;3&amp;quot;&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Lịch l&amp;amp;agrave;m việc tuần 5 (từ 21/8/2015 đến 27/9/2015)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ/Ng&amp;amp;agrave;y&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;S&amp;amp;aacute;ng&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chiều&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ hai&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(21/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Văn ph&amp;amp;ograve;ng: Nhập số liệu thống k&amp;amp;ecirc;.&amp;lt;br /&amp;gt;
			- B&amp;amp;aacute;o c&amp;amp;aacute;o triển khai hệ thống phần mềm Quản l&amp;amp;yacute; nh&amp;amp;agrave; trường cho Sở (thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao động trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 14h00: Tiếp đo&amp;amp;agrave;n Văn h&amp;amp;oacute;a Gi&amp;amp;aacute;o dục New Zealand (c&amp;amp;ocirc; Sương -&amp;amp;nbsp;Lớp tham dự: 12/21, 12/22, 12/27).&amp;lt;br /&amp;gt;
			- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ ba&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(22/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh tham dự thi chọn ĐT HSG QG lớp 12 nghỉ học để &amp;amp;ocirc;n tập trong 02 ng&amp;amp;agrave;y: 21 v&amp;amp;agrave; 22/9/2015.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Lao động+trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh)&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ tư&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(23/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00:&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Hiệu trưởng, Kế to&amp;amp;aacute;n, Y tế họp BHYT tại trường Nguyễn Khuyến.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Họp tại Quận Ủy Hải Ch&amp;amp;acirc;u (thầy Hưng, c&amp;amp;ocirc; Sương).&amp;lt;br /&amp;gt;
			- C&amp;amp;aacute;c tổ nộp sản phẩm dự thi thiết kế b&amp;amp;agrave;i giảng E.Learning (nộp cho thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao đ&amp;amp;ocirc;ng+trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h00: Thi chon ĐT dự thi HSGQG lớp 12 (V&amp;amp;ograve;ng 1) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- 14h00: Họp b&amp;amp;agrave;n giao Ng&amp;amp;acirc;n h&amp;amp;agrave;ng đề tại SGD (thầy Hưng).&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ năm&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(24/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h30: Thi chọn ĐT dự thi HSGQG lớp 12 (v&amp;amp;ograve;ng 2) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h30: Họp tổ BV+GT+GV ph&amp;amp;acirc;n c&amp;amp;ocirc;ng trực nề nếp (CĐGV) tại ph&amp;amp;ograve;ng kh&amp;amp;aacute;ch.&amp;lt;br /&amp;gt;
			- 14h00: Họp li&amp;amp;ecirc;n tịch mở rộng.&amp;lt;br /&amp;gt;
			- 14h30: Kiểm tra năng lực Tiếng Anh cho HS du học (ph&amp;amp;ograve;ng Multi 4)&amp;lt;br /&amp;gt;
			- 14h45: Họp x&amp;amp;eacute;t GV hết tập sự (tổ Văn, Sinh).&amp;lt;br /&amp;gt;
			(T/phần: BGH+TTCM+GV hướng dẫn).&amp;lt;br /&amp;gt;
			- 15h00: Họp Chi bộ.&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;Thứ s&amp;amp;aacute;u&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(25/9)&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00: Dự Lễ ph&amp;amp;aacute;t động cuộc thi giải to&amp;amp;aacute;n qua Internet tại trường Nguyễn Khuyến (T/phần: thầy Hưng, thầy Hải - tổ To&amp;amp;aacute;n).&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ bảy&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(26/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h45: Hội nghị CCVC năm học 2015-2016 (T/phần: CB-GV-NV).&amp;lt;br /&amp;gt;
			- 10h00: Hội nghị C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n giữa nhiệm kỳ (T/phần: theo th&amp;amp;ocirc;ng b&amp;amp;aacute;o của C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n).&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh nghỉ học cả ng&amp;amp;agrave;y.&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chủ nhật&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(27/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h00: ĐH Đo&amp;amp;agrave;n trường tại ph&amp;amp;ograve;ng Hội đồng.&amp;lt;br /&amp;gt;
			- 8h30: Edupatle tư vấn du học tại ph&amp;amp;ograve;ng Multi.&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'11233278_image015.jpg', CAST(N'2015-09-23 21:46:39.560' AS DateTime), 9, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (27, N'Lịch làm việc tuần 2 (từ 31/8/2015 đến 6/9/2015)', N'Lịch làm việc tuần 2 (từ 31/8/2015 đến 6/9/2015)', N'&amp;lt;table border=&amp;quot;1&amp;quot; cellpadding=&amp;quot;0&amp;quot; cellspacing=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td colspan=&amp;quot;3&amp;quot;&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Lịch l&amp;amp;agrave;m việc tuần 5 (từ 21/8/2015 đến 27/9/2015)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ/Ng&amp;amp;agrave;y&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;S&amp;amp;aacute;ng&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chiều&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ hai&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(21/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Văn ph&amp;amp;ograve;ng: Nhập số liệu thống k&amp;amp;ecirc;.&amp;lt;br /&amp;gt;
			- B&amp;amp;aacute;o c&amp;amp;aacute;o triển khai hệ thống phần mềm Quản l&amp;amp;yacute; nh&amp;amp;agrave; trường cho Sở (thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao động trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 14h00: Tiếp đo&amp;amp;agrave;n Văn h&amp;amp;oacute;a Gi&amp;amp;aacute;o dục New Zealand (c&amp;amp;ocirc; Sương -&amp;amp;nbsp;Lớp tham dự: 12/21, 12/22, 12/27).&amp;lt;br /&amp;gt;
			- Ch&amp;amp;agrave;o cờ&amp;amp;nbsp;- Ngoại kh&amp;amp;oacute;a chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n tổ H&amp;amp;oacute;a.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ ba&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(22/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh tham dự thi chọn ĐT HSG QG lớp 12 nghỉ học để &amp;amp;ocirc;n tập trong 02 ng&amp;amp;agrave;y: 21 v&amp;amp;agrave; 22/9/2015.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/13 (c&amp;amp;ocirc; Hồng Đức).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Lao động+trực: Lớp 12/24 (c&amp;amp;ocirc; Thi&amp;amp;ecirc;n Anh)&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ tư&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(23/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00:&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Hiệu trưởng, Kế to&amp;amp;aacute;n, Y tế họp BHYT tại trường Nguyễn Khuyến.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp;+ Họp tại Quận Ủy Hải Ch&amp;amp;acirc;u (thầy Hưng, c&amp;amp;ocirc; Sương).&amp;lt;br /&amp;gt;
			- C&amp;amp;aacute;c tổ nộp sản phẩm dự thi thiết kế b&amp;amp;agrave;i giảng E.Learning (nộp cho thầy Hưng).&amp;lt;br /&amp;gt;
			- Lao đ&amp;amp;ocirc;ng+trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h00: Thi chon ĐT dự thi HSGQG lớp 12 (V&amp;amp;ograve;ng 1) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- 14h00: Họp b&amp;amp;agrave;n giao Ng&amp;amp;acirc;n h&amp;amp;agrave;ng đề tại SGD (thầy Hưng).&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ năm&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(24/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h30: Thi chọn ĐT dự thi HSGQG lớp 12 (v&amp;amp;ograve;ng 2) tại trường chuy&amp;amp;ecirc;n L&amp;amp;ecirc; Qu&amp;amp;yacute; Đ&amp;amp;ocirc;n.&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/12 (c&amp;amp;ocirc; Diệu Trang).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 13h30: Họp tổ BV+GT+GV ph&amp;amp;acirc;n c&amp;amp;ocirc;ng trực nề nếp (CĐGV) tại ph&amp;amp;ograve;ng kh&amp;amp;aacute;ch.&amp;lt;br /&amp;gt;
			- 14h00: Họp li&amp;amp;ecirc;n tịch mở rộng.&amp;lt;br /&amp;gt;
			- 14h30: Kiểm tra năng lực Tiếng Anh cho HS du học (ph&amp;amp;ograve;ng Multi 4)&amp;lt;br /&amp;gt;
			- 14h45: Họp x&amp;amp;eacute;t GV hết tập sự (tổ Văn, Sinh).&amp;lt;br /&amp;gt;
			(T/phần: BGH+TTCM+GV hướng dẫn).&amp;lt;br /&amp;gt;
			- 15h00: Họp Chi bộ.&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;Thứ s&amp;amp;aacute;u&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(25/9)&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 8h00: Dự Lễ ph&amp;amp;aacute;t động cuộc thi giải to&amp;amp;aacute;n qua Internet tại trường Nguyễn Khuyến (T/phần: thầy Hưng, thầy Hải - tổ To&amp;amp;aacute;n).&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Thứ bảy&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(26/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h45: Hội nghị CCVC năm học 2015-2016 (T/phần: CB-GV-NV).&amp;lt;br /&amp;gt;
			- 10h00: Hội nghị C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n giữa nhiệm kỳ (T/phần: theo th&amp;amp;ocirc;ng b&amp;amp;aacute;o của C&amp;amp;ocirc;ng Đo&amp;amp;agrave;n).&amp;lt;br /&amp;gt;
			- Trực: Lớp 12/7 (c&amp;amp;ocirc; Xu&amp;amp;acirc;n Đ&amp;amp;agrave;o)&amp;amp;nbsp;&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- Học sinh nghỉ học cả ng&amp;amp;agrave;y.&amp;lt;br /&amp;gt;
			- Lao động+trực: Lớp 12/25 (thầy Ph&amp;amp;uacute;c).&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Chủ nhật&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;
			&amp;lt;strong&amp;gt;(27/9)&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;- 7h00: ĐH Đo&amp;amp;agrave;n trường tại ph&amp;amp;ograve;ng Hội đồng.&amp;lt;br /&amp;gt;
			- 8h30: Edupatle tư vấn du học tại ph&amp;amp;ograve;ng Multi.&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'11233278_image015.jpg', CAST(N'2015-09-23 21:47:17.720' AS DateTime), 9, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (28, N'Đề và đáp án môn Toán kì thi THPT Quốc gia 2015', N'Đề thi minh họa môn Toán kì thi THPT Quốc gia năm 2015. Các bạn xem đề thi và đáp án trên trang web hoặc có thể tải về dạng file PDF ở cuối trang', N'&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://luyenthidaminh.vn/uploads/news/dethidapan/thpt/toan/2015/de-toan-mhtn-2015.jpg&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'test01_57915325.jpg', CAST(N'2015-09-25 17:58:08.480' AS DateTime), 10, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (29, N'Đề và Đáp án Đại học môn Tiếng Anh khối D năm 2014', N'Đề thi đại học môn Tiếng Anh khối D năm 2014 và đáp án chính thức của Bộ GD & ĐT. ĐỀ THI và ĐÁP ÁN được trình bày đầy đủ, rõ ràng và chi tiết trên Website hoặc các bạn có thể tải về máy toàn bộ mã đề thi dạng file PDF ở cuối trang.', N'&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://luyenthidaminh.vn/uploads/news/dethidapan/daihoc/tienganh/de-anhd-dh2014-01.jpg&amp;quot; style=&amp;quot;height:989px; width:700px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'dethitienganh_13.jpg', CAST(N'2015-09-25 17:59:52.710' AS DateTime), 10, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (30, N'Đề và đáp án môn Lịch sử kì thi THPT Quốc gia 2015', N'Đề thi và đáp án môn Lịch sử kì thi THPT Quốc gia năm 2015. Các bạn xem đề thi và đáp án trên trang web hoặc có thể tải về dạng file PDF ở cuối trang.', N'&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://luyenthidaminh.vn/uploads/news/dethidapan/daihoc/tienganh/de-anhd-dh2014-01.jpg&amp;quot; style=&amp;quot;height:989px; width:700px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'images.jpg', CAST(N'2015-09-25 18:01:04.573' AS DateTime), 10, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (31, N'Đề và đáp án môn Văn kì thi THPT Quốc gia 2015', N'Đề thi và đáp án môn Văn kì thi THPT Quốc gia năm 2015. Các bạn xem đề thi và đáp án trên trang web hoặc có thể tải về dạng file PDF ở cuối trang.', N'&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://luyenthidaminh.vn/uploads/news/dethidapan/thpt/van/de-van-qg2015-01.jpg&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'Icon - paper pile 3.png', CAST(N'2015-09-25 18:02:16.750' AS DateTime), 10, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (32, N'Tuyển tập thơ Xuân Diệu', N'Tập thơ tuyển chọn những bài thơ hay của nhà thơ Xuân Diệu', N'&amp;lt;p&amp;gt;Tải về:&amp;amp;nbsp;&amp;lt;a href=&amp;quot;http://www.lrc.tnu.edu.vn/upload/collection/brief/4642_vhtt0110.pdf&amp;quot;&amp;gt;http://www.lrc.tnu.edu.vn/upload/collection/brief/4642_vhtt0110.pdf&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;
', 0, 1, N'cover.jpg', CAST(N'2015-09-25 18:04:38.010' AS DateTime), 10, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (33, N'Hoạt động tuyên truyền an toàn giao thông', N'Thực hiện Kế hoạch thực hiện công tác đảm bảo TTATGT (năm học 2015-2016); thực hiện Kế hoạch tổ chức hoạt động chủ điểm hưởng ứng tháng ATGT (tháng 9 năm 2015) nhằm đẩy mạnh công tác giáo dục pháp luật về TTATGT', N'&amp;lt;p&amp;gt;Thực hiện&amp;amp;nbsp;&amp;lt;em&amp;gt;Kế hoạch thực hiện c&amp;amp;ocirc;ng t&amp;amp;aacute;c đảm bảo TTATGT (năm học 2015-2016&amp;lt;/em&amp;gt;); thực hiện&amp;amp;nbsp;&amp;lt;em&amp;gt;Kế hoạch tổ chức hoạt động chủ điểm hưởng ứng th&amp;amp;aacute;ng ATGT (th&amp;amp;aacute;ng 9 năm 2015&amp;lt;/em&amp;gt;) nhằm đẩy mạnh c&amp;amp;ocirc;ng t&amp;amp;aacute;c gi&amp;amp;aacute;o dục ph&amp;amp;aacute;p luật về TTATGT, bảo đảm TTATGT g&amp;amp;oacute;p phần n&amp;amp;acirc;ng cao nhận thức v&amp;amp;agrave; x&amp;amp;acirc;y dựng th&amp;amp;oacute;i quen cư xử c&amp;amp;oacute; văn h&amp;amp;oacute;a, đ&amp;amp;uacute;ng ph&amp;amp;aacute;p luật, x&amp;amp;oacute;a bỏ những th&amp;amp;oacute;i quen t&amp;amp;ugrave;y tiện vi phạm quy tắc giao th&amp;amp;ocirc;ng, h&amp;amp;igrave;nh th&amp;amp;agrave;nh v&amp;amp;agrave; n&amp;amp;acirc;ng cao &amp;amp;yacute; thức, h&amp;amp;agrave;nh vi tự gi&amp;amp;aacute;c tu&amp;amp;acirc;n thủ ph&amp;amp;aacute;p luật khi tham gia giao th&amp;amp;ocirc;ng, tạo m&amp;amp;ocirc;i trường giao th&amp;amp;ocirc;ng trật tự, an to&amp;amp;agrave;n, văn minh, th&amp;amp;acirc;n thiện, g&amp;amp;oacute;p phần bảo đảm TTATGT, giảm thiểu tai nạn giao th&amp;amp;ocirc;ng tr&amp;amp;ecirc;n địa b&amp;amp;agrave;n nh&amp;amp;agrave; trường v&amp;amp;agrave; th&amp;amp;agrave;nh phố, trường THPT Phan Ch&amp;amp;acirc;u Trinh đ&amp;amp;atilde; v&amp;amp;agrave; sẽ triển khai một số c&amp;amp;aacute;c hoạt động tuy&amp;amp;ecirc;n truyền, gi&amp;amp;aacute;o dục TTATGT cho c&amp;amp;aacute;c em HS to&amp;amp;agrave;n trường.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Triển khai Lịch trực ATGT khi tan trường tại cổng đường Hải Ph&amp;amp;ograve;ng v&amp;amp;agrave; L&amp;amp;ecirc; Lợi (Chi đo&amp;amp;agrave;n GV v&amp;amp;agrave; HS c&amp;amp;aacute;c lớp).&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Tuy&amp;amp;ecirc;n truyền, phổ biến c&amp;amp;aacute;c th&amp;amp;ocirc;ng tin, kiến thức về TTATGT trong tuần sinh hoạt tập thể đầu năm học, trong tiết sinh hoạt lớp, ch&amp;amp;agrave;o cờ đầu tuần&amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Trong cuộc họp CMHS đầu năm học, đề nghị CMHS c&amp;amp;ugrave;ng phối hợp. nhắc nhở, gi&amp;amp;aacute;o dục HS về TTATGT cũng như th&amp;amp;ocirc;ng b&amp;amp;aacute;o với CMHS c&amp;amp;aacute;c quy định về TTATGT, trong đ&amp;amp;oacute; lưu &amp;amp;yacute; CMHS kh&amp;amp;ocirc;ng l&amp;amp;agrave;m &amp;amp;ugrave;n tắc giao th&amp;amp;ocirc;ng trước cổng trường khi đưa đ&amp;amp;oacute;n HS.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Tổ chức cho CMHS, HS v&amp;amp;agrave; GVCN k&amp;amp;yacute; cam kết thực tốt TTATGT, nhất l&amp;amp;agrave; thực hiện quy định v/v HS kh&amp;amp;ocirc;ng đi xe m&amp;amp;ocirc;-t&amp;amp;ocirc;, xe m&amp;amp;aacute;y đến trường.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Giờ Ch&amp;amp;agrave;o cờ ng&amp;amp;agrave;y 07/9/15: Tổ chức Mit-tinh hưởng ứng th&amp;amp;aacute;ng ATGT 9/2015, c&amp;amp;aacute;c lớp trưởng k&amp;amp;yacute; cam kết thực hiện tốt TTATGT v&amp;amp;agrave; ngoại kh&amp;amp;oacute;a thi t&amp;amp;igrave;m hiểu về TTATGT (Ban HĐNGLL v&amp;amp;agrave; Chi đo&amp;amp;agrave;n GV phụ tr&amp;amp;aacute;ch).&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Treo băng r&amp;amp;ocirc;n, khẩu hiệu, ph&amp;amp;aacute;t thanh tuy&amp;amp;ecirc;n truyền hưởng ứng Th&amp;amp;aacute;ng ATGT (th&amp;amp;aacute;ng 9/2015) trong khu&amp;amp;ocirc;n vi&amp;amp;ecirc;n nh&amp;amp;agrave; trường.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Phối hợp với Ph&amp;amp;ograve;ng CSGT (C&amp;amp;ocirc;ng an TP ĐN) v&amp;amp;agrave; Quận đo&amp;amp;agrave;n quận Hải Ch&amp;amp;acirc;u tổ chức tuy&amp;amp;ecirc;n truyền về Luật giao th&amp;amp;ocirc;ng đường bộ v&amp;amp;agrave; gi&amp;amp;aacute;o dục việc thực hiện c&amp;amp;aacute;c quy định khi tham gia giao th&amp;amp;ocirc;ng cho to&amp;amp;agrave;n thể HS khối 10 tại Hội trường (S&amp;amp;aacute;ng ng&amp;amp;agrave;y thứ năm, 10/9/2015).&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- C&amp;amp;aacute;c GV tổ GDCD dạy tiết ngoại kh&amp;amp;oacute;a theo PPCT về thực hiện TTATGT (Một số b&amp;amp;agrave;i trong Chương tr&amp;amp;igrave;nh &amp;amp;ldquo;ATGT cho nụ cười ng&amp;amp;agrave;y mai&amp;amp;rdquo;) cho khối lớp 10 (Th&amp;amp;aacute;ng 9, 10 năm 2015).&amp;lt;/p&amp;gt;
', 0, 1, N'20150926110206_at_1.jpg', CAST(N'2015-09-26 22:33:47.377' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (34, N'Thông tin về cuộc thi giới thiệu sách và thuyết trình năm 2015', N'Thực hiện Kế hoạch hoạt động của Thư viện năm học 2014 – 2015, thực hiện Kế hoạch triển khai các hoạt động hưởng ứng “Năm văn hóa, văn minh đô thị 2015” của TP Đà Nẵng, hướng đến kỉ niệm Ngày sách Việt Nam 21/4, nhằm góp phần hình thành, xây dựng cho các em HS lòng yêu thích, đam mê đọc sách thường ', N'&amp;lt;p&amp;gt;Thực hiện&amp;amp;nbsp;&amp;lt;em&amp;gt;Kế hoạch thực hiện c&amp;amp;ocirc;ng t&amp;amp;aacute;c đảm bảo TTATGT (năm học 2015-2016&amp;lt;/em&amp;gt;); thực hiện&amp;amp;nbsp;&amp;lt;em&amp;gt;Kế hoạch tổ chức hoạt động chủ điểm hưởng ứng th&amp;amp;aacute;ng ATGT (th&amp;amp;aacute;ng 9 năm 2015&amp;lt;/em&amp;gt;) nhằm đẩy mạnh c&amp;amp;ocirc;ng t&amp;amp;aacute;c gi&amp;amp;aacute;o dục ph&amp;amp;aacute;p luật về TTATGT, bảo đảm TTATGT g&amp;amp;oacute;p phần n&amp;amp;acirc;ng cao nhận thức v&amp;amp;agrave; x&amp;amp;acirc;y dựng th&amp;amp;oacute;i quen cư xử c&amp;amp;oacute; văn h&amp;amp;oacute;a, đ&amp;amp;uacute;ng ph&amp;amp;aacute;p luật, x&amp;amp;oacute;a bỏ những th&amp;amp;oacute;i quen t&amp;amp;ugrave;y tiện vi phạm quy tắc giao th&amp;amp;ocirc;ng, h&amp;amp;igrave;nh th&amp;amp;agrave;nh v&amp;amp;agrave; n&amp;amp;acirc;ng cao &amp;amp;yacute; thức, h&amp;amp;agrave;nh vi tự gi&amp;amp;aacute;c tu&amp;amp;acirc;n thủ ph&amp;amp;aacute;p luật khi tham gia giao th&amp;amp;ocirc;ng, tạo m&amp;amp;ocirc;i trường giao th&amp;amp;ocirc;ng trật tự, an to&amp;amp;agrave;n, văn minh, th&amp;amp;acirc;n thiện, g&amp;amp;oacute;p phần bảo đảm TTATGT, giảm thiểu tai nạn giao th&amp;amp;ocirc;ng tr&amp;amp;ecirc;n địa b&amp;amp;agrave;n nh&amp;amp;agrave; trường v&amp;amp;agrave; th&amp;amp;agrave;nh phố, trường THPT Phan Ch&amp;amp;acirc;u Trinh đ&amp;amp;atilde; v&amp;amp;agrave; sẽ triển khai một số c&amp;amp;aacute;c hoạt động tuy&amp;amp;ecirc;n truyền, gi&amp;amp;aacute;o dục TTATGT cho c&amp;amp;aacute;c em HS to&amp;amp;agrave;n trường.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Triển khai Lịch trực ATGT khi tan trường tại cổng đường Hải Ph&amp;amp;ograve;ng v&amp;amp;agrave; L&amp;amp;ecirc; Lợi (Chi đo&amp;amp;agrave;n GV v&amp;amp;agrave; HS c&amp;amp;aacute;c lớp).&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Tuy&amp;amp;ecirc;n truyền, phổ biến c&amp;amp;aacute;c th&amp;amp;ocirc;ng tin, kiến thức về TTATGT trong tuần sinh hoạt tập thể đầu năm học, trong tiết sinh hoạt lớp, ch&amp;amp;agrave;o cờ đầu tuần&amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Trong cuộc họp CMHS đầu năm học, đề nghị CMHS c&amp;amp;ugrave;ng phối hợp. nhắc nhở, gi&amp;amp;aacute;o dục HS về TTATGT cũng như th&amp;amp;ocirc;ng b&amp;amp;aacute;o với CMHS c&amp;amp;aacute;c quy định về TTATGT, trong đ&amp;amp;oacute; lưu &amp;amp;yacute; CMHS kh&amp;amp;ocirc;ng l&amp;amp;agrave;m &amp;amp;ugrave;n tắc giao th&amp;amp;ocirc;ng trước cổng trường khi đưa đ&amp;amp;oacute;n HS.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Tổ chức cho CMHS, HS v&amp;amp;agrave; GVCN k&amp;amp;yacute; cam kết thực tốt TTATGT, nhất l&amp;amp;agrave; thực hiện quy định v/v HS kh&amp;amp;ocirc;ng đi xe m&amp;amp;ocirc;-t&amp;amp;ocirc;, xe m&amp;amp;aacute;y đến trường.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Giờ Ch&amp;amp;agrave;o cờ ng&amp;amp;agrave;y 07/9/15: Tổ chức Mit-tinh hưởng ứng th&amp;amp;aacute;ng ATGT 9/2015, c&amp;amp;aacute;c lớp trưởng k&amp;amp;yacute; cam kết thực hiện tốt TTATGT v&amp;amp;agrave; ngoại kh&amp;amp;oacute;a thi t&amp;amp;igrave;m hiểu về TTATGT (Ban HĐNGLL v&amp;amp;agrave; Chi đo&amp;amp;agrave;n GV phụ tr&amp;amp;aacute;ch).&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Treo băng r&amp;amp;ocirc;n, khẩu hiệu, ph&amp;amp;aacute;t thanh tuy&amp;amp;ecirc;n truyền hưởng ứng Th&amp;amp;aacute;ng ATGT (th&amp;amp;aacute;ng 9/2015) trong khu&amp;amp;ocirc;n vi&amp;amp;ecirc;n nh&amp;amp;agrave; trường.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- Phối hợp với Ph&amp;amp;ograve;ng CSGT (C&amp;amp;ocirc;ng an TP ĐN) v&amp;amp;agrave; Quận đo&amp;amp;agrave;n quận Hải Ch&amp;amp;acirc;u tổ chức tuy&amp;amp;ecirc;n truyền về Luật giao th&amp;amp;ocirc;ng đường bộ v&amp;amp;agrave; gi&amp;amp;aacute;o dục việc thực hiện c&amp;amp;aacute;c quy định khi tham gia giao th&amp;amp;ocirc;ng cho to&amp;amp;agrave;n thể HS khối 10 tại Hội trường (S&amp;amp;aacute;ng ng&amp;amp;agrave;y thứ năm, 10/9/2015).&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;- C&amp;amp;aacute;c GV tổ GDCD dạy tiết ngoại kh&amp;amp;oacute;a theo PPCT về thực hiện TTATGT (Một số b&amp;amp;agrave;i trong Chương tr&amp;amp;igrave;nh &amp;amp;ldquo;ATGT cho nụ cười ng&amp;amp;agrave;y mai&amp;amp;rdquo;) cho khối lớp 10 (Th&amp;amp;aacute;ng 9, 10 năm 2015).&amp;lt;/p&amp;gt;
', 0, 1, N'20150427141948.jpg', CAST(N'2015-09-26 22:34:46.047' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (35, N'Kỷ niệm 32 năm Ngày Nhà giáo Việt Nam', N'Quán triệt tinh thần đổi mới “căn bản và toàn diện” hoạt động giáo dục, trường THPT Phan Châu Trinh – Đà Nẵng đã tổ chức nhiều hoạt động thiết thực nhằm kỷ niệm 32 năm Ngày Nhà giáo Việt Nam 20-11.', N'&amp;lt;p&amp;gt;Qu&amp;amp;aacute;n triệt tinh thần đổi mới &amp;amp;ldquo;căn bản v&amp;amp;agrave; to&amp;amp;agrave;n diện&amp;amp;rdquo; hoạt động gi&amp;amp;aacute;o dục, trường THPT Phan Ch&amp;amp;acirc;u Trinh &amp;amp;ndash; Đ&amp;amp;agrave; Nẵng đ&amp;amp;atilde; tổ chức nhiều hoạt động thiết thực nhằm kỷ niệm 32 năm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11.&amp;lt;br /&amp;gt;
&amp;amp;nbsp; &amp;amp;nbsp;C&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; thực hiện nhiều đổi mới trong phương ph&amp;amp;aacute;p giảng dạy v&amp;amp;agrave; kiểm tra đ&amp;amp;aacute;nh gi&amp;amp;aacute;, nhiều thầy c&amp;amp;ocirc; đ&amp;amp;atilde; đăng k&amp;amp;yacute; c&amp;amp;aacute;c tiết dạy tốt nhằm hưởng ứng phong tr&amp;amp;agrave;o thi đua dạy tốt học tốt của to&amp;amp;agrave;n ng&amp;amp;agrave;nh. Về ph&amp;amp;iacute;a c&amp;amp;aacute;c em học sinh đ&amp;amp;atilde; đăng k&amp;amp;yacute; tuần học tốt, t&amp;amp;iacute;ch cực hoạt động trong học tập.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11 năm nay cũng c&amp;amp;oacute; nhiều đổi mới, ban văn nghệ nh&amp;amp;agrave; trường đ&amp;amp;atilde; tổ chức 2 đ&amp;amp;ecirc;m văn nghệ ch&amp;amp;agrave;o mừng (15 v&amp;amp;agrave; 16-11-2014) với nhiều tiết mục phong ph&amp;amp;uacute; do c&amp;amp;aacute;c em học sinh biểu diễn.&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Việc tổ chức Lễ kỷ niệm cũng được tổ chức trong tiết ch&amp;amp;agrave;o cờ đầu tuần (17-11-2014); chiều ng&amp;amp;agrave;y 19-11-2914, nh&amp;amp;agrave; trường d&amp;amp;agrave;nh 2 tiết cuối để tổ chức buổi sinh hoạt kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam trong Hội đồng gi&amp;amp;aacute;o dục.v&amp;amp;agrave; ng&amp;amp;agrave;y 20-11-2014 thầy c&amp;amp;ocirc; v&amp;amp;agrave; c&amp;amp;aacute;c em học sinh vẫn l&amp;amp;ecirc;n lớp b&amp;amp;igrave;nh thường.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Về h&amp;amp;igrave;nh thức, Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam năm nay được tổ chức gọn nhẹ hơn c&amp;amp;aacute;c năm học trước, nhưng về nội dung v&amp;amp;agrave; &amp;amp;yacute; nghĩa th&amp;amp;igrave; phong ph&amp;amp;uacute; v&amp;amp;agrave; s&amp;amp;acirc;u sắc hơn.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://www.pct.edu.vn/files/tintuc/20142015/20-11/HDGV_3.jpg&amp;quot; style=&amp;quot;height:200px; width:250px&amp;quot; /&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;- L&amp;amp;atilde;nh đạo nh&amp;amp;agrave; trường trực tiếp ph&amp;amp;aacute;t biểu trước c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o v&amp;amp;agrave; em học sinh về truyền thống &amp;amp;ldquo;t&amp;amp;ocirc;n sư trọng đạo&amp;amp;rdquo; của d&amp;amp;acirc;n tộc Việt Nam, vai tr&amp;amp;ograve; tr&amp;amp;aacute;ch nhiệm của thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o trong c&amp;amp;ocirc;ng t&amp;amp;aacute;c gi&amp;amp;aacute;o dục.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Đại diện cha mẹ học sinh, đại diện học sinh đ&amp;amp;atilde; b&amp;amp;agrave;y tỏ l&amp;amp;ograve;ng tri &amp;amp;acirc;n đến thầy c&amp;amp;ocirc;, những người đ&amp;amp;atilde; g&amp;amp;oacute;p phần quan trọng trong việc đ&amp;amp;agrave;o tạo c&amp;amp;aacute;c em học sinh trở th&amp;amp;agrave;nh những người c&amp;amp;oacute; &amp;amp;iacute;ch cho x&amp;amp;atilde; hội.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Tuy&amp;amp;ecirc;n dương khen thưởng c&amp;amp;aacute;n bộ, gi&amp;amp;aacute;o vi&amp;amp;ecirc;n v&amp;amp;agrave; nh&amp;amp;acirc;n vi&amp;amp;ecirc;n đạt được nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong việc thực hiện c&amp;amp;aacute;c nhiệm vụ của m&amp;amp;igrave;nh.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Gặp mặt v&amp;amp;agrave; đi thăm c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; nghỉ hưu.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Trao phần thưởng, học bổng cho c&amp;amp;aacute;c em học sinh đạt nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong học tập, học sinh c&amp;amp;oacute; ho&amp;amp;agrave;n cảnh kh&amp;amp;oacute; khăn&amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; Những hoạt động trong th&amp;amp;aacute;ng ch&amp;amp;agrave;o mừng Ng&amp;amp;agrave;y gi&amp;amp;aacute;o Việt Nam 20-11 sẽ được tiếp tục duy tr&amp;amp;igrave; v&amp;amp;agrave; ph&amp;amp;aacute;t triển, trở th&amp;amp;agrave;nh động lực gi&amp;amp;uacute;p cho c&amp;amp;aacute;c em học sinh ho&amp;amp;agrave;n th&amp;amp;agrave;nh tốt việc học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện của m&amp;amp;igrave;nh trong năm học 2014-2015.&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;HO&amp;amp;Agrave;NG QU&amp;amp;Acirc;N&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'20141120071855_20_11_anh_tuong_trung.jpg', CAST(N'2015-09-26 22:36:19.047' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (36, N'Trường THPT Phan Châu Trinh tổng kết năm học 2014 - 2015', N'Cuối tháng 5 năm 2015, sau khi hoàn thành chương trình dạy học, tổng kết điểm số, xếp loại thi đua… trường THPT Phan Châu Trinh tiến hành Tổng kết năm học 2014-2015 trong Hội đồng sư phạm và toàn thể học sinh.', N'&amp;lt;p&amp;gt;Qu&amp;amp;aacute;n triệt tinh thần đổi mới &amp;amp;ldquo;căn bản v&amp;amp;agrave; to&amp;amp;agrave;n diện&amp;amp;rdquo; hoạt động gi&amp;amp;aacute;o dục, trường THPT Phan Ch&amp;amp;acirc;u Trinh &amp;amp;ndash; Đ&amp;amp;agrave; Nẵng đ&amp;amp;atilde; tổ chức nhiều hoạt động thiết thực nhằm kỷ niệm 32 năm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11.&amp;lt;br /&amp;gt;
&amp;amp;nbsp; &amp;amp;nbsp;C&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; thực hiện nhiều đổi mới trong phương ph&amp;amp;aacute;p giảng dạy v&amp;amp;agrave; kiểm tra đ&amp;amp;aacute;nh gi&amp;amp;aacute;, nhiều thầy c&amp;amp;ocirc; đ&amp;amp;atilde; đăng k&amp;amp;yacute; c&amp;amp;aacute;c tiết dạy tốt nhằm hưởng ứng phong tr&amp;amp;agrave;o thi đua dạy tốt học tốt của to&amp;amp;agrave;n ng&amp;amp;agrave;nh. Về ph&amp;amp;iacute;a c&amp;amp;aacute;c em học sinh đ&amp;amp;atilde; đăng k&amp;amp;yacute; tuần học tốt, t&amp;amp;iacute;ch cực hoạt động trong học tập.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11 năm nay cũng c&amp;amp;oacute; nhiều đổi mới, ban văn nghệ nh&amp;amp;agrave; trường đ&amp;amp;atilde; tổ chức 2 đ&amp;amp;ecirc;m văn nghệ ch&amp;amp;agrave;o mừng (15 v&amp;amp;agrave; 16-11-2014) với nhiều tiết mục phong ph&amp;amp;uacute; do c&amp;amp;aacute;c em học sinh biểu diễn.&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Việc tổ chức Lễ kỷ niệm cũng được tổ chức trong tiết ch&amp;amp;agrave;o cờ đầu tuần (17-11-2014); chiều ng&amp;amp;agrave;y 19-11-2914, nh&amp;amp;agrave; trường d&amp;amp;agrave;nh 2 tiết cuối để tổ chức buổi sinh hoạt kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam trong Hội đồng gi&amp;amp;aacute;o dục.v&amp;amp;agrave; ng&amp;amp;agrave;y 20-11-2014 thầy c&amp;amp;ocirc; v&amp;amp;agrave; c&amp;amp;aacute;c em học sinh vẫn l&amp;amp;ecirc;n lớp b&amp;amp;igrave;nh thường.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Về h&amp;amp;igrave;nh thức, Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam năm nay được tổ chức gọn nhẹ hơn c&amp;amp;aacute;c năm học trước, nhưng về nội dung v&amp;amp;agrave; &amp;amp;yacute; nghĩa th&amp;amp;igrave; phong ph&amp;amp;uacute; v&amp;amp;agrave; s&amp;amp;acirc;u sắc hơn.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://www.pct.edu.vn/files/tintuc/20142015/20-11/HDGV_3.jpg&amp;quot; style=&amp;quot;height:200px; width:250px&amp;quot; /&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;- L&amp;amp;atilde;nh đạo nh&amp;amp;agrave; trường trực tiếp ph&amp;amp;aacute;t biểu trước c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o v&amp;amp;agrave; em học sinh về truyền thống &amp;amp;ldquo;t&amp;amp;ocirc;n sư trọng đạo&amp;amp;rdquo; của d&amp;amp;acirc;n tộc Việt Nam, vai tr&amp;amp;ograve; tr&amp;amp;aacute;ch nhiệm của thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o trong c&amp;amp;ocirc;ng t&amp;amp;aacute;c gi&amp;amp;aacute;o dục.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Đại diện cha mẹ học sinh, đại diện học sinh đ&amp;amp;atilde; b&amp;amp;agrave;y tỏ l&amp;amp;ograve;ng tri &amp;amp;acirc;n đến thầy c&amp;amp;ocirc;, những người đ&amp;amp;atilde; g&amp;amp;oacute;p phần quan trọng trong việc đ&amp;amp;agrave;o tạo c&amp;amp;aacute;c em học sinh trở th&amp;amp;agrave;nh những người c&amp;amp;oacute; &amp;amp;iacute;ch cho x&amp;amp;atilde; hội.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Tuy&amp;amp;ecirc;n dương khen thưởng c&amp;amp;aacute;n bộ, gi&amp;amp;aacute;o vi&amp;amp;ecirc;n v&amp;amp;agrave; nh&amp;amp;acirc;n vi&amp;amp;ecirc;n đạt được nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong việc thực hiện c&amp;amp;aacute;c nhiệm vụ của m&amp;amp;igrave;nh.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Gặp mặt v&amp;amp;agrave; đi thăm c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; nghỉ hưu.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Trao phần thưởng, học bổng cho c&amp;amp;aacute;c em học sinh đạt nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong học tập, học sinh c&amp;amp;oacute; ho&amp;amp;agrave;n cảnh kh&amp;amp;oacute; khăn&amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; Những hoạt động trong th&amp;amp;aacute;ng ch&amp;amp;agrave;o mừng Ng&amp;amp;agrave;y gi&amp;amp;aacute;o Việt Nam 20-11 sẽ được tiếp tục duy tr&amp;amp;igrave; v&amp;amp;agrave; ph&amp;amp;aacute;t triển, trở th&amp;amp;agrave;nh động lực gi&amp;amp;uacute;p cho c&amp;amp;aacute;c em học sinh ho&amp;amp;agrave;n th&amp;amp;agrave;nh tốt việc học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện của m&amp;amp;igrave;nh trong năm học 2014-2015.&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;HO&amp;amp;Agrave;NG QU&amp;amp;Acirc;N&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'20150601155733_pct_tong_ket_tuong_trung.jpg', CAST(N'2015-09-26 22:37:42.653' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (37, N'Thông tin về trao học bổng đầu năm học 2015-2016', N' Trong giờ chào cờ ngày thứ hai (07/9/2015), trường Phan Châu Trinh đã phối hợp với C.ty TNHH Đồng Tiến và CHS PCT (Lớp 12/1 – Khóa 1988-1991) tổ chức trao học bổng cho các em học sinh.', N'&amp;lt;p&amp;gt;Qu&amp;amp;aacute;n triệt tinh thần đổi mới &amp;amp;ldquo;căn bản v&amp;amp;agrave; to&amp;amp;agrave;n diện&amp;amp;rdquo; hoạt động gi&amp;amp;aacute;o dục, trường THPT Phan Ch&amp;amp;acirc;u Trinh &amp;amp;ndash; Đ&amp;amp;agrave; Nẵng đ&amp;amp;atilde; tổ chức nhiều hoạt động thiết thực nhằm kỷ niệm 32 năm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11.&amp;lt;br /&amp;gt;
&amp;amp;nbsp; &amp;amp;nbsp;C&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; thực hiện nhiều đổi mới trong phương ph&amp;amp;aacute;p giảng dạy v&amp;amp;agrave; kiểm tra đ&amp;amp;aacute;nh gi&amp;amp;aacute;, nhiều thầy c&amp;amp;ocirc; đ&amp;amp;atilde; đăng k&amp;amp;yacute; c&amp;amp;aacute;c tiết dạy tốt nhằm hưởng ứng phong tr&amp;amp;agrave;o thi đua dạy tốt học tốt của to&amp;amp;agrave;n ng&amp;amp;agrave;nh. Về ph&amp;amp;iacute;a c&amp;amp;aacute;c em học sinh đ&amp;amp;atilde; đăng k&amp;amp;yacute; tuần học tốt, t&amp;amp;iacute;ch cực hoạt động trong học tập.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11 năm nay cũng c&amp;amp;oacute; nhiều đổi mới, ban văn nghệ nh&amp;amp;agrave; trường đ&amp;amp;atilde; tổ chức 2 đ&amp;amp;ecirc;m văn nghệ ch&amp;amp;agrave;o mừng (15 v&amp;amp;agrave; 16-11-2014) với nhiều tiết mục phong ph&amp;amp;uacute; do c&amp;amp;aacute;c em học sinh biểu diễn.&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Việc tổ chức Lễ kỷ niệm cũng được tổ chức trong tiết ch&amp;amp;agrave;o cờ đầu tuần (17-11-2014); chiều ng&amp;amp;agrave;y 19-11-2914, nh&amp;amp;agrave; trường d&amp;amp;agrave;nh 2 tiết cuối để tổ chức buổi sinh hoạt kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam trong Hội đồng gi&amp;amp;aacute;o dục.v&amp;amp;agrave; ng&amp;amp;agrave;y 20-11-2014 thầy c&amp;amp;ocirc; v&amp;amp;agrave; c&amp;amp;aacute;c em học sinh vẫn l&amp;amp;ecirc;n lớp b&amp;amp;igrave;nh thường.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Về h&amp;amp;igrave;nh thức, Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam năm nay được tổ chức gọn nhẹ hơn c&amp;amp;aacute;c năm học trước, nhưng về nội dung v&amp;amp;agrave; &amp;amp;yacute; nghĩa th&amp;amp;igrave; phong ph&amp;amp;uacute; v&amp;amp;agrave; s&amp;amp;acirc;u sắc hơn.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://www.pct.edu.vn/files/tintuc/20142015/20-11/HDGV_3.jpg&amp;quot; style=&amp;quot;height:200px; width:250px&amp;quot; /&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;- L&amp;amp;atilde;nh đạo nh&amp;amp;agrave; trường trực tiếp ph&amp;amp;aacute;t biểu trước c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o v&amp;amp;agrave; em học sinh về truyền thống &amp;amp;ldquo;t&amp;amp;ocirc;n sư trọng đạo&amp;amp;rdquo; của d&amp;amp;acirc;n tộc Việt Nam, vai tr&amp;amp;ograve; tr&amp;amp;aacute;ch nhiệm của thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o trong c&amp;amp;ocirc;ng t&amp;amp;aacute;c gi&amp;amp;aacute;o dục.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Đại diện cha mẹ học sinh, đại diện học sinh đ&amp;amp;atilde; b&amp;amp;agrave;y tỏ l&amp;amp;ograve;ng tri &amp;amp;acirc;n đến thầy c&amp;amp;ocirc;, những người đ&amp;amp;atilde; g&amp;amp;oacute;p phần quan trọng trong việc đ&amp;amp;agrave;o tạo c&amp;amp;aacute;c em học sinh trở th&amp;amp;agrave;nh những người c&amp;amp;oacute; &amp;amp;iacute;ch cho x&amp;amp;atilde; hội.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Tuy&amp;amp;ecirc;n dương khen thưởng c&amp;amp;aacute;n bộ, gi&amp;amp;aacute;o vi&amp;amp;ecirc;n v&amp;amp;agrave; nh&amp;amp;acirc;n vi&amp;amp;ecirc;n đạt được nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong việc thực hiện c&amp;amp;aacute;c nhiệm vụ của m&amp;amp;igrave;nh.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Gặp mặt v&amp;amp;agrave; đi thăm c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; nghỉ hưu.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Trao phần thưởng, học bổng cho c&amp;amp;aacute;c em học sinh đạt nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong học tập, học sinh c&amp;amp;oacute; ho&amp;amp;agrave;n cảnh kh&amp;amp;oacute; khăn&amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; Những hoạt động trong th&amp;amp;aacute;ng ch&amp;amp;agrave;o mừng Ng&amp;amp;agrave;y gi&amp;amp;aacute;o Việt Nam 20-11 sẽ được tiếp tục duy tr&amp;amp;igrave; v&amp;amp;agrave; ph&amp;amp;aacute;t triển, trở th&amp;amp;agrave;nh động lực gi&amp;amp;uacute;p cho c&amp;amp;aacute;c em học sinh ho&amp;amp;agrave;n th&amp;amp;agrave;nh tốt việc học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện của m&amp;amp;igrave;nh trong năm học 2014-2015.&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;HO&amp;amp;Agrave;NG QU&amp;amp;Acirc;N&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'20150601155733_pct_tong_ket_tuong_trung.jpg', CAST(N'2015-09-26 22:39:24.723' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (38, N'Thông tin về trao học bổng đầu năm học 2015-2016', N' Trong giờ chào cờ ngày thứ hai (07/9/2015), trường Phan Châu Trinh đã phối hợp với C.ty TNHH Đồng Tiến và CHS PCT (Lớp 12/1 – Khóa 1988-1991) tổ chức trao học bổng cho các em học sinh.', N'&amp;lt;p&amp;gt;Qu&amp;amp;aacute;n triệt tinh thần đổi mới &amp;amp;ldquo;căn bản v&amp;amp;agrave; to&amp;amp;agrave;n diện&amp;amp;rdquo; hoạt động gi&amp;amp;aacute;o dục, trường THPT Phan Ch&amp;amp;acirc;u Trinh &amp;amp;ndash; Đ&amp;amp;agrave; Nẵng đ&amp;amp;atilde; tổ chức nhiều hoạt động thiết thực nhằm kỷ niệm 32 năm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11.&amp;lt;br /&amp;gt;
&amp;amp;nbsp; &amp;amp;nbsp;C&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; thực hiện nhiều đổi mới trong phương ph&amp;amp;aacute;p giảng dạy v&amp;amp;agrave; kiểm tra đ&amp;amp;aacute;nh gi&amp;amp;aacute;, nhiều thầy c&amp;amp;ocirc; đ&amp;amp;atilde; đăng k&amp;amp;yacute; c&amp;amp;aacute;c tiết dạy tốt nhằm hưởng ứng phong tr&amp;amp;agrave;o thi đua dạy tốt học tốt của to&amp;amp;agrave;n ng&amp;amp;agrave;nh. Về ph&amp;amp;iacute;a c&amp;amp;aacute;c em học sinh đ&amp;amp;atilde; đăng k&amp;amp;yacute; tuần học tốt, t&amp;amp;iacute;ch cực hoạt động trong học tập.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam 20-11 năm nay cũng c&amp;amp;oacute; nhiều đổi mới, ban văn nghệ nh&amp;amp;agrave; trường đ&amp;amp;atilde; tổ chức 2 đ&amp;amp;ecirc;m văn nghệ ch&amp;amp;agrave;o mừng (15 v&amp;amp;agrave; 16-11-2014) với nhiều tiết mục phong ph&amp;amp;uacute; do c&amp;amp;aacute;c em học sinh biểu diễn.&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;
			&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Việc tổ chức Lễ kỷ niệm cũng được tổ chức trong tiết ch&amp;amp;agrave;o cờ đầu tuần (17-11-2014); chiều ng&amp;amp;agrave;y 19-11-2914, nh&amp;amp;agrave; trường d&amp;amp;agrave;nh 2 tiết cuối để tổ chức buổi sinh hoạt kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam trong Hội đồng gi&amp;amp;aacute;o dục.v&amp;amp;agrave; ng&amp;amp;agrave;y 20-11-2014 thầy c&amp;amp;ocirc; v&amp;amp;agrave; c&amp;amp;aacute;c em học sinh vẫn l&amp;amp;ecirc;n lớp b&amp;amp;igrave;nh thường.&amp;lt;br /&amp;gt;
			&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;Về h&amp;amp;igrave;nh thức, Lễ kỷ niệm Ng&amp;amp;agrave;y Nh&amp;amp;agrave; gi&amp;amp;aacute;o Việt Nam năm nay được tổ chức gọn nhẹ hơn c&amp;amp;aacute;c năm học trước, nhưng về nội dung v&amp;amp;agrave; &amp;amp;yacute; nghĩa th&amp;amp;igrave; phong ph&amp;amp;uacute; v&amp;amp;agrave; s&amp;amp;acirc;u sắc hơn.&amp;lt;/p&amp;gt;
			&amp;lt;/td&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;http://www.pct.edu.vn/files/tintuc/20142015/20-11/HDGV_3.jpg&amp;quot; style=&amp;quot;height:200px; width:250px&amp;quot; /&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;- L&amp;amp;atilde;nh đạo nh&amp;amp;agrave; trường trực tiếp ph&amp;amp;aacute;t biểu trước c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o v&amp;amp;agrave; em học sinh về truyền thống &amp;amp;ldquo;t&amp;amp;ocirc;n sư trọng đạo&amp;amp;rdquo; của d&amp;amp;acirc;n tộc Việt Nam, vai tr&amp;amp;ograve; tr&amp;amp;aacute;ch nhiệm của thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o trong c&amp;amp;ocirc;ng t&amp;amp;aacute;c gi&amp;amp;aacute;o dục.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Đại diện cha mẹ học sinh, đại diện học sinh đ&amp;amp;atilde; b&amp;amp;agrave;y tỏ l&amp;amp;ograve;ng tri &amp;amp;acirc;n đến thầy c&amp;amp;ocirc;, những người đ&amp;amp;atilde; g&amp;amp;oacute;p phần quan trọng trong việc đ&amp;amp;agrave;o tạo c&amp;amp;aacute;c em học sinh trở th&amp;amp;agrave;nh những người c&amp;amp;oacute; &amp;amp;iacute;ch cho x&amp;amp;atilde; hội.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Tuy&amp;amp;ecirc;n dương khen thưởng c&amp;amp;aacute;n bộ, gi&amp;amp;aacute;o vi&amp;amp;ecirc;n v&amp;amp;agrave; nh&amp;amp;acirc;n vi&amp;amp;ecirc;n đạt được nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong việc thực hiện c&amp;amp;aacute;c nhiệm vụ của m&amp;amp;igrave;nh.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Gặp mặt v&amp;amp;agrave; đi thăm c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o đ&amp;amp;atilde; nghỉ hưu.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; - Trao phần thưởng, học bổng cho c&amp;amp;aacute;c em học sinh đạt nhiều th&amp;amp;agrave;nh t&amp;amp;iacute;ch trong học tập, học sinh c&amp;amp;oacute; ho&amp;amp;agrave;n cảnh kh&amp;amp;oacute; khăn&amp;amp;hellip;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; Những hoạt động trong th&amp;amp;aacute;ng ch&amp;amp;agrave;o mừng Ng&amp;amp;agrave;y gi&amp;amp;aacute;o Việt Nam 20-11 sẽ được tiếp tục duy tr&amp;amp;igrave; v&amp;amp;agrave; ph&amp;amp;aacute;t triển, trở th&amp;amp;agrave;nh động lực gi&amp;amp;uacute;p cho c&amp;amp;aacute;c em học sinh ho&amp;amp;agrave;n th&amp;amp;agrave;nh tốt việc học tập v&amp;amp;agrave; r&amp;amp;egrave;n luyện của m&amp;amp;igrave;nh trong năm học 2014-2015.&amp;lt;/p&amp;gt;

&amp;lt;table border=&amp;quot;0&amp;quot;&amp;gt;
	&amp;lt;tbody&amp;gt;
		&amp;lt;tr&amp;gt;
			&amp;lt;td&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;HO&amp;amp;Agrave;NG QU&amp;amp;Acirc;N&amp;lt;/strong&amp;gt;&amp;lt;/td&amp;gt;
		&amp;lt;/tr&amp;gt;
	&amp;lt;/tbody&amp;gt;
&amp;lt;/table&amp;gt;
', 0, 1, N'20150601155733_pct_tong_ket_tuong_trung.jpg', CAST(N'2015-09-26 22:39:32.807' AS DateTime), 3, N'admin')
INSERT [dbo].[BaiViet] ([MaBV], [TieuDe], [TomTat], [NoiDung], [NoiBat], [TrangThai], [Anh], [NgayCapNhat], [MaLoai], [TaiKhoan]) VALUES (39, N'Trường THPT XYZ triển khai dạy - học lịch sử', N'Thực hiện chỉ đạo của Sở Giáo dục và Đào tạo thành phố Đà Nẵng theo tinh thần công văn số 1226/SGDĐT-GDTrH, ngày 21 tháng 4 năm 2015 về việc Hướng dẫn dạy học sách Lịch sử Đà Nẵng THCS và THPT, Hiệu trưởng trường THPT Phan Châu Trinh', N'&amp;lt;p&amp;gt;Thực hiện chỉ đạo của Sở Gi&amp;amp;aacute;o dục v&amp;amp;agrave; Đ&amp;amp;agrave;o tạo th&amp;amp;agrave;nh phố Đ&amp;amp;agrave; Nẵng theo tinh thần c&amp;amp;ocirc;ng văn số 1226/SGDĐT-GDTrH, ng&amp;amp;agrave;y 21 th&amp;amp;aacute;ng 4 năm 2015 về việc Hướng dẫn dạy học s&amp;amp;aacute;ch&amp;amp;nbsp;&amp;lt;em&amp;gt;Lịch sử Đ&amp;amp;agrave; Nẵng&amp;amp;nbsp;&amp;lt;/em&amp;gt;THCS v&amp;amp;agrave; THPT, Hiệu trưởng trường THPT Phan Ch&amp;amp;acirc;u Trinh &amp;amp;ndash; Đ&amp;amp;agrave; Nẵng đ&amp;amp;atilde; chỉ đạo Tổ chuy&amp;amp;ecirc;n m&amp;amp;ocirc;n Lịch sử của nh&amp;amp;agrave; trường triển khai kế hoạch dạy học&amp;amp;nbsp;&amp;lt;em&amp;gt;Lịch sử Đ&amp;amp;agrave; Nẵng&amp;amp;nbsp;&amp;lt;/em&amp;gt;ngay trong thời điểm cuối học k&amp;amp;igrave; 2 của năm học 2014-2015:&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;- Đối với học sinh khối lớp 10 v&amp;amp;agrave; 11, sẽ tổ chức dưới h&amp;amp;igrave;nh thức b&amp;amp;aacute;o c&amp;amp;aacute;o ngoại kh&amp;amp;oacute;a tại Hội trường theo từng nh&amp;amp;oacute;m lớp (c&amp;amp;aacute;c ng&amp;amp;agrave;y 27-4 v&amp;amp;agrave; 4-5-2015). Nội dung về lịch sử Đ&amp;amp;agrave; Nẵng nằm trong chương tr&amp;amp;igrave;nh &amp;amp;ocirc;n tập kiểm tra cuối học k&amp;amp;igrave; như c&amp;amp;aacute;c b&amp;amp;agrave;i học kh&amp;amp;aacute;c.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; - Đối với học sinh khối lớp 12, đ&amp;amp;atilde; ho&amp;amp;agrave;n th&amp;amp;agrave;nh việc kiểm tra học k&amp;amp;igrave; 2, thời gian c&amp;amp;ograve;n lại từ nay đến cuối năm học, gi&amp;amp;aacute;o vi&amp;amp;ecirc;n bộ m&amp;amp;ocirc;n lịch sử sẽ triển khai dạy học tr&amp;amp;ecirc;n lớp, đặc biệt ch&amp;amp;uacute; &amp;amp;yacute; về vấn đề chủ quyền của Việt Nam đối với quần đảo Ho&amp;amp;agrave;ng Sa &amp;amp;ndash; một đơn vị h&amp;amp;agrave;nh ch&amp;amp;iacute;nh trực thuộc th&amp;amp;agrave;nh phố Đ&amp;amp;agrave; Nẵng.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; Cấu tr&amp;amp;uacute;c nội dung Lịch sử Đ&amp;amp;agrave; Nẵng ở cấp trung học phổ th&amp;amp;ocirc;ng gồm c&amp;amp;aacute;c b&amp;amp;agrave;i học như sau:&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; B&amp;amp;agrave;i 1 (Lớp 10): Đ&amp;amp;agrave; Nẵng từ khởi thủy đến giữa thế kỉ XIX&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 1. Dấu t&amp;amp;iacute;ch thời nguy&amp;amp;ecirc;n thủy&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 2. Đ&amp;amp;agrave; Nẵng trở th&amp;amp;agrave;nh bộ phận l&amp;amp;atilde;nh thổ của Đại Việt&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 3. Quần đảo Ho&amp;amp;agrave;ng Sa &amp;amp;ndash; v&amp;amp;ugrave;ng l&amp;amp;atilde;nh thổ thi&amp;amp;ecirc;ng li&amp;amp;ecirc;ng của Đại Việt&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 4. Đ&amp;amp;agrave; Nẵng v&amp;amp;agrave; Hội An trong c&amp;amp;aacute;c thế kỉ XVI &amp;amp;ndash; XIX&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; B&amp;amp;agrave;i 2 (Lớp 11): Đ&amp;amp;agrave; Nẵng từ giữa thế kỉ XIX đến đầu thế kỉ XX&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 1. Đ&amp;amp;agrave; Nẵng trong quan hệ với phương T&amp;amp;acirc;y v&amp;amp;agrave; c&amp;amp;ocirc;ng cuộc bố ph&amp;amp;ograve;ng của nh&amp;amp;agrave; Nguyễn&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 2. Quần đảo Ho&amp;amp;agrave;ng Sa dưới triều Nguyễn&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 3. Đ&amp;amp;agrave; Nẵng trong những ng&amp;amp;agrave;y đầu kh&amp;amp;aacute;ng chiến chống thực d&amp;amp;acirc;n Ph&amp;amp;aacute;p&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 4. Địa danh Đ&amp;amp;agrave; Nẵng qua c&amp;amp;aacute;c thời k&amp;amp;igrave;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; B&amp;amp;agrave;i 3 (Lớp 12): Đ&amp;amp;agrave; Nẵng trong cuộc vận động giải ph&amp;amp;oacute;ng d&amp;amp;acirc;n tộc v&amp;amp;agrave;&amp;lt;/strong&amp;gt;&amp;amp;nbsp;&amp;lt;strong&amp;gt;kh&amp;amp;aacute;ng chiến chống thực d&amp;amp;acirc;n Ph&amp;amp;aacute;p (1885 &amp;amp;ndash; 1954).&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 1. Đ&amp;amp;agrave; Nẵng trong bước chuyển lớn của phong tr&amp;amp;agrave;o giải ph&amp;amp;oacute;ng d&amp;amp;acirc;n tộc (1885 &amp;amp;ndash; 1930)&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 2. Đ&amp;amp;agrave; Nẵng trong cuộc vận động c&amp;amp;aacute;ch mạng tiến tới tổng khởi nghĩa th&amp;amp;aacute;ng T&amp;amp;aacute;m năm 1945&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 3. Đ&amp;amp;agrave; Nẵng trong những ng&amp;amp;agrave;y đầu to&amp;amp;agrave;n quốc kh&amp;amp;aacute;ng chiến chống thực d&amp;amp;acirc;n Ph&amp;amp;aacute;p (từ 12-1946 đến 1-1947)&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 4. Quần đảo Ho&amp;amp;agrave;ng Sa từ năm 1884 đến năm 1954&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; B&amp;amp;agrave;i 4 (Lớp 12): Đ&amp;amp;agrave; Nẵng trong cuộc kh&amp;amp;aacute;ng chiến chống Mĩ, cứu nước (1954 &amp;amp;ndash; 1975) v&amp;amp;agrave; thời k&amp;amp;igrave; x&amp;amp;acirc;y dựng đất nước từ sau năm 1975&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 1. Phong tr&amp;amp;agrave;o đấu tranh đ&amp;amp;ograve;i thi h&amp;amp;agrave;nh Hiệp định Giơ-ne-vơ, đ&amp;amp;ograve;i quyền d&amp;amp;acirc;n sinh, d&amp;amp;acirc;n chủ (1954 &amp;amp;ndash; 1956)&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 2. Phong tr&amp;amp;agrave;o đấu tranh ch&amp;amp;iacute;nh trị của học sinh, sinh vi&amp;amp;ecirc;n v&amp;amp;agrave; c&amp;amp;aacute;c tầng lớp nh&amp;amp;acirc;n d&amp;amp;acirc;n (1963 &amp;amp;ndash; 1974)&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 3. Đ&amp;amp;agrave; Nẵng trong cuộc Tổng tiến c&amp;amp;ocirc;ng v&amp;amp;agrave; nổi dậy Xu&amp;amp;acirc;n 1975&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 4. Đ&amp;amp;agrave; Nẵng từ năm 1975 đến nay&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; 5. Quần đảo Ho&amp;amp;agrave;ng Sa từ sau năm 1954 đến nay.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; C&amp;amp;aacute;c tiết học về Lịch sử Đ&amp;amp;agrave; Nẵng đ&amp;amp;atilde; được c&amp;amp;aacute;c thầy c&amp;amp;ocirc; gi&amp;amp;aacute;o bộ m&amp;amp;ocirc;n lịch sử chuẩn bị rất chu đ&amp;amp;aacute;o, C&amp;amp;Oacute; CH&amp;amp;Uacute; &amp;amp;Yacute; ứng dụng c&amp;amp;ocirc;ng nghệ th&amp;amp;ocirc;ng để cung cấp cho người học những h&amp;amp;igrave;nh ảnh, bản đồ, tư liệu rất phong ph&amp;amp;uacute;. S&amp;amp;aacute;ch&amp;amp;nbsp;&amp;lt;em&amp;gt;Lịch sử Đ&amp;amp;agrave; Nẵng&amp;amp;nbsp;&amp;lt;/em&amp;gt;THCS v&amp;amp;agrave; THPT vừa l&amp;amp;agrave; t&amp;amp;agrave;i liệu được sử dụng như s&amp;amp;aacute;ch gi&amp;amp;aacute;o khoa, vừa l&amp;amp;agrave; nguồn cung cấp t&amp;amp;agrave;i liệu c&amp;amp;ugrave;ng với những chỉ dẫn khoa học để người học cũng như những người c&amp;amp;oacute; quan t&amp;amp;acirc;m tiếp tục t&amp;amp;igrave;m hiểu v&amp;amp;agrave; mở rộng kiến thức về c&amp;amp;aacute;c nội dung cơ bản m&amp;amp;agrave; t&amp;amp;agrave;i liệu đ&amp;amp;atilde; cung cấp.&amp;lt;/p&amp;gt;

&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;HO&amp;amp;Agrave;NG QU&amp;amp;Acirc;N&amp;lt;/p&amp;gt;
', 0, 1, N'20150504140911_lsdn_00.jpg', CAST(N'2015-09-26 22:40:45.937' AS DateTime), 3, N'admin')
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
SET IDENTITY_INSERT [dbo].[BoMon] ON 

INSERT [dbo].[BoMon] ([MaBM], [TenBM], [MoTa], [TrangThai], [TaiKhoan]) VALUES (10, N'Hóa học 6', N'Hóa học 56', 1, N'admin')
SET IDENTITY_INSERT [dbo].[BoMon] OFF
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau], [HoTen], [TrangThai]) VALUES (N'admin', N'admin', N'Nguyễn Văn A', 1)
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (1, N'Giới thiệu trường', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (2, N'Giới thiệu cơ cấu tổ chức', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (3, N'Tin hoạt động', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (4, N'Thông tin giáo dục', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (5, N'Thông báo trường', N'')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (6, N'Thông báo học sinh', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (7, N'Tuyển sinh', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (8, N'Bảng vàng học sinh', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (9, N'Lịch công tác tuần', NULL)
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [MoTa]) VALUES (10, N'Tài nguyên học tập', NULL)
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
SET IDENTITY_INSERT [dbo].[TrangLienKet] ON 

INSERT [dbo].[TrangLienKet] ([ID], [TenSite], [URL], [Target], [TrangThai], [TaiKhoan]) VALUES (1, N'Bộ giáo dục và Đào tạo', N'http://www.moet.gov.vn', N'_blank', 1, N'admin')
INSERT [dbo].[TrangLienKet] ([ID], [TenSite], [URL], [Target], [TrangThai], [TaiKhoan]) VALUES (2, N'Sở giáo dục Đồng Tháp', N'http://dongthap.edu.vn/', N'_blank', 1, N'admin')
INSERT [dbo].[TrangLienKet] ([ID], [TenSite], [URL], [Target], [TrangThai], [TaiKhoan]) VALUES (3, N'Thư viện tài liệu trực tuyến', N'http://tailieu.vn/', N'_blank', 1, N'admin')
INSERT [dbo].[TrangLienKet] ([ID], [TenSite], [URL], [Target], [TrangThai], [TaiKhoan]) VALUES (4, N'Thư viện Violet', N'http://violet.vn/main/', N'_blank', 1, N'admin')
SET IDENTITY_INSERT [dbo].[TrangLienKet] OFF
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_NguoiDung] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[NguoiDung] ([TaiKhoan])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_NguoiDung]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_NguoiDung] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[NguoiDung] ([TaiKhoan])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_NguoiDung]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_TheLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_TheLoai]
GO
ALTER TABLE [dbo].[BoMon]  WITH CHECK ADD  CONSTRAINT [FK_BoMon_NguoiDung] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[NguoiDung] ([TaiKhoan])
GO
ALTER TABLE [dbo].[BoMon] CHECK CONSTRAINT [FK_BoMon_NguoiDung]
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnh_Album] FOREIGN KEY([IDAlbum])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [FK_HinhAnh_Album]
GO
ALTER TABLE [dbo].[TrangLienKet]  WITH CHECK ADD  CONSTRAINT [FK_TrangLienKet_NguoiDung] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[NguoiDung] ([TaiKhoan])
GO
ALTER TABLE [dbo].[TrangLienKet] CHECK CONSTRAINT [FK_TrangLienKet_NguoiDung]
GO
/****** Object:  StoredProcedure [dbo].[Album_DanhSach]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Album_DanhSach]
AS
	SELECT * FROM Album
	ORDER BY NgayCapNhat DESC

GO
/****** Object:  StoredProcedure [dbo].[Album_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Album_Delete]
  @ID int
AS BEGIN
    DELETE [Album] WHERE    [ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[Album_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Album_GetAll]
AS BEGIN
    SELECT 
[Album].[Anh]
,[Album].[ID]
,[Album].[MoTa]
,[Album].[NgayCapNhat]
,[Album].[TaiKhoan]
,[Album].[TenAlbum]
,[NguoiDungJoin].[HoTen] as [HoTen_NguoiDungJoin]
,[NguoiDungJoin].[MatKhau] as [MatKhau_NguoiDungJoin]
,[NguoiDungJoin].[TrangThai] as [TrangThai_NguoiDungJoin] FROM [Album] as [Album] 
    
join [NguoiDung] as [NguoiDungJoin] on [Album].[TaiKhoan] = [NguoiDungJoin].[TaiKhoan] 
    
END;

GO
/****** Object:  StoredProcedure [dbo].[Album_GetByID]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Album_GetByID]
@ID int
AS BEGIN
    SELECT 
    
[Album].[Anh]
,[Album].[ID]
,[Album].[MoTa]
,[Album].[NgayCapNhat]
,[Album].[TaiKhoan]
,[Album].[TenAlbum]
,[NguoiDungJoin].[HoTen] as [HoTen_NguoiDungJoin]
,[NguoiDungJoin].[MatKhau] as [MatKhau_NguoiDungJoin]
,[NguoiDungJoin].[TrangThai] as [TrangThai_NguoiDungJoin] 
    FROM [Album] as [Album] 
    
join [NguoiDung] as [NguoiDungJoin] on [Album].[TaiKhoan] = [NguoiDungJoin].[TaiKhoan] 
     WHERE [Album].[ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[Album_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Album_Insert]
 @Anh nvarchar(50), @MoTa nvarchar(300), @NgayCapNhat datetime, @TaiKhoan nvarchar(100), @TenAlbum nvarchar(200)
AS BEGIN
    INSERT INTO [Album](  [Anh] , [MoTa] , [NgayCapNhat] , [TaiKhoan] , [TenAlbum]) VALUES( @Anh, @MoTa, @NgayCapNhat, @TaiKhoan, @TenAlbum)
END;

GO
/****** Object:  StoredProcedure [dbo].[Album_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Album_Update]
 @Anh nvarchar(50), @ID int, @MoTa nvarchar(300), @NgayCapNhat datetime, @TaiKhoan nvarchar(100), @TenAlbum nvarchar(200)
AS BEGIN
    UPDATE [Album] SET  [Anh] = @Anh, [MoTa] = @MoTa, [NgayCapNhat] = @NgayCapNhat, [TaiKhoan] = @TaiKhoan, [TenAlbum] = @TenAlbum WHERE   [ID] = @ID
END;

GO
/****** Object:  StoredProcedure [dbo].[BaiViet_CapNhat]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BaiViet_CapNhat]
	@MaBV int,
	@TieuDe nvarchar(150),
	@TomTat nvarchar(300),
	@NoiDung ntext,
	@NoiBat bit,
	@TrangThai bit,
	@Anh nvarchar(50),	
	@MaLoai int,
	@TaiKhoan nvarchar(100)
AS
	UPDATE BaiViet
	SET TieuDe=@TieuDe,
		TomTat=@TomTat,
		NoiDung=@NoiDung,
		NoiBat=@NoiBat,
		TrangThai=@TrangThai,
		Anh=@Anh,
		MaLoai=@MaLoai,
		TaiKhoan=@TaiKhoan
	WHERE MaBV=@MaBV

GO
/****** Object:  StoredProcedure [dbo].[BaiViet_ChiTiet]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[BaiViet_ChiTiet]
	@MaBV int
AS
	SELECT * FROM BaiViet WHERE MaBV=@MaBV

GO
/****** Object:  StoredProcedure [dbo].[BaiViet_DanhSach]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BaiViet_DanhSach]
	@TuKhoa nvarchar(150),
	@MaLoai int
AS
	IF @TuKhoa <> '' AND @MaLoai <> 0 
		SELECT B.*,T.TenLoai 
		FROM BaiViet B INNER JOIN TheLoai T ON B.MaLoai=T.MaLoai
		WHERE TieuDe like @TuKhoa AND B.MaLoai=@MaLoai
		ORDER BY NgayCapNhat DESC
	ELSE
		SELECT B.*,T.TenLoai 
		FROM BaiViet B INNER JOIN TheLoai T ON B.MaLoai=T.MaLoai
		WHERE TieuDe like @TuKhoa OR B.MaLoai=@MaLoai
		ORDER BY NgayCapNhat DESC

GO
/****** Object:  StoredProcedure [dbo].[BaiViet_NoiBat]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BaiViet_NoiBat]
AS
	SELECT * FROM BaiViet 
	WHERE NoiBat=1 AND TrangThai=1 AND MaLoai=3
	ORDER BY NgayCapNhat DESC

GO
/****** Object:  StoredProcedure [dbo].[BaiViet_Them]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BaiViet_Them]
	@TieuDe nvarchar(150),
	@TomTat nvarchar(300),
	@NoiDung ntext,
	@NoiBat bit,
	@TrangThai bit,
	@Anh nvarchar(50),
	@NgayCapNhat datetime,
	@MaLoai int,
	@TaiKhoan nvarchar(100)
AS
	INSERT INTO BaiViet(TieuDe,TomTat,NoiDung,NoiBat,TrangThai,Anh,NgayCapNhat,MaLoai,TaiKhoan)
	VALUES(@TieuDe,@TomTat,@NoiDung,@NoiBat,@TrangThai,@Anh,@NgayCapNhat,@MaLoai,@TaiKhoan)

GO
/****** Object:  StoredProcedure [dbo].[BaiViet_Xoa]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BaiViet_Xoa]
	@MaBV int	
AS
	DELETE FROM BaiViet WHERE MaBV=@MaBV

GO
/****** Object:  StoredProcedure [dbo].[BoMon_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[BoMon_Delete]
  @MaBM int
AS BEGIN
    DELETE [BoMon] WHERE    [MaBM] = @MaBM 
END;

GO
/****** Object:  StoredProcedure [dbo].[BoMon_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[BoMon_GetAll]
AS BEGIN
    SELECT 
[BoMon].[MaBM]
,[BoMon].[MoTa]
,[BoMon].[TaiKhoan]
,[BoMon].[TenBM]
,[BoMon].[TrangThai]
,[NguoiDungJoin].[HoTen] as [HoTen_NguoiDungJoin]
,[NguoiDungJoin].[MatKhau] as [MatKhau_NguoiDungJoin]
,[NguoiDungJoin].[TrangThai] as [TrangThai_NguoiDungJoin] FROM [BoMon] as [BoMon] 
    
join [NguoiDung] as [NguoiDungJoin] on [BoMon].[TaiKhoan] = [NguoiDungJoin].[TaiKhoan] 
    
END;

GO
/****** Object:  StoredProcedure [dbo].[BoMon_GetByMaBM]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[BoMon_GetByMaBM]
@MaBM int
AS BEGIN
    SELECT 
    
[BoMon].[MaBM]
,[BoMon].[MoTa]
,[BoMon].[TaiKhoan]
,[BoMon].[TenBM]
,[BoMon].[TrangThai]
,[NguoiDungJoin].[HoTen] as [HoTen_NguoiDungJoin]
,[NguoiDungJoin].[MatKhau] as [MatKhau_NguoiDungJoin]
,[NguoiDungJoin].[TrangThai] as [TrangThai_NguoiDungJoin] 
    FROM [BoMon] as [BoMon] 
    
join [NguoiDung] as [NguoiDungJoin] on [BoMon].[TaiKhoan] = [NguoiDungJoin].[TaiKhoan] 
     WHERE [BoMon].[MaBM] = @MaBM 
END;

GO
/****** Object:  StoredProcedure [dbo].[BoMon_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;CREATE PROC [dbo].[BoMon_Insert]
 @MoTa ntext, @TaiKhoan nvarchar(100), @TenBM nvarchar(150), @TrangThai bit
AS BEGIN
    INSERT INTO [BoMon](  [MoTa] , [TaiKhoan] , [TenBM] , [TrangThai]) VALUES( @MoTa, @TaiKhoan, @TenBM, @TrangThai)
END;
GO
/****** Object:  StoredProcedure [dbo].[BoMon_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;CREATE PROC [dbo].[BoMon_Update]
 @MaBM int, @MoTa ntext , @TaiKhoan nvarchar(100), @TenBM nvarchar(150), @TrangThai bit
AS BEGIN
    UPDATE [BoMon] SET  [MoTa] = @MoTa, [TaiKhoan] = @TaiKhoan, [TenBM] = @TenBM, [TrangThai] = @TrangThai WHERE   [MaBM] = @MaBM
END;
GO
/****** Object:  StoredProcedure [dbo].[HinhAnh_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[HinhAnh_Delete]
  @ID int
AS BEGIN
    DELETE [HinhAnh] WHERE    [ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[HinhAnh_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[HinhAnh_GetAll]
AS BEGIN
    SELECT 
[HinhAnh].[AnhLon]
,[HinhAnh].[AnhNho]
,[HinhAnh].[ID]
,[HinhAnh].[IDAlbum]
,[AlbumJoin].[Anh] as [Anh_AlbumJoin]
,[AlbumJoin].[MoTa] as [MoTa_AlbumJoin]
,[AlbumJoin].[NgayCapNhat] as [NgayCapNhat_AlbumJoin]
,[AlbumJoin].[TaiKhoan] as [TaiKhoan_AlbumJoin]
,[AlbumJoin].[TenAlbum] as [TenAlbum_AlbumJoin] FROM [HinhAnh] as [HinhAnh] 
    
join [Album] as [AlbumJoin] on [HinhAnh].[IDAlbum] = [AlbumJoin].[ID] 
    
END;

GO
/****** Object:  StoredProcedure [dbo].[HinhAnh_GetByID]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[HinhAnh_GetByID]
@ID int
AS BEGIN
    SELECT 
    
[HinhAnh].[AnhLon]
,[HinhAnh].[AnhNho]
,[HinhAnh].[ID]
,[HinhAnh].[IDAlbum]
,[AlbumJoin].[Anh] as [Anh_AlbumJoin]
,[AlbumJoin].[MoTa] as [MoTa_AlbumJoin]
,[AlbumJoin].[NgayCapNhat] as [NgayCapNhat_AlbumJoin]
,[AlbumJoin].[TaiKhoan] as [TaiKhoan_AlbumJoin]
,[AlbumJoin].[TenAlbum] as [TenAlbum_AlbumJoin] 
    FROM [HinhAnh] as [HinhAnh] 
    
join [Album] as [AlbumJoin] on [HinhAnh].[IDAlbum] = [AlbumJoin].[ID] 
     WHERE [HinhAnh].[ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[HinhAnh_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[HinhAnh_Insert]
 @AnhLon nvarchar(50), @AnhNho nvarchar(50), @IDAlbum int
AS BEGIN
    INSERT INTO [HinhAnh](  [AnhLon] , [AnhNho] , [IDAlbum]) VALUES( @AnhLon, @AnhNho, @IDAlbum)
END;

GO
/****** Object:  StoredProcedure [dbo].[HinhAnh_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[HinhAnh_Update]
 @AnhLon nvarchar(50), @AnhNho nvarchar(50), @ID int, @IDAlbum int
AS BEGIN
    UPDATE [HinhAnh] SET  [AnhLon] = @AnhLon, [AnhNho] = @AnhNho, [IDAlbum] = @IDAlbum WHERE   [ID] = @ID
END;

GO
/****** Object:  StoredProcedure [dbo].[LienHe_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[LienHe_Delete]
  @ID int
AS BEGIN
    DELETE [LienHe] WHERE    [ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[LienHe_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[LienHe_GetAll]
AS BEGIN
    SELECT 
[LienHe].[DienThoai]
,[LienHe].[Email]
,[LienHe].[ID]
,[LienHe].[NgayGui]
,[LienHe].[NguoiGui]
,[LienHe].[NoiDung]
,[LienHe].[TieuDe] FROM [LienHe] as [LienHe] 
     
    
END;

GO
/****** Object:  StoredProcedure [dbo].[LienHe_GetByID]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[LienHe_GetByID]
@ID int
AS BEGIN
    SELECT 
    
[LienHe].[DienThoai]
,[LienHe].[Email]
,[LienHe].[ID]
,[LienHe].[NgayGui]
,[LienHe].[NguoiGui]
,[LienHe].[NoiDung]
,[LienHe].[TieuDe] 
    FROM [LienHe] as [LienHe] 
     
     WHERE [LienHe].[ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[LienHe_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[LienHe_Insert]
 @DienThoai nvarchar(100), @Email nvarchar(100), @NgayGui datetime, @NguoiGui nvarchar(100), @NoiDung nvarchar(500), @TieuDe nvarchar(150)
AS BEGIN
    INSERT INTO [LienHe](  [DienThoai] , [Email] , [NgayGui] , [NguoiGui] , [NoiDung] , [TieuDe]) VALUES( @DienThoai, @Email, @NgayGui, @NguoiGui, @NoiDung, @TieuDe)
END;

GO
/****** Object:  StoredProcedure [dbo].[LienHe_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[LienHe_Update]
 @DienThoai nvarchar(100), @Email nvarchar(100), @ID int, @NgayGui datetime, @NguoiGui nvarchar(100), @NoiDung nvarchar(500), @TieuDe nvarchar(150)
AS BEGIN
    UPDATE [LienHe] SET  [DienThoai] = @DienThoai, [Email] = @Email, [NgayGui] = @NgayGui, [NguoiGui] = @NguoiGui, [NoiDung] = @NoiDung, [TieuDe] = @TieuDe WHERE   [ID] = @ID
END;

GO
/****** Object:  StoredProcedure [dbo].[Menu_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Menu_Delete]
  @ID int
AS BEGIN
    DELETE [Menu] WHERE    [ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[Menu_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Menu_GetAll]
AS BEGIN
    SELECT 
[Menu].[ID]
,[Menu].[MaLoai]
,[Menu].[MenuCha]
,[Menu].[TenMenu]
,[Menu].[TrangThai]
,[Menu].[URL] FROM [Menu] as [Menu] 
     
    
END;

GO
/****** Object:  StoredProcedure [dbo].[Menu_GetByID]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Menu_GetByID]
@ID int
AS BEGIN
    SELECT 
    
[Menu].[ID]
,[Menu].[MaLoai]
,[Menu].[MenuCha]
,[Menu].[TenMenu]
,[Menu].[TrangThai]
,[Menu].[URL] 
    FROM [Menu] as [Menu] 
     
     WHERE [Menu].[ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[Menu_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Menu_Insert]
 @MaLoai int, @MenuCha int, @TenMenu nvarchar(50), @TrangThai bit, @URL nvarchar(100)
AS BEGIN
    INSERT INTO [Menu](  [MaLoai] , [MenuCha] , [TenMenu] , [TrangThai] , [URL]) VALUES( @MaLoai, @MenuCha, @TenMenu, @TrangThai, @URL)
END;

GO
/****** Object:  StoredProcedure [dbo].[Menu_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Menu_Update]
 @ID int, @MaLoai int, @MenuCha int, @TenMenu nvarchar(50), @TrangThai bit, @URL nvarchar(100)
AS BEGIN
    UPDATE [Menu] SET  [MaLoai] = @MaLoai, [MenuCha] = @MenuCha, [TenMenu] = @TenMenu, [TrangThai] = @TrangThai, [URL] = @URL WHERE   [ID] = @ID
END;

GO
/****** Object:  StoredProcedure [dbo].[NguoiDung_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[NguoiDung_Delete]
  @TaiKhoan nvarchar(100)
AS BEGIN
    DELETE [NguoiDung] WHERE    [TaiKhoan] = @TaiKhoan 
END;

GO
/****** Object:  StoredProcedure [dbo].[NguoiDung_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[NguoiDung_GetAll]
AS BEGIN
    SELECT 
[NguoiDung].[HoTen]
,[NguoiDung].[MatKhau]
,[NguoiDung].[TaiKhoan]
,[NguoiDung].[TrangThai] FROM [NguoiDung] as [NguoiDung] 
     
    
END;

GO
/****** Object:  StoredProcedure [dbo].[NguoiDung_GetByTaiKhoan]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[NguoiDung_GetByTaiKhoan]
@TaiKhoan nvarchar(100)
AS BEGIN
    SELECT 
    
[NguoiDung].[HoTen]
,[NguoiDung].[MatKhau]
,[NguoiDung].[TaiKhoan]
,[NguoiDung].[TrangThai] 
    FROM [NguoiDung] as [NguoiDung] 
     
     WHERE [NguoiDung].[TaiKhoan] = @TaiKhoan 
END;

GO
/****** Object:  StoredProcedure [dbo].[NguoiDung_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[NguoiDung_Insert]
 @HoTen nvarchar(100), @MatKhau nvarchar(300), @TaiKhoan nvarchar(100), @TrangThai bit
AS BEGIN
    INSERT INTO [NguoiDung](  [HoTen] , [MatKhau] , [TaiKhoan] , [TrangThai]) VALUES( @HoTen, @MatKhau, @TaiKhoan, @TrangThai)
END;

GO
/****** Object:  StoredProcedure [dbo].[NguoiDung_Login]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NguoiDung_Login]
	@TaiKhoan nvarchar(100),
	@MatKhau nvarchar(300)
AS
	SELECT * FROM NguoiDung
	WHERE TaiKhoan=@TaiKhoan AND MatKhau=@MatKhau AND TrangThai=1

GO
/****** Object:  StoredProcedure [dbo].[NguoiDung_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[NguoiDung_Update]
 @HoTen nvarchar(100), @MatKhau nvarchar(300), @TaiKhoan nvarchar(100), @TrangThai bit
AS BEGIN
    UPDATE [NguoiDung] SET  [HoTen] = @HoTen, [MatKhau] = @MatKhau, [TrangThai] = @TrangThai WHERE   [TaiKhoan] = @TaiKhoan
END;

GO
/****** Object:  StoredProcedure [dbo].[Students_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Students_Delete]
  @Id int
AS BEGIN
    DELETE [Students] WHERE    [Id] = @Id 
END;

GO
/****** Object:  StoredProcedure [dbo].[Students_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Students_GetAll]
AS BEGIN
    SELECT 
[Students].[Id]
,[Students].[StudentName] FROM [Students] as [Students] 
     
    
END;

GO
/****** Object:  StoredProcedure [dbo].[Students_GetById]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Students_GetById]
@Id int
AS BEGIN
    SELECT 
    
[Students].[Id]
,[Students].[StudentName] 
    FROM [Students] as [Students] 
     
     WHERE [Students].[Id] = @Id 
END;

GO
/****** Object:  StoredProcedure [dbo].[Students_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Students_Insert]
 @StudentName nvarchar(MAX)
AS BEGIN
    INSERT INTO [Students](  [StudentName]) VALUES( @StudentName)
END;

GO
/****** Object:  StoredProcedure [dbo].[Students_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[Students_Update]
 @Id int, @StudentName nvarchar(MAX)
AS BEGIN
    UPDATE [Students] SET  [StudentName] = @StudentName WHERE   [Id] = @Id
END;

GO
/****** Object:  StoredProcedure [dbo].[TheLoai_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TheLoai_Delete]
  @MaLoai int
AS BEGIN
    DELETE [TheLoai] WHERE    [MaLoai] = @MaLoai 
END;

GO
/****** Object:  StoredProcedure [dbo].[TheLoai_DS]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TheLoai_DS]
AS
	SELECT * FROM TheLoai

GO
/****** Object:  StoredProcedure [dbo].[TheLoai_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TheLoai_GetAll]
AS BEGIN
    SELECT 
[TheLoai].[MaLoai]
,[TheLoai].[MoTa]
,[TheLoai].[TenLoai] FROM [TheLoai] as [TheLoai] 
     
    
END;

GO
/****** Object:  StoredProcedure [dbo].[TheLoai_GetByMaLoai]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TheLoai_GetByMaLoai]
@MaLoai int
AS BEGIN
    SELECT 
    
[TheLoai].[MaLoai]
,[TheLoai].[MoTa]
,[TheLoai].[TenLoai] 
    FROM [TheLoai] as [TheLoai] 
     
     WHERE [TheLoai].[MaLoai] = @MaLoai 
END;

GO
/****** Object:  StoredProcedure [dbo].[TheLoai_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TheLoai_Insert]
 @MoTa nvarchar(300), @TenLoai nvarchar(150)
AS BEGIN
    INSERT INTO [TheLoai](  [MoTa] , [TenLoai]) VALUES( @MoTa, @TenLoai)
END;

GO
/****** Object:  StoredProcedure [dbo].[TheLoai_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TheLoai_Update]
 @MaLoai int, @MoTa nvarchar(300), @TenLoai nvarchar(150)
AS BEGIN
    UPDATE [TheLoai] SET  [MoTa] = @MoTa, [TenLoai] = @TenLoai WHERE   [MaLoai] = @MaLoai
END;

GO
/****** Object:  StoredProcedure [dbo].[TrangLienKet_DanhSach]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TrangLienKet_DanhSach]
AS
	SELECT * FROM TrangLienKet WHERE TrangThai=1

GO
/****** Object:  StoredProcedure [dbo].[TrangLienKet_Delete]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TrangLienKet_Delete]
  @ID int
AS BEGIN
    DELETE [TrangLienKet] WHERE    [ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[TrangLienKet_GetAll]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TrangLienKet_GetAll]
AS BEGIN
    SELECT 
[TrangLienKet].[ID]
,[TrangLienKet].[TaiKhoan]
,[TrangLienKet].[Target]
,[TrangLienKet].[TenSite]
,[TrangLienKet].[TrangThai]
,[TrangLienKet].[URL]
,[NguoiDungJoin].[HoTen] as [HoTen_NguoiDungJoin]
,[NguoiDungJoin].[MatKhau] as [MatKhau_NguoiDungJoin]
,[NguoiDungJoin].[TrangThai] as [TrangThai_NguoiDungJoin] FROM [TrangLienKet] as [TrangLienKet] 
    
join [NguoiDung] as [NguoiDungJoin] on [TrangLienKet].[TaiKhoan] = [NguoiDungJoin].[TaiKhoan] 
    
END;

GO
/****** Object:  StoredProcedure [dbo].[TrangLienKet_GetByID]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TrangLienKet_GetByID]
@ID int
AS BEGIN
    SELECT 
    
[TrangLienKet].[ID]
,[TrangLienKet].[TaiKhoan]
,[TrangLienKet].[Target]
,[TrangLienKet].[TenSite]
,[TrangLienKet].[TrangThai]
,[TrangLienKet].[URL]
,[NguoiDungJoin].[HoTen] as [HoTen_NguoiDungJoin]
,[NguoiDungJoin].[MatKhau] as [MatKhau_NguoiDungJoin]
,[NguoiDungJoin].[TrangThai] as [TrangThai_NguoiDungJoin] 
    FROM [TrangLienKet] as [TrangLienKet] 
    
join [NguoiDung] as [NguoiDungJoin] on [TrangLienKet].[TaiKhoan] = [NguoiDungJoin].[TaiKhoan] 
     WHERE [TrangLienKet].[ID] = @ID 
END;

GO
/****** Object:  StoredProcedure [dbo].[TrangLienKet_Insert]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TrangLienKet_Insert]
 @TaiKhoan nvarchar(100), @Target nvarchar(50), @TenSite nvarchar(150), @TrangThai bit, @URL nvarchar(200)
AS BEGIN
    INSERT INTO [TrangLienKet](  [TaiKhoan] , [Target] , [TenSite] , [TrangThai] , [URL]) VALUES( @TaiKhoan, @Target, @TenSite, @TrangThai, @URL)
END;

GO
/****** Object:  StoredProcedure [dbo].[TrangLienKet_Update]    Script Date: 9/11/2017 12:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

;CREATE PROC [dbo].[TrangLienKet_Update]
 @ID int, @TaiKhoan nvarchar(100), @Target nvarchar(50), @TenSite nvarchar(150), @TrangThai bit, @URL nvarchar(200)
AS BEGIN
    UPDATE [TrangLienKet] SET  [TaiKhoan] = @TaiKhoan, [Target] = @Target, [TenSite] = @TenSite, [TrangThai] = @TrangThai, [URL] = @URL WHERE   [ID] = @ID
END;

GO
USE [master]
GO
ALTER DATABASE [HighSchool] SET  READ_WRITE 
GO
