<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/15/2024
  Time: 1:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="wrapper">
    <section class="flat-spacing-11">
        <div class="container">
            <h5>Đơn mua của bạn </h5>
            <div class="tf-page-cart-footer">
                <div class="tf-cart-footer-inner">
                    <div class="tf-page-cart-checkout widget-wrap-checkout">
                        <ul class="wrap-checkout-product">
                            <c:forEach items="${orderEntityList}" var="item">
                                <c:forEach items="${item.orderItemEntities}" var="orderItem">
                                    <li class="checkout-product-item">
                                    <figure class="img-product">
                                        <img src="/repository${orderItem.productEntity.image}" alt="product">
                                        <span class="quantity" id="quantity">${orderItem.quantity}</span>
                                    </figure>
                                    <div class="content">
                                        <div class="info">
                                            <p class="name" style="    color: darkblue;">${orderItem.productEntity.title}</p>
                                            <span class="variant" id="size">Size: ${orderItem.size}</span>
                                            <span class="variant-picker-item">| Giá: <fmt:formatNumber value="${orderItem.price}" pattern="#,###"/> VNĐ</span>
                                            <span class="variant-picker-item">| Ngày đặt: ${orderItem.createdDate} </span>
                                        </div>
                                        <span class="price" style="display: grid">
                                                 <span class="price" style="font-weight: 600;
                                                                     ">Thành giá: <fmt:formatNumber value="${orderItem.total}" pattern="#,###"/> VNĐ</span>
                                                 <span class="price" style="font-weight: 600;
                                                                     color: #00ba00;">Trạng thái: ${item.status}
                                                 </span>
                                    </span>
                                    </div>
                                </li>
                                </c:forEach>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
