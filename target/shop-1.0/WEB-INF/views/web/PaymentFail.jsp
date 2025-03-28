<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/14/2024
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .page-background {
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #f7fafc;
    }

    /* Container cho thông báo thất bại */
    .payment-failure-container {
        background-color: #ffffff;
        padding: 1.5rem;
        max-width: 600px;
        margin: 0 auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    /* SVG Icon X màu đỏ */
    .payment-failure-icon {
        color: #dc2626; /* Màu đỏ cho biểu tượng X */
        width: 4rem;
        height: 4rem;
        margin: 1.5rem auto;
        display: block;
    }

    /* Tiêu đề thất bại */
    .payment-failure-title {
        font-size: 2rem;
        color: #1a202c;
        font-weight: 600;
        text-align: center;
    }

    /* Văn bản mô tả thất bại */
    .payment-failure-description {
        color: #4a5568;
        font-size: 1.125rem;
        margin: 0.5rem 0;
        text-align: center;
    }
    /* Nút trở về */
    .payment-failure-button-container {
        padding: 2.5rem 0;
        text-align: center;
    }

    .payment-failure-button {
        font-size: 1.125rem;
        padding: 0.75rem 3rem;
        background-color: #4f46e5;
        color: #ffffff;
        font-weight: 600;
        text-decoration: none;
        border-radius: 4px;
        transition: background-color 0.2s ease;
    }

    .payment-failure-button:hover {
        background-color: #4338ca;
    }
</style>
<div class="page-background">
    <div class="payment-failure-container">
        <svg viewBox="0 0 24 24" class="payment-failure-icon">
            <path fill="currentColor"
                  d="M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0zm5.707 15.293a1 1 0 01-1.414 1.414L12 13.414l-4.293 4.293a1 1 0 01-1.414-1.414L10.586 12 6.293 7.707a1 1 0 011.414-1.414L12 10.586l4.293-4.293a1 1 0 011.414 1.414L13.414 12l4.293 4.293z">
            </path>
        </svg>
        <div class="text-center">
            <h3 class="payment-failure-title">Thanh toán thất bại!</h3>
            <p class="payment-failure-description">Có lỗi xảy ra trong quá trình thanh toán.</p>
            <p> Vui lòng thử lại sau! </p>
            <div class="payment-failure-button-container">
                <a href="<c:url value="/trang-chu"/>" class="payment-failure-button">
                    trở về
                </a>
            </div>
        </div>
    </div>
</div>

