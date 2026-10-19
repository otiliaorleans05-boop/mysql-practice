-- 1. TẠO CƠ SỞ DỮ LIỆU
CREATE DATABASE IF NOT EXISTS autoride_db;
USE autoride_db;

-- 2. TẠO BẢNG CARS
CREATE TABLE IF NOT EXISTS Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL
);

-- 3. TẠO BẢNG RENTALS (ĐÃ TỐI ƯU CỘT TÀI CHÍNH VÀ ENUM)
CREATE TABLE IF NOT EXISTS Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    rent_date DATETIME NOT NULL,
    return_date DATETIME,
    status ENUM('BOOKED', 'ACTIVE', 'COMPLETED', 'CANCELLED') DEFAULT 'BOOKED',
    security_deposit DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    late_fee DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    damage_fee DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE RESTRICT
);

-- 4. TẠO BẢNG INSPECTIONS (GHI NHẬN TÌNH TRẠNG KIỂM TRA XE)
CREATE TABLE IF NOT EXISTS Inspections (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    inspection_date DATETIME NOT NULL,
    damage_description TEXT,
    inspector_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id) ON DELETE RESTRICT
);

-- ========================================================
-- 5. KỊCH BẢN MÔ PHỎNG DỮ LIỆU THỰC TẾ (DML)
-- ========================================================

-- Thêm xe mẫu
INSERT INTO Cars (model_name, license_plate) 
VALUES ('Toyota Camry', '30A-999.88');

-- Khách hàng "Nguyen Van A" thuê xe, cọc 10.000.000 VNĐ, trạng thái ACTIVE
INSERT INTO Rentals (car_id, customer_name, rent_date, status, security_deposit, late_fee, damage_fee)
VALUES (1, 'Nguyen Van A', NOW(), 'ACTIVE', 10000000.00, 0.00, 0.00);

-- Khi trả xe: phát hiện vỡ đèn pha trái -> ghi nhận vào Inspections
INSERT INTO Inspections (rental_id, inspection_date, damage_description, inspector_name)
VALUES (1, NOW(), 'Vỡ đèn pha trái', 'Staff_Nguyen');

-- Cập nhật hợp đồng: Hoàn tất, phạt hư hỏng 2.000.000 VNĐ, trễ 0 VNĐ
UPDATE Rentals 
SET return_date = NOW(),
    status = 'COMPLETED',
    late_fee = 0.00,
    damage_fee = 2000000.00
WHERE rental_id = 1;

-- Truy vấn tính số tiền hoàn trả thực tế cho khách:
-- Tiền hoàn lại = security_deposit - late_fee - damage_fee
SELECT 
    rental_id,
    customer_name,
    security_deposit,
    late_fee,
    damage_fee,
    (security_deposit - late_fee - damage_fee) AS refund_amount,
    status
FROM Rentals
WHERE rental_id = 1;
