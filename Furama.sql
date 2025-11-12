DROP DATABASE IF EXISTS furama;
CREATE DATABASE furama;
USE furama;
CREATE TABLE bo_phan (
  bID INT AUTO_INCREMENT PRIMARY KEY,
  bName VARCHAR(20)
);
INSERT INTO bo_phan VALUES
(1,'electrical'),
(2,'mechanical'),
(3,'operate'),
(4,'monitor'),
(5,'quantity');
CREATE TABLE vi_tri (
  vID INT AUTO_INCREMENT PRIMARY KEY,
  vName VARCHAR(20)
);
INSERT INTO vi_tri VALUES
(1,'staff'),
(2,'dev'),
(3,'manager'),
(4,'leader'),
(5,'president');
CREATE TABLE trinh_do (
  tID INT AUTO_INCREMENT PRIMARY KEY,
  tName VARCHAR(20)
);
INSERT INTO trinh_do VALUES
(1,'college'),
(2,'university'),
(3,'bachelor'),
(4,'engineer'),
(5,'technician'),
(6,'electrical');
CREATE TABLE nhan_vien (
  nID INT AUTO_INCREMENT PRIMARY KEY,
  nName VARCHAR(20),
  nDate DATE,
  nIDCard VARCHAR(15),
  Salary FLOAT,
  nPhone VARCHAR(15),
  nEmail VARCHAR(50),
  nAddress VARCHAR(20),
  nvID INT,
  ntID INT,
  nbID INT,
  FOREIGN KEY (nvID) REFERENCES vi_tri(vID),
  FOREIGN KEY (ntID) REFERENCES trinh_do(tID),
  FOREIGN KEY (nbID) REFERENCES bo_phan(bID)
);
INSERT INTO nhan_vien VALUES
(1,'nam','2000-10-15','1234',500,'0911574798','nam@gmail.com','nghe an',1,4,1),
(2,'huy','1997-01-01','2345',600,'0911574777','huy@gmail.com','da nang',1,2,3),
(3,'manh','2004-08-02','3456',700,'0935126836','manh@gmail.com','hue',2,3,4),
(4,'thanh','2000-01-26','4567',800,'0915345687','thanh@gmail.com','nghe an',3,4,5),
(5,'ngoc','2000-10-29','5678',400,'0927988707','ngoc@gmail.com','nghe an',1,2,2),
(6,'khanh','2004-07-30','6789',300,'0915134765','khanh@gmail.com','hue',4,5,4),
(7,'xuan','2000-08-25','7890',500,'0905452789','xuan@gmail.com','da nang',5,4,5),
(8,'quang','2004-01-05','9876',900,'0911678456','quang@gmail.com','da nang',3,3,3);
CREATE TABLE loai_khach (
  lkID INT AUTO_INCREMENT PRIMARY KEY,
  lkName VARCHAR(20)
);
INSERT INTO loai_khach VALUES
(1,'silver'),
(2,'golden'),
(3,'diamond');
CREATE TABLE kieu_thue (
  kID INT AUTO_INCREMENT PRIMARY KEY,
  kName VARCHAR(20)
);
INSERT INTO kieu_thue VALUES
(1,'day'),
(2,'week'),
(3,'month');
CREATE TABLE loai_dich_vu (
  ldvID INT AUTO_INCREMENT PRIMARY KEY,
  ldvName VARCHAR(20)
);
INSERT INTO loai_dich_vu VALUES
(1,'standard'),
(2,'vip'),
(3,'luxury');
CREATE TABLE dich_vu (
  dvID INT AUTO_INCREMENT PRIMARY KEY,
  dvName VARCHAR(20),
  Acreage INT,
  Cost FLOAT,
  Max_people INT,
  Standard VARCHAR(20),
  Utility VARCHAR(20),
  Swim FLOAT,
  floor FLOAT,
  dv_kID INT,
  dv_ldvID INT,
  FOREIGN KEY (dv_kID) REFERENCES kieu_thue(kID),
  FOREIGN KEY (dv_ldvID) REFERENCES loai_dich_vu(ldvID)
);
INSERT INTO dich_vu VALUES
(1,'villa',300,500,8,'luxury','infinity',50,3,1,3),
(2,'house',150,250,4,'vip','ocean view',20,2,2,2),
(3,'room',50,100,2,'standard','techcare',0,1,3,1);
CREATE TABLE dich_vu_di_kem (
  dkID INT AUTO_INCREMENT PRIMARY KEY,
  dkName VARCHAR(20),
  dkCost FLOAT,
  unit VARCHAR(20),
  status VARCHAR(20)
);
INSERT INTO dich_vu_di_kem VALUES
(1,'massage',100,'mmm','1'),
(2,'gym',80,'ggg','1'),
(3,'play card',90,'ppp','1');
CREATE TABLE khach_hang (
  khID INT AUTO_INCREMENT PRIMARY KEY,
  kh_lkID INT,
  khName VARCHAR(20),
  khDate DATE,
  Gender VARCHAR(10),
  khIDCard VARCHAR(15),
  khPhone VARCHAR(15),
  khEmail VARCHAR(50),
  khAddress VARCHAR(20),
  FOREIGN KEY (kh_lkID) REFERENCES loai_khach(lkID)
);
INSERT INTO khach_hang VALUES
(1,1,'long','1995-10-10','Nam','123456789','0123456789','long@gmail.com','nghe an'),
(2,1,'lan','1994-10-10','Nam','123456987','0123789654','lan@gmail.com','hue'),
(3,2,'quy','1993-10-10','Nu','321654987','0123666888','quy@gmail.com','da nang'),
(4,2,'phung','1992-10-10','Nu','123765983','0123222333','phung@gmail.com','quang tri'),
(5,3,'dau','1996-10-10','Nu','123455555','0123444555','dau@gmail.com','quang binh'),
(6,3,'chi','1997-10-10','Nam','222333444','0123888999','chi@gmail.com','ha tinh');
CREATE TABLE hop_dong (
  hdID INT AUTO_INCREMENT PRIMARY KEY,
  beginDate DATE,
  endDate DATE,
  hdCost FLOAT,
  hd_nID INT,
  hd_khID INT,
  hd_dvID INT,
  FOREIGN KEY (hd_nID) REFERENCES nhan_vien(nID),
  FOREIGN KEY (hd_khID) REFERENCES khach_hang(khID),
  FOREIGN KEY (hd_dvID) REFERENCES dich_vu(dvID)
);
INSERT INTO hop_dong VALUES
(1,'2025-10-05','2025-11-05',200,1,2,1),
(2,'2021-10-06','2021-10-20',300,2,3,2),
(3,'2025-10-07','2025-11-01',400,3,4,1),
(4,'2021-09-08','2021-09-25',500,4,5,2),
(5,'2020-10-09','2020-11-23',600,5,1,3),
(6,'2020-10-10','2020-11-28',700,5,6,3);
CREATE TABLE hop_dong_chi_tiet (
  ctID INT AUTO_INCREMENT PRIMARY KEY,
  ct_hdID INT,
  ct_dkID INT,
  ctVolume INT,
  FOREIGN KEY (ct_hdID) REFERENCES hop_dong(hdID),
  FOREIGN KEY (ct_dkID) REFERENCES dich_vu_di_kem(dkID)
);
INSERT INTO hop_dong_chi_tiet VALUES
(1,1,1,1),
(2,2,2,2),
(3,3,3,2),
(4,4,2,1),
(5,5,1,2),
(6,6,3,1);
-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
FROM nhan_vien
WHERE (nName LIKE 'H%' OR nName LIKE 'T%' OR nName LIKE 'K%')
  AND LENGTH(nName) <= 15;
  -- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT *
FROM khach_hang
WHERE (YEAR(CURDATE()) - YEAR(khDate)) BETWEEN 18 AND 50
  AND (khAddress LIKE '%da nang%' OR khAddress LIKE '%quang tri%');
-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT kh.khID,
       kh.khName,
       COUNT(hd.hdID) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON kh.kh_lkID = lk.lkID
LEFT JOIN hop_dong hd ON kh.khID = hd.hd_khID
WHERE lk.lkName = 'diamond'
GROUP BY kh.khID, kh.khName
ORDER BY so_lan_dat_phong ASC;
-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT
  kh.khID AS ma_khach_hang,
  kh.khName AS ho_ten,
  lk.lkName AS ten_loai_khach,
  hd.hdID AS ma_hop_dong,
  dv.dvName AS ten_dich_vu,
  hd.beginDate AS ngay_lam_hop_dong,
  hd.endDate AS ngay_ket_thuc,
  (IFNULL(hd.hdCost,0) + IFNULL(SUM(hdct.ctVolume * dvdk.dkCost),0)) AS tong_tien
FROM khach_hang kh
LEFT JOIN loai_khach lk ON kh.kh_lkID = lk.lkID
LEFT JOIN hop_dong hd ON kh.khID = hd.hd_khID
LEFT JOIN dich_vu dv ON hd.hd_dvID = dv.dvID
LEFT JOIN hop_dong_chi_tiet hdct ON hd.hdID = hdct.ct_hdID
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ct_dkID = dvdk.dkID
GROUP BY
  kh.khID, kh.khName, lk.lkName,
  hd.hdID, dv.dvName, hd.beginDate, hd.endDate
ORDER BY kh.khID, ma_hop_dong;
-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dv.dvID AS ma_dich_vu,
       dv.dvName AS ten_dich_vu,
       dv.Acreage AS dien_tich,
       dv.Cost AS chi_phi_thue,
       ldv.ldvName AS ten_loai_dich_vu
FROM dich_vu dv
LEFT JOIN loai_dich_vu ldv ON dv.dv_ldvID = ldv.ldvID
WHERE dv.dvID NOT IN (
  SELECT hd.hd_dvID
  FROM hop_dong hd
  WHERE hd.beginDate BETWEEN '2021-01-01' AND '2021-03-31'
);
-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT dv.dvID AS ma_dich_vu,
       dv.dvName AS ten_dich_vu,
       dv.Acreage AS dien_tich,
       dv.Max_people AS so_nguoi_toi_da,
       dv.Cost AS chi_phi_thue,
       ldv.ldvName AS ten_loai_dich_vu
FROM dich_vu dv
LEFT JOIN loai_dich_vu ldv ON dv.dv_ldvID = ldv.ldvID
WHERE dv.dvID IN (
  SELECT DISTINCT hd.hd_dvID FROM hop_dong hd WHERE YEAR(hd.beginDate) = 2020
)
AND dv.dvID NOT IN (
  SELECT DISTINCT hd.hd_dvID FROM hop_dong hd WHERE YEAR(hd.beginDate) = 2021
);
-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
SELECT DISTINCT khName FROM khach_hang;
-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(hd.beginDate) AS thang,
       COUNT(DISTINCT hd.hd_khID) AS so_khach_dat_phong
FROM hop_dong hd
WHERE YEAR(hd.beginDate) = 2021
GROUP BY MONTH(hd.beginDate)
ORDER BY thang;
-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT
  hd.hdID AS ma_hop_dong,
  hd.beginDate AS ngay_lam_hop_dong,
  hd.endDate AS ngay_ket_thuc,
  hd.hdCost AS tien_dat_coc,
  IFNULL(SUM(hdct.ctVolume), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.hdID = hdct.ct_hdID
GROUP BY hd.hdID, hd.beginDate, hd.endDate, hd.hdCost
ORDER BY hd.hdID;