# AI Prompt Log - Quản lý CSDL AutoRide

### Prompt 1:
"Tại sao nên sử dụng kiểu dữ liệu DECIMAL(12, 2) thay vì FLOAT hay DOUBLE cho các cột lưu trữ tiền tệ như security_deposit, late_fee và damage_fee trong MySQL?"
- **Mục đích**: Tìm hiểu chuẩn lưu trữ dữ liệu tài chính tránh sai số dấu phẩy động.

### Prompt 2:
"Ưu và nhược điểm khi tách bảng Inspections riêng biệt so với việc lưu trực tiếp cột damage_description vào bảng Rentals trong quy trình hoàn tất hợp đồng?"
- **Mục đích**: Đánh giá chuẩn hóa 1-1 và 1-N cho biên bản bàn giao xe.

### Prompt 3:
"Cách viết truy vấn tính toán số tiền hoàn trả (refund_amount) an toàn khi xử lý các giá trị có khả năng nhận NULL trong MySQL?"
- **Mục đích**: Áp dụng hàm COALESCE / IFNULL để bảo đảm công thức số học không bị lỗi NULL.
