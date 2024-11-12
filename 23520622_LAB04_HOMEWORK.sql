
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Kỹ năng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Dự án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trưởng nhóm phát triển', '2023-01-01'),
(2, 4, N'Chuyên gia bảo mật', '2023-04-01'),
(3, 5, N'Kỹ sư AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(5, 3, N'Kiến trúc sư đám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(7, 3, N'Kỹ sư IoT', '2023-02-01'),
(8, 1, N'Nhà thiết kế UX/UI', '2023-01-01'),
(9, 3, N'Kỹ sư DevOps', '2023-02-01'),
(10, 5, N'Kỹ sư Blockchain', '2023-05-01');
--Cau 1
SELECT HoTen
FROM ChuyenGia
ORDER BY HoTen; 
--Cau 2
SELECT HoTen, SoDienThoai
FROM ChuyenGia WHERE ChuyenNganh = N'Phát triển phần mềm';
--Cau 3
SELECT TenCongTy 
FROM CongTy
WHERE SoNhanVien > 100; 
--Cau 4
SELECT TenDuAn, NgayBatDau
FROM DuAn
WHERE YEAR(NgayBatDau) = 2023; 
--Cau 5 
SELECT TenKyNang
FROM KyNang
ORDER BY TenKyNang;
--Cau 6
SELECT HoTen, Email 
FROM ChuyenGia
WHERE DATEDIFF(YEAR, NgaySinh, '2024-01-01') < 35; 
--Cau 7 
SELECT HoTen, ChuyenNganh
FROM ChuyenGia
WHERE GioiTinh = N'Nữ';
--Cau 8
SELECT TenKyNang
FROM KyNang
WHERE LoaiKyNang = N'Công nghệ';
--Cau 9
SELECT TenCongTy, DiaChi
FROM CongTy
WHERE LinhVuc = N'Phân tích dữ liệu'; 
--Cau 10
SELECT TenDuAn
FROM DuAn 
WHERE TrangThai = N'Hoàn thành'; 
--Cau 11
SELECT HoTen, NamKinhNghiem
FROM ChuyenGia
ORDER BY NamKinhNghiem DESC; 
--Cau 12 
SELECT TenCongTy, SoNhanVien 
FROM CongTy
WHERE SoNhanVien BETWEEN 100 AND 200; 
--Cau 13
SELECT TenDuAn, NgayKetThuc
FROM DuAn
WHERE YEAR(NgayKetThuc) = 2023; 
--Cau 14
SELECT HoTen, Email 
FROM ChuyenGia
WHERE HoTen LIKE N'N%'; 
--Cau 15
SELECT TenKyNang, LoaiKyNang
FROM KyNang
WHERE LoaiKyNang != N'Ngôn ngữ lập trình'; 
--Cau 16
SELECT TenCongTy, LinhVuc
FROM CongTy
ORDER BY LinhVuc; 
--Cau 17 
SELECT HoTen, ChuyenNganh 
FROM ChuyenGia
WHERE GioiTinh = N'Nam' AND NamKinhNghiem > 5; 
--Cau 18
SELECT * FROM ChuyenGia; 
--Cau 19 
SELECT HoTen, Email 
FROM ChuyenGia
WHERE GioiTinh = N'Nữ'; 
--Cau 20 
SELECT TenCongTy, SoNhanVien 
FROM CongTy
ORDER BY SoNhanVien DESC; 
--Cau 21
SELECT TenDuAn 
FROM DuAn
WHERE TrangThai = N'Đang thực hiện'; 
--Cau 22
SELECT TenKyNang
FROM KyNang
WHERE LoaiKyNang = N'Ngôn ngữ lập trình'; 
--Cau 23
SELECT HoTen, ChuyenNganh 
FROM ChuyenGia 
WHERE NamKinhNghiem > 8; 
--Cau 24
SELECT TenDuAn
FROM DuAn
WHERE MaCongTy = 1; 
--Cau 25
SELECT ChuyenNganh, COUNT(*) AS SoLuongChuyenGia
FROM ChuyenGia
GROUP BY ChuyenNganh; 
--Cau 26
SELECT TOP 1 HoTen, NamKinhNghiem
FROM ChuyenGia
--ORDER BY NamKinhNghiem DESC; (neu muon nam kn giam dan)
--Cau 27
SELECT TenCongTy, SoNhanVien 
FROM CongTy
WHERE SoNhanVien > 100
ORDER BY SoNhanVien ASC; 
--Cau 28
SELECT C.TenCongTy, COUNT(D.MaDuAn) AS SoLuongDuAn
FROM CongTy C
JOIN DuAn D ON C.MaCongTy = D.MaCongTy
WHERE D.TrangThai = N'Đang thực hiện'
GROUP BY C.TenCongTy
HAVING COUNT(D.MaDuAn) > 1
ORDER BY SoLuongDuAn DESC;
--Cau 29 
SELECT K.TenKyNang, COUNT(CK.MaChuyenGia) AS TongSoChuyenGia
FROM KyNang K
JOIN ChuyenGia_KyNang CK ON K.MaKyNang = CK.MaKyNang
WHERE CK.CapDo >= 4
GROUP BY K.TenKyNang
HAVING COUNT(CK.MaChuyenGia) > 2
ORDER BY K.TenKyNang ASC;
--Cau 30 
SELECT TenCongTy, SoNhanVien 
FROM CongTy
WHERE LinhVuc = N'Điện toán đám mây'
ORDER BY SoNhanVien ASC; 
--Cau 31
SELECT TenCongTy, SoNhanVien, AVG(SoNhanVien) OVER() AS TrungBinhSoNhanVien
FROM CongTy
WHERE SoNhanVien BETWEEN 50 AND 100
ORDER BY TenCongTy ASC; 
--Cau 32
SELECT CG.HoTen, COUNT(CK.MaKyNang) AS SoLuongKyNang
FROM ChuyenGia CG
JOIN ChuyenGia_KyNang CK ON CG.MaChuyenGia = CK.MaChuyenGia
WHERE CK.CapDo = 5
GROUP BY CG.HoTen
HAVING COUNT(CK.MaKyNang) > 0
ORDER BY CG.HoTen ASC;
--Cau 33
SELECT K.TenKyNang, COUNT(CK.MaChuyenGia) AS TongSoChuyenGia
FROM KyNang K
JOIN ChuyenGia_KyNang CK ON K.MaKyNang = CK.MaKyNang
WHERE CK.CapDo >= 4
GROUP BY K.TenKyNang
HAVING COUNT(CK.MaChuyenGia) > 2
ORDER BY K.TenKyNang ASC;
--Cau 34
SELECT CG.HoTen, AVG(CK.CapDo) AS TrungBinhCapDo
FROM ChuyenGia CG 
JOIN ChuyenGia_KyNang CK ON CG.MaChuyenGia = CK.MaChuyenGia
WHERE CG.ChuyenNganh = N'Phát triển phần mềm'
GROUP BY CG.HoTen
HAVING AVG(CK.CapDo) > 3
ORDER BY TrungBinhCapDo DESC; 
----------------
--Lab 3 
--Cau 8
SELECT 
    k.TenKyNang, 
    cgk.CapDo
FROM 
    ChuyenGia_KyNang cgk
JOIN 
    KyNang k ON cgk.MaKyNang = k.MaKyNang
WHERE 
    cgk.MaChuyenGia = 1;
---Cau 9 
SELECT 
    cg.HoTen
FROM 
    ChuyenGia_DuAn cgd
JOIN 
    ChuyenGia cg ON cgd.MaChuyenGia = cg.MaChuyenGia
WHERE 
    cgd.MaDuAn = 2;
--Cau 10
SELECT 
    ct.TenCongTy, 
    da.TenDuAn
FROM 
    DuAn da
JOIN 
    CongTy ct ON da.MaCongTy = ct.MaCongTy;
--Cau 11
SELECT 
    ChuyenNganh,
    COUNT(MaChuyenGia) AS SoLuongChuyenGia
FROM 
    ChuyenGia
GROUP BY 
    ChuyenNganh;
--Cau 12 
SELECT TOP 1 
    HoTen, 
    NamKinhNghiem
FROM 
    ChuyenGia
ORDER BY 
    NamKinhNghiem DESC;
--Cau 13 
SELECT 
    cg.HoTen,
    COUNT(cgdu.MaDuAn) AS SoLuongDuAn
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cgdu ON cg.MaChuyenGia = cgdu.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 14 
SELECT 
    ct.TenCongTy,
    COUNT(da.MaDuAn) AS SoLuongDuAn
FROM 
    CongTy ct
LEFT JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
GROUP BY 
    ct.TenCongTy;
--Cau 15 
SELECT TOP 1 
    kn.TenKyNang, 
    COUNT(cgk.MaChuyenGia) AS SoLuongChuyenGia
FROM 
    ChuyenGia_KyNang cgk
JOIN 
    KyNang kn ON cgk.MaKyNang = kn.MaKyNang
GROUP BY 
    kn.TenKyNang
ORDER BY 
    SoLuongChuyenGia DESC;
--Cau 16 
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
JOIN 
    KyNang kn ON cgk.MaKyNang = kn.MaKyNang
WHERE 
    kn.TenKyNang = 'Python' AND cgk.CapDo >= 4;
--Cau 17 
SELECT TOP 1 
    da.TenDuAn, 
    COUNT(cgdu.MaChuyenGia) AS SoLuongChuyenGia
FROM 
    DuAn da
JOIN 
    ChuyenGia_DuAn cgdu ON da.MaDuAn = cgdu.MaDuAn
GROUP BY 
    da.TenDuAn
ORDER BY 
    SoLuongChuyenGia DESC;
--Cau 18
SELECT 
    cg.HoTen, 
    COUNT(cgk.MaKyNang) AS SoLuongKyNang
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 19
SELECT 
    cg1.HoTen AS ChuyenGia1, 
    cg2.HoTen AS ChuyenGia2, 
    cgdu.MaDuAn
FROM 
    ChuyenGia_DuAn cgdu
JOIN 
    ChuyenGia cg1 ON cgdu.MaChuyenGia = cg1.MaChuyenGia
JOIN 
    ChuyenGia cg2 ON cgdu.MaChuyenGia = cg2.MaChuyenGia
WHERE 
    cg1.MaChuyenGia < cg2.MaChuyenGia;  
--Cau 20 
SELECT 
    cg.HoTen, 
    COUNT(cgk.MaKyNang) AS SoLuongKyNangCapDo5
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
WHERE 
    cgk.CapDo = 5
GROUP BY 
    cg.HoTen;
--Cau 21 
SELECT 
    ct.TenCongTy
FROM 
    CongTy ct
LEFT JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
WHERE 
    da.MaDuAn IS NULL;
--Cau 22
SELECT 
    cg.HoTen AS TenChuyenGia, 
    da.TenDuAn AS TenDuAn
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cgdu ON cg.MaChuyenGia = cgdu.MaChuyenGia
LEFT JOIN 
    DuAn da ON cgdu.MaDuAn = da.MaDuAn;
--Cau 23
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
GROUP BY 
    cg.HoTen
HAVING 
    COUNT(cgk.MaKyNang) >= 3;
--Cau 24
SELECT 
    ct.TenCongTy, 
    SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN 
    ChuyenGia_DuAn cgdu ON da.MaDuAn = cgdu.MaDuAn
JOIN 
    ChuyenGia cg ON cgdu.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    ct.TenCongTy;
--Cau 25
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
WHERE 
    cgk.MaKyNang = 1  
GROUP BY 
    cg.HoTen
HAVING 
    SUM(CASE WHEN cgk.MaKyNang = 2 THEN 1 ELSE 0 END) = 0; 
--Cau 76
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
GROUP BY 
    cg.HoTen
HAVING 
    COUNT(cgk.MaKyNang) = 
	(
        SELECT 
            MAX(SkillCount)
        FROM 
            (SELECT COUNT(*) AS SkillCount
             FROM ChuyenGia_KyNang
             GROUP BY MaChuyenGia) AS SkillCounts
    );
--Cau 77
SELECT 
    cg1.HoTen AS ChuyenGia1, 
    cg2.HoTen AS ChuyenGia2
FROM 
    ChuyenGia cg1
JOIN 
    ChuyenGia cg2 ON cg1.ChuyenNganh = cg2.ChuyenNganh 
WHERE 
    cg1.MaChuyenGia <> cg2.MaChuyenGia;
--Cau 78 
SELECT TOP 1 
    ct.TenCongTy
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN 
    ChuyenGia_DuAn cgdu ON da.MaDuAn = cgdu.MaDuAn
JOIN 
    ChuyenGia cg ON cgdu.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    ct.TenCongTy
ORDER BY 
    SUM(cg.NamKinhNghiem) DESC;
--Cau 79
SELECT 
    ky.TenKyNang
FROM 
    KyNang ky
WHERE 
    NOT EXISTS 
	(
        SELECT 1 
        FROM ChuyenGia cg 
        WHERE NOT EXISTS 
		(
            SELECT 1 
            FROM ChuyenGia_KyNang cgk 
            WHERE cgk.MaKyNang = ky.MaKyNang AND cgk.MaChuyenGia = cg.MaChuyenGia
        )
    );
--TH4 
--TH4 cau 76
SELECT TOP 3 
    cg.HoTen,
    COUNT(ck.MaKyNang) AS SoLuongKyNang
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
GROUP BY 
    cg.MaChuyenGia, cg.HoTen
ORDER BY 
    SoLuongKyNang DESC;
--Cau 77 
SELECT 
    cg1.HoTen AS ChuyenGia1, 
    cg2.HoTen AS ChuyenGia2,
    cg1.ChuyenNganh,
    ABS(cg1.NamKinhNghiem - cg2.NamKinhNghiem) AS ChenhLechKinhNghiem
FROM 
    ChuyenGia cg1
JOIN 
    ChuyenGia cg2 ON cg1.ChuyenNganh = cg2.ChuyenNganh 
                  AND cg1.MaChuyenGia < cg2.MaChuyenGia
WHERE 
    ABS(cg1.NamKinhNghiem - cg2.NamKinhNghiem) <= 2;
--Cau 78 
SELECT 
    ct.TenCongTy,
    COUNT(DISTINCT da.MaDuAn) AS SoLuongDuAn,
    SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN 
    ChuyenGia_DuAn cda ON da.MaDuAn = cda.MaDuAn
JOIN 
    ChuyenGia cg ON cda.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    ct.TenCongTy;
--Cau 79:
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
GROUP BY 
    cg.MaChuyenGia, cg.HoTen
HAVING 
    MAX(CASE WHEN ck.CapDo = 5 THEN 1 ELSE 0 END) = 1 
    AND MIN(ck.CapDo) >= 3;
--Cau 80 
SELECT 
    cg.HoTen,
    COUNT(cda.MaDuAn) AS SoLuongDuAnThamGia
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cda ON cg.MaChuyenGia = cda.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 81 
SELECT 
    k.LoaiKyNang,
    cg.HoTen,
    MAX(ck.CapDo) AS CapDoCaoNhat
FROM 
    KyNang k
JOIN 
    ChuyenGia_KyNang ck ON k.MaKyNang = ck.MaKyNang
JOIN 
    ChuyenGia cg ON ck.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    k.LoaiKyNang, cg.HoTen
HAVING 
    ck.CapDo = MAX(ck.CapDo);
--Cau 82 
SELECT 
    ChuyenNganh,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ChuyenGia) AS TiLePhanTram
FROM 
    ChuyenGia
GROUP BY 
    ChuyenNganh;
--Cau 83
SELECT 
    k1.TenKyNang AS KyNang1,
    k2.TenKyNang AS KyNang2,
    COUNT(*) AS SoLanXuatHienCung
FROM 
    ChuyenGia_KyNang ck1
JOIN 
    ChuyenGia_KyNang ck2 ON ck1.MaChuyenGia = ck2.MaChuyenGia AND ck1.MaKyNang < ck2.MaKyNang
JOIN 
    KyNang k1 ON ck1.MaKyNang = k1.MaKyNang
JOIN 
    KyNang k2 ON ck2.MaKyNang = k2.MaKyNang
GROUP BY 
    k1.TenKyNang, k2.TenKyNang
ORDER BY 
    SoLanXuatHienCung DESC;
--Cau 84
SELECT 
    ct.TenCongTy,
    AVG(DATEDIFF(DAY, da.NgayBatDau, da.NgayKetThuc)) AS SoNgayTrungBinh
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
GROUP BY 
    ct.TenCongTy;
--Cau 85
SELECT 
    cg.HoTen,
    STRING_AGG(k.TenKyNang, ', ') AS KetHopKyNang
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
JOIN 
    KyNang k ON ck.MaKyNang = k.MaKyNang
GROUP BY 
    cg.HoTen
HAVING 
    COUNT(DISTINCT ck.MaKyNang) = 1 
    OR NOT EXISTS (
        SELECT 1 
        FROM ChuyenGia cg2 
        WHERE cg2.MaChuyenGia != cg.MaChuyenGia 
        AND NOT EXISTS (
            SELECT 1 
            FROM ChuyenGia_KyNang ck2 
            WHERE ck2.MaChuyenGia = cg2.MaChuyenGia 
            AND ck2.MaKyNang = ck.MaKyNang
        )
    );
--Cau 86
SELECT 
    cg.HoTen,
    COUNT(DISTINCT cda.MaDuAn) AS SoLuongDuAn,
    SUM(ck.CapDo) AS TongCapDoKyNang,
    RANK() OVER (ORDER BY COUNT(DISTINCT cda.MaDuAn) DESC, SUM(ck.CapDo) DESC) AS XepHang
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cda ON cg.MaChuyenGia = cda.MaChuyenGia
LEFT JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 87
SELECT 
    da.TenDuAn
FROM 
    DuAn da
JOIN 
    ChuyenGia_DuAn cda ON da.MaDuAn = cda.MaDuAn
JOIN 
    ChuyenGia cg ON cda.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    da.TenDuAn
HAVING 
    COUNT(DISTINCT cg.ChuyenNganh) = (SELECT COUNT(DISTINCT ChuyenNganh) FROM ChuyenGia);
--Cau 88
SELECT 
    ct.TenCongTy,
    COUNT(CASE WHEN da.TrangThai = N'Hoàn thành' THEN 1 END) * 100.0 / COUNT(*) AS TiLeThanhCong
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
GROUP BY 
    ct.TenCongTy;
--Cau 89
SELECT 
    cg1.HoTen AS ChuyenGia1,
    cg2.HoTen AS ChuyenGia2,
    k1.TenKyNang AS KyNangA,
    k2.TenKyNang AS KyNangB,
    ck1.CapDo AS CapDoA_ChuyenGia1,
    ck2.CapDo AS CapDoB_ChuyenGia1,
    ck3.CapDo AS CapDoA_ChuyenGia2,
    ck4.CapDo AS CapDoB_ChuyenGia2
FROM 
    ChuyenGia cg1
JOIN 
    ChuyenGia cg2 ON cg1.MaChuyenGia < cg2.MaChuyenGia
JOIN 
    ChuyenGia_KyNang ck1 ON cg1.MaChuyenGia = ck1.MaChuyenGia
JOIN 
    ChuyenGia_KyNang ck2 ON cg1.MaChuyenGia = ck2.MaChuyenGia AND ck1.MaKyNang != ck2.MaKyNang
JOIN 
    ChuyenGia_KyNang ck3 ON cg2.MaChuyenGia = ck3.MaChuyenGia AND ck3.MaKyNang = ck1.MaKyNang
JOIN 
    ChuyenGia_KyNang ck4 ON cg2.MaChuyenGia = ck4.MaChuyenGia AND ck4.MaKyNang = ck2.MaKyNang
JOIN 
    KyNang k1 ON ck1.MaKyNang = k1.MaKyNang
JOIN 
    KyNang k2 ON ck2.MaKyNang = k2.MaKyNang
WHERE 
    ck1.CapDo >= 4 AND ck2.CapDo <= 2 
    AND ck3.CapDo <= 2 AND ck4.CapDo >= 4;

------------------------------------------END-----------------------------------------------





