<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/14/2024
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  /* Tổng quan */
  .page-background {
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f7fafc; /* tương tự bg-gray-100 */
  }

  /* Container chính */
  .payment-container {
    background-color: #ffffff; /* tương tự bg-white */
    padding: 1.5rem; /* tương tự p-6 */
    max-width: 600px;
    margin: 0 auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  /* SVG Icon */
  .payment-icon {
    color: #16a34a; /* tương tự text-green-600 */
    width: 4rem; /* tương tự w-16 */
    height: 4rem; /* tương tự h-16 */
    margin: 1.5rem auto; /* tương tự mx-auto my-6 */
    display: block;
  }

  /* Tiêu đề */
  .payment-title {
    font-size: 1.5rem; /* tăng từ 1.5rem lên 2rem */
    color: #1a202c; /* tương tự text-gray-900 */
    font-weight: 600; /* tương tự font-semibold */
    text-align: center; /* tương tự text-center */
  }

  /* Văn bản mô tả */
  .payment-description {
    color: #4a5568; /* tương tự text-gray-600 */
    font-size: 1.125rem; /* tăng từ 1rem lên 1.125rem */
    margin: 0.5rem 0; /* tương tự my-2 */
    text-align: center;
  }

  /* Nút trở về */
  .payment-button-container {
    padding: 2.5rem 0; /* tương tự py-10 */
    text-align: center;
  }

  .payment-button {
    font-size: 1.125rem; /* tăng từ 1rem lên 1.125rem */
    padding: 0.75rem 3rem; /* tương tự px-12 py-3 */
    background-color: #4f46e5; /* tương tự bg-indigo-600 */
    color: #ffffff;
    font-weight: 600; /* tương tự font-semibold */
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.2s ease;
  }

  .payment-button:hover {
    background-color: #4338ca; /* tương tự hover:bg-indigo-500 */
  }


</style>
<div class="page-background">
  <div class="payment-container">
    <svg viewBox="0 0 24 24" class="payment-icon">
      <path fill="currentColor"
            d="M12,0A12,12,0,1,0,24,12,12.014,12.014,0,0,0,12,0Zm6.927,8.2-6.845,9.289a1.011,1.011,0,0,1-1.43.188L5.764,13.769a1,1,0,1,1,1.25-1.562l4.076,3.261,6.227-8.451A1,1,0,1,1,18.927,8.2Z">
      </path>
    </svg>
    <div class="text-center">
      <h3 class="payment-title">Thanh toán thành công!</h3>
      <p class="payment-description">Cảm ơn bạn đã thanh toán tại đây.</p>
      <p> Chúc bạn một ngày vui! </p>
      <div class="payment-button-container">
        <a href="<c:url value='/trang-chu'/>" class="payment-button">
          trở về
        </a>
      </div>
    </div>
  </div>
</div>

