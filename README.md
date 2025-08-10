# Ecommerce
VIDEO DEMO: https://youtu.be/LECXp_U838g?si=DOR0y-HVi96A0pIb

# ABCSHOP – Hệ thống thương mại điện tử bán quần áo

Một nền tảng e-commerce cho quần áo, xây dựng với **Java Spring Boot**, giao diện **JSP + Sitemesh**, cơ sở dữ liệu **MySQL**, hỗ trợ **xác thực/ủy quyền** (JWT/OAuth2) và các tiện ích như xuất **PDF hóa đơn** và **gửi email xác nhận**.

## 1) Tính năng chính

### Cho khách hàng
- Duyệt, tìm kiếm sản phẩm theo danh mục/giá; phân trang.
- Quản lý giỏ hàng: thêm/xóa/cập nhật số lượng.
- Đặt hàng (checkout) với nhiều phương thức thanh toán.
- Theo dõi lịch sử và trạng thái đơn hàng.
- Tài khoản cá nhân: đăng ký, đăng nhập (hỗ trợ **Google OAuth2**).

### Cho quản lý, nhân viên, shipper
- CRUD sản phẩm, danh mục, nhà cung cấp.
- Quản lý đơn hàng: cập nhật trạng thái.
- Quản lý người dùng và cấu hình phương thức vận chuyển.
- Báo cáo thống kê doanh thu/đơn hàng.
- Hệ thống thông báo nội bộ.

### Nâng cao
- Sinh **PDF hóa đơn** tự động (iTextPDF), **email** xác nhận đơn hàng/OTP.
- Hệ thống giảm giá (Strategy Pattern), thời gian bắt đầu/kết thúc.
- Thông báo real-time cho admin (event-driven).
- Bộ validator (điện thoại, email, mật khẩu…).

## 2) Kiến trúc & cấu trúc mã nguồn

- Mô hình **MVC** (JSP View ↔ Controller ↔ Model/JPA).
- Phân lớp: `controller/`, `service/`, `repository/`, `entity/`, `config/`, `security/`, `api/`, `utils/`.
- Áp dụng các **Design Patterns**: Strategy, State (trạng thái đơn hàng), Decorator (validation), Proxy, Facade (đặt hàng), Iterator (duyệt thông báo).

## 3) Công nghệ

- **Spring Boot 2.2.x**, **Spring Security**, **Spring Data JPA**, **OAuth2** (Google).
- **MySQL 8.x**; **Lombok**, **ModelMapper**, **iTextPDF**, **Spring Mail**.
- View: **JSP**, **Sitemesh**, **Bootstrap**, **jQuery**.
- Đóng gói: **Maven**, chạy bằng **Tomcat embedded**; **Docker** (tuỳ chọn).

## 4) CSDL (chính)

- `User`, `Role`, `Cart`, `Product`, `Category`, `Order`, `OrderItem`, `Payment`, `ShippingMethod`…
- Quan hệ nổi bật: `User 1–1 Cart`, `User 1–N Order`, `Order 1–N OrderItem`, `Order 1–1 Payment`, `Product N–1 Category`…

## 5) Bảo mật

- Form login + **Google OAuth2**.
- Phân quyền theo vai trò `USER/MANAGER/STAFF/SHIPPER` (RBAC).
- Mã hoá mật khẩu **BCrypt**, CSRF protection, quản lý session an toàn.
- Ràng buộc/validator: email duy nhất, số điện thoại hợp lệ, mật khẩu mạnh…

## 6) Tài khoản mẫu (demo)
- `admin@abcshop.com` / `Admin@123` (ROLE_ADMIN) – cập nhật theo seed.
- `user@abcshop.com` / `User@123` (ROLE_USER).
