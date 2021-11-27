/*
Created		10/8/2020
Modified		11/11/2020
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [SAN_PHAM]
(
	[MaSP] Varchar(10) NOT NULL,
	[TenSP] Varchar(30) NOT NULL,
	[Mau] Varchar(20) NOT NULL,
	[GiaGoc] Money NOT NULL,
	[MoTa] Nvarchar(200) NOT NULL,
	[Size] Float NOT NULL,
	[XuatXu] Nvarchar(100) NOT NULL,
	[Anh] Image NOT NULL,
Primary Key ([MaSP])
) 
go

Create table [KHACH_HANG]
(
	[MaKH] Varchar(10) NOT NULL,
	[TenKH] Varchar(20) NOT NULL,
	[DiaChi] Nvarchar(100) NOT NULL,
	[DienThoai] Varchar(12) NOT NULL,
Primary Key ([MaKH])
) 
go

Create table [HOA_DON]
(
	[MaHD] Varchar(10) NOT NULL,
	[MaNV] Varchar(10) NOT NULL,
	[MaKH] Varchar(10) NOT NULL,
	[NgayGio] Datetime NOT NULL,
	[HTTT] Varchar(40) NOT NULL,
	[GhiChu] Nvarchar(200) NULL,
	[TongTien] Money NOT NULL,
	[MaGiamGia] Varchar(10) NULL,
Primary Key ([MaHD])
) 
go

Create table [CUA_HANG]
(
	[MaCuaHang] Varchar(10) NOT NULL,
	[TenCuaHang] Varchar(50) NOT NULL,
	[DiaChiCH] Nvarchar(100) NOT NULL,
	[DienThoaiCH] Varchar(12) NOT NULL,
Primary Key ([MaCuaHang])
) 
go

Create table [TAI_KHOAN]
(
	[MaTaiKhoan] Varchar(10) NOT NULL,
	[MaKH] Varchar(10) NOT NULL,
	[Email] Varchar(50) NOT NULL,
	[MatKhau] Varchar(15) NOT NULL,
Primary Key ([MaTaiKhoan])
) 
go

Create table [GIO_HANG]
(
	[MaGioHang] Varchar(10) NOT NULL,
	[Gia] Money NOT NULL,
	[GhiChuGH] Nvarchar(200) NULL,
	[MaKH] Varchar(10) NOT NULL,
Primary Key ([MaGioHang])
) 
go

Create table [GIOHANG_SANPHAM]
(
	[MaGioHang] Varchar(10) NOT NULL,
	[MaSP] Varchar(10) NOT NULL,
Primary Key ([MaGioHang],[MaSP])
) 
go

Create table [KHUYEN_MAI]
(
	[MaKM] Varchar(10) NOT NULL,
	[TGBatDau] Datetime NOT NULL,
	[NgayKetThuc] Datetime NOT NULL,
Primary Key ([MaKM])
) 
go

Create table [KM_SP]
(
	[MaSP] Varchar(10) NOT NULL,
	[MaKM] Varchar(10) NOT NULL,
	[TyLeKM] Float NOT NULL,
Primary Key ([MaSP],[MaKM])
) 
go

Create table [GIAM_GIA]
(
	[MaGiamGia] Varchar(10) NOT NULL,
	[TyleGiamGia] Float NOT NULL,
Primary Key ([MaGiamGia])
) 
go

Create table [CUAHANG_SANPHAM]
(
	[MaSP] Varchar(10) NOT NULL,
	[MaCuaHang] Varchar(10) NOT NULL,
	[SLnhap] Integer NOT NULL,
	[DGnhap] Money NOT NULL,
Primary Key ([MaSP],[MaCuaHang])
) 
go

Create table [NHAN_VIEN]
(
	[MaNV] Varchar(10) NOT NULL,
	[TenNV] Varchar(20) NOT NULL,
Primary Key ([MaNV])
) 
go

Create table [DONG_DON_HANG]
(
	[MaSP] Varchar(10) NOT NULL,
	[MaHD] Varchar(10) NOT NULL,
	[SLmua] Integer NOT NULL,
	[MaDH] Varchar(10) NOT NULL,
Primary Key ([MaSP],[MaHD])
) 
go

Create table [VAN_CHUYEN]
(
	[PTVC] Varchar(15) NOT NULL,
	[PhiVC] Money NULL,
Primary Key ([PTVC])
) 
go

Create table [DAT_HANG]
(
	[MaDH] Varchar(10) NOT NULL,
	[PTVC] Varchar(15) NOT NULL,
	[MaKH] Varchar(10) NOT NULL,
	[MaGiamGia] Varchar(10) NOT NULL,
	[PTTT] Varchar(40) NOT NULL,
Primary Key ([MaDH])
) 
go

Create table [PHIEU_DAT_HANG]
(
	[MaDH] Varchar(10) NOT NULL,
	[MaSP] Varchar(10) NOT NULL,
	[SL] Integer NOT NULL,
	[DGdat] Money NOT NULL,
Primary Key ([MaDH],[MaSP])
) 
go


Alter table [GIOHANG_SANPHAM] add  foreign key([MaSP]) references [SAN_PHAM] ([MaSP])  on update no action on delete no action 
go
Alter table [KM_SP] add  foreign key([MaSP]) references [SAN_PHAM] ([MaSP])  on update no action on delete no action 
go
Alter table [CUAHANG_SANPHAM] add  foreign key([MaSP]) references [SAN_PHAM] ([MaSP])  on update no action on delete no action 
go
Alter table [PHIEU_DAT_HANG] add  foreign key([MaSP]) references [SAN_PHAM] ([MaSP])  on update no action on delete no action 
go
Alter table [DONG_DON_HANG] add  foreign key([MaSP]) references [SAN_PHAM] ([MaSP])  on update no action on delete no action 
go
Alter table [TAI_KHOAN] add  foreign key([MaKH]) references [KHACH_HANG] ([MaKH])  on update no action on delete no action 
go
Alter table [GIO_HANG] add  foreign key([MaKH]) references [KHACH_HANG] ([MaKH])  on update no action on delete no action 
go
Alter table [DAT_HANG] add  foreign key([MaKH]) references [KHACH_HANG] ([MaKH])  on update no action on delete no action 
go
Alter table [HOA_DON] add  foreign key([MaKH]) references [KHACH_HANG] ([MaKH])  on update no action on delete no action 
go
Alter table [DONG_DON_HANG] add  foreign key([MaHD]) references [HOA_DON] ([MaHD])  on update no action on delete no action 
go
Alter table [CUAHANG_SANPHAM] add  foreign key([MaCuaHang]) references [CUA_HANG] ([MaCuaHang])  on update no action on delete no action 
go
Alter table [GIOHANG_SANPHAM] add  foreign key([MaGioHang]) references [GIO_HANG] ([MaGioHang])  on update no action on delete no action 
go
Alter table [KM_SP] add  foreign key([MaKM]) references [KHUYEN_MAI] ([MaKM])  on update no action on delete no action 
go
Alter table [DAT_HANG] add  foreign key([MaGiamGia]) references [GIAM_GIA] ([MaGiamGia])  on update no action on delete no action 
go
Alter table [HOA_DON] add  foreign key([MaGiamGia]) references [GIAM_GIA] ([MaGiamGia])  on update no action on delete no action 
go
Alter table [HOA_DON] add  foreign key([MaNV]) references [NHAN_VIEN] ([MaNV])  on update no action on delete no action 
go
Alter table [DAT_HANG] add  foreign key([PTVC]) references [VAN_CHUYEN] ([PTVC])  on update no action on delete no action 
go
Alter table [PHIEU_DAT_HANG] add  foreign key([MaDH]) references [DAT_HANG] ([MaDH])  on update no action on delete no action 
go
Alter table [DONG_DON_HANG] add  foreign key([MaDH]) references [DAT_HANG] ([MaDH])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


