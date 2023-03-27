
CREATE DATABASE QL_DIENTHOAI
use QL_DIENTHOAI
go

CREATE TABLE THUONGHIEU
(
	MATH INT IDENTITY(1,1) PRIMARY KEY,
	TENTH NVARCHAR(50),
)
CREATE TABLE KHACHHANG
(
	MAKH INT IDENTITY(1,1) PRIMARY KEY,
	TENKH NVARCHAR(50),
	GIOITINH NCHAR(5),
	DIACHI NVARCHAR(50),
	DIENTHOAI CHAR(15),
	TAIKHOANKH NVARCHAR(30),
	MATKHAUKH NVARCHAR(30)
)

CREATE TABLE NHANVIEN
( 
	MANV INT IDENTITY(1,1) PRIMARY KEY,
	HOTEN NVARCHAR(30),
	GIOITINH NCHAR(5),
	DIACHI NVARCHAR(50),
	DIENTHOAI CHAR(15),
	LUONG DECIMAL,
	TAIKHOANNV VARCHAR(20),
	MATKHAUNV VARCHAR(20),
)

CREATE TABLE PHANQUYEN
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MANV INT,
	QL_DONHANG BIT,
	QL_SANPHAM BIT,
	QL_KHACHHANG BIT,
	QL_NHACC BIT,
	QL_NHAPHANG BIT,
	THONGKE BIT,
	CONSTRAINT FK_PHANQUYEN_NV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
)

CREATE TABLE NHACC
(
	MANCC INT IDENTITY(1,1) PRIMARY KEY,
	TENNCC NVARCHAR(500),
	DCHI NVARCHAR(50),
	DTHOAI CHAR(15),
)

CREATE TABLE SANPHAM
(
	MASP INT IDENTITY(1,1) PRIMARY KEY,
	TENSP NVARCHAR(100),
	MATH INT,
	MANCC INT,
	SOLUONG INT,
	DVT NVARCHAR(20),
	GIABAN DECIMAL,
	GIANHAP DECIMAL,
	GIAMGIA DECIMAL,
	THONGTIN NVARCHAR(500),
	HINHANH NVARCHAR(100),
	CONSTRAINT FK_SANPHAM_NHACC FOREIGN KEY(MANCC) REFERENCES NHACC(MANCC),
	CONSTRAINT FK_SANPHAM_LOAI FOREIGN KEY(MATH) REFERENCES THUONGHIEU(MATH),
)

CREATE TABLE HOADON
(
	MAHD INT IDENTITY(1,1) PRIMARY KEY, 
	MANV INT,
	MAKH INT,
	NGAYBAN DATE,
	NGAYGIAO DATE,
	NGAYTHANHTOAN DATE,
	GIAMGIA DECIMAL,
	TONGTIEN DECIMAL,
	GHICHU NVARCHAR(500),
	CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH),
	CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
)

CREATE TABLE CHITIETHD
(
	MAHD INT ,
	MASP INT,
	SOLUONG INT,
	DONGIA DECIMAL,
	THANHTIEN DECIMAL,
	CONSTRAINT PK_CHITIETHD PRIMARY KEY(MAHD,MASP),
	CONSTRAINT FK_CHITIETHD_HOADON FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD),
	CONSTRAINT FK_CHITIETHD_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP),
)

CREATE TABLE PHIEUNHAP
(
	MAPN INT IDENTITY(1,1) PRIMARY KEY,
	MANV INT ,
	MANCC INT,
	NGAYNHAP DATE,
	TIENNHAP DECIMAL,
	GHICHU NVARCHAR(500),
	CONSTRAINT FK_PHIEUNHAP_NHANVIEN FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
	CONSTRAINT FK_PHIEUNHAP_NHACC FOREIGN KEY(MANCC) REFERENCES NHACC(MANCC),
)

CREATE TABLE CHITIETPN
(
	MAPN INT,
	MASP INT,
	SOLUONG INT,
	GIANHAP DECIMAL,
	THANHTIEN DECIMAL,
	CONSTRAINT PK_CHITIETPN PRIMARY KEY(MAPN,MASP),
	CONSTRAINT FK_CHITIETPN_SP FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP),
	CONSTRAINT FK_CHITIETPN_PN FOREIGN KEY(MAPN) REFERENCES PHIEUNHAP(MAPN),
)

INSERT INTO KHACHHANG VALUES
(N'Nguyễn Lê Hoàng Duy',N'Nam',N'Cà Mau','03824918292','duy','123'),
(N'Huỳnh Nhật Tân',N'Nam',N'Bến Tre','0674563353','tan','123'),
(N'Phạm Minh Toàn',N'Nam',N'Sóc Trăng','0462123316','toan','123'),
(N'Lê Hải Đăng',N'Nam',N'Sóc Trăng','0935412323','dang','123')
INSERT INTO NHANVIEN VALUES
(N'Trần Minh Tân',N'Nam',N'Long An','0354587944',25000000,'admin',123),
(N'Lê Viết Tường',N'Nam',N'TP HCM','0376423423',15000000,'tuong',123),
(N'Nguyễn Đình Khả',N'Nam',N'Campuchia','0925458878',15000000,'kha',123),
(N'Trần Hiếu Nghĩa',N'Nam',N'Bình Phước','0923247728',15000000,'nghia',123)
INSERT INTO PHANQUYEN VALUES
(1,'true','true','true','true','true','true'),
(2,'true','false','true','false','false','true'),
(3,'false','true','false','false','false','false'),
(4,'false','false','false','true','true','false')
INSERT INTO NHACC VALUES
(N'Công Ty TNHH Mi Home',N'Bến Tre','0779127372'),
(N'Công Ty TNHH Viễn Thông Xuyên Á',N'Long An','0238472342'),
(N'Công Ty TNHH Thế Giới Di Động',N'Hà Nội','0546332311'),
(N'Cty Thế Giới Di Động Cổ Phần-Cn Biên Hòa',N'Biên Hòa','0967332356'),
(N'Công Ty TNHH Bao La',N'Hải Phòng','0346423327'),
(N'Công Ty TNHH MTV TMDV Kiến Quốc',N'TP HCM','0937334533')
INSERT INTO THUONGHIEU VALUES
(N'SamSung'),
(N'iPhone'),
(N'OPPO'),
(N'Xiaomi'),
(N'Realme'),
(N'Nokia')
INSERT INTO SANPHAM(TENSP,MATH,MANCC,SOLUONG,DVT,GIABAN,GIANHAP,THONGTIN,HINHANH) VALUES
--SamSung
(N'Điện thoại Samsung Galaxy S22 5G 256GB',1,4,20,N'Cái',27490000,20000000,
'Màn hình:Dynamic AMOLED 2X6.6"Full HD+
Hệ điều hành:Android 12
Camera sau:Chính 50 MP & Phụ 12 MP, 10 MP
Camera trước:10 MP
Chip:Snapdragon 8 Gen 1 8 nhân
RAM:8 GB
Bộ nhớ trong:256 GB',N'Điện thoại Samsung Galaxy S22 5G 256GB.PNG'),

(N'Điện thoại Samsung Galaxy A03s',1,2,15,N'Cái',3290000,2500000,
'Màn hình:PLS LCD6.5"HD+
Hệ điều hành:Android 11
Camera sau:Chính 13 MP & Phụ 2 MP, 2 MP
Camera trước:5 MP
Chip:MediaTek MT6765
RAM:4 GB
Bộ nhớ trong:64 GB',N'Điện thoại Samsung Galaxy A03s.PNG'),

(N'Điện thoại Samsung Galaxy A22',1,1,22,N'Cái',5590000,4500000,
'Màn hình:Super AMOLED6.4"HD+
Hệ điều hành:Android 11
Camera sau:Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:13 MP
Chip:MediaTek MT6769V
RAM:6 GB
Bộ nhớ trong:128 GB',N'Điện thoại Samsung Galaxy A22.PNG'),

(N'Điện thoại Samsung Galaxy S21 FE 5G',1,6,25,N'Cái',13490000,10000000,
'Màn hình:Dynamic AMOLED 2X6.6"Full HD+
Hệ điều hành:Android 12
Camera sau:Chính 50 MP & Phụ 12 MP, 10 MP
Camera trước:10 MP
Chip:Snapdragon 8 Gen 1 8 nhân
RAM:8 GB
Bộ nhớ trong:256 GB',N'Điện thoại Samsung Galaxy S21 FE 5G.PNG'),
--iPhone
(N'Điện thoại iPhone 13 Pro Max 128GB Xanh lá',2,3,55,N'Cái',33490000,25000000,
'Màn hình:OLED6.7"Super Retina XDR
Hệ điều hành:iOS 15
Camera sau:3 camera 12 MP
Camera trước:12 MP
Chip:Apple A15 Bionic
RAM:6 GB
Bộ nhớ trong:128 GB',N'Điện thoại iPhone 13 Pro Max 128GB Xanh lá.PNG'),

(N'Điện thoại iPhone 13 128GB',2,4,16,N'Cái',24190000,20000000,
'Màn hình:OLED6.1"Super Retina XDR
Hệ điều hành:iOS 15
Camera sau:2 camera 12 MP
Camera trước:12 MP
Chip:Apple A15 Bionic
RAM:4 GB
Bộ nhớ trong:128 GB',N'Điện thoại iPhone 13 128GB.PNG'),

(N'Điện thoại iPhone 12 Pro Max 256GB',2,2,28,N'Cái',29490000,25000000,
'Màn hình:OLED6.7"Super Retina XDR
Hệ điều hành:iOS 15
Camera sau:3 camera 12 MP
Camera trước:12 MP
Chip:Apple A14 Bionic
RAM:6 GB
Bộ nhớ trong:256 GB',N'Điện thoại iPhone 12 Pro Max 256GB.PNG'),

(N'Điện thoại iPhone 11 64GB',2,3,30,N'Cái',15790000,10000000,
'Màn hình:IPS LCD6.1"Liquid Retina
Hệ điều hành:iOS 15
Camera sau:2 camera 12 MP
Camera trước:12 MP
Chip:Apple A13 Bionic
RAM:4 GB
Bộ nhớ trong:64 GB',N'Điện thoại iPhone 11 64GB.PNG'),

(N'Điện thoại iPhone 12 mini 64GB',2,6,45,N'Cái',16190000,12000000,
'Màn hình:OLED5.4"Super Retina XDR
Hệ điều hành:iOS 15
Camera sau:2 camera 12 MP
Camera trước:12 MP
Chip:Apple A14 Bionic
RAM:4 GB
Bộ nhớ trong:64 GB',N'Điện thoại iPhone 12 mini 64GB.PNG'),

(N'Điện thoại iPhone XR 128GB',2,5,35,N'Cái',12990000,10000000,
'Màn hình:IPS LCD6.1"Liquid Retina
Hệ điều hành:iOS 15
Camera sau:12 MP
Camera trước:7 MP
Chip:Apple A12 Bionic
RAM:3 GB
Bộ nhớ trong:128 GB',N'Điện thoại iPhone XR 128GB.PNG'),
--OPPO
(N'Điện thoại OPPO Reno6 5G',3,6,22,N'Cái',12990000,10000000,
'Hệ điều hành:Android 11
Camera sau:Chính 64 MP & Phụ 8 MP, 2 MP
Camera trước:32 MP
Chip:MediaTek Dimensity 900 5G
RAM:8 GB
Bộ nhớ trong:128 GB',N'Điện thoại OPPO Reno6 5G.PNG'),

(N'Điện thoại OPPO Reno4 Pro',3,3,14,N'Cái',10490000,8000000,
'Màn hình:AMOLED6.5"Full HD+
Hệ điều hành:Android 10
Camera sau:Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:32 MP
Chip:Snapdragon 720G
RAM:8 GB
Bộ nhớ trong:256 GB',N'Điện thoại OPPO Reno4 Pro.PNG'),

(N'Điện thoại OPPO A74 5G',3,5,24,N'Cái',7990000,5000000,
'Màn hình:IPS LCD6.5"Full HD+
Hệ điều hành:Android 11
Camera sau:Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:16 MP
Chip:Snapdragon 480 8 nhân 5G
RAM:6 GB
Bộ nhớ trong:128 GB',N'Điện thoại OPPO A74 5G.PNG'),

(N'Điện thoại OPPO A76',3,1,11,N'Cái',5990000,4000000,
'Màn hình:IPS LCD6.56"HD+
Hệ điều hành:Android 11
Camera sau:Chính 13 MP & Phụ 2 MP
Camera trước:8 MP
Chip:Snapdragon 680 8 nhân
RAM:6 GB
Bộ nhớ trong:128 GB',N'Điện thoại OPPO A76.PNG'),

--Xiaomi
(N'Điện thoại Xiaomi Redmi 9A',4,3,15,N'Cái',2490000,1500000,
'Màn hình:IPS LCD6.53"HD+
Hệ điều hành:Android 10
Camera sau:13 MP
Camera trước:5 MP
Chip:MediaTek Helio G25
RAM:2 GB
Bộ nhớ trong:32 GB',N'Điện thoại Xiaomi Redmi 9A.PNG'),

(N'Điện thoại Xiaomi Redmi 10',4,1,25,N'Cái',4290000,2500000,
'Màn hình:IPS LCD6.5"Full HD+
Hệ điều hành:Android 11
Camera sau:Chính 50 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:8 MP
Chip:MediaTek Helio G88 8 nhân
RAM:4 GB
Bộ nhớ trong:128 GB',N'Điện thoại Xiaomi Redmi 10.PNG'),

(N'Điện thoại Xiaomi 11T Pro 5G 8GB',4,2,30,N'Cái',12790000,10000000,
'Màn hình:AMOLED6.67"Full HD+
Hệ điều hành:Android 11
Camera sau:Chính 108 MP & Phụ 8 MP, 5 MP
Camera trước:16 MP
Chip:Snapdragon 888
RAM:8 GB
Bộ nhớ trong:256 GB',N'Điện thoại Xiaomi 11T Pro 5G 8GB.PNG'),

--Realme
(N'Điện thoại Realme 9i',5,1,30,N'Cái',5490000,4500000,
'Màn hình:IPS LCD6.6"Full HD+
Hệ điều hành:Android 11
Camera sau:Chính 50 MP & Phụ 2 MP, 2 MP
Camera trước:16 MP
Chip:Snapdragon 680 8 nhân
RAM:4 GB',N'Điện thoại Realme 9i.PNG'),

(N'Điện thoại Realme C21-Y 4GB',5,3,34,N'Cái',4290000,3500000,
'Màn hình:IPS LCD6.5"HD+
Hệ điều hành:Android 11
Camera sau:Chính 13 MP & Phụ 2 MP, 2 MP
Camera trước:5 MP
Chip:Spreadtrum T610 8 nhân
RAM:4 GB
Bộ nhớ trong:64 GB',N'Điện thoại Realme C21-Y 4GB.PNG'),

(N'Điện thoại Realme 9 Pro 5G',5,5,22,N'Cái',7990000,6000000,
'Màn hình:IPS LCD6.6"Full HD+
Hệ điều hành:Android 12
Camera sau:Chính 64 MP & Phụ 8 MP, 2 MP
Camera trước:16 MP
Chip:Snapdragon 695 5G 8 nhân
RAM:8 GB
Bộ nhớ trong:128 GB',N'Điện thoại Realme 9 Pro 5G.PNG'),

--Nokia
(N'Điện thoại Nokia G21',6,1,30,N'Cái',5000000,4000000,
'Màn hình:TFT LCD6.5"HD+
Hệ điều hành:Android 11
Camera sau:Chính 50 MP & Phụ 2 MP, 2 MP
Camera trước:8 MP
Chip:Unisoc T606 8 nhân
RAM:4 GB
Bộ nhớ trong:128 GB',N'Điện thoại Nokia G21.PNG'),

(N'Điện thoại Nokia G11',6,4,20,N'Cái',5500000,4500000,
'Màn hình:TFT LCD6.5"HD+
Hệ điều hành:Android 11
Camera sau:Chính 13 MP & Phụ 2 MP, 2 MP
Camera trước:8 MP
Chip:Unisoc T606 8 nhân
RAM:4 GB
Bộ nhớ trong:64 GB',N'Điện thoại Nokia G11.PNG'),

(N'Điện thoại Nokia G10',6,2,10,N'Cái',3490000,2500000,
'Màn hình:TFT LCD6.5"HD+
Hệ điều hành:Android 11
Camera sau:Chính 13 MP & Phụ 2 MP, 2 MP
Camera trước:8 MP
Chip:MediaTek Helio G25
RAM:4 GB
Bộ nhớ trong:64 GB',N'Điện thoại Nokia G10.PNG'),

(N'Điện thoại Nokia 2.1 Plus',6,1,22,N'Cái',3200000,2500000,
'Màn hình:IPS LCDHD
Hệ điều hành:Android 8 (Go Edition)
RAM:1 GB
Bộ nhớ trong:16 GB
SIM:2 Nano 
SIMHỗ trợ 4G',N'Điện thoại Nokia 2.1 Plus.PNG')

INSERT INTO HOADON(MANV,MAKH,NGAYBAN,NGAYGIAO,NGAYTHANHTOAN,TONGTIEN) VALUES
(1,1,'2019/5/7','2019/5/9','2019/5/9',90000),
(2,2,'2019/9/17','2019/9/19','2019/9/19',54000),
(2,3,'2020/3/10','2020/3/12','2020/3/12',125000),
(1,4,'2021/8/11','2021/8/14',NULL,28000)

INSERT INTO CHITIETHD(MAHD,MASP,SOLUONG,DONGIA,THANHTIEN) VALUES
(1,5,3,30000,90000),
(2,7,1,42000,42000),
(2,19,1,12000,12000),
(3,4,1,125000,125000),
(4,15,2,14000,28000)

INSERT INTO PHIEUNHAP VALUES
(1,2,'2019/4/3',60000,NULL)
INSERT INTO CHITIETPN VALUES
(1,5,2,30000,60000)

-- Trigger  giảm SOLUONG trên bảng SANPHAM mỗi khi bán mặt hàng đó ra(nhập dữ liệu vào bảng CHITIETHD).

	CREATE TRIGGER TRG_CapNhatSL_SP_ChiTietHD
	ON CHITIETHD
	AFTER INSERT 
	AS 
	BEGIN
		UPDATE SANPHAM
		SET SOLUONG= SP.SOLUONG - (SELECT SOLUONG FROM INSERTED WHERE MASP=SP.MASP)
		FROM SANPHAM SP 
		JOIN INSERTED ON SP.MASP = INSERTED.MASP
	END

-- Trigger  tăng SOLUONG trên bảng SANPHAM mỗi khi nhập mặt hàng đó (nhập dữ liệu vào bảng CHITIETPN).

	CREATE TRIGGER TRG_CapNhatSL_SP_ChiTietPN 
	ON CHITIETPN
	AFTER INSERT 
	AS 
	BEGIN
		UPDATE SANPHAM
		SET SOLUONG= SP.SOLUONG + (SELECT SOLUONG FROM INSERTED WHERE MASP=SP.MASP)
		FROM SANPHAM SP 
		JOIN INSERTED ON SP.MASP = INSERTED.MASP
	END

-- Trigger cập nhật tổng tiền trong bảng HOADON khi nhập THANHTIEN trong bảng CHITIETHD
	CREATE TRIGGER TRG_CapNhatTT_HoaDon_ChiTietHD
	ON CHITIETHD 
	AFTER INSERT 
	AS 
	BEGIN
		UPDATE HOADON
		SET TONGTIEN=(SELECT SUM(THANHTIEN) FROM CHITIETHD WHERE MAHD=HD.MAHD GROUP BY MAHD)
		FROM HOADON HD 
		JOIN INSERTED ON HD.MAHD = INSERTED.MAHD	
	END

-- Trigger cập nhật tổng tiền trong bảng HOADON khi nhập THANHTIEN trong bảng CHITIETHD
	CREATE TRIGGER TRG_CapNhatTT_PhieuNhap_ChiTietPN
	ON CHITIETPN 
	AFTER INSERT,UPDATE,DELETE 
	AS 
	BEGIN
		UPDATE PHIEUNHAP
		SET TIENNHAP=(SELECT SUM(THANHTIEN) FROM CHITIETPN WHERE MAPN=PN.MAPN GROUP BY MAPN)
		FROM PHIEUNHAP PN 
		JOIN INSERTED ON PN.MAPN = INSERTED.MAPN 
	END