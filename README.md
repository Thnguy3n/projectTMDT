<img width="970" height="461" alt="image" src="https://github.com/user-attachments/assets/bcbc0457-83cd-44f6-9155-d0313f3838ce" /># Ecommerce
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

## 7) Screenshot
<img width="545" height="696" alt="Ảnh chụp màn hình 2025-08-17 144206" src="https://github.com/user-attachments/assets/93fcc792-b925-423b-b6a7-5b9147469435" />
<img width="953" height="788" alt="image" src="https://github.com/user-attachments/assets/3408a679-3e87-4e1a-8c71-e8bf10ff3f5d" />
<img width="970" height="464" alt="image" src="https://github.com/user-attachments/assets/29ef5b38-9c0f-49e2-adb6-aa499acb11b3" />
<img width="970" height="494" alt="image" src="https://github.com/user-attachments/assets/7b7504ad-2016-486e-95c2-42946fdf0429" />
<img width="970" height="456" alt="image" src="https://github.com/user-attachments/assets/df8ed146-5460-4bc5-8387-16a648304feb" />
<img width="970" height="416" alt="image" src="https://github.com/user-attachments/assets/db045311-8b33-4d78-8505-54daa605b114" />
<img width="970" height="391" alt="image" src="https://github.com/user-attachments/assets/30ba3456-ee81-476b-865e-73ff5f4e9ad9" />
<img width="970" height="459" alt="image" src="https://github.com/user-attachments/assets/4dc77bbc-78e5-4ac8-8500-776c172b28a5" />
<img width="970" height="461" alt="image" src="https://github.com/user-attachments/assets/68494808-ba70-44d7-9d50-77adb86ec3d2" />
<img width="970" height="463" alt="image" src="https://github.com/user-attachments/assets/4186f695-8f18-41c0-9a2c-33d7eaba7086" />
<img width="964" height="450" alt="image" src="https://github.com/user-attachments/assets/c3cce193-8b08-409f-8ac3-545c8e50203c" />
<img width="950" height="600" alt="image" src="https://github.com/user-attachments/assets/7eecea8c-008e-4523-80b5-075ec2e0ec8d" />
<img width="970" height="458" alt="image" src="https://github.com/user-attachments/assets/a8a20a23-c498-4907-bf0d-e4ddf0616f21" />
<img width="970" height="463" alt="image" src="https://github.com/user-attachments/assets/a5ea8692-7c76-4415-8965-d068b141dcb9" />
<img width="970" height="555" alt="image" src="https://github.com/user-attachments/assets/8c0a8768-6110-4c26-b02a-3686033be87d" />
<img width="970" height="713" alt="image" src="https://github.com/user-attachments/assets/3de5d516-7554-4d60-b7d4-c2a176ad291a" />
<img width="970" height="463" alt="image" src="https://github.com/user-attachments/assets/a1299445-94bc-4501-b3e2-e21de4680bd9" />
<img width="970" height="458" alt="image" src="https://github.com/user-attachments/assets/efb604d0-7c87-4167-a71a-fa4526860fb3" />
<img width="970" height="456" alt="image" src="https://github.com/user-attachments/assets/bd2a6eae-da56-458d-a184-bfd70ff820f4" />
<img width="970" height="461" alt="image" src="https://github.com/user-attachments/assets/b8c86e25-9c26-4a16-879c-dad29b502fef" />
<img width="970" height="459" alt="image" src="https://github.com/user-attachments/assets/f809db2c-5dd6-44ae-afed-2c1ccd3ef64d" />
<img width="970" height="456" alt="image" src="https://github.com/user-attachments/assets/852e681c-2b57-4586-b352-b79c1246bba9" />
<img width="970" height="458" alt="image" src="https://github.com/user-attachments/assets/8fa0ae49-a299-4a55-966c-a04016d9fcaa" />
<img width="970" height="455" alt="image" src="https://github.com/user-attachments/assets/7194eb1e-4ee0-474f-a424-aaad1fe5aa1a" />
<img width="970" height="450" alt="image" src="https://github.com/user-attachments/assets/1a62edc8-ce3d-4d3c-9f76-cfeb10583d87" />
<img width="970" height="392" alt="image" src="https://github.com/user-attachments/assets/a9579f76-9959-445e-8584-5c1f8cb60647" />
<img width="945" height="453" alt="image" src="https://github.com/user-attachments/assets/53cc0c0d-c2dc-4245-8c01-5e24c33f09ac" />
<img width="970" height="369" alt="image" src="https://github.com/user-attachments/assets/6e47bafb-1351-4e14-a8d5-fdf358d09e53" />
<img width="970" height="381" alt="image" src="https://github.com/user-attachments/assets/c8b853bd-df31-4b7e-a312-5f59310bc27a" />






