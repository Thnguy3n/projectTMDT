<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/3/2024
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<style>
    .google-btn {
        padding: 12px 9px;
        background-color: #ffffff;
        border: 1px solid #dadce0;
        border-radius: 4px;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        font-size: 12px;
        font-weight: 500;
        color: #3c4043;
    }

    .google-btn:hover {
        background-color: #f8f9fa;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        border-color: #dadce0;
    }

    .google-btn:active {
        background-color: #f1f3f4;
    }

    .google-icon {
        width: 18px;
        height: 18px;
    }
</style>
<header id="header" class="header-default">
    <div class="container-full px_15 lg-px_40">
        <div class="row wrapper-header align-items-center">
            <div class="col-md-4 col-3 tf-lg-hidden">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="16" viewBox="0 0 24 16" fill="none">
                        <path d="M2.00056 2.28571H16.8577C17.1608 2.28571 17.4515 2.16531 17.6658 1.95098C17.8802 1.73665 18.0006 1.44596 18.0006 1.14286C18.0006 0.839753 17.8802 0.549063 17.6658 0.334735C17.4515 0.120408 17.1608 0 16.8577 0H2.00056C1.69745 0 1.40676 0.120408 1.19244 0.334735C0.978109 0.549063 0.857702 0.839753 0.857702 1.14286C0.857702 1.44596 0.978109 1.73665 1.19244 1.95098C1.40676 2.16531 1.69745 2.28571 2.00056 2.28571ZM0.857702 8C0.857702 7.6969 0.978109 7.40621 1.19244 7.19188C1.40676 6.97755 1.69745 6.85714 2.00056 6.85714H22.572C22.8751 6.85714 23.1658 6.97755 23.3801 7.19188C23.5944 7.40621 23.7148 7.6969 23.7148 8C23.7148 8.30311 23.5944 8.59379 23.3801 8.80812C23.1658 9.02245 22.8751 9.14286 22.572 9.14286H2.00056C1.69745 9.14286 1.40676 9.02245 1.19244 8.80812C0.978109 8.59379 0.857702 8.30311 0.857702 8ZM0.857702 14.8571C0.857702 14.554 0.978109 14.2633 1.19244 14.049C1.40676 13.8347 1.69745 13.7143 2.00056 13.7143H12.2863C12.5894 13.7143 12.8801 13.8347 13.0944 14.049C13.3087 14.2633 13.4291 14.554 13.4291 14.8571C13.4291 15.1602 13.3087 15.4509 13.0944 15.6653C12.8801 15.8796 12.5894 16 12.2863 16H2.00056C1.69745 16 1.40676 15.8796 1.19244 15.6653C0.978109 15.4509 0.857702 15.1602 0.857702 14.8571Z"
                              fill="currentColor"></path>
                    </svg>
                </a>
            </div>
            <div class="col-xl-3 col-md-4 col-6">
                <a href="<c:url value="/trang-chu"/>" class="logo-header">
                    <img src="images/logo/ABCSHOPLogo.PNG" alt="logo" class="logo">
                </a>
            </div>
            <div class="col-xl-6 tf-md-hidden">
                <nav class="box-navigation text-center">
                    <ul class="box-nav-ul d-flex align-items-center justify-content-center gap-30">
                        <li class="menu-item">
                            <a href="<c:url value="/product-category"/>" class="item-link">Bộ sưu tập</a>
                        </li>
                        <li class="menu-item">
                            <a href="/product-category-1" class="item-link">Áo Khoác</a>
                        </li>
                        <li class="menu-item">
                            <a href="/product-category-2" class="item-link">Áo thun</a>
                        </li>
                        <li class="menu-item">
                            <a href="/product-category-3" class="item-link">Quần tây</a>
                        </li>
                        <li class="menu-item">
                            <a href="/product-category-4" class="item-link">Quần jean</a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="item-link">Giới thiệu</a>
                        </li>

                    </ul>
                </nav>
            </div>
            <div class="col-xl-3 col-md-4 col-3">
                <ul class="nav-icon d-flex justify-content-end align-items-center gap-20">
                    <li class="nav-search">
                        <a href="#canvasSearch" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft"
                           class="nav-icon-item">
                            <i class="icon icon-search"></i>
                        </a>
                    </li>
                    <security:authorize access="isAnonymous()">
                        <li class="nav-account">
                            <a href="#login" data-bs-toggle="modal" class="nav-icon-item">
                                <i class="icon icon-account"></i>
                            </a>
                        </li>
                    </security:authorize>

                    <security:authorize access="isAuthenticated()">
                        <li class="nav-account dropdown">
                            <a href="#" class="nav-icon-item dropdown-toggle" id="userDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="icon icon-account"></i>
                                    <%--                                 <%=SecurityUtils.getPrincipal().getFullName()%>--%>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                               <li>
                                    <a class="dropdown-item" href="/profile">
                                        <i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>
                                        Hồ sơ
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/OrderHistory">
                                        <i class="fas fa-shipping-fast fa-sm fa-fw me-2 text-gray-400"></i>
                                        Đơn mua
                                    </a>
                                </li>
                                 <li>
                                    <a class="dropdown-item" href="#" data-bs-toggle="modal"
                                       data-bs-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>
                                        Đăng xuất
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </security:authorize>


                    <li class="nav-cart">
                        <a href="#shoppingCart" data-bs-toggle="modal" class="nav-icon-item">
                            <i class="icon icon-bag"></i><span class="count-box"></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</header>
<!-- modal login -->
<div class="modal modalCentered fade form-sign-in modal-part-content" id="login">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="header">
                <div class="demo-title">Đăng nhập</div>
                <span class="icon-close icon-close-popup" data-bs-dismiss="modal"></span>
            </div>
            <div class="tf-login-form">
                <c:if test="${param.incorrectAccount != null}">
                    <div class="alert alert-danger">
                        Username or password incorrect
                    </div>
                </c:if>
                <c:if test="${param.accessDenied != null}">
                    <div class="alert alert-danger">
                        You Not authorize
                    </div>
                </c:if>
                <c:if test="${param.sessionTimeout != null}">
                    <div class="alert alert-danger">
                        Session Timeout
                    </div>
                </c:if>
                <form class="" action="j_spring_security_check" id="formLogin" accept-charset="utf-8" method="post">
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="text" id="userName"
                               name="j_username">
                        <label class="tf-field-label">Tên đăng nhập *</label>
                    </div>
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="password" id="password"
                               name="j_password">
                        <label class="tf-field-label">Mật khẩu *</label>
                    </div>
                    <div class="bottom" style="gap: 15px">
                        <div class="w-100">
                            <button type="submit"
                                    class="tf-btn btn-fill animate-hover-btn radius-3 w-100 justify-content-center">
                                <span>Đăng nhập</span></button>
                        </div>
                        <div class="w-100">
                            <a href="#register" data-bs-toggle="modal" class="btn-link fw-6 w-100 link">
                                Đăng ký tài khoản
                                <i class="icon icon-arrow1-top-left"></i>
                            </a>
                        </div>
                        <div class="w-100">
                            <a href="/login"
                               class="google-btn btn d-flex align-items-center justify-content-center gap-2">
                                <img src="images/logo/Google__G__logo.svg.png" alt="Google logo" class="google-icon">
                                Đăng nhập bằng Google
                            </a>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /modal login -->

<script>
    fetch("api/cart/items/")
        .then(response => response.json())
        .then(data => {
            let countTotal = 0;
            data.items.forEach(item => {
                countTotal += item.quantity;
            });
            document.querySelector(".count-box").textContent = countTotal;
        })


</script>