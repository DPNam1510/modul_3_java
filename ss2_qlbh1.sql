drop database QLBH;
create database if not exists QLBH;
use QLBH;
create table NHACC(
MaNCC int primary key,
TenNCC varchar(20),
DiaChi varchar(20),
SDT varchar(10) 
);
create table DONDH(
SoDH int primary key auto_increment,
NgayDH date,
NHACC_MaNCC int,
foreign key(NHACC_MaNCC) references NHACC(MaNCC)
);
create table VATTU(
MaVTU int primary key auto_increment,
TenVTU varchar(20)
);
create table PHIEUXUAT(
SoPX int primary key auto_increment,
NgayXuat date
);
create table PHIEUNHAP(
SoPN int primary key,
NgayNhap date
);
create table DONDH_VATTU(
DONDH_SoDH int,
VATTU_MaVTU int,
primary key(DONDH_SoDH,VATTU_MaVTU),
foreign key(DONDH_SoDH) references DONDH(SoDH),
foreign key(VATTU_MaVTU) references VATTU(MaVTU)
);
create table chi_tiet_phieu_xuat(
DGXuat float,
SLXuat int,
PHIEUXUAT_SoPX int,
VATTU_MaVTU int,
primary key(PHIEUXUAT_SoPX,VATTU_MaVTU),
foreign key(VATTU_MaVTU) references VATTU(MaVTU),
foreign key(PHIEUXUAT_SoPX) references PHIEUXUAT(SoPX)
);
create table chi_tiet_phieu_nhap(
DGNhap float,
SLNhap int,
PHIEUNHAP_SoPN int,
VATTU_MaVTU int,
primary key(PHIEUNHAP_SoPN,VATTU_MaVTU),
foreign key(VATTU_MaVTU) references VATTU(MaVTU),
foreign key(PHIEUNHAP_SoPN) references PHIEUNHAP(SoPN)
);
